mus_mother_earth_pulse2:
.addr mus_mother_earth_pulse2_intro
.addr mus_mother_earth_pulse2_intro
mus_mother_earth_pulse2_loop:
.addr mus_mother_earth_pulse2_block1
.addr mus_mother_earth_pulse2_block2
.addr mus_mother_earth_pulse2_block2sx
.addr -1
.addr mus_mother_earth_pulse2_loop

mus_mother_earth_pulse1:
mus_mother_earth_pulse1_loop:
.addr mus_mother_earth_pulse1_intro
.addr -1
.addr mus_mother_earth_pulse1_loop

mus_mother_earth_triangle:
.addr mus_mother_earth_triangle_intro
.addr mus_mother_earth_triangle_intro
mus_mother_earth_triangle_loop:
.addr mus_mother_earth_triangle_block1
.addr mus_mother_earth_triangle_block2
.addr mus_mother_earth_triangle_block2
.addr -1
.addr mus_mother_earth_triangle_loop

mus_mother_earth_noise:
.addr mus_mother_earth_noise_t1
.addr -1
.addr mus_mother_earth_noise

mus_mother_earth_pulse2_intro:
Set_Timbre 5, 7, timbre_c_square SQTD_75, 1, SQTV_ISVOL, 4
    Note_Length nl_eighth                           ;Measure 1 bar 1
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

   Note_Length nl_half                       ;bar 2+3
   Note_Rest

    Note_Length nl_eighth
   Note_Rest                                       ;bar 4
   Note_Length nl_thirtysecond
   Note_Rest
   Note_Length nl_sixteenth
   Note_F 5 ;4a
   Note_Length nl_thirtysecond
   Note_Rest

   Note_Length nl_eighth                           ;Measure 2 bar 1
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

   Note_Length nl_half                       ;bar 2+3
   Note_Rest

    Note_Length nl_eighth
   Note_Rest                                       ;bar 4
   Note_Length nl_thirtysecond
   Note_Rest
   Note_Length nl_sixteenth
   Note_AS 5 ;4a
   Note_Length nl_thirtysecond
   Note_Rest

    Track_End

mus_mother_earth_pulse2_block1:
Set_Timbre 5, 7, timbre_c_square SQTD_75, 1, SQTV_ISVOL, 4
Note_Length nl_eighth                           ;Measure 1 bar 1
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_D 6 ;4a                                    ;bar 2
    Note_Length nl_eighth
    Note_DS 6 ;4a
    Note_Length nl_sixteenth
    Note_D 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 2 bar 1
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_D 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

        Note_Length nl_eighth                           ;Measure 3 bar 1
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_D 6 ;4a                                    ;bar 2
    Note_Length nl_eighth
    Note_DS 6 ;4a
    Note_Length nl_sixteenth
    Note_D 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 4 bar 1
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                          ;bar 3
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_D 6 ;4a
    Note_Rest

    ;key change and new melody

    Note_Length nl_eighth                           ;Measure 5 bar 1
    Note_D 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_D 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_quarter                                ;ending bar 2 (3 16ths in..)
    Note_A 5 ;4a
    Note_Length nl_sixteenth                        ;bar 3 (after 5 16ths of held quarter note)
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                     ;bar 4
    Note_G 5 ;4a

    Note_Length nl_eighth                           ;Measure 6 bar 1
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_G 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_D 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                           ;Measure 7 bar 1
    Note_C 6 ;4a

    Note_Length nl_thirtysecond
    Note_G 5                                       ;bar 2
    Note_Length nl_eighth
    Note_GS 5 ;4a
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                            ;bar 3
    Note_F 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                            ;bar 4
    Note_DS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_F 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 8 bar 1
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_D 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_F 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                         ;bar 3
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_DS 6 ;4a
    Note_Rest

Track_End

mus_mother_earth_pulse2_block2:
Note_Length nl_eighth                           ;Measure 1 bar 1
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_D 6 ;4a                                    ;bar 2
    Note_Length nl_eighth
    Note_DS 6 ;4a
    Note_Length nl_sixteenth
    Note_D 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 2 bar 1
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_DS 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_D 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_half
    Note_AS 5 ;4a                                   ;bar 4 through bar 1 and 5/8ths of bar 2 in Measure 3
    Note_A 5 ;4a                                   ;bar 2 5/8 through bar 3 and 5/8ths of bar 4 in Measure 3
    Note_Length nl_sixteenth
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                           ;Measure 4 bar 1
    Note_GS 5 ;4a
    Note_Length nl_eighth                            ;bar 2
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_half
    Note_G 5 ;4a                                   ;bar 2 5/8 through bar 4 and 5/8ths of bar 4 in Measure 4
    Note_Length nl_sixteenth
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 5 bar 1
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_D 6 ;4a                                    ;bar 2
    Note_Length nl_eighth
    Note_DS 6 ;4a
    Note_Length nl_sixteenth
    Note_D 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 6 bar 1
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 5 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_DS 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_D 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_C 6 ;4a
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_half
    Note_AS 5 ;4a                                   ;bar 4 through bar 1 and 5/8ths of bar 2 in Measure 7
    Note_A 5 ;4a                                   ;bar 2 5/8 through bar 3 and 5/8ths of bar 4 in Measure 7
    Note_Length nl_sixteenth
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                           ;Measure 8 bar 1
    Note_D 6 ;4a
    Note_Length nl_eighth                            ;bar 2
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_half
    Note_F 6 ;4a                                   ;bar 2 5/8 through bar 4 and 5/8ths of bar 4 in Measure 8
    Note_Length nl_sixteenth
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
    Track_End

mus_mother_earth_pulse2_block2sx:
Note_Repeat 4
    Note_Length nl_whole                           ;Measure 1 bar 1
    Note_Rest
    Note_Rest
Note_End_Repeat
Track_End

mus_mother_earth_pulse1_intro:
    Note_Length nl_whole                           ;Measure 1 bar 1
    Note_Rest
Track_End

mus_mother_earth_triangle_intro:
    Note_Length nl_eighth                           ;Measure 1 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_A 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 2 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_F 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Track_End

mus_mother_earth_triangle_block2:
Note_Repeat 2
    Set_Timbre 5, 0, timbre_c_triangle 0, 0
    Note_Length nl_eighth                           ;Measure 1 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_A 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 2 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_F 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 3 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_A 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 4 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                           ;bar 3
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_D 3 ;42
    Note_Rest

    Note_End_Repeat
    Track_End

mus_mother_earth_triangle_block1:
Set_Timbre 5, 0, timbre_c_triangle 0, 0
    Note_Length nl_eighth                           ;Measure 1 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_A 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 2 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_F 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 3 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_A 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 4 bar 1
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                           ;bar 3
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_D 3 ;42
    Note_Rest

    Note_Length nl_eighth                           ;Measure 5 bar 1
    Note_D 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_D 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_GS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_AS 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_AS 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_GS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 6 bar 1
    Note_E 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_E 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_AS 2 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_F 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 7 bar 1
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_DS 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_F 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 3
    Note_G 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_F 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_DS 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;Measure 8 bar 1
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_D 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_eighth                           ;bar 2
    Note_F 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest

    Note_Length nl_quarter                          ;bar 3
    Note_Rest

    Note_Length nl_eighth                           ;bar 4
    Note_A 3 ;42
    Note_Length nl_thirtysecond
    Note_Rest
    Note_Length nl_sixteenth
    Note_Rest
    Note_Length nl_thirtysecond
    Note_Rest
Track_End

mus_mother_earth_noise_t1:
    Note_Length nl_quarter                           ;Measure 1 bar 1
    Note_Noise 0, 4
    Track_End