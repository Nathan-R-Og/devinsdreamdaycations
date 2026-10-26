mus_tank_pulse1:
.addr B29_0C77
main_loop:
.addr B29_0C3E
.addr melody_pt2
.addr -1
.addr main_loop

mus_tank_pulse2:
.addr B29_0CB3
.addr -1
.addr main_loop

mus_tank_triangle:
.addr B29_0D9C
.addr -1
.addr mus_tank_triangle

mus_tank_noise:
.addr B29_0DE6
.addr -1
.addr mus_tank_noise

B29_0C3E:
Note_Length nl_whole
Note_Rest
Note_Rest
Note_Rest
Note_Rest

Note_Repeat 6
    Note_Length nl_eighth
    Note_Rest
Note_End_Repeat
Note_Length nl_sixteenth
Note_DS 3
Note_Rest
Note_E 3
Note_Rest

Note_C 4
Note_Rest
Note_AS 3
Note_Rest
Note_C 4
Note_Rest
Note_AS 3
Note_Rest
Note_C 4
Note_Rest
Note_GS 4
Note_Rest
Note_G 4
Note_Rest
Note_F 4
Note_Rest

Note_Length nl_eighth
Note_C 4
Note_C 4
Note_Length nl_sixteenth
Note_Rest
Note_Rest
Note_AS 3
Note_B 3
Note_Length nl_half
Note_C 4

Note_Length nl_sixteenth
    Note_DS 4
    Note_Rest
    Note_CS 4
    Note_Rest
    Note_DS 4
    Note_Rest
    Note_CS 4
    Note_Rest
    Note_DS 4
    Note_Rest
    Note_CS 4
    Note_Rest
    Note_CS 4
    Note_Rest
    Note_Rest
    Note_Rest

Track_End

melody_pt2:
Note_Length nl_sixteenth
Note_C 4
Note_Rest
Note_CS 4
Note_Rest
Note_DS 4
Note_Rest
Note_F 4
Note_Rest
Note_GS 4
Note_Rest
Note_G 4
Note_Rest
Note_F 4
Note_Rest
Note_E 4
Note_Rest

Note_DS 4
Note_Rest
Note_F 4
Note_Rest
Note_G 4
Note_Rest
Note_GS 4
Note_Rest
Note_CS 5
Note_Rest
Note_C 5
Note_Rest
Note_AS 4
Note_Rest
Note_GS 4
Note_Rest

Note_Length nl_half
Note_AS 4
Note_AS 4
Note_A 4
Note_A 4

Track_End

B29_0C77:
.byte $9F,$00,$F3
Note_Length nl_eighth
Note_Rest
.byte $00

B29_0CB3:
.byte $9F,$A2,$B7
.byte $00

B29_0D9C: ;Triangle
.byte $9F,$00,$00
Note_Repeat 2    
    Note_Repeat 3
    Note_Length nl_sixteenth
    Note_F 3
    Note_F 3
    Note_Rest
    Note_F 3
    Note_F 3
    Note_Rest
    Note_F 3
    Note_F 3
    Note_Rest
    Note_F 3
    Note_F 3
    Note_Rest
    Note_Length nl_eighth
    Note_DS 3
    Note_E 3
    Note_End_Repeat
        Note_Length nl_sixteenth
        Note_F 3
        Note_F 3
        Note_Rest
        Note_F 3
        Note_F 3
        Note_Rest
        Note_F 3
        Note_F 3
        Note_Rest
        Note_F 3
        Note_F 3
        Note_Rest
        Note_Length nl_eighth
        Note_Rest
        Note_Rest
Note_End_Repeat

    Note_Length nl_sixteenth
    Note_DS 3
    Note_DS 3
    Note_Rest
    Note_DS 3
    Note_DS 3
    Note_Rest
    Note_DS 3
    Note_DS 3
    Note_Rest
    Note_DS 3
    Note_DS 3
    Note_Rest
    Note_Length nl_eighth
    Note_G 3
    Note_F 3

    Note_Length nl_sixteenth
    Note_CS 3
    Note_CS 3
    Note_Rest
    Note_CS 3
    Note_CS 3
    Note_Rest
    Note_CS 3
    Note_CS 3
    Note_Rest
    Note_CS 3
    Note_CS 3
    Note_Rest
    Note_Length nl_eighth
    Note_DS 3
    Note_E 3

    Note_Length nl_sixteenth
    Note_F 3
    Note_F 3
    Note_Rest
    Note_F 3
    Note_F 3
    Note_Rest
    Note_F 3
    Note_F 3
    Note_Rest
    Note_F 3
    Note_F 3
    Note_Rest
    Note_Length nl_eighth
    Note_DS 3
    Note_E 3

        Note_Length nl_sixteenth
        Note_F 3
        Note_F 3
        Note_Rest
        Note_F 3
        Note_F 3
        Note_Rest
        Note_F 3
        Note_F 3
        Note_Rest
        Note_F 3
        Note_F 3
        Note_Rest
        Note_Length nl_eighth
        Note_Rest
        Note_Rest
Track_End

B29_0DE6:
Note_Repeat 3
Note_Length nl_sixteenth
    Note_Noise 1, 4 ;kick+hat
    Note_Noise 0, 4 ;hat
    Note_Noise 0, 4 ;hat
    Note_Noise 0, 4 ;hat
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 0, 4 ;hat
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 1, 4 ;kick+hat
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 0, 4 ;hat
    Note_Noise 0, 4 ;hat
Note_End_Repeat
    Note_Noise 1, 4 ;kick+hat
    Note_Noise 0, 4 ;hat
    Note_Noise 0, 4 ;hat
    Note_Noise 0, 4 ;hat
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 0, 4 ;hat
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 1, 4 ;kick+hat
    Note_Noise 2, 0 ;snare
    Note_Rest
    Note_Rest
    Note_Rest
Track_End
