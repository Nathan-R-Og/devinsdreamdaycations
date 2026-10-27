.segment        "CREDITS": absolute

.define loop_count UNK_47

Credits_Entry:
    ;wait 120 frames
    ldx #120
    jsr WaitXFrames_Min1

    ;do fade out
    jsr credits_cmd_fade_out

    ;wait a frame
    jsr PpuSync

    ;horizontal tables
    lda #0
    sta MIRROR

    ;irq_count = 0
    lda #0
    sta irq_count

    ; disable camera shaking
    lda UNK_E7
    and #~$40
    sta UNK_E7

    ;shift_x = 0
    ;shift_y = 0
    lda #0
    sta shift_x
    sta shift_y

    ;reset Base nametable address
    lda ram_PPUCTRL
    and #%11111100
    ldx #$10
    ldy #8
    sta ram_PPUCTRL
    stx scroll_x
    sty scroll_y

    ;clear music
    lda #$ff
    jsr PlayMusic

    ;swap music bank to the dedicated credits bank
    lda #.BANK(Music_Tick)
    sta music_bank

    ;wait for nmi
    jsr WaitNMI

    ;load pointer
    lda #.LOBYTE(Credits_Script)
    sta UNK_40
    lda #.HIBYTE(Credits_Script)
    sta UNK_40+1

    eval_loop:

    ;if byte == 0, loop
    ldy #0
    lda (UNK_40), y
    beq force_loop

    jsr do_credits_eval

    ;UNK_40 += y index
    clc
    tya
    adc UNK_40
    sta UNK_40
    lda #0
    adc UNK_40+1
    sta UNK_40+1

    jmp eval_loop

    force_loop:
    jmp force_loop

do_credits_eval:
    ;x = a * 2
    asl a
    tax

    ;jmp credits_lut[a]
    lda credits_lut+1, x
    pha
    lda credits_lut, x
    pha
    rts


Credits_Entry_bad:
    ;wait 120 frames
    ldx #120
    jsr WaitXFrames_Min1

    ;do fade out
    jsr credits_cmd_fade_out

    ;wait a frame
    jsr PpuSync

    ;horizontal tables
    lda #0
    sta MIRROR

    ;irq_count = 0
    lda #0
    sta irq_count

    ; disable camera shaking
    lda UNK_E7
    and #~$40
    sta UNK_E7

    ;shift_x = 0
    ;shift_y = 0
    lda #0
    sta shift_x
    sta shift_y

    ;reset Base nametable address
    lda ram_PPUCTRL
    and #%11111100
    ldx #$10
    ldy #8
    sta ram_PPUCTRL
    stx scroll_x
    sty scroll_y

    ;clear music
    lda #$ff
    jsr PlayMusic

    ;swap music bank to the dedicated credits bank
    lda #.BANK(Music_Tick)
    sta music_bank

    ;wait for nmi
    jsr WaitNMI

    ;load pointer
    lda #.LOBYTE(Credits_Script_bad)
    sta UNK_40
    lda #.HIBYTE(Credits_Script_bad)
    sta UNK_40+1

    jmp eval_loop

credits_lut:
    .addr force_loop-1 ; [00]                      - END, locks up the game
    .addr credits_cmd_delay-1 ; [01 XX]                   - Wait XX frames
    .addr credits_cmd_unk2-1 ; [02 XX]                   - Waits for a specific input??
    .addr credits_cmd_fade_out-1 ; [03]                      - Fades out
    .addr credits_cmd_load_tilesets-1 ; [04 AA BB CC DD]          - CHR bankswitch (R2, R3, R0, R1)
    .addr credits_cmd_load_bg2map-1 ; [05 AA BB CC DD (XX*BB)]  - Load nametable tile data
    .addr credits_cmd_set_metatileprops-1 ; [06 AA BB CC DD (XX*BB)]  - Load metatile properites
    .addr credits_cmd_set_palette-1 ; [07 (XX*10)]              - Set color palette
    .addr credits_cmd_unk8-1 ; [08 XXXX]                 - Unconditional jump
    .addr credits_cmd_init_sprite-1 ; [09 AA BB CC DD EE FF GG] - Init "Sprite" object
    .addr credits_cmd_move_sprite-1 ; [0A AA BB CC DD EE]       - Edit "Sprite" object
    .addr credits_cmd_play_mus-1 ; [0B XX]                   - Play music XX
    .addr credits_cmd_load_secondarytilesets-1 ; [0C XX]                   - CHR bankswitch (R1)
    .addr credits_cmd_set_alltilesets-1 ; [0D AA BB CC DD EE FF]    - CHR bankswitch (R4, R5, R2, R3, R0, R1)
    .addr credits_cmd_begin_loop-1 ; [0E XX]                   - Set $47 loop variable
    .addr credits_cmd_end_loop-1 ; [0F XXXX]                 - Conditional branch on $47. Decrement it and branch if still not zero
    .addr credits_cmd_clear_sprite-1 ; [10 XX]                   - Wait frame then remove OAM entry?
    .addr credits_cmd_draw_text-1 ; [11 AA BB (CC*??)]        - Display text
    .addr credits_cmd_draw_text_xy-1 ; [12 AA BB CC DD]          - Display text with a position
    .addr credits_cmd_fade_in-1 ; [13]                      - Fades in
    .addr credits_cmd_fill_bg2map-1
    .addr credits_cmd_crash-1

.define ENDING_CMD_00_END .byte 0

.define ENDING_CMD_01_DELAY(frames) .byte 1, frames

credits_cmd_delay:
    ;get next byte
    iny
    lda (UNK_40), y

    ;x = a
    tax

    ;do ppu syncs until x == 0
    @loop:
    jsr PpuSync
    lda #1
    sta new_animation_timer
    dex
    bne @loop

    ;get next byte
    iny

    ;bye
    rts

.define ENDING_CMD_02(arg1) .byte 2, arg1

;wait until button pressed?
credits_cmd_unk2:
    ;clear pad1_forced
    lda #0
    sta pad1_forced

    ;get next byte
    iny
    lda (UNK_40), y

    ;loop until pad1_forced == arg1
    @wait:
    bit pad1_forced
    beq @wait

    ;clear pad1_forced
    lda #0
    sta pad1_forced

    ;get next byte
    iny

    ;bye
    rts

.define ENDING_CMD_03_FADEOUT .byte 3

credits_cmd_fade_out:
    jsr OT0_DefaultTransition
    jsr ClearSprites
    jsr ClearTilemaps

    ;set y to after this
    ldy #1

    ;bye
    rts

.macro ENDING_CMD_0D_SETALLTILESETS arg1, arg2, arg3, arg4, arg5, arg6
    .byte $D
    .byte arg1, arg2
    .byte arg3, arg4
    .byte arg5, arg6
.endmacro

credits_cmd_set_alltilesets:
    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR1800
    jsr BANK_SWAP

    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR1C00
    jsr BANK_SWAP
    ;fallthrough

.macro ENDING_CMD_04_LOADTILESETS arg1, arg2, arg3, arg4
    .byte 4
    .byte arg1
    .byte arg2
    .byte arg3
    .byte arg4
.endmacro

.define ENDING_CMD_0C_LOADSECONDARYSPRITETILES(arg1) .byte $C, arg1

credits_cmd_load_tilesets:
    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR1000
    jsr BANK_SWAP

    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR1400
    jsr BANK_SWAP

    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR0000
    jsr BANK_SWAP

    credits_cmd_load_secondarytilesets:
    ;get next byte
    iny
    lda (UNK_40), y

    ;swap to that bank
    ldx #BANK::CHR0800
    jsr BANK_SWAP

    ;goto next byte
    iny

    ;byte
    rts

.macro ENDING_CMD_05_LOADBG2MAP arg1, arg2, arg3
    .byte 5
    .addr arg1
    .byte arg2, arg3
.endmacro

.macro ENDING_CMD_06_SETMETATILEPROPERTIES arg1, arg2, arg3
    .byte 6
    .addr arg1
    .byte arg2, arg3
.endmacro

.define height UNK_42

credits_cmd_set_metatileprops:
    lda #8
    bne unconditional_funny2
    credits_cmd_load_bg2map:
    lda #$20
    unconditional_funny2:
    sta UNK_43
    jsr PpuSync

    lda #NMI_COMMANDS::PPU_WRITE
    sta nmi_queue ; TODO: UNKNOWN NMI COMMAND

    ;height = UNK_40[y]
    ldy #4
    lda (UNK_40), y
    sta height

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

    lda #$80
    sta new_animation_timer

    dec height
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

.define ENDING_CMD_07_SETPAL .byte 7

credits_cmd_set_palette:
    jsr PpuSync

    ;palette size
    ldy #$10

    ldx #$0f
    @loop:
    ;read/write byte
    lda (UNK_40), y
    sta palette_queue, x

    ;copy and write default sprite palette
    lda credits_generic_sprite_pal, x
    sta palette_queue+$10, x

    dey
    dex
    bpl @loop

    ;get transparency of first bg, copy to sprite transparency
    ;emergency case basically
    lda palette_queue
    sta palette_queue+$10
    sta palette_queue+$14
    sta palette_queue+$18
    sta palette_queue+$1c

    lda #4
    sta nmi_queue ; UPDATE_PALETTE

    lda #0
    sta nmi_queue+1 ; END
    sta nmi_data_offset

    lda #$80
    sta new_animation_timer

    ;set to after command
    ldy #$11

    ;bye
    rts

.macro ENDING_CMD_09_INITSPRITE id, tiles, arg_x, arg_y, sprite_pointer
    .byte 9, id, tiles
    .byte arg_x,arg_y
    .addr sprite_pointer
.endmacro

credits_cmd_init_sprite:
    jsr PpuSync

    ;get next byte (Slot)
    iny
    lda (UNK_40), y
    ;x = a * .sizeof(SpriteObject)
    asl a
    asl a
    asl a
    tax
    ;write Y position 9th bit
    lda (UNK_40), y
    and #SPRITE_OBJECT_OFFSCREEN_Y_DIR
    sta SPRITE_OBJECTS+SpriteObject::oam_slot_flags, x

    ;write tile count (incl. X position 9th bit)
    iny
    lda (UNK_40), y
    sta SPRITE_OBJECTS+SpriteObject::count_flags, x

    ;write posX
    iny
    lda (UNK_40), y
    sta SPRITE_OBJECTS+SpriteObject::x_pos, x

    ;write posY
    iny
    lda (UNK_40), y
    sta SPRITE_OBJECTS+SpriteObject::y_pos, x

    ;write sprite pointer
    iny
    lda (UNK_40), y
    sta SPRITE_OBJECTS+SpriteObject::sprite_def_ptr, x
    iny
    lda (UNK_40), y
    sta SPRITE_OBJECTS+SpriteObject::sprite_def_ptr+1, x

    ;write velx,vely
    lda #0
    sta SPRITE_OBJECTS+SpriteObject::x_vel, x
    sta SPRITE_OBJECTS+SpriteObject::y_vel, x

    ;set to after macro
    ldy #7

    ;bye
    rts

.macro ENDING_CMD_0A_MOVESPRITE id, offset, xvel, yvel
    .byte $A, id
    .word offset
    .byte xvel, yvel
.endmacro

credits_cmd_move_sprite:
    jsr PpuSync

    ;get next byte (Slot)
    iny
    lda (UNK_40), y
    ;x = a * 8
    asl a
    asl a
    asl a
    tax

    ;clear
    clc

    ;pointer += UNK_40[y]
    iny
    lda (UNK_40), y
    adc SPRITE_OBJECTS+SpriteObject::sprite_def_ptr, x
    sta SPRITE_OBJECTS+SpriteObject::sprite_def_ptr, x
    iny
    lda (UNK_40), y
    adc SPRITE_OBJECTS+SpriteObject::sprite_def_ptr+1, x
    sta SPRITE_OBJECTS+SpriteObject::sprite_def_ptr+1, x

    ;velx = UNK_40[y]
    iny
    lda (UNK_40), y
    sta SPRITE_OBJECTS+SpriteObject::x_vel, x
    ;vely = UNK_40[y]
    iny
    lda (UNK_40), y
    sta SPRITE_OBJECTS+SpriteObject::y_vel, x

    ;bye
    ldy #6
    rts

.define ENDING_CMD_0B_PLAYMUS(sfx) .byte $B, sfx

credits_cmd_play_mus:
    ;get and play byte
    iny
    lda (UNK_40), y
    jsr PlayMusic

    ;bye
    iny
    rts

.define ENDING_CMD_0E_BEGINLOOP(iterations) .byte $E, iterations

credits_cmd_begin_loop:
    ;write byte to $47
    iny
    lda (UNK_40), y
    sta loop_count

    ;bye
    iny
    rts

.macro ENDING_CMD_0F_ENDLOOP pointer
    .byte $F
    .addr pointer
.endmacro

credits_cmd_end_loop:
    ;loop count down
    dec loop_count
    ;if loop count == 0, do a jump to this pointer
    bne credits_cmd_unk8
    ;else, bye
    ldy #3
    rts

.macro ENDING_CMD_08 arg1
    .byte 8
    .word arg1
.endmacro

credits_cmd_unk8:
    ;push addr to stack
    ;this is some funky stuff because this is a subroutine so it has to write over the data
    ;it is BASICALLY a push to the stack. so
    ;whatever
    iny
    lda (UNK_40), y
    pha
    iny
    lda (UNK_40), y
    sta UNK_40+1
    pla
    sta UNK_40
    ldy #0
    rts

.define ENDING_CMD_10_CLEARSPRITE(arg1) .byte $10, arg1

credits_cmd_clear_sprite:
    jsr PpuSync

    ;get byte
    iny
    lda (UNK_40), y
    ;x = a * .sizeof(SpriteObject)
    asl a
    asl a
    asl a
    tax
    ;set tiles to 0
    lda #0
    sta SPRITE_OBJECTS+SpriteObject::count_flags, x

    iny
    rts

.macro ENDING_CMD_11_DRAWTEXT stringId, nodouble, posX, posY, speed
    .byte $11
    .word stringId
    .byte nodouble, posX, posY, speed
.endmacro

credits_cmd_draw_text:
    lda #0
    sta UNK_70

    ;get next word
    iny
    lda (UNK_40), y
    sta tilepack_ptr
    iny
    lda (UNK_40), y
    sta tilepack_ptr+1
    iny
    lda (UNK_40), y
    sta no_double
    iny
    lda (UNK_40), y
    bne @load_x
    @re_rollx:
    jsr RNG_BYTE
    cmp #30
    bcs @re_rollx
    @load_x:
    sta ntbl_x
    iny
    lda (UNK_40), y
    bne @load_y
    @re_rolly:
    jsr RNG_BYTE
    cmp #30
    bcs @re_rolly
    @load_y:
    sta ntbl_y
    iny
    lda (UNK_40), y
    sta dad_call_input_timer
    beq @insta_print

    @loop:
    jsr PRINT_STRING

    lda ntbl_x
    bne @haha_normal
    jsr RNG_BYTE
    cmp #5
    bcs @random_exit

    @haha_normal:

    dec ntbl_y
    lda UNK_72
    cmp #0
    bne @loop
    beq @random_exit

    @insta_print:
    jsr DrawTilepack
    dec ntbl_y
    cmp #0
    bne @insta_print

    @random_exit:


    ldy #7
    rts

.macro ENDING_CMD_12_DRAWTEXTXY stringId, arg_x, arg_y
    .byte $12
    .word stringId
    .byte arg_x,arg_y
.endmacro

credits_cmd_draw_text_xy:
    ;get next umsg
    iny
    lda (UNK_40), y
    sta tilepack_ptr
    iny
    lda (UNK_40), y
    sta UNK_73

    ;get next byte (x pos)
    iny
    lda (UNK_40), y
    sta ntbl_x

    ;get next byte (y pos)
    iny
    lda (UNK_40), y
    sta ntbl_x+1

    lda #0
    sta UNK_70
    sta UNK_71

    jsr GetTextData
    jsr DrawTilepackClear

    ;bye
    ldy #5
    rts

.define ENDING_CMD_13_FADEIN .byte $13

credits_cmd_fade_in:
    jsr RestoreAndUpdatePalette

    ;bye
    ldy #1
    rts

.macro ENDING_CMD_14_FILLBG2MAP ppuaddr, width, height, fillbyte
    .byte $14
    .addr ppuaddr
    .byte width, height, fillbyte
.endmacro

credits_cmd_fill_bg2map:
    lda #$20
    sta UNK_43
    jsr PpuSync

    lda #NMI_COMMANDS::PPU_WRITE
    sta nmi_queue ; TODO: UNKNOWN NMI COMMAND

    ldy #5
    lda (UNK_40), y
    sta dad_call_input_timer
    dey

    ;height = UNK_40[y]
    lda (UNK_40), y
    sta height

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
    lda dad_call_input_timer
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

    lda #$80
    sta new_animation_timer

    dec height
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
    ldy #$6
    rts

credits_generic_sprite_pal:
    .byte $0f, $0f, $00, $30
    .byte $0f, $0f, $16, $37
    .byte $0f, $0f, $24, $37
    .byte $0f, $0f, $12, $37


.define ENDING_CMD_15_CRASH .byte $15

credits_cmd_crash:
    ; TODO: will this hurt an nes :)
    ldx #$ff
    txs

    jsr RNG_BYTE
    pha
    jsr RNG_BYTE
    pha

    rts

;byte code begin
Credits_Script:
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0B_PLAYMUS $A
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0D_SETALLTILESETS $7e, $7F, $d4, $d3, $D0, $D4
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .incbin "../../edit/ending_a_bgtiles.tilemap"
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 2
        .res 10, $55
    ENDING_CMD_09_INITSPRITE 0, 9, $A8, $D8, SPRITEDEF_C_HELICOPTER
    ENDING_CMD_09_INITSPRITE 1, 3, $A8, $D8, SPRITEDEF_C_HELICOPTER_THING
    ENDING_CMD_0A_MOVESPRITE 0, 0, 0, -1
    ENDING_CMD_0A_MOVESPRITE 1, 0, 0, -1
    ENDING_CMD_07_SETPAL
        .byte $0f,$11,$02,$0f
        .byte $0f,$0f,$28,$38
        .byte $0f, $28, $30, $18
        .byte $0f,$0f,$30,$0f
    ENDING_CMD_11_DRAWTEXT msg_credits1, 1, 2, 19, 1
    ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 1, 4, 0, 0
    ENDING_CMD_14_FILLBG2MAP $22a4, 27, 7, 0
    ENDING_CMD_11_DRAWTEXT msg_credits2, 1, 2, 19, 1
    ENDING_CMD_0E_BEGINLOOP 120
    CREDITS_loop_unk292:
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 1, 4, 0, 0
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 1, -8, 0, 0
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 1, 4, 0, 0
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk292
    ENDING_CMD_14_FILLBG2MAP $22a2, 30, 8, 0
    ENDING_CMD_14_FILLBG2MAP $26c0, 1, 1, 0
    ENDING_CMD_11_DRAWTEXT msg_credits3, 1, 11, 20, 1
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_06_SETMETATILEPROPERTIES $23f1, 7, 1
        .res 7, $AA
    ENDING_CMD_05_LOADBG2MAP $2306, 23, 3
        .incbin "../../edit/jj4_tiles.tilemap"

    ENDING_CMD_0E_BEGINLOOP 70
    CREDITS_loop_unk29:
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 0, 0, -1, -1
        ENDING_CMD_0A_MOVESPRITE 1, 4, -1, -1
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
        ENDING_CMD_0A_MOVESPRITE 1, -8, 0, 0
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
        ENDING_CMD_0A_MOVESPRITE 1, 4, 0, 0
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 0, 0, -1, 0
        ENDING_CMD_0A_MOVESPRITE 1, 4, -1, 0
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
        ENDING_CMD_0A_MOVESPRITE 1, -8, 0, 0
        ENDING_CMD_01_DELAY 1
        ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
        ENDING_CMD_0A_MOVESPRITE 1, 4, 0, 0
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk29

    ENDING_CMD_00_END


;byte code begin
Credits_Script_bad:
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0B_PLAYMUS $A
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0D_SETALLTILESETS $7E, $7F, $d2, $d3, $D0, $D4
    ENDING_CMD_05_LOADBG2MAP $2108, 20, 8
        .incbin "../../edit/ending_b_tiles.tilemap"
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 2
        .res 10, $55
    ENDING_CMD_07_SETPAL
        .byte $0f, $02, $16, $37
        .byte $0f, $02, $16, $37
        .byte $0f, $02, $16, $37
        .byte $0f,$0f,$30,$0f
    ENDING_CMD_11_DRAWTEXT MSG_CREDITS_92, 1, 4, 18, 10
    ENDING_CMD_14_FILLBG2MAP $2286, 25, 5, 0
    ENDING_CMD_14_FILLBG2MAP $2108, 20, 8, 0
    ENDING_CMD_05_LOADBG2MAP $216e, 8, 1
        .byte $54,0,0,0,0,0,0,$55
    ENDING_CMD_11_DRAWTEXT hello_my_baby_hello_my_honey_hello_e_waterfall, 1, 11, 23, 0
    ENDING_CMD_0E_BEGINLOOP 10
    funny_e_loop:
    ENDING_CMD_11_DRAWTEXT hello_my_baby_hello_my_honey_hello_e_waterfall, 1, 0, 0, 0
    ENDING_CMD_0F_ENDLOOP funny_e_loop
    ENDING_CMD_0E_BEGINLOOP 10
    funny_death_loop:
    ENDING_CMD_11_DRAWTEXT hello_my_baby_hello_my_honey_hello_e_waterfall, 1, 0, 0, 0
    ENDING_CMD_11_DRAWTEXT cred_Syserror, 1, 0, 0, 0
    ENDING_CMD_11_DRAWTEXT cred_NoProblem, 1, 0, 0, 0
    ENDING_CMD_11_DRAWTEXT cred_NPCerror, 1, 0, 0, 0
    ENDING_CMD_0F_ENDLOOP funny_death_loop
    ENDING_CMD_15_CRASH


MSG_CREDITS_92:
.byte   "Oh well. It was fun while",newLine
.byte   "it lasted, right?",newLine
.byte   newLine
.byte   "Now you get to spend the",newLine
.byte   "rest of your days in",newLine
.byte   "PARADIS",stopText

hello_my_baby_hello_my_honey_hello_e_waterfall:
.repeat 20
.byte "E",newLine
.endrepeat
.byte stopText

cred_NoProblem:
.byte "No problem.",stopText

cred_Syserror:
.byte "System Error!!!",stopText

cred_NPCerror:
.byte "What?!?",stopText

msg_credits1:
.byte   "Despite all odds, you, and",newLine
.byte   "more importantly ",nintenName,newLine
.byte   "get rescued and taken home.",newLine
.byte   "They ask lots of questions",newLine
.byte   "you can't begin answering.",newLine
.byte   "All the matters is that you",newLine
.byte   "ended up okay."
.byte stopText

msg_credits2:
.byte   "They take plenty of samples",newLine
.byte   "of your newly accrued disease",newLine
.byte   "and start developing a cure.",newLine
.byte   "How long it'll take, no one",newLine
.byte   "knows. But you know now that",newLine
.byte   "you can finally rest easy.",newLine
.byte   "In your own form of paradise",newLine
.byte   "called home."
.byte stopText

msg_credits3:
.byte   "THE    END",stopText