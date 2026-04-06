; ************* Part-3 ************* ;
;                                    ;
;          SYS 16384 to start        ;
;                                    ;
; ********************************** ;
                *=$0800
                ;!binary "./binaries/memory-0800-a000.bin"
                !binary "./binaries/memory-0800-5600.bin"
                *=$9100
                !binary "./binaries/memory-9100-a000.bin"                