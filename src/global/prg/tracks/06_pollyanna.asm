mus_pollyanna_pulse2:
.addr delay_P2
Loop_Pulse2:
.addr mus_pollyanna_pulse2_t1
.addr -1
.addr Loop_Pulse2

mus_pollyanna_pulse1:
.addr delay_P1
.addr -1
.addr Loop_Pulse2

mus_pollyanna_triangle:
.addr mus_pollyanna_triangle_t1
.addr -1
.addr mus_pollyanna_triangle

mus_pollyanna_noise:
.addr mus_pollyanna_noise_t1
.addr -1
.addr mus_pollyanna_noise

mus_pollyanna_pulse2_t1:
Note_Repeat 16
Note_Length nl_half
Note_Rest 
Note_End_Repeat
    Note_Length nl_eighth
    Note_Rest 
    Note_F 5 ;42
    Note_Length nl_sixteenth
    Note_G 5 ;42
    Note_GS 5 ;42
    Note_Length nl_eighth
    Note_CS 6 ;42

    Note_C 6 ;42
    Note_Rest 
    Note_AS 5 ;42
    Note_Rest 
    Note_GS 5 ;42

    Note_Length nl_half 
    Note_G 5 ;42
    Note_GS 5 ;42

    ;measure 2
    Note_Length nl_eighth
    Note_Rest 
    Note_F 5 ;42
    Note_Length nl_sixteenth
    Note_G 5 ;42
    Note_GS 5 ;42
    Note_Length nl_eighth
    Note_CS 6 ;42

    Note_C 6 ;42
    Note_Rest 
    Note_AS 5 ;42
    Note_Rest 
    Note_GS 5 ;42

    Note_Length nl_sixteenth
    Note_C 6
    Note_AS 5
    Note_GS 5
    Note_DS 5
    Note_C 6
    Note_AS 5
    Note_GS 5
    Note_DS 5

    Note_Length nl_half 
    Note_F 5 ;42

    ;measure 3
    Note_Length nl_eighth
    Note_Rest 
    Note_Rest
    Note_C 5 ;42
    Note_DS 5 ;42

    Note_CS 6 ;42
    Note_Rest 
    Note_C 6 ;42
    Note_Rest 

    Note_CS 6 ;
    Note_C 6 ;42
    Note_GS 5 ;
    Note_AS 5 ;

    Note_Rest 
    Note_Rest
    Note_G 5 ;
    Note_GS 5 ;

    ;measure 4
    Note_Length nl_half 
    Note_F 5 ;42
    Note_DS 5 ;42
    Note_CS 5 ;42
    Note_Length nl_quarter 
    Note_C 5 ;42
    Note_Length nl_eighth
    Note_DS 4 ;42
    Note_E 4 ;42

    ;shitty repeat but in 5 keys higher

        Note_Length nl_eighth
    Note_Rest
    Note_AS 5 ;42
    Note_Length nl_sixteenth
    Note_C 6 ;42
    Note_CS 6 ;42
    Note_Length nl_eighth
    Note_FS 6 ;42

    Note_F 6 ;42
    Note_Rest
    Note_DS 6 ;42
    Note_Rest
    Note_CS 6 ;42

    Note_Length nl_half
    Note_C 6 ;42
    Note_CS 6 ;42

    ;measure 2
    Note_Length nl_eighth
    Note_Rest
    Note_AS 5 ;42
    Note_Length nl_sixteenth
    Note_C 6 ;42
    Note_CS 6 ;42
    Note_Length nl_eighth
    Note_FS 6 ;42

    Note_F 6 ;42
    Note_Rest
    Note_DS 6 ;42
    Note_Rest
    Note_CS 6 ;42

    Note_Length nl_sixteenth
    Note_F 6
    Note_DS 6
    Note_CS 6
    Note_GS 5
    Note_F 6
    Note_DS 6
    Note_CS 6
    Note_GS 5

    Note_Length nl_half
    Note_AS 5 ;42

    ;measure 3
    Note_Length nl_eighth
    Note_Rest
    Note_Rest
    Note_F 5 ;42
    Note_GS 5 ;42

    Note_FS 6 ;42
    Note_Rest
    Note_F 6 ;42
    Note_Rest

    Note_FS 6 ;
    Note_F 6 ;42
    Note_CS 6 ;
    Note_DS 6 ;

    Note_Rest
    Note_Rest
    Note_C 6 ;
    Note_CS 6 ;

    ;measure 4
    Note_Length nl_half
    Note_AS 5 ;42
    Note_GS 5 ;42
    Note_FS 5 ;42
    Note_Length nl_quarter
    Note_F 5 ;42
    Note_Length nl_eighth
    Note_GS 4 ;42
    Note_A 4 ;42

Track_End

delay_P1:
.byte $9F,$00,$F3
Note_Length nl_quarter
Note_Rest
Track_End

delay_P2:
Set_Timbre 5, 7, timbre_c_square SQTD_75, 1, SQTV_ISVOL, 4
Track_End

mus_pollyanna_triangle_t1:
Set_Timbre 5, 0, timbre_c_triangle 0, 0
Note_Repeat 8
Note_Length nl_half
Note_Rest 
Note_End_Repeat

;shitty intro triangle using 3 and 4 measure of end

    Note_Length nl_half                        ;Measure 3 bar 1
    Note_AS 3

    Note_FS 4                                     ;bar 2

    Note_DS 5                                     ;bar 3

    Note_CS 5                                     ;bar 4

    ;Measure 4 bar 1
    Note_AS 4

    Note_GS 4                                     ;bar 2

    Note_FS 4                                     ;bar 3

    Note_Length nl_quarter                         ;bar 4
    Note_F 3
    Note_Length nl_eighth
    Note_GS 3
    Note_A 3

    ;normal

    Note_Length nl_half                        ;Measure 1 bar 1
    Note_F 3 ;42

    Note_CS 4 ;42                                 ;bar 2
    
    Note_C 4 ;42                                  ;bar 3
    
    Note_Length nl_quarter                          ;bar 4
    Note_AS 3 ;42
    Note_Length nl_eighth
    Note_DS 3 ;42
    Note_E 3 ;42

    Note_Length nl_half                        ;Measure 2 bar 1
    Note_F 3 ;42

    Note_CS 4 ;42                                 ;bar 2
    
    Note_C 4 ;42                                  ;bar 3
    
    Note_Length nl_quarter                        ;bar 4
    Note_AS 3 ;42
    Note_Length nl_eighth
    Note_DS 3 ;42
    Note_E 3 ;42

    Note_Length nl_half                        ;Measure 3 bar 1
    Note_F 3 ;42

    Note_CS 4 ;42                                 ;bar 2
    
    Note_AS 4 ;42                                 ;bar 3
    
    Note_GS 4 ;42                                 ;bar 4
   
    ;Note_Length nl_half                        ;Measure 4 bar 1
    Note_F 4 ;42

    Note_DS 4 ;42                                 ;bar 2
    
    Note_CS 4 ;42                                  ;bar 3
    
    Note_Length nl_quarter                        ;bar 4
    Note_C 3 ;42
    Note_Length nl_eighth
    Note_DS 3 ;42
    Note_E 3 ;42

    ;shitty same thing but in, GASP! 5 notes higher!

    Note_Length nl_half                        ;Measure 1 bar 1
    Note_AS 3

    Note_FS 4                                     ;bar 2

    Note_F 4                                      ;bar 3

    Note_Length nl_quarter                         ;bar 4
    Note_DS 4
    Note_Length nl_eighth
    Note_GS 3
    Note_A 3

    Note_Length nl_half                        ;Measure 2 bar 1
    Note_AS 3

    Note_FS 4                                     ;bar 2

    Note_F 4                                      ;bar 3

    Note_Length nl_quarter                         ;bar 4
    Note_DS 4
    Note_Length nl_eighth
    Note_GS 3
    Note_A 3

    Note_Length nl_half                        ;Measure 3 bar 1
    Note_AS 3

    Note_FS 4                                     ;bar 2

    Note_DS 5                                     ;bar 3

    Note_CS 5                                     ;bar 4

    ;Measure 4 bar 1
    Note_AS 4

    Note_GS 4                                     ;bar 2

    Note_FS 4                                     ;bar 3

    Note_Length nl_quarter                         ;bar 4
    Note_F 3
    Note_Length nl_eighth
    Note_GS 3
    Note_A 3

Track_End

mus_pollyanna_noise_t1:
    Note_Length nl_quarter                       ;Measure 4 bar 1
    Note_Noise 0, 4
    Track_End