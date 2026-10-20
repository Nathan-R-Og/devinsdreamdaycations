mus_level_up_pulse1_intro:
.addr mus_level_up_pulse1_phrase01
.addr mus_level_up_pulse1_phrase02
mus_level_up_pulse1_loop:
.addr mus_level_up_pulse1_phrase03
.addr -1
.addr mus_level_up_pulse1_loop

mus_level_up_pulse2_intro:
.addr mus_level_up_pulse2_phrase01
mus_level_up_pulse2_loop:
.addr mus_level_up_pulse2_phrase02
.addr -1
.addr mus_level_up_pulse2_loop

mus_level_up_triangle_intro:
.addr mus_level_up_triangle_phrase01
mus_level_up_triangle_loop:
.addr mus_level_up_triangle_phrase02
.addr -1
.addr mus_level_up_triangle_loop

mus_level_up_pulse1_phrase02:
    .byte $9F,$0E,$F1
    Set_NLT NLT_18-Tempo_Lengths
    Note_Length nl_t_quarter
    Note_Rest

    Track_End

mus_level_up_pulse2_phrase02:
    .byte $9F,$0C,$F1
;fallthrough
mus_level_up_pulse1_phrase03:
        Note_Length nl_eighth           ;Starting Note
        Note_F 5

        Note_Length nl_eighth           ;Measure 1
        Note_AS 5
        Note_AS 5
        Note_D 6
        Note_D 6

        Note_Length nl_quarter
        Note_AS 5

        Note_Length nl_eighth
        Note_F 5
        Note_F 5

        Note_Length nl_eighth        ;Measure 2
        Note_F 5
        Note_Length nl_sixteenth
        Note_Rest
        Note_F 5

        Note_C 6
        Note_AS 5
        Note_A 5
        Note_G 6

        Note_Length nl_quarter
        Note_F 5

        Note_Length nl_eighth
        Note_Rest
        Note_F 5

        Note_Length nl_eighth           ;Measure 3
        Note_AS 5
        Note_AS 5
        Note_D 6
        Note_D 6

        Note_Length nl_quarter
        Note_AS 5

        Note_Length nl_eighth
        Note_F 5
        Note_AS 5

        Note_A 5                       ;Measure 4
        Note_Length nl_sixteenth
        Note_G 5
        Note_A 5
        Note_Length nl_eighth
        Note_AS 5
        Note_E 5
        Note_Length nl_quarter
        Note_F 5
        Note_Length nl_eighth
        Note_Rest
        Note_F 5

        Note_A 5                       ;Measure 5
        Note_A 5
        Note_Length nl_sixteenth
        Note_AS 5
        Note_A 5
        Note_G 5
        Note_A 5
        Note_Length nl_quarter
        Note_AS 5
        Note_Length nl_eighth
        Note_F 5
        Note_AS 5

        Note_A 5                       ;Measure 6
        Note_A 5
        Note_Length nl_sixteenth
        Note_A 5
        Note_DS 6
        Note_C 6
        Note_A 5
        Note_Length nl_quarter
        Note_AS 5
        Note_Length nl_eighth
        Note_Rest
        Note_AS 5

        Note_G 5                       ;Measure 7
        Note_G 5
        Note_G 5
        Note_AS 5
        Note_Length nl_quarter
        Note_AS 5
        Note_Length nl_eighth
        Note_F 5
        Note_F 5

        Note_F 5                       ;Measure 8
        Note_Length nl_sixteenth
        Note_Rest
        Note_F 5
        Note_Length nl_eighth
        Note_C 6
        Note_A 5
        Note_Length nl_quarter
        Note_AS 5
        Note_Length nl_eighth
        Note_Rest

    Track_End

mus_level_up_triangle_phrase02:
    Note_Length nl_d_half
    Note_Rest

    Track_End
