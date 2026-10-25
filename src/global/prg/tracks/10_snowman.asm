mus_snowman_pulse1:
.addr B29_02A6
B29_021C:
.addr B29_02B0
.addr B29_02D5
.addr B29_02FD
.addr -1
.addr B29_021C

mus_snowman_pulse2:
.addr B29_02AC
.addr -1
.addr B29_021C

mus_snowman_triangle:
.addr B29_0240
.addr B29_0279
.addr -1
.addr mus_snowman_triangle

B29_0240:
.byte $9F,$A0,$00
Note_Repeat 2
Note_Length nl_whole
Note_C 4
Note_AS 4
Note_A 4
Note_GS 4

Note_C 4
Note_AS 4
Note_DS 5
Note_D 5
Note_End_Repeat
Track_End

B29_0279: ;Triangle Other
Note_Length nl_eighth
Note_Repeat 8
Note_C 4
Note_End_Repeat

Note_Repeat 8
Note_E 4
Note_End_Repeat

Note_Repeat 8
Note_FS 4
Note_End_Repeat

Note_Repeat 4
Note_G 4
Note_End_Repeat

Note_Repeat 4
Note_A 4
Note_End_Repeat

;Measure 5

Note_Repeat 8
Note_C 4
Note_End_Repeat

Note_Repeat 8
Note_E 4
Note_End_Repeat

Note_Repeat 8
Note_FS 4
Note_End_Repeat

Note_Repeat 4
Note_E 4
Note_End_Repeat

Note_Repeat 4
Note_DS 4
Note_End_Repeat

;ending

Note_Length nl_whole
Note_GS 3
Note_AS 3
Note_A 3
Note_GS 3

Track_End

B29_02A6: ;Delay
.byte $9F,$00,$F3
Note_Length nl_eighth
Note_Rest
.byte $00

B29_02AC:
.byte $9F,$A2,$B7
.byte $00

B29_02B0: ;Intro holding
Note_Repeat 8
Note_Length nl_whole
Note_Rest
Note_End_Repeat
Track_End

B29_02D5: ;First part
Note_Length nl_quarter
Note_Rest
Note_Length nl_eighth
Note_C 5
Note_DS 5
Note_F 5
Note_Length nl_half
Note_AS 5

Note_Length nl_eighth
Note_Rest
Note_DS 5
Note_C 6
Note_AS 5
Note_Length nl_half
Note_A 5

Note_Length nl_eighth
Note_Rest
Note_A 4
Note_C 5
Note_DS 5
Note_Length nl_half
Note_F 5

Note_AS 5
Note_A 5

Note_Length nl_eighth
Note_Rest
Note_C 5
Note_DS 5
Note_F 5
Note_Length nl_half
Note_AS 5

Note_Length nl_eighth
Note_Rest
Note_DS 5
Note_C 6
Note_AS 5
Note_Length nl_half
Note_A 5

Note_AS 5
Note_A 5
Note_AS 5
Note_Length nl_quarter
Note_C 6
Note_Length nl_eighth
Note_Rest

Track_End


B29_02FD:
Note_Length nl_quarter
Note_GS 4
Note_Length nl_eighth
Note_Rest
Note_Length nl_sixteenth
Note_G 4
Note_G 4
Note_Length nl_eighth
Note_G 5
Note_E 5
Note_Length nl_sixteenth
Note_Rest
Note_Length nl_eighth
Note_D 5
Note_Length nl_sixteenth
Note_Rest

Note_Length nl_eighth
Note_C 5
Note_Length nl_half
Note_E 5
Note_C 5
Note_FS 4
Note_Length nl_half
Note_Rest

Note_Length nl_eighth
Note_Rest
Note_Length nl_sixteenth
Note_C 5
Note_B 4
Note_A 4
Note_B 4
Note_Length nl_eighth
Note_Rest
Note_G 5
Note_FS 5
Note_D 5

Note_DS 5
Note_Length nl_half
Note_E 5
Note_Length nl_sixteenth
Note_A 6
Note_Rest
Note_G 6
Note_Rest
Note_FS 6
Note_Rest
Note_E 6
Note_Rest
Note_Length nl_half
Note_D 6

Note_Length nl_sixteenth
Note_A 6
Note_Rest
Note_G 6
Note_Rest
Note_FS 6
Note_Rest
Note_E 6
Note_F 6
Note_Length nl_half
Note_FS 6

Note_Length nl_sixteenth
Note_A 6
Note_Rest
Note_G 6
Note_Rest
Note_FS 6
Note_Rest
Note_E 6
Note_Rest
Note_Length nl_eighth
Note_GS 5
Note_E 5
Note_GS 5
Note_AS 5
Note_C 6
Note_AS 5
Note_GS 5
Note_E 5
Note_Length nl_half
Note_DS 5

Note_Length nl_eighth
Note_Repeat 3
Note_Rest
Note_End_Repeat

Note_Length nl_whole
Note_Repeat 3
Note_Rest
Note_End_Repeat
Note_Length nl_eighth
Note_Rest
Note_Rest

Track_End