; ************* Part-3 ************* ;
;                                    ;
;          SYS 4096 to start         ;
;                                    ;
; ********************************** ;
;                *=$0800
;                !binary "./binaries/memory-0800-ffff.bin"

                *=$1000
                !binary "./binaries/memory-1000-4000.bin"
                *=$e000
                !binary "./binaries/memory-e000-ffff.bin"