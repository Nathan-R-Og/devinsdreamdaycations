;pulse 1
mus_poltergeist_pulse1:
.addr B29_00AE
B29_0085:
.addr Triangle_Main
.addr -1
.addr B29_0085

;pulse 2
mus_poltergeist_pulse2:
.addr B29_00CC
B29_008f:
.addr Triangle_Main
.addr -1
.addr B29_008f

;triangle
mus_poltergeist_triangle:
.addr B29_00EF
B29_0099:
.addr Triangle_Main
.addr -1
.addr B29_0099

;noise
mus_poltergeist_noise:
.addr B29_0111
B29_00a3:
.addr Noise_Main
.addr -1
.addr B29_00a3

B29_00AE:
Note_Repeat 4
Note_Length nl_whole
Note_Rest
Note_End_Repeat
Track_End

B29_00CC:
Note_Repeat 4
Note_Length nl_whole
Note_Rest
Note_End_Repeat
Track_End

B29_00EF:
.byte $9F,$00,$00
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
Note_End_Repeat
Track_End

Triangle_Main:
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

B29_0111:
Note_Repeat 14
	Note_Length nl_sixteenth  
		.byte $44,$44,$44,$44
	Note_End_Repeat
	Note_Repeat 2
		.byte $81,$81,$44,$81
	Note_End_Repeat
Track_End

Noise_Main:
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