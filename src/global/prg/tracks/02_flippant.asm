; music::b_flippant pulse1 pointers
mus_b_flippant_pulse1:
    .addr mus_b_intro_pulse1 ; 00
    mus_b_flippant_pulse1_loop:
    .addr mus_flippant_Triangle_Main ; 01
    .addr -1
    .addr mus_b_flippant_pulse1_loop

; music::b_flippant pulse2 pointers
mus_b_flippant_pulse2:
    .addr mus_b_intro_pulse2 ; 00
    mus_b_flippant_pulse2_loop:
    .addr mus_flippant_Triangle_Main ; 01
    .addr -1
    .addr mus_b_flippant_pulse2_loop

; music::b_flippant triangle pointers
mus_b_flippant_triangle:
    .addr mus_b_intro_triangle ; 00
    mus_b_flippant_triangle_loop:
    .addr mus_flippant_Triangle_Main ; 01
    .addr -1
    .addr mus_b_flippant_triangle_loop

; music::b_flippant noise pointers
mus_b_flippant_noise:
    .addr mus_b_intro_noise ; 00
    mus_b_flippant_noise_loop:
    .addr mus_flippant_Noise_Main ; 01
    .addr -1
    .addr mus_b_flippant_noise_loop

mus_flippant_Triangle_Main:
    Set_NLT NLT_18-Tempo_Lengths
	Note_Repeat 4
Note_Length nl_sixteenth
Note_F 2 ;4a
Note_F 2 ;4a
Note_C 3 ;4a
Note_AS 2 ;4a
Note_GS 2 ;4a
Note_F 3 ;4a
Note_DS 3 ;4a
Note_Rest
Note_Length nl_eighth
Note_DS 2 ;4a
Note_E 2 ;4a
Note_F 2 ;4a

Note_DS 2 ;4a Measure 2
Note_DS 2 ;4a
Note_C 3 ;4a
Note_AS 2 ;4a
Note_GS 2 ;4a
Note_F 3 ;4a
Note_DS 3 ;4a
Note_Rest
Note_Length nl_eighth
Note_GS 2 ;4a
Note_CS 3 ;4a
Note_C 3 ;4a

Note_CS 2 ;4a Measure 3
Note_CS 2 ;4a
Note_C 3 ;4a
Note_AS 2 ;4a
Note_GS 2 ;4a
Note_F 3 ;4a
Note_DS 3 ;4a
Note_Rest
Note_Length nl_eighth
Note_DS 2 ;4a
Note_G 2 ;4a
Note_GS 2 ;4a

Note_AS 2 ;4a
Note_GS 2 ;4a
Note_G 2 ;4a
Note_DS 2 ;4a
Note_AS 1 ;4a
Note_C 1 ;4a
Note_CS 2 ;4a
Note_DS 2 ;4a
	Note_End_Repeat
Track_End

mus_flippant_Noise_Main:
Note_Repeat 4
	Note_Repeat 3
		.byte $41,$44,$44,$44
		.byte $81,$44,$44,$81
		.byte $44,$81,$44,$41
		.byte $81,$44,$44,$44
	Note_End_Repeat
		.byte $81,$81,$44,$44
		.byte $81,$81,$44,$44
		.byte $81,$44,$81,$44
		.byte $81,$81,$81,$81
Note_End_Repeat
Track_End