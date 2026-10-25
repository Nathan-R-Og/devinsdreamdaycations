mus_b_dangerous_pulse1:
.addr mus_b_intro_pulse1
.addr mus_b_dangerous_pulse_1_intro
.addr mus_b_dangerous_pulse_1_intro
.addr mus_b_dangerous_pulse_1_intro
.addr mus_b_dangerous_pulse_1_intro
song_3_second1:
.addr mus_b_dangerous_pulse_1_p23
.addr mus_b_dangerous_pulse_1_p23
.addr mus_b_dangerous_pulse_1_p23
.addr mus_b_dangerous_pulse_1_p23
.addr mus_b_dangerous_pulse_1_p23
.addr mus_b_dangerous_pulse_1_p45
.addr mus_b_dangerous_pulse_1_p910912
.addr mus_b_dangerous_pulse_1_p67
.addr mus_b_dangerous_pulse_1_p67
.addr -1
.addr song_3_second1

mus_b_dangerous_pulse2:
.addr mus_b_intro_pulse2
.addr mus_b_dangerous_pulse_2_intro
song_3_second2:
.addr mus_b_dangerous_pulse_2_p34
.addr mus_b_dangerous_pulse_2_p34
.addr mus_b_dangerous_pulse_2_p5678
.addr mus_b_dangerous_pulse_2_p5678
.addr mus_b_dangerous_pulse_2_ptherestofit
.addr mus_b_dangerous_pulse_2_ptherestofit
.addr -1
.addr song_3_second2

mus_b_dangerous_triangle:
.addr mus_b_intro_triangle
.addr mus_b_dangerous_triangle_intro
song_3_second3:
.addr mus_b_dangerous_triangle_p34
.addr mus_b_dangerous_triangle_p34
.addr mus_b_dangerous_triangle_p34
.addr mus_b_dangerous_triangle_p34
.addr mus_b_dangerous_triangle_p34
.addr mus_b_dangerous_triangle_p34
.addr mus_b_dangerous_triangle_restofit
.addr -1
.addr song_3_second3

mus_b_dangerous_noise:
.addr mus_b_intro_noise
.addr mus_b_dangerous_noise_intro
song_3_second4:
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p11
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p4
.addr mus_b_dangerous_noise_p5
.addr mus_b_dangerous_noise_p4
.addr -1
.addr song_3_second4

; battle intro
    .include "./tracks/generic/b_intro.asm"

mus_b_dangerous_die:
    Note_Length nl_whole
    Note_Rest
    Track_End

mus_b_dangerous_pulse_1_intro:
    Set_NLT NLT_18-Tempo_Lengths
Set_Timbre 5, 7, timbre_c_square SQTD_12_5, 1, SQTV_ISVOL, 2

   Note_Length nl_sixteenth
    Note_F 2
    Note_F 2
    Note_C 3
    Note_Rest
    Note_AS 2
    Note_GS 2
    Note_Rest
    Note_F 3
    Note_DS 3
    Note_Rest
    Note_Length nl_eighth
    Note_DS 2
    Note_E 2
    Note_F 2

    Track_End


mus_b_dangerous_pulse_1_p23:
   Note_Length nl_sixteenth
    Note_F 4-2
    Note_F 4-2
    Note_C 5-2
    Note_Rest
    Note_AS 4-2
    Note_GS 4-2
    Note_Rest
    Note_F 5-2
    Note_DS 5-2
    Note_Rest
    Note_Length nl_eighth
    Note_DS 4-2
    Note_E 4-2
    Note_F 4-2
   Note_Length nl_sixteenth
    Note_DS 4-2
    Note_DS 4-2
    Note_C 5-2
    Note_Rest
    Note_AS 4-2
    Note_GS 4-2
    Note_Rest
    Note_F 5-2
    Note_DS 5-2
    Note_Rest
    Note_Length nl_eighth
    Note_AS 4-2
    Note_CS 5-2
    Note_C 5-2


   Note_Length nl_sixteenth
    Note_CS 4-2
    Note_CS 4-2
    Note_C 5-2
    Note_Rest
    Note_AS 4-2
    Note_GS 4-2
    Note_Rest
    Note_F 5-2
    Note_DS 5-2
    Note_Rest
    Note_Length nl_eighth
    Note_DS 4-2
    Note_G 4-2
    Note_GS 4-2
    Note_AS 4-2
    Note_GS 4-2
    Note_G 4-2
    Note_DS 4-2
    Note_C 4-2
    Note_C 4-2
    Note_CS 4-2
    Note_DS 4-2

    Track_End


;just 23 up an octave
mus_b_dangerous_pulse_1_p45:
   Note_Length nl_sixteenth
    Note_F 4-1
    Note_F 4-1
    Note_C 5-1
    Note_Rest
    Note_AS 4-1
    Note_GS 4-1
    Note_Rest
    Note_F 5-1
    Note_DS 5-1
    Note_Rest
    Note_Length nl_eighth
    Note_DS 4-1
    Note_E 4-1
    Note_F 4-1
   Note_Length nl_sixteenth
    Note_DS 4-1
    Note_DS 4-1
    Note_C 5-1
    Note_Rest
    Note_AS 4-1
    Note_GS 4-1
    Note_Rest
    Note_F 5-1
    Note_DS 5-1
    Note_Rest
    Note_Length nl_eighth
    Note_AS 4-1
    Note_CS 5-1
    Note_C 5-1


   Note_Length nl_sixteenth
    Note_CS 4-1
    Note_CS 4-1
    Note_C 5-1
    Note_Rest
    Note_AS 4-1
    Note_GS 4-1
    Note_Rest
    Note_F 5-1
    Note_DS 5-1
    Note_Rest
    Note_Length nl_eighth
    Note_DS 4-1
    Note_G 4-1
    Note_GS 4-1
    Note_AS 4-1
    Note_GS 4-1
    Note_G 4-1
    Note_DS 4-1
    Note_AS 3-1
    Note_C 4-1
    Note_CS 4-1
    Note_DS 4-1

    Track_End

mus_b_dangerous_pulse_1_p910912:
   Note_Length nl_whole
    Note_F 5
    Note_F 5

    Note_F 5
    Note_Length nl_half
    Note_F 5
    Note_F 5

   Note_Length nl_whole
    Note_F 5
    Note_F 5

    Note_GS 5
    Note_Length nl_half
    Note_AS 5
    Note_F 5

    Track_End


mus_b_dangerous_pulse_1_p67:
   Note_Length nl_sixteenth
    Note_F 3
    Note_F 3
    Note_F 3
    Note_Rest
    Note_F 3
    Note_Rest
    Note_F 3
    Note_Rest
    Note_F 3
    Note_F 3
    Note_F 3
    Note_Rest
    Note_F 3
    Note_Rest
    Note_G 3
    Note_Rest

    Note_DS 3
    Note_DS 3
    Note_DS 3
    Note_Rest
    Note_DS 3
    Note_Rest
    Note_DS 3
    Note_Rest
    Note_DS 3
    Note_DS 3
    Note_DS 3
    Note_Rest
    Note_DS 3
    Note_Rest
    Note_F 3
    Note_Rest


    Note_CS 3
    Note_CS 3
    Note_CS 3
    Note_Rest
    Note_CS 3
    Note_Rest
    Note_CS 3
    Note_Rest
    Note_CS 3
    Note_CS 3
    Note_CS 3
    Note_Rest
    Note_CS 3
    Note_Rest
    Note_DS 3
    Note_Rest

    Note_AS 2
    Note_AS 2
    Note_AS 2
    Note_Rest
    Note_AS 2
    Note_Rest
    Note_AS 2
    Note_Rest
    Note_Length nl_eighth
    Note_G 2
    Note_GS 2
    Note_AS 2
    Note_G 3

    Track_End

mus_b_dangerous_pulse_2_intro:

Set_Timbre 5, 7, timbre_c_square SQTD_75, 1, SQTV_ISVOL, 4
    Note_Length nl_whole
    Note_Rest

   Note_Length nl_sixteenth
    Note_A 2
    Note_A 2
    Note_E 3
    Note_Rest
    Note_D 3
    Note_C 3
    Note_Rest
    Note_A 3
    Note_G 3
    Note_Rest
    Note_Length nl_eighth
    Note_G 2
    Note_GS 2
    Note_A 2

   Note_Length nl_sixteenth
    Note_B 2
    Note_B 2
    Note_FS 3
    Note_Rest
    Note_E 3
    Note_D 3
    Note_Rest
    Note_B 3
    Note_A 3
    Note_Rest
    Note_Length nl_eighth
    Note_A 2
    Note_AS 2
    Note_B 2

   Note_Length nl_sixteenth
    Note_F 3
    Note_F 3
    Note_C 4
    Note_Rest
    Note_AS 3
    Note_G 3
    Note_Rest
    Note_F 4
    Note_DS 4
    Note_Rest
    Note_Length nl_eighth
    Note_DS 5
    Note_E 5
    Note_F 5

    Track_End

mus_b_dangerous_pulse_2_p34:
   Note_Length nl_sixteenth
    Note_F 4
    Note_F 4
    Note_C 5
    Note_Rest
    Note_AS 4
    Note_GS 4
    Note_Rest
    Note_F 5
    Note_DS 5
    Note_Rest
    Note_Length nl_eighth
    Note_DS 4
    Note_E 4
    Note_F 4

   Note_Length nl_sixteenth
    Note_DS 4
    Note_DS 4
    Note_C 5
    Note_Rest
    Note_AS 4
    Note_GS 4
    Note_Rest
    Note_F 5
    Note_DS 5
    Note_Rest
    Note_Length nl_eighth
    Note_AS 4
    Note_CS 5
    Note_C 5


   Note_Length nl_sixteenth
    Note_CS 4
    Note_CS 4
    Note_C 5
    Note_Rest
    Note_AS 4
    Note_GS 4
    Note_Rest
    Note_F 5
    Note_DS 5
    Note_Rest
    Note_Length nl_eighth
    Note_DS 4
    Note_G 4
    Note_GS 4
    Note_AS 4
    Note_GS 4
    Note_G 4
    Note_DS 4
    Note_AS 3
    Note_C 4
    Note_CS 4
    Note_DS 4

    Track_End

mus_b_dangerous_pulse_2_p5678:

   Note_Length nl_d_half
    Note_C 6
    Note_Length nl_eighth
    Note_DS 6
    Note_CS 6
   Note_Length nl_half
    Note_AS 5
    Note_C 6

   Note_Length nl_whole
    Note_GS 5
    Note_Repeat 2
        Note_Length nl_sixteenth
        Note_F 5
        Note_G 5
        Note_GS 5
        Note_AS 5
    Note_End_Repeat
    Note_CS 6
    Note_C 6
    Note_AS 5
    Note_GS 5
    Note_CS 6
    Note_C 6
    Note_G 5
    Note_GS 5


   Note_Length nl_d_half
    Note_C 6
    Note_Length nl_eighth
    Note_DS 6
    Note_CS 6
   Note_Length nl_half
    Note_AS 5
   Note_Length nl_quarter
    Note_C 6
    Note_AS 6

   Note_Length nl_whole
    Note_GS 6
    Note_Repeat 4
        Note_Length nl_sixteenth
        Note_C 6
        Note_C 6
        Note_Rest
    Note_End_Repeat

    Note_Length nl_eighth
    Note_GS 5
    Note_G 5


    Track_End

mus_b_dangerous_pulse_2_ptherestofit:
   Note_Length nl_whole
    Note_GS 5
    Note_CS 6

    Note_AS 5
    Note_Length nl_half
    Note_GS 5
    Note_G 5

   Note_Length nl_whole
    Note_GS 5
    Note_CS 6

    Note_DS 6
    Note_Length nl_half
    Note_G 6
    Note_GS 5

    Track_End

mus_b_dangerous_triangle_intro:
   Note_Length nl_whole
    Note_Rest
   Note_Length nl_sixteenth
    Note_F 2+1
    Note_F 2+1
    Note_C 3+1
    Note_Rest
    Note_AS 2+1
    Note_GS 2+1
    Note_Rest
    Note_F 3+1
    Note_DS 3+1
    Note_Rest
    Note_Length nl_eighth
    Note_DS 2+1
    Note_E 2+1
    Note_F 2+1


   Note_Length nl_sixteenth
    Note_A 2+1
    Note_A 2+1
    Note_E 3+1
    Note_Rest
    Note_D 3+1
    Note_C 3+1
    Note_Rest
    Note_A 3+1
    Note_G 3+1
    Note_Rest
    Note_Length nl_eighth
    Note_G 2+1
    Note_GS 2+1
    Note_A 2+1

   Note_Length nl_sixteenth
    Note_B 2+1
    Note_B 2+1
    Note_FS 3+1
    Note_Rest
    Note_E 3+1
    Note_D 3+1
    Note_Rest
    Note_B 3+1
    Note_A 3+1
    Note_Rest
    Note_Length nl_eighth
    Note_A 2+1
    Note_AS 2+1
    Note_B 2+1

    Track_End

mus_b_dangerous_triangle_p34:
   Note_Length nl_sixteenth
    Note_F 3+1
    Note_F 3+1
    Note_F 3+1
    Note_Rest
    Note_F 3+1
    Note_Rest
    Note_F 3+1
    Note_Rest
    Note_F 3+1
    Note_F 3+1
    Note_F 3+1
    Note_Rest
    Note_F 3+1
    Note_Rest
    Note_G 3+1
    Note_Rest

    Note_DS 3+1
    Note_DS 3+1
    Note_DS 3+1
    Note_Rest
    Note_DS 3+1
    Note_Rest
    Note_DS 3+1
    Note_Rest
    Note_DS 3+1
    Note_DS 3+1
    Note_DS 3+1
    Note_Rest
    Note_DS 3+1
    Note_Rest
    Note_F 3+1
    Note_Rest


    Note_CS 3+1
    Note_CS 3+1
    Note_CS 3+1
    Note_Rest
    Note_CS 3+1
    Note_Rest
    Note_CS 3+1
    Note_Rest
    Note_CS 3+1
    Note_CS 3+1
    Note_CS 3+1
    Note_Rest
    Note_CS 3+1
    Note_Rest
    Note_DS 3+1
    Note_Rest

    Note_AS 2+1
    Note_AS 2+1
    Note_AS 2+1
    Note_Rest
    Note_AS 2+1
    Note_Rest
    Note_AS 2+1
    Note_Rest
    Note_Length nl_eighth
    Note_G 2+1
    Note_GS 2+1
    Note_AS 2+1
    Note_G 3+1

    Track_End


mus_b_dangerous_triangle_restofit:
   Note_Length nl_whole
   Note_Rest
   Note_Length nl_d_half
   Note_Rest
   Note_Length nl_eighth
    Note_AS 2+1
    Note_GS 2+1


    Note_FS 2+1
    Note_GS 2+1
    Note_AS 2+1
    Note_GS 3+1
    Note_FS 3+1
    Note_GS 3+1
    Note_AS 3+1
    Note_GS 4+1
    Note_FS 4+1
    Note_GS 4+1
    Note_AS 4+1
    Note_DS 5+1
    Note_FS 5+1
    Note_DS 5+1
    Note_AS 3+1
    Note_GS 3+1

    Note_FS 3+1
    Note_GS 3+1
    Note_AS 3+1
    Note_GS 2+1
    Note_FS 2+1
    Note_GS 2+1
    Note_AS 1+1
    Note_GS 1+1
    Note_FS 1+1
    Note_GS 1+1
    Note_DS 1+1
    Note_AS 1+1
    Note_GS 1+1
    Note_FS 1+1
    Note_Rest
    Note_Rest

    Note_Length nl_whole
    Note_Rest
    Note_Rest

    Note_Length nl_eighth
    Note_F 2+1
    Note_DS 2+1
    Note_CS 2+1
    Note_DS 2+1
    Note_F 2+1
    Note_DS 3+1
    Note_CS 3+1
    Note_DS 3+1
    Note_F 3+1
    Note_DS 4+1
    Note_CS 4+1
    Note_DS 4+1
    Note_F 4+1
    Note_AS 4+1
    Note_CS 5+1
    Note_AS 4+1

    Note_F 3+1
    Note_DS 3+1
    Note_CS 3+1
    Note_DS 3+1
    Note_F 3+1
    Note_DS 2+1
    Note_CS 2+1
    Note_DS 2+1
    Note_F 1+1
    Note_DS 1+1
    Note_CS 1+1
    Note_DS 1+1
    Note_C 1+1
    Note_F 1+1
    Note_DS 1+1
    Note_CS 1+1

   Note_Length nl_sixteenth
    Note_F 4+1
    Note_F 4+1
    Note_C 5+1
    Note_Rest
    Note_AS 4+1
    Note_GS 4+1
    Note_Rest
    Note_F 5+1
    Note_DS 5+1
    Note_Rest
    Note_Length nl_eighth
    Note_DS 4+1
    Note_E 4+1
    Note_F 4+1
   Note_Length nl_sixteenth
    Note_GS 4+1
    Note_GS 4+1
    Note_F 5+1
    Note_Rest
    Note_DS 5+1
    Note_CS 5+1
    Note_Rest
    Note_AS 5+1
    Note_GS 5+1
    Note_Rest
    Note_Length nl_eighth
    Note_CS 5+1
    Note_FS 5+1
    Note_F 5+1


   Note_Length nl_sixteenth
    Note_AS 3+1
    Note_AS 3+1
    Note_G 4+1
    Note_Rest
    Note_F 4+1
    Note_DS 4+1
    Note_Rest
    Note_C 5+1
    Note_AS 4+1
    Note_Rest
    Note_Length nl_eighth
    Note_AS 3+1
    Note_D 4+1
    Note_DS 4+1
    Note_AS 4+1
    Note_GS 4+1
    Note_G 4+1
    Note_DS 4+1
    Note_AS 3+1
    Note_C 4+1
    Note_CS 4+1
    Note_DS 4+1

    Track_End

mus_b_dangerous_noise_intro:
    Note_Repeat 32
    Note_Length nl_sixteenth
    Note_Noise 0, 4 ;hat
    Note_End_Repeat

    Note_Repeat 24
    Note_Length nl_sixteenth
    Note_Noise 0, 4 ;hat
    Note_End_Repeat
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 0, 4 ;hat
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare

    Track_End

mus_b_dangerous_noise_p4:
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
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 1, 0 ;kick
    Note_Noise 1, 0 ;kick
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 1, 0 ;kick
    Note_Noise 1, 0 ;kick
    Note_Noise 2, 0 ;snare
    Note_Noise 1, 0 ;kick
    Note_Noise 2, 0 ;snare
    Note_Noise 1, 0 ;kick
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare

    Track_End

mus_b_dangerous_noise_p5:
    Note_Repeat 2
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

    Track_End


mus_b_dangerous_noise_p11:
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
    Note_Length nl_half
    Noise_Rest
    Note_Length nl_sixteenth
    Note_Noise 2, 0 ;snare
    Note_Noise 1, 0 ;kick
    Note_Noise 2, 0 ;snare
    Note_Noise 1, 0 ;kick
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare
    Note_Noise 2, 0 ;snare

    Track_End