; ************* Part-2 ************* ;
;                                    ;
;          SYS 4096 to start         ;
;                                    ;
; ********************************** ;
                *=$0800
                !bin "./binaries/code-0800-0fff.bin"
                
                *=$1000
                SEI
                LDA #$05
                STA $0800
                LDA #$1A
                STA $0801
                LDA #$1B
                STA $0802
                LDX #$00
branch0         LDA $1100,X
                STA $0400,X
                LDA $1200,X
                STA $0500,X
                LDA $1300,X
                STA $0600,X
                LDA $1400,X
                STA $0700,X
                INX
                BNE branch0
                LDA #$00
                STA $D020
                STA $D021
                STA $D015
                STA $D010
                LDA #$80
                ORA #$18
                STA $D016
                LDA #$1B
                STA $D011
                LDA #$12
                STA $D018
                LDA #$09
                STA $D022
                LDA #$08
                STA $D023
                LDX #$00
branch1         LDA #$0B
                STA $D800,X
                STA $D900,X
                STA $DA00,X
                STA $DB00,X
                INX
                BNE branch1
                LDA #$E1
                STA $0328
                SEI
                LDA #$35
                STA $01
                JSR label0
label3          LDA #$80
branch2         CMP $D012
                BNE branch2
                JSR label1
                JSR label2
                JSR label1
                JMP label3
label2          LDA $DC01
                CMP #$EF
                BEQ branch3
                RTS
branch3         INC $01
                LDA #$00
                STA $D418
                JSR label4
                LDA #$15
                STA $D018
                JMP label5
label0 = $E14E
label1 = $E181
label4 = $E544
label5 = $9F00

                *=$1100
                !bin "./binaries/code-1100-1500.bin"

                *=$e000
                !bin "./binaries/music-e000-f540.bin"
