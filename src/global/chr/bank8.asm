.segment        "CHR8": absolute
    .incbin "../../edit/presents_gfx_bin.bin"

    ;the only REAL thing that's shared
    ;the globe that spins
    .incbin "../../split/global/chr/earth.bin"

    ;JP ends here in padding
    .ifndef VER_JP
        ;the crazy melody effect in US
        .incbin "../../split/us/chr/melody_effect.bin"
    .endif
