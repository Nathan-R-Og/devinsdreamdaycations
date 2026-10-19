.segment        "ANTIPIRACY": absolute

;$A28B
;loads naming_screen_1
LoadNamingScreen1:
    .import __NAMING_SCREEN_1_LOAD__
    ;set read address
    lda #.LOBYTE(__NAMING_SCREEN_1_LOAD__)
    ldx #.HIBYTE(__NAMING_SCREEN_1_LOAD__)
    sta UNK_60 ; $60 = 0xB800
    stx UNK_60+1

    ;set write address
    .import __NAMING_SCREEN_1_RUN__
    lda #.LOBYTE(__NAMING_SCREEN_1_RUN__)
    ldx #.HIBYTE(__NAMING_SCREEN_1_RUN__)
    sta UNK_64 ; $64 = 0x6000
    stx UNK_64+1

    jsr EnablePRGRam

    ; Copy 0x0800 bytes from $B800 into $6000
    ldx #8
    @loop:
    ldy #0
    @copy:
    ;one iteration of this copies a full $100 bytes.
    lda (UNK_60), y
    sta (UNK_64), y
    iny
    bne @copy
    inc UNK_60+1
    inc UNK_64+1
    dex
    bne @loop

    jmp WriteProtectPRGRam

;updates the screen with attr data at UNK_A4
SetMenu_ScreenAttr:
    clc

    ;UNK_AA = (player_x + $40) & $FF80
    lda player_x
    adc #$40
    and #$80
    sta UNK_AA
    lda player_x+1
    adc #0
    sta UNK_AA+1

    ;UNK_AC = player_y
    lda player_y
    sta UNK_AC
    lda player_y+1
    sta UNK_AC+1

    ;???
    jsr B30_155d

    ;a = (player_x << 2) << 1 + c
    ;x = a & 1
    lda player_x
    asl a
    asl a
    rol a
    and #%00000001
    tax

    ldy UNK_A1

    ;UNK_7A = $10
    lda #$10
    sta UNK_7A

    jsr EnablePRGRam

    @B25_02de:

    tya
    ora #$f0
    sta UNK_7B

    ;OVERWORLD_attrbuffer[x] = UNK_A4[y]
    @attrbuffer_loop:
    lda (UNK_A4), y
    sta OVERWORLD_attrbuffer, x
    iny
    inx
    inc UNK_7B
    bne @attrbuffer_loop

    ;y -= $10
    tya
    sec
    sbc #$10
    tay

    ;UNK_A5 ^= 1
    lda UNK_A5
    eor #%00000001
    sta UNK_A5

    lda UNK_A1
    and #$0f
    beq @skip_loop2
    sta UNK_7B

    @attrbuffer_loop2:
    lda (UNK_A4), y
    sta OVERWORLD_attrbuffer, x
    iny
    inx
    dec UNK_7B
    bne @attrbuffer_loop2

    @skip_loop2:

    ;y += $10
    tya
    clc
    adc #$10
    tay

    ;UNK_A5 ^= 1
    lda UNK_A5
    eor #%00000001
    sta UNK_A5

    dec UNK_7A
    bne @B25_02de

    jmp WriteProtectPRGRam

;hides all relevant sprites when you open a menu
HideSpritesForMenu:
    sec
    ror oam_and_300_clear_flag

    ;UNK_78 = ntbl_x << 3
    ;;;UNK_78 is now the top left of a panel
    lda ntbl_x
    asl a
    asl a
    asl a
    sta UNK_78

    ;UNK_79 = ((ntbl_x + char_count) << 3) - 4
    ;;;UNK_79 is now the top right of a panel
    clc
    lda ntbl_x
    adc char_count
    asl a
    asl a
    asl a
    sec
    sbc #4
    sta UNK_79

    ;UNK_7C = (ntbl_y & 0x1E) << 3
    ;;;UNK_7C is now the bottom left of a panel
    lda ntbl_y
    clc
    and #%00011110
    asl a
    asl a
    asl a
    sta UNK_7C

    ;UNK_7D = UNK_7C + 12
    ;;;UNK_7D is now the bottom right of a panel
    clc
    adc #12
    sta UNK_7D

    ldx #0
    @loop:
    ;if shadow_oam[x] (sprite y) < UNK_7D, skip
    lda shadow_oam, x
    cmp UNK_7D
    bcs @no_match

    ;if shadow_oam[x] (sprite y) + 4 >= UNK_7C, skip
    adc #4
    cmp UNK_7C
    bcc @no_match

    ;if shadow_oam[x]+3 (sprite x) < UNK_79, skip
    lda shadow_oam+3, x
    cmp UNK_79
    bcs @no_match

    ;if shadow_oam[x]+3 (sprite x) + 4 >= UNK_78, skip
    adc #4
    cmp UNK_78
    bcc @no_match

    ;set tile offscreen
    lda #$f0
    sta shadow_oam, x

    @no_match:
    inx
    inx
    inx
    inx
    bne @loop

    asl oam_and_300_clear_flag
    rts

SetupMenu:
    jsr Draw_SetupMenu

    ;display all 4 choices
    ldy #0
    @load_your_choices:
    tya
    pha
    jsr Display_SetupMenuChoices
    pla
    tay
    iny
    cpy #4
    bcc @load_your_choices

    ;yeah man
    lda #1
    sta UNK_D6

    ;do menu choicer
    lda #.LOBYTE(SetupMenu_Choicer)
    ldx #.HIBYTE(SetupMenu_Choicer)
    sta UNK_80
    stx UNK_80+1
    jsr PRINT_CURR_CHOICER

    @main_loop:
    ;if !PAD_A, jump
    bit menucursor_pos+1
    bpl @exit

    ;x = pos
    lda menucursor_pos
    tax
    ;y = pos >> 3
    lsr a
    lsr a
    lsr a
    tay

    jsr EnablePRGRam

    ;write value
    lda SetupMenu_Choices, x
    sta preferences, y

    ;if y != 3, jump
    cpy #3
    bne @B25_03b0

    txa
    and #$07
    tax
    lda SetupMenu_MessageSpeeds, x
    sta battle_message_speed
    @B25_03b0:
    jsr WriteProtectPRGRam

    ;re-run the displaying script to add the new choice
    lda ntbl_x
    pha
    lda ntbl_x+1
    pha
    jsr Display_SetupMenuChoices

    ;reset ntbl_x
    pla
    sta ntbl_x+1
    pla
    sta ntbl_x

    jsr B31_0f7c
    jmp @main_loop

    @exit:
    lda #0
    sta UNK_D6
    rts

;y = preference index
Display_SetupMenuChoices:
    ;ntbl_y = (y << 2) + 13
    tya
    asl a
    asl a
    adc #13 ;y pos offset?
    sta ntbl_y

    ;get preferences[y]
    lda preferences, y
    sta UNK_60
    ;get preference_limits[y]
    lda SetupBitfields, y
    sta UNK_60+1

    ldx #5
    @loop:
    stx ntbl_x

    ;get tile value from `preferences` boolean
    ;radial_empty + 0 or 1
    lda #radial_empty
    asl UNK_60
    adc #0

    ;;;check if should bother
    ;UNK_60+1 <<= 1
    ;if not carry, skip
    asl UNK_60+1
    bcc @no_add
    ;if carry, display value
    jsr AddTileViaNMI
    @no_add:
    clc

    ;x = ntbl_x+4
    lda ntbl_x
    adc #4
    tax
    ;if x == 25, break
    cpx #25
    bcc @loop

    rts

;self explanatory
SetupMenu_Choicer:
    .byte 8, 4 ; choicer array size
    .byte 4, 4 ; X/Y inc
    .byte PAD_A | PAD_B ; Input mask
    .byte $3a ; Tile
    .byte 4, 13 ;X/Y start
    .addr SetupMenu_Choices ; choices

;used to determine when things are displayed/checked
SetupBitfields:
    .byte %10101000
    .byte %10101000
    .byte %10101000
    .byte %11111000

;bits that get written to save meta's 'preferences'
SetupMenu_Choices:
    .byte $80,  0,$20,  0, 8, 0, 0, 0
    .byte $80,  0,$20,  0, 8, 0, 0, 0
    .byte $80,  0,$20,  0, 8, 0, 0, 0
    .byte $80,$40,$20,$10, 8, 0, 0, 0

;indexed from ^
SetupMenu_MessageSpeeds:
    .byte $41, $31, $21, $11, $01

RepelRing_Effect:
    jsr AutoBattleTest

    ;if repel_counter == 0, leave
    lda repel_counter
    beq @exit

    ;get Repel_LevelTable[Repel_BattleDifficultyTable[battle]]
    ldy enemy_group
    ldx Repel_BattleDifficultyTable, y
    lda Repel_LevelTable, x

    ;if Ninten's level is >= the repel level, leave
    cmp Ninten_Data+party_info::level
    bcs @exit
    ;else, expend a repel
    jsr EnablePRGRam
    dec repel_counter
    jsr WriteProtectPRGRam
    lda #0
    sta enemy_group

    ;if repel_counter == 0, jump
    lda repel_counter
    beq @out_of_repels

    @exit:
    rts

    @out_of_repels:
    ;UNK_73 = UMSG::REPEL_RING_BREAK (big endian)
    lda #.LOBYTE(UMSG::REPEL_RING_BREAK)
    sta UNK_73+1
    lda #.HIBYTE(UMSG::REPEL_RING_BREAK)
    sta UNK_73

    lda #.BANK(O_PrintText)
    ldx #.LOBYTE(O_PrintText-1)
    ldy #.HIBYTE(O_PrintText-1)
    jsr TempUpperBankswitch

    lda #.BANK(OINST_END)
    ldx #.LOBYTE(OINST_END-1)
    ldy #.HIBYTE(OINST_END-1)
    jsr TempUpperBankswitch

    ;????
    lda #$13
    ldx #.LOBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    ldy #.HIBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    jsr TempUpperBankswitch

    ;rts
    jmp BANKSET_H14

Repel_LevelTable:
.byte 0,3,5,7,10,12,16,18,19,21,23,26,28,30,35,36,37,-1

Repel_BattleDifficultyTable:
.byte $00,$01,$03,$01,$03,$01,$03,$03,$01,$03,$01,$01,$07,$01,$01,$02
.byte $11,$11,$11,$11,$02,$02,$03,$03,$11,$03,$03,$03,$03,$03,$03,$11
.byte $03,$11,$03,$03,$11,$03,$06,$11,$06,$06,$11,$08,$04,$11,$11,$11
.byte $04,$04,$04,$04,$05,$05,$05,$04,$05,$05,$04,$04,$04,$05,$05,$11
.byte $11,$11,$11,$11,$11,$11,$11,$11,$06,$08,$08,$11,$11,$11,$07,$07
.byte $07,$07,$07,$11,$06,$06,$11,$11,$06,$11,$02,$09,$11,$11,$11,$09
.byte $09,$11,$09,$09,$11,$11,$09,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$11
.byte $11,$11,$0B,$0B,$0B,$0B,$0B,$0D,$0D,$0B,$0B,$0B,$0B,$0B,$11,$11
.byte $11,$0B,$11,$11,$11,$11,$11,$11,$11,$0B,$0B,$0C,$0C,$0C,$0C,$0C
.byte $11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11
.byte $11,$11,$11,$11,$11,$0E,$0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F,$10,$10
.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00

Tombstone_AntiPiracy:
    ;UNK_2C = 0
    lda #0
    sta UNK_2C

    ;???
    lda #$13
    ldx #.LOBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    ldy #.HIBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    jsr TempUpperBankswitch

    ;swap gfx
    lda #$6a
    ldx #BANK::CHR0800
    jsr BANK_SWAP

    jsr PpuSync

    ;move all sprite objects $20 forward
    ldx #$df
    @move:
    lda SPRITE_OBJECTS, x
    sta SPRITE_OBJECTS+$20, x
    dex
    cpx #$ff
    bne @move

    ;write the sparkles
    ldx #$1f
    @write:
    lda tombstone_spritedata, x
    sta SPRITE_OBJECTS, x
    dex
    bpl @write

    ;UNK_60 = (player_x + $60) - object_pointer->xpos
    clc
    lda player_x
    adc #$60
    sta UNK_60
    lda player_x+1
    adc #0
    sta UNK_60+1
    sec
    ldy #object_m_xpos
    lda (object_pointer), y
    sbc UNK_60
    sta UNK_60
    iny
    lda (object_pointer), y
    sbc UNK_60+1
    sta UNK_60+1

    ;UNK_60 >>= 2
    lsr UNK_60+1
    ror UNK_60
    lsr UNK_60+1
    ror UNK_60

    ;UNK_64 = (player_y + $a4) - object_pointer->ypos
    clc
    lda player_y
    adc #$a4
    sta UNK_64
    lda player_y+1
    adc #0
    sta UNK_64+1
    sec
    ldy #object_m_ypos
    lda (object_pointer), y
    sbc UNK_64
    sta UNK_64
    iny
    lda (object_pointer), y
    sbc UNK_64+1
    sta UNK_64+1

    ;UNK_64 >>= 2
    lsr UNK_64+1
    ror UNK_64
    lsr UNK_64+1
    ror UNK_64

    ;first four objects.x = UNK_60
    lda UNK_60
    sta SPRITE_OBJECTS+(0*8)+2
    sta SPRITE_OBJECTS+(1*8)+2
    sta SPRITE_OBJECTS+(2*8)+2
    sta SPRITE_OBJECTS+(3*8)+2

    ;first four objects.y = UNK_64
    lda UNK_64
    sta SPRITE_OBJECTS+(0*8)+3
    sta SPRITE_OBJECTS+(1*8)+3
    sta SPRITE_OBJECTS+(2*8)+3
    sta SPRITE_OBJECTS+(3*8)+3

    ;new_animation_timer = 90
    ;wait for 90 frames
    lda #90
    sta new_animation_timer

    ;fill palette with color $30
    lda #$30
    jsr BackupAndFillPalette

    jsr PpuSync

    ;remove sparkles
    lda #0
    sta SPRITE_OBJECTS+4
    sta SPRITE_OBJECTS+5
    sta SPRITE_OBJECTS+(1*8)
    sta SPRITE_OBJECTS+(2*8)
    sta SPRITE_OBJECTS+(3*8)

    ;place crystal
    lda UNK_60
    sta SPRITE_OBJECTS+2
    lda UNK_64
    sta SPRITE_OBJECTS+3
    lda #.LOBYTE(SPRITEDEF_TOMBSTONE_CRYSTAL)
    sta SPRITE_OBJECTS+6
    lda #.HIBYTE(SPRITEDEF_TOMBSTONE_CRYSTAL)
    sta SPRITE_OBJECTS+7

    ;one frame wait
    lda #1
    sta new_animation_timer

    ;then resotre palette
    jsr RestoreAndUpdatePalette

    ldx #60
    jmp WaitXFrames_Min1

;sparkles :)
tombstone_spritedata:
    .byte 4, 0, 50, 50,  1,  1
    .addr SPRITEDEF_TOMBSTONE_SPARKLE
    .byte 4, 0, 66, 50,  1, -1
    .addr SPRITEDEF_TOMBSTONE_SPARKLE
    .byte 4, 0, 50, 66, -1,  1
    .addr SPRITEDEF_TOMBSTONE_SPARKLE
    .byte 4, 0, 66, 66, -1, -1
    .addr SPRITEDEF_TOMBSTONE_SPARKLE

Livehouse_Antipiracy:
    jsr Refresh_SpriteObjects
    ;mute music
    lda #$ff
    jsr PlayMusic

    ;wait a second
    ldx #60
    jsr WaitXFrames_Min1

    ;play music
    lda #$23
    sta soundqueue_track

    ;party spr pointer -= 8
    lda #.LOBYTE(-8)
    ldx #.HIBYTE(-8)
    jsr LIVEHOUSE_setupParty

    ;party spr pointer += 16
    lda #.LOBYTE(16)
    ldx #.HIBYTE(16)
    jsr LIVEHOUSE_setupParty

    jsr LIVEHOUSE_domotionStopTwice
    jsr LIVEHOUSE_domotionStopTwice
    jsr LIVEHOUSE_setmotion0
    jsr LIVEHOUSE_setmotion8
    jsr LIVEHOUSE_setmotion0
    jsr LIVEHOUSE_setmotion8
    jsr LIVEHOUSE_domotionStopTwice
    jsr LIVEHOUSE_setmotion10
    jsr LIVEHOUSE_setmotion18
    jsr LIVEHOUSE_setmotion10
    jsr LIVEHOUSE_setmotion18
    jsr PpuSync
    ldx #96
    jsr WaitXFrames_Min1
    jsr LIVEHOUSE_setmotion0
    jsr LIVEHOUSE_setmotion8
    jsr LIVEHOUSE_setmotion0
    jsr LIVEHOUSE_domotionStop
    ldx #120
    jmp WaitXFrames_Min1

LIVEHOUSE_setmotion0:
    ldy #0
    bpl LIVEHOUSE_setmotionloop

LIVEHOUSE_setmotion8:
    ldy #8
    bpl LIVEHOUSE_setmotionloop

LIVEHOUSE_setmotion10:
    ldy #$10
    bpl LIVEHOUSE_setmotionloop

LIVEHOUSE_setmotion18:
    ldy #$18
    LIVEHOUSE_setmotionloop:
    lda LIVEHOUSE_motions, y
    ldx LIVEHOUSE_motions+1, y
    jsr LIVEHOUSE_domotion
    iny
    iny
    tya
    and #%00000111
    bne LIVEHOUSE_setmotionloop
    rts

; $A73E
; Used by $A71F
LIVEHOUSE_motions:
    .byte 1, 0
    .byte -1, 0
    .byte 1, 0
    .byte -1, 0
    ; Used by $A723
    .byte 1, -1
    .byte -1, 0
    .byte 1, 1
    .byte -1, 0
    ; Used by $A727
    .byte 0, -1
    .byte 0, -1
    .byte 0, -1
    .byte 0, -1
    ; Usd by $A72B
    .byte 1, 1
    .byte -1, 1
    .byte 1, 1
    .byte -1, 1


;in
;a = UNK_60
;x = UNK_60+1
;todo: verify
LIVEHOUSE_setupParty:
    sta UNK_60
    stx UNK_60+1

    ;loop over SPRITE_OBJECTS 1-4 exclusive
    ldx #(1*8)
    @loop:
    jsr LIVEHOUSE_movesprUnk60

    lda #$30
    sta new_animation_timer

    jsr LIVEHOUSE_movex8

    cpx #$20
    bcc @loop

    jsr PpuSync

    lda #$30
    sta new_animation_timer

    rts

;move sprite object at SPRITE_OBJECT[x] by UNK_60
LIVEHOUSE_movesprUnk60:
    jsr PpuSync

    ;SPRITE_OBJECTS[x].spritedef += UNK_60
    clc
    lda UNK_60
    adc SPRITE_OBJECTS+6, x
    sta SPRITE_OBJECTS+6, x
    lda UNK_60+1
    adc SPRITE_OBJECTS+7, x
    sta SPRITE_OBJECTS+7, x

    rts

;check if sprite object >= $20, if so zero out the velocity
;else, set velocity from UNK_64
LIVEHOUSE_checksetvel:
    cpx #$20
    bcs LIVEHOUSE_zerovel

    lda UNK_64
    sta SPRITE_OBJECTS+4, x
    lda UNK_64+1
    sta SPRITE_OBJECTS+5, x

    rts

LIVEHOUSE_zerovel:
    lda #0
    sta SPRITE_OBJECTS+4, x
    sta SPRITE_OBJECTS+5, x

    rts

;x += 8
LIVEHOUSE_movex8:
    clc
    txa
    adc #8
    tax

    rts

;this is basically an alias for
;jsr LIVEHOUSE_domotionStop
;jsr LIVEHOUSE_domotionStop
LIVEHOUSE_domotionStopTwice:
    jsr LIVEHOUSE_domotionStop
    ;fallthrough

LIVEHOUSE_domotionStop:
    lda #0
    ldx #0
    LIVEHOUSE_domotion:
    sta UNK_64
    stx UNK_64+1

    ;run B25_07bb twice
    jsr @B25_07bb
    @B25_07bb:
    ;UNK_60 = 4
    lda #.LOBYTE(4)
    ldx #.HIBYTE(4)
    sta UNK_60
    stx UNK_60+1

    ldx #(1*8)
    @loop_all:
    jsr LIVEHOUSE_movesprUnk60
    jsr LIVEHOUSE_checksetvel
    jsr LIVEHOUSE_movex8
    bcc @loop_all

    lda #2
    sta new_animation_timer

    ldx #8
    @loop_all2:
    jsr PpuSync
    jsr LIVEHOUSE_zerovel
    jsr LIVEHOUSE_movex8
    bcc @loop_all2

    lda #$16
    sta new_animation_timer

    lda #.LOBYTE(-4)
    ldx #.HIBYTE(-4)
    sta UNK_60
    stx UNK_60+1

    ldx #8
    @loop_all3:
    jsr LIVEHOUSE_movesprUnk60
    jsr LIVEHOUSE_movex8
    bcc @loop_all3

    lda #$18
    sta new_animation_timer

    rts

DepleteAttackerPP:
    ldy attacker_offset
    sec
    lda BATTLER_CURR_PP, y
    sbc battle_input_num
    sta BATTLER_CURR_PP, y
    lda BATTLER_CURR_PP+1, y
    sbc battle_input_num+1
    sta BATTLER_CURR_PP+1, y
    bcs @exit
    lda #$00
    sta BATTLER_CURR_PP, y
    sta BATTLER_CURR_PP+1, y
    @exit:
    rts

; AutoWinTest:
;     ;clear all values
;     lda #0
;     tax
;     @cleanar:
;     sta battle_reward_vars, x
;     inx
;     cpx #5
;     bcc @cleanar

;     lda #$80
;     @loopah:
;     tay

;     lda BATTLER_CURR_HP+1, y
;     and #%00000011
;     bne @kill
;     lda BATTLER_CURR_HP, y
;     beq @nokill
;     @kill:
;     jsr MiniKillTargetInY
;     @nokill:
;     tya
;     clc
;     adc #BATTLER_DATASIZE

;     cmp #0
;     bne @loopah

;     jsr AutoWin
;     rts


.define scaling 1
AutoBattleTest:
    .define player_count $C0
    .define enemy_count $C1

    .define highest_speed $C0
    .define lowest_speed $c1
    .define lowest_offense $c2

    .define players_order $c0
    .define enemies_order $c4

    lda #0
    sta attacker_offset
    sta player_count
    sta enemy_count

    ;do funny clean
    tax
    @clear_loop:
    sta BATTLER, x
    inx
    bne @clear_loop

    ; loop thru all party members to init data
    tax
    @InitPlayerBattler:
    txa
    pha
    lda party_members, x
    beq @EmptyPlayer
    pha

    lda #.BANK(BattleMain)
    ldx #BANK::PRG8000
    jsr BANK_SWAP
    pla
    jsr InitializePlayerBattler-$2000

    ;if this player has a status,
    ldy attacker_offset
    lda BATTLER_STATUS, y
    bne @has_status
    inc player_count
    @has_status:

    clc
    lda attacker_offset
    adc #BATTLER_DATASIZE
    sta attacker_offset
    ; skip init if party member ID is 0 (empty)
    @EmptyPlayer:
    pla
    tax
    inx
    ; loop thru party members 4 times
    cpx #4
    bne @InitPlayerBattler

    ;these are copied straight from BattleMain
    jsr BANKSWAP_L16

    jsr GetEnemyGroupPointer
    lda #BATTLER_DATASIZE * 4
    sta attacker_offset

    ; init enemies
    .define enemy_pointer battle_wordvar60

    ldy #0
    @EnemyInitStart:
    lda (ptr_chara), y
    sta enemy_pointer
    iny
    lda (ptr_chara), y
    sta enemy_pointer+1
    iny
    tya
    pha
    lda enemy_pointer
    cmp #$ff
    beq @EmptyEnemy
    tya
    pha
    lda #.BANK(CopyEnemy)
    ldx #.LOBYTE(CopyEnemy-1)
    ldy #.HIBYTE(CopyEnemy-1)
    jsr TempUpperBankswitch

    ;if this player has a status,
    ldy attacker_offset
    lda BATTLER_MINOR_STATUS, y
    and #1
    bne @is_called
    inc enemy_count
    @is_called:

    pla
    tay
    ; skip init if enemy ID is FF (empty)
    @EmptyEnemy:
    clc
    lda attacker_offset
    adc #BATTLER_DATASIZE
    sta attacker_offset
    pla
    tay
    ; there are 8 battler slots total (0-3 players, 4-7 enemies)
    cpy #8
    bne @EnemyInitStart

    ;jsr AutoWinTest
    ;jmp @exit

    ;TODO - fix for 3party??? lol
    ;if enemy_count > player_count, no win
    lda enemy_count
    cmp player_count
    beq @dont_exit
    bcc @dont_exit

    jmp @exit

    @dont_exit:
    ;need
    ;-offense
    ;-defense
    ;-hp
    ;speed oneoff
    .define working UNK_580
    .define hps working
    .define offenses working+$10
    .define defenses working+$20

    ;dump data
    lda #0
    tax ;guy index
    tay ;attacker offset
    sta highest_speed
    lda #$ff
    sta lowest_speed
    sta lowest_offense
    sta lowest_offense+1


    @checker_loop:
    ;store y
    tya
    pha

    ;get hp
    clc
    adc #battler_struct::curr_hp
    tay
    lda BATTLER, y
    sta hps, x
    iny
    inx
    lda BATTLER, y

    ;todo : verify if player also has this restriction. probably not
    cpx #8
    bcs @enemy_workaround
    ;is normal player
    jmp @normal_player
    @enemy_workaround:
    and #%00000011
    @normal_player:
    sta hps, x
    iny

    ;get offense
    iny
    iny
    dex
    lda BATTLER, y
    sta offenses, x
    iny
    inx
    lda BATTLER, y
    sta offenses, x

    ;get defense
    iny
    dex
    lda BATTLER, y
    sta defenses, x
    iny
    inx
    lda BATTLER, y
    ;todo : verify if player also has this restriction. probably not
    cpx #8
    bcs @enemy_workaround2
    ;is normal player
    jmp @normal_player2
    @enemy_workaround2:
    and #%00000011
    @normal_player2:
    sta defenses, x

    ;get speed
    iny
    iny
    lda BATTLER, y
    cpy #$80
    bcs @is_enemy
    ;else, is party
    ;get lowest speed
    cmp lowest_speed
    bcs @otherwise
    sta lowest_speed
    bcc @otherwise

    @is_enemy:
    ;is enemy
    ;get highest speed
    cmp highest_speed
    bcc @otherwise
    sta highest_speed

    @otherwise:
    inx

    ;increment
    pla
    clc
    adc #BATTLER_DATASIZE
    tay

    bcc @checker_loop

    ;rando
    jsr RNG_BYTE
    ;32 / 256
    cmp #$E0
    ;bcc @black_swirl
    jmp @green_swirl

    ; @black_swirl:

    ;actually do the check
    ;if enemy highest_speed > player lowest_speed, no win
    ; lda highest_speed
    ; .repeat scaling
    ; lsr
    ; .endrepeat
    ; cmp lowest_speed
    ; bcs @exit

    ; ;get offense check
    ; ldx #0
    ; @do_offense_loop:
    ; cpx #8
    ; bcs @is_enemy_offense
    ; ;else, is party offense
    ; lda offenses, x
    ; cmp lowest_offense
    ; bcs @highbit
    ; sta lowest_offense

    ; @highbit:
    ; inx
    ; lda offenses, x
    ; cmp lowest_offense+1
    ; bcs @otherwise_offense
    ; sta lowest_offense+1
    ; bcc @otherwise_offense

    ; @is_enemy_offense:
    ; .define workingword UNK_60
    ; ;defense[x] + hp[x] = working word
    ; clc
    ; lda defenses, x
    ; adc hps, x
    ; sta workingword
    ; inx
    ; lda defenses, x
    ; adc hps, x
    ; sta workingword+1
    ; inx

    ; lda workingword+1
    ; .repeat scaling
    ; lsr
    ; .endrepeat
    ; cmp lowest_offense+1
    ; beq @equals_case
    ; bcs @exit
    ; @equals_case:
    ; lda workingword
    ; .repeat scaling
    ; lsr
    ; .endrepeat
    ; cmp lowest_offense
    ; beq @otherwise_offense
    ; bcs @exit



    ; @otherwise_offense:
    ; inx
    ; cpx #16
    ; bcc @do_offense_loop

    ; lda #0
    ; sta enemy_group
    ; jsr ErrBuzzer
    ; ;force exit
    ; bcs @exit


    ;green swirl
    @green_swirl:
    ;oh boy tons of 16 bit math!
    ;todo - make this a chance thing???

    ;clear all values
    ldx #0
    txa
    @cleanar:
    sta players_order, x
    inx
    cpx #8
    bcc @cleanar

    tax
    @cleanar2:
    sta UNK_60, x
    inx
    cpx #$10
    bcc @cleanar2

    tax
    @cleanar3:
    sta battle_reward_vars, x
    inx
    cpx #5
    bcc @cleanar3

    jsr DoOrderSorting



    ;exit
    @exit:
    lda #.BANK(Title_Screen)
    ldx #BANK::PRG8000
    jmp BANK_SWAP


DoOrderSorting:
    .define highest_offense $60
    .define highest_hp $68
    .define groups $C0
    .define groups2 $C4

    lda #0
    tay
    tax
    ;get the main highest
    @do_offense_sort_first:
    lda offenses, x
    cmp highest_offense
    bcc @highbit
    beq @highbit
    sta highest_offense
    txa
    lsr
    clc
    adc #1
    sta groups
    @highbit:
    inx
    lda offenses, x
    cmp highest_offense+1
    bcc @otherwise_offense
    beq @otherwise_offense
    sta highest_offense+1
    txa
    lsr
    clc
    adc #1
    sta groups
    @otherwise_offense:

    inx
    cpx #8
    bcc @do_offense_sort_first

    lda #0
    tay
    @main_offense_sort:
    ldx #0
    iny
    iny
    @do_offense_sort:
    lda offenses, x
    ;if equal or higher than the previous, ignore
    cmp highest_offense-2, y
    bcs @highbit2
    ;if less or equal to current, ignore
    cmp highest_offense, y
    bcc @highbit2
    beq @highbit2
    sta highest_offense, y

    ;nummnerber order
    tya
    pha
    lsr
    tay
    lda groups, y
    bne @no_numb_check

    ;write number of member
    txa
    lsr
    clc
    adc #1
    sta groups, y

    @no_numb_check:
    pla
    tay

    @highbit2:
    inx
    lda offenses, x
    ;if equal or higher than the previous, ignore
    cmp highest_offense-1, y
    bcs @otherwise_offense2
    ;if less or equal to current, ignore
    cmp highest_offense+1, y
    bcc @otherwise_offense2
    beq @otherwise_offense2
    sta highest_offense+1, y


    ;nummnerber order
    tya
    pha
    lsr
    tay
    lda groups, y
    bne @no_numb_check2

    ;write number of member
    txa
    lsr
    clc
    adc #1
    sta groups, y

    @no_numb_check2:
    pla
    tay
    @otherwise_offense2:

    inx
    cpx #8
    bcc @do_offense_sort

    cpy #8
    bcc @main_offense_sort


    ;hps sort
    ldx #8
    lda #0
    tay
    ;get the main highest
    @do_hp_sort_first:
    lda hps, x
    cmp highest_hp
    bcc @highbit3
    beq @highbit3
    sta highest_hp
    txa
    lsr
    clc
    adc #1
    sta groups2
    @highbit3:
    inx
    lda hps, x
    cmp highest_hp+1
    bcc @otherwise_hp
    beq @otherwise_hp
    sta highest_hp+1
    txa
    lsr
    clc
    adc #1
    sta groups2
    @otherwise_hp:

    inx
    cpx #16
    bcc @do_hp_sort_first



    lda #0
    tay
    @main_hp_sort:
    ldx #8
    iny
    iny
    @do_hp_sort:
    lda hps, x
    ;if equal or higher than the previous, ignore
    cmp highest_hp-2, y
    bcs @highbit4
    ;if less or equal to current, ignore
    cmp highest_hp, y
    bcc @highbit4
    beq @highbit4
    sta highest_hp, y

    ;nummnerber order
    tya
    pha
    lsr
    tay
    lda groups2, y
    bne @no_numb_check3

    ;write number of member
    txa
    lsr
    clc
    adc #1
    sta groups2, y

    @no_numb_check3:
    pla
    tay

    @highbit4:
    inx
    lda hps, x
    ;if equal or higher than the previous, ignore
    cmp highest_hp-1, y
    bcs @otherwise_hp2
    ;if less or equal to current, ignore
    cmp highest_hp+1, y
    bcc @otherwise_hp2
    beq @otherwise_hp2
    sta highest_hp+1, y

    ;nummnerber order
    tya
    pha
    lsr
    tay
    lda groups2, y
    bne @no_numb_check4

    ;write number of member
    txa
    lsr
    clc
    adc #1
    sta groups2, y

    @no_numb_check4:
    pla
    tay
    @otherwise_hp2:

    inx
    cpx #16
    bcc @do_hp_sort

    cpy #8
    bcc @main_hp_sort


    ;for each guy in party, use up one turn attacking
    ;if all enemies die, insta win
    ;this is the fun part!
    .define final_working_defense $c8 ;word
    .define final_working_offense $ca ;word
    .define final_working_hp $cc ;word
    .define current_enemy $580 ;byte
    .define final_working_generic $ce ;word
    lda #0
    tay
    tax

    @cleanar2:
    sta UNK_60, x
    inx
    cpx #$10
    bcc @cleanar2
    tax

    sta final_working_hp
    sta final_working_hp+1
    lda #3
    sta current_enemy

    @do_subtraction:
    ;get usar id
    lda groups, x

    ;id -= 1 because one index
    clc
    sbc #0
    ;if id high bit, negative. skip
    bpl @keepgoing1
    jmp @donextentry
    @keepgoing1:

    ;id * 2
    asl
    tay
    ;get player offense
    lda offenses, y
    sta final_working_offense
    lda offenses+1, y
    sta final_working_offense+1

    ;if working_hp == 0
    ;load next enemy
    lda final_working_hp
    bne @whale
    lda final_working_hp+1
    bne @whale
    ;if both checks fail, load in next enemy

    inc current_enemy
    lda current_enemy
    ;if current slot is 8, youve done all :)
    cmp #8
    bcs AutoWin

    tay
    ;if no next, finish
    lda groups, y
    beq AutoWin
    ;load next
    clc
    sbc #0
    asl
    tay
    lda hps, y
    sta final_working_hp
    lda hps+1, y
    sta final_working_hp+1
    lda defenses, y
    sta final_working_defense
    lda defenses+1, y
    sta final_working_defense+1


    ;else, keep whalin!
    @whale:
    ;Normal Attack Damage = AttackerOFF - (DefenderDEF / 2)
    ;defense >> 1
    lda final_working_defense+1
    lsr
    sta final_working_generic+1
    lda final_working_defense
    ror
    sta final_working_generic

    ;offense - final_working_generic
    sec
    lda final_working_offense
    sbc final_working_generic
    sta final_working_generic
    lda final_working_offense+1
    sbc final_working_generic+1
    sta final_working_generic+1
    ;if offense is negative, proper damage will not be output. just ignore atp
    bmi @donextentry

    ;hp - final_working_generic
    sec
    lda final_working_hp
    sbc final_working_generic
    sta final_working_hp
    lda final_working_hp+1
    sbc final_working_generic+1
    sta final_working_hp+1

    ;if health is negative, ya killed him !!!
    bmi @this_guy_is_dead
    bpl @donextentry

    @this_guy_is_dead:
    ;reset hp and prepare for next
    lda current_enemy
    tay
    lda groups, y
    clc
    sbc #0
    asl
    asl
    asl
    asl
    asl
    tay
    jsr MiniKillTargetInY

    lda #0
    sta final_working_hp
    sta final_working_hp+1

    ;check because god forbid you only attack as much as you can
    sec
    lda current_enemy
    adc #0
    ;if current slot is 8, youve done all :)
    cmp #8
    bcs AutoWin

    tay
    ;if no next, finish
    lda groups, y
    beq AutoWin

    ;BUFF : do new?
    ;RED = If DEF > OFF, Damage = (3 * AttackerOFF - DefenderDEF ) / 4


    @donextentry:
    inx
    cpx #4
    bcs @escape
    jmp @do_subtraction
    @escape:
    rts

AutoWin:
    lda #0
    sta enemy_group

    ;lda #Noise_EnemyKilled
    ;sta soundqueue_noise

    ; lda #PulseG0_StatBoost
    ; sta soundqueue_pulseg0

    ; lda #.HIBYTE(UMSG::B_YOU_WIN)
    ; sta text_id
    ; lda #.LOBYTE(UMSG::B_YOU_WIN)
    ; sta text_id+1

    ; lda #.BANK(O_PrintText)
    ; ldx #.LOBYTE(O_PrintText-1)
    ; ldy #.HIBYTE(O_PrintText-1)
    ; jsr TempUpperBankswitch

    lda soundactive_track
    pha

    ;draw stat bar
    jsr B30_03d5

    jsr RECONFIGURE_PARTY

    jsr WaitNMI

    lda #0
    ;do funny clean 2
    tax
    @clear_loop2:
    sta nmi_queue, x
    inx
    bne @clear_loop2
    sta nmi_data_offset


    lda #.BANK(BattleMain)
    ldx #.LOBYTE(BattleRewardsRoutine-1)
    ldy #.HIBYTE(BattleRewardsRoutine-1)
    jsr TempUpperBankswitch

    ; lda #.BANK(OINST_END)
    ; ldx #.LOBYTE(OINST_END-1)
    ; ldy #.HIBYTE(OINST_END-1)
    ; jsr TempUpperBankswitch

    lda #.BANK(CLEAR_TEXTBOXES_ROUTINE)
    ldx #.LOBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    ldy #.HIBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    jsr TempUpperBankswitch

    jsr B30_1977
    lda #0
    sta MIRROR
    sta irq_count
    sta UNK_70
    sta UNK_71
    sta sram_mode
    sta post_nmi_callback

    pla
    cmp soundactive_track
    beq @isnt_lvlup
    sta soundqueue_track
    @isnt_lvlup:

    rts

; kills whoever is in Y (offset)
MiniKillTargetInY:
    tya
    pha
    lda #$00
    sta BATTLER_CURR_HP, y
    sta BATTLER_CURR_HP+1, y
    lda #UNCON
    sta BATTLER_STATUS, y
    tya
    bpl @exit
    lda #$00
    sta BATTLER, y
    lda BATTLER_FULLDATA_PTR, y
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, y
    sta battle_wordvar60+1
    tya
    pha
    clc

    ;add defeated enemy exp
    ldy #enemy_struct::exp
    lda (battle_wordvar60), y
    adc battle_reward_vars
    sta battle_reward_vars
    iny
    lda (battle_wordvar60), y
    adc battle_reward_vars+1
    sta battle_reward_vars+1
    lda #0
    adc battle_reward_vars+2
    sta battle_reward_vars+2
    clc

    ;add defeated enemy money
    ldy #enemy_struct::money
    lda (battle_wordvar60), y
    adc battle_reward_vars+3
    sta battle_reward_vars+3
    iny
    lda (battle_wordvar60), y
    adc battle_reward_vars+4
    sta battle_reward_vars+4

    ;get defeated enemy item drop
    ldy #enemy_struct::item_drop
    lda (battle_wordvar60), y
    ;if item drop is 0, skip
    beq @no_item_to_drop
    ;else, write to enemy_group
    sta enemy_group
    @no_item_to_drop:
    lda #Noise_EnemyKilled
    sta soundqueue_noise
    pla
    pla
    tay

    @exit:
    rts

.define chr_page $5ff
.define address_start $5fd
.define chr_offset UNK_6
.define nametable_address UNK_78
.define gen_tiles $601

TryPortrait:
    lda chr_page
    cmp #$FF
    bne @no_skip_portrait
    rts
    @no_skip_portrait:
    ;backup chr_page
    pha

    ;we are running!
    lda #NMI_MODE::RUNNING
    sta nmi_mode

    ;backup screen space addr
    lda ntbl_x
    pha
    lda ntbl_y
    pha

    ;get top left addr
    lda #3
    sta ntbl_x
    lda #20
    sta ntbl_y
    jsr CalculateNTAddr

    ;move to backup + PPUADDR
    lda nametable_address
    sta PPUADDR
    sta address_start
    lda nametable_address+1
    sta PPUADDR
    sta address_start+1

    .define x_limit chr_page
    lda #4
    sta x_limit

    .define current_tile chr_offset
    lda chr_offset

    ;a == current_tile
    ldy #0
    @loopa:
    sta PPUDATA

    ;current_tile++
    sec
    adc #0
    pha

    ;check ntbl horiz overflow
    lda nametable_address+1
    and #$1F
    cmp #$1f
    bne @ignoral
    ;lo - coarse x == 0
    lda nametable_address+1
    and #~$1F
    sta nametable_address+1
    ;hi - switch
    lda nametable_address
    eor #%0100
    sta nametable_address

    sta PPUADDR
    lda nametable_address+1
    sta PPUADDR

    bne @returnal
    @ignoral:
    inc nametable_address+1
    @returnal:

    ;get current tile
    pla

    ;check if done with horiz row
    iny
    cpy x_limit
    bne @loopa
    ;escaped x limit

    ;move current_tile to next row
    clc
    adc #$10-4
    ;store current_tile and x_limit
    pha

    jsr yincr

    ;x_limit += 4
    clc
    lda x_limit
    adc #4
    sta x_limit


    pla
    cpy #$10
    bne @loopa

    lda #$FF
    sta chr_page

    pla
    sta ntbl_y
    pla
    sta ntbl_x

    ;irq
    pla
    sta chr_offset


    @skip_portrait:
    rts

yincr:
    lda address_start
    and #%11
    cmp #3
    bne @not_gonna_cross
    lda address_start+1
    cmp #$a0
    bcc @not_gonna_cross

    clc
    lda address_start
    adc #5
    and #$2C
    sta address_start
    sta nametable_address
    sta PPUADDR

    lda address_start+1
    and #$1f
    sta address_start+1
    sta nametable_address+1
    sta PPUADDR
    rts

    @not_gonna_cross:
    clc
    lda address_start+1
    adc #$20
    sta address_start+1
    sta nametable_address+1
    lda address_start
    adc #0
    sta address_start
    sta nametable_address
    sta PPUADDR

    lda nametable_address+1
    sta PPUADDR
    rts

;this is checked every time the 'warp to magicant' transition happens
;namely the onyx hook, shells and gravestone
ShowScreen:
    jsr PpuSync
    ;fade to black
    jsr OT0_DefaultTransition

    ;clear everything
    jsr Refresh_SpriteObjects
    jsr ClearSprites
    jsr ClearTilemaps

    jsr PpuSync

    ;irq_count = 0
    ;scroll_x = 0
    ;scroll_y = 0
    lda #0
    sta irq_count
    sta scroll_x
    sta scroll_y
    sta UNK_70
    sta UNK_71

    BankswitchCHR_Address ANTIPIRACY_chrs

    lda #.LOBYTE(jj3_tmp-1)
    sta UNK_40
    lda #.HIBYTE(jj3_tmp-1)
    sta UNK_40+1
    jsr mini_cmd_load_bg2map
    lda #.LOBYTE(jj3_attr-1)
    sta UNK_40
    lda #.HIBYTE(jj3_attr-1)
    sta UNK_40+1
    jsr mini_cmd_set_metatileprops

    lda #1
    sta no_double

    ;ntbl_x = 2
    ;ntbl_y = 2
    lda #4
    sta ntbl_x
    sta ntbl_y

    ;load the text manually
    @B25_0238:
    jsr GetTextData
    jsr DrawTilepackClear


    cmp #0
    beq @B25_024a
    ldy #0
    lda (tilepack_ptr), y
    cmp #0
    bne @B25_0238

    @B25_024a:

    jsr PpuSync

    ;load generic palette
    ldx #$1f
    @B25_024f:
    lda ANTIPIRACY_PALETTE, x
    sta palette_queue, x
    dex
    bpl @B25_024f

    jsr mini_pal_update

    jsr WAIT_CLOSE_MENU

    lda #0
    sta no_double

    BankswitchCHR_Address ANTIPIRACY_chrs2

    jsr OT0_DefaultTransition
    rts

mini_pal_update:
    lda #1
    tya
    tax
    ;force update palette
    jmp B31_0eb5

ANTIPIRACY_PALETTE:
    .byte $07, $17, $18, $38
    .byte $07, $0f, $0f, $38
    .byte $07, $0F, $0F, $0F
    .byte $07, $0F, $0F, $0F

    .byte $07, $0F, $0F, $0F
    .byte $07, $0F, $0F, $0F
    .byte $07, $0F, $0F, $0F
    .byte $07, $0F, $0F, $0F

ANTIPIRACY_chrs:
    .byte $00, $00, $d9, $00, $dA, $db
ANTIPIRACY_chrs2:
    .byte $60, $00, $7c, $7d, $7e, $7f

;should i bother turning this into tile commands
jj3_tmp:
.addr $2000
;width, height
.byte 32, 30
    .incbin "../../edit/note_tiles.tilemap"

jj3_attr:
.addr $23C9
.byte 6, 5
    .res 6*5, %01010101

mini_cmd_set_metatileprops:
    lda #8
    bne unconditional_funny
    mini_cmd_load_bg2map:
    lda #$20
    unconditional_funny:
    sta UNK_43
    jsr PpuSync

    lda #NMI_COMMANDS::PPU_WRITE
    sta nmi_queue ; TODO: UNKNOWN NMI COMMAND

    ;height = UNK_40[y]
    ldy #4
    lda (UNK_40), y
    sta UNK_42

    ;count
    dey
    lda (UNK_40), y
    sta nmi_queue+1

    ;write-to pointer
    dey
    lda (UNK_40), y
    sta nmi_queue+2
    dey
    lda (UNK_40), y
    sta nmi_queue+3

    ldy #5
    @y_loop:
    ldx #0
    @x_loop:
    ;get content byte
    lda (UNK_40), y
    sta nmi_queue+4, x
    iny

    ;if y == 0, UNK_41 += 1
    bne @not_zero
    inc UNK_41
    @not_zero:

    ;if x != count, branch
    inx
    cpx nmi_queue+1
    bne @x_loop

    ;end
    lda #0
    sta nmi_queue+4, x
    sta nmi_data_offset

    ;skip nmi
    lda #$80
    sta new_animation_timer

    dec UNK_42
    beq @exit

    jsr PpuSync

    ;nmi_queue+2 += UNK_43
    clc
    lda UNK_43
    adc nmi_queue+3
    sta nmi_queue+3
    lda #0
    adc nmi_queue+2
    sta nmi_queue+2
    jmp @y_loop

    @exit:
    rts

TimeChange:
    ;step time increment
    clc
    lda dad_call_timer
    adc #150
    sta dad_call_timer
    bcc @no_more
    inc dad_call_timer+1
    bne @no_more
    inc dad_call_timer+2

    @no_more:


    lda dad_call_timer
    sta UNK_60
    lda dad_call_timer+1
    sta UNK_60+1
    lda dad_call_timer+2
    sta UNK_62
    lda #60
    sta UNK_64
    jsr B31_113d

    lda #60
    sta UNK_64
    jsr B31_113d
    sta time_min

    lda #24
    sta UNK_64
    jsr B31_113d
    sta time_hour

    lda time_days
    sta temp_vars+1

    lda temp_vars
    clc
    adc #1
    sta time_days
    cmp temp_vars+1
    bcc make_sure_dim_level_is_correct
    beq make_sure_dim_level_is_correct
    cmp #1
    beq make_sure_dim_level_is_correct
    jmp ShowNewDay

make_sure_dim_level_is_correct:
    ;hour // 4
    lda time_hour
    sta temp_vars
    lda #0
    sta temp_vars+1
    sta temp_vars+2
    lda #4
    sta UNK_64
    jsr B31_113d
    ldx temp_vars
    lda dim_levels, x

    cmp current_light
    bne @do
    rts
    @do:
    pha
    jsr EnablePRGRam
    pla
    pha
    sta current_light

    jsr reload_palette

    ;backup palette
    jsr BackupPalette

    pla
    bne @actually_darken
    ;force update palette
    lda #1
    tax
    tay
    jsr B31_0eb5
    rts
    @actually_darken:


    tay
    iny ;amount of darkens
    @do_another:
    ldx #$1f ;amount of colors - 1
    @darken:
    ;set carry to check if toggled
    sec
    ;get palette[x]
    lda palette_queue, x
    ;-= 16
    sbc #$10
    ;skip if still 'carry'
    bcs @darkest
    ;if negative, load default black
    lda #$0f
    @darkest:
    ;load back into
    sta palette_queue, x
    dex
    ;if x < 0, break
    bpl @darken

    tya
    tax
    ;force update palette
    jsr B31_0eb5
    dey
    cpy #1
    bne @do_another

    rts



dim_levels:
    ;0-4
    .byte 2
    ;4-8
    .byte 1
    ;8-12
    .byte 0
    ;12-16
    .byte 0
    ;16-20
    .byte 1
    ;20-24
    .byte 2

reload_palette:
    ;[map_tmp_ptr+1] = 0
    lda #0
    sta map_tmp_ptr+1

    ;[map_current_palette] <<= 4
    ;[map_tmp_ptr+1] <<= 2
    ;move lost bits into map_tmp_ptr+1
    lda map_current_palette
    asl a
    asl a
    asl a
    rol map_tmp_ptr+1
    asl a
    rol map_tmp_ptr+1

    ;basically, map_tmp_ptr = map_current_palette * 0x10

    ;[map_tmp_ptr] += Map_Palettes
    adc #.LOBYTE(Map_Palettes)
    sta map_tmp_ptr
    lda map_tmp_ptr+1
    adc #.HIBYTE(Map_Palettes)
    sta map_tmp_ptr+1

    ;wait for ppu so this doesnt go crazy
    jsr PpuSync

    lda current_banks+BANK::PRG8000
    pha
    lda #.BANK(Map_Palettes)
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ldy #$f
    @add_palette_to_queue:
    lda (map_tmp_ptr), y
    bpl @is_positive
    @is_positive:
    ;put byte into palette queue (relative)
    sta palette_queue, y
    ;y--, loop if y > 0
    dey
    bpl @add_palette_to_queue

    pla
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ;standard copy the sprite palette
    ldy #$f
    @copy_sprite_palette:
    lda Field_Sprite_Palette, y
    sta palette_queue+$10, y
    dey
    bpl @copy_sprite_palette

    lda #$f
    sta palette_queue+$c
    lda #$30
    sta palette_queue+$e

    rts


;this is checked every time the 'warp to magicant' transition happens
;namely the onyx hook, shells and gravestone
ShowNewDay:
    jsr PpuSync
    ;fade to black
    jsr OT0_DefaultTransition

    ;clear everything
    jsr Refresh_SpriteObjects
    jsr ClearSprites
    jsr ClearTilemaps

    jsr PpuSync

    ;irq_count = 0
    ;scroll_x = 0
    ;scroll_y = 0
    lda #0
    sta irq_count
    sta scroll_x
    sta scroll_y
    sta UNK_70
    sta UNK_71

    BankswitchCHR_Address NEW_DAY_chrs

    lda #.LOBYTE(a_new_day_tiles)
    sta tilepack_ptr ;store lo
    lda #.HIBYTE(a_new_day_tiles)
    sta tilepack_ptr+1 ;store hi

    @loop:
    jsr DrawTilepack
    dec ntbl_y
    cmp #0
    bne @loop

    jsr PpuSync

    ;load generic palette
    ldx #$1f
    @B25_024f:
    lda NEW_DAY_PALETTE, x
    sta palette_queue, x
    dex
    bpl @B25_024f

    jsr mini_pal_update

    jsr WAIT_CLOSE_MENU

    jsr OT0_DefaultTransition

    ;???
    lda #.BANK(STORE_COORDINATES)
    ldx #.LOBYTE(STORE_COORDINATES-1)
    ldy #.HIBYTE(STORE_COORDINATES-1)
    jsr TempUpperBankswitch

    jsr EnablePRGRam
    sta current_light
    jmp make_sure_dim_level_is_correct

NEW_DAY_PALETTE:
    .byte $0F, $0F, $30, $0F
    .byte $0F, $0F, $30, $0F
    .byte $0F, $0F, $30, $0F
    .byte $0F, $0F, $30, $0F

    .byte $0F, $0F, $30, $0F
    .byte $0F, $0F, $30, $0F
    .byte $0F, $0F, $30, $0F
    .byte $0F, $0F, $30, $0F

NEW_DAY_chrs:
    .byte $60, $00, $7c, $7d, $7e, $7f

a_new_day_tiles:
    ;produced by
    .byte set_pos 11, 12
    .byte "A NEW DAY"
    .byte set_pos 13, 15
    .byte "BEGINS"
    .byte stopText
