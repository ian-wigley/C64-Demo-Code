; ************* Part-5 ************* ;
;                                    ;
;          SYS 8192 to start         ;
;                                    ;
; ********************************** ;

                *=$0800
                !bin "../binaries/music-0800-1850.bin"

                *=$1900
label0          SEI
                LDA #$AD
                STA $0800
                LDA #$4E
                STA $0801
                LDA #$0C
                STA $0802
                LDA #$01
                STA $0C4E
                LDA #$D0
                STA $0803
                RTS

                *=$2000
                SEI
                LDA #$37
                STA $01
                LDA #$1B
                STA $D011
                LDA #$C7
                STA $D016
                LDA #$00
                STA $D017
                STA $D01D
                STA $3FFF
                TAX
branch0         STA $3FF8,X
                INX
                CPX #$08
                BNE branch0
                LDA #$01
                STA $9578
                JSR label0
                LDA #$1F
                STA $D015
                STA $D01C
                LDA #$03
                STA $D025
                LDA #$06
                STA $D026
                LDX #$00
branch1         LDA #$0E
                STA $D027,X
                INX
                CPX #$07
                BNE branch1
                LDA #$30
                STA $D001
                STA $D003
                STA $D005
                STA $D007
                STA $D009
                NOP
                NOP
                NOP
                LDA #$78
                STA $D000
                LDA #$91
                STA $D002
                LDA #$AA
                STA $D004
                LDA #$C3
                STA $D006
                LDA #$DC
                STA $D008
                LDX #$00
                LDA #$C2
branch2         CLC
                ADC #$01
                STA $07F8,X
                INX
                CPX #$05
                BNE branch2
                LDA #$03
                STA $0C4E
                JSR label1
                JSR label2
                LDX #$00
branch3         LDA $20BE,X
                AND #$3F
                STA $04CD,X
                CLC
                ADC #$80
                STA $04F5,X
                LDA #$07
                STA $D8CD,X
                STA $D8F5,X
                LDA $20DD,X
                AND #$3F
                STA $0778,X
                CLC
                ADC #$80
                STA $07A0,X
                INX
                CPX #$1F
                BNE branch3
                JMP label3

 ;              *=$20be
                !byte $54,$48,$45,$20,$53,$49,$47,$4D
                !byte $41,$20,$43,$52,$45,$57,$20,$49
                !byte $4E,$20,$31,$39,$38,$37,$20,$2D
                !byte $20,$31,$39,$38,$38,$20,$21,$20
                !byte $2D,$20,$50,$52,$45,$53,$53,$20
                !byte $54,$48,$45,$20,$4C,$4F,$4E,$47
                !byte $20,$4F,$4E,$45,$20,$21,$20,$2D
                !byte $20,$20,$20,$20,$20,$20,$20,$20
                !byte $20,$20,$20,$20,$20,$20,$20,$20
                !byte $20,$20,$20,$20,$20

;               *=$210B
label3          LDA #$1F
                STA $D018
                LDA #$7D
                STA $028A
                LDA #$00
                STA $02A7
                STA $02A8
                STA $02A9
                LDA #$D9
                STA $0314
                LDA #$21
                STA $0315
                LDA #$00
                STA $DC0E
                LDA #$01
                STA $D019
                STA $D01A
                CLI
branch17        JSR label5
                BEQ branch17
                CMP #$20
                BNE branch18
                JSR label1
                LDA #$00
                STA $D418
                LDA $D01A
                STA $D015
                AND #$F0
                STA $D01A
                LDA #$31
                STA $0314
                LDA #$EA
                STA $0315
                JMP label6
branch18        CMP #$31
                BNE branch19
                LDA #$01
                STA $0C4E
                JSR $21c0 ;label7
branch19        CMP #$32
                BNE branch20
                LDA #$02
                STA $0C4E
                JSR $21c0 ;label7
branch20        CMP #$33
                BNE branch4 ;branch8
                LDA #$03
                STA $0C4E
                JSR $21c0 ;label7
branch4         CMP #$34
                BNE branch21
                LDA #$B4
                STA $2228
                LDA #$96
                STA $2229
                LDA #$01
                STA $9578
branch21        CMP #$88
                BNE branch22
                LDA #$05
                STA $23B9
branch22        CMP #$87
                BNE branch5 ;branch11
                LDA #$04
                STA $23B9
branch5         CMP #$86
                BNE branch23
                LDA #$02
                STA $23B9
branch23        CMP #$85
branch6         BNE branch24
                LDA #$00
                STA $23B9
branch24        JMP $2138 ;label8
                RTS
branch7         LDA #$9E
                STA $2228
                LDA #$0D
                STA $2229
                RTS
branch8         LDA $D019
                AND #$01
                BEQ branch8
                STA $D019
                LDA $DC0D
                RTS
                JSR  $21CB; label9
                LDA #$42
branch9         STA $D012
                LDA $29BC
                ORA #$C0
                STA $D016
branch10        LDA #$1B
                STA $D011
                LDA #$FC
                STA $0314
branch11        LDA #$21
                STA $0315
                CLI
                JMP label10
branch12        JSR $21CB ;label9
                LDA #$80
                STA $D012
                LDA #$1B
branch13        STA $D011
                LDA #$C8
label7          STA $D016
                LDA #$00
                STA $D020
                STA $D021
                LDA #$2D
branch14        STA $0314
                LDA #$22
                STA $0315
                CLI
                JSR label11
                JSR label12
                JSR label13
                JMP label14
                JSR $21CB ;label9
                LDA #$F0
                STA $D012
                LDA #$1B
                STA $D011
                LDA #$C8
                STA $D016
                LDA #$D9
                STA $0314
                LDA #$21
                STA $0315
                CLI
                JSR label15
                LDA #$00
                STA $D020
                STA $D021
                LDA #$1B
                STA $D011
                JSR label16
                JMP label14
                LDX #$00
                LDA $D012
branch15        CMP $D012
                BEQ branch15
                LDA $D012
                AND #$07
                ORA #$10
                STA $D011
                LDA $22AC,X
                STA $D020
                STA $D021
                INX
                CPX #$52
                BNE branch15
                RTS
                LDX $29BD
                LDA $6000,X ; Sine Table
                SEC
                SBC #$28
                STA $D001
                STA $D003
                STA $D005
                STA $D007
                STA $D009
                LDA $233E,X
                STA $29BF
                INX
                CPX #$19
                BNE branch16
                LDX #$00
branch16        STX $29BD
                RTS

                *=$22ac
                !byte $09,$09,$02,$08,$0A,$07,$0A,$08
                !byte $02,$09,$09,$00,$00,$01,$00,$00
                !byte $0B,$0C,$0F,$01,$0F,$0C,$0B,$00
                !byte $06,$06,$0E,$03,$01,$03,$0E,$06
                !byte $06,$00,$09,$09,$02,$08,$0A,$07
                !byte $0A,$08,$02,$09,$09,$00,$06,$06
                !byte $0E,$03,$01,$03,$0E,$06,$06,$00
                !byte $0B,$0C,$0F,$01,$0F,$0C,$0B,$00
                !byte $00,$01,$00,$00,$09,$09,$02,$08
                !byte $0A,$07,$0A,$08,$02,$09,$09,$00
                !byte $00,$00,$00,$00,$00,$00,$00,$00
                !byte $00,$00,$00,$00,$00,$00,$00,$00
                !byte $00,$00,$00,$00,$00,$00,$00,$00
                !byte $00,$00,$00,$00,$00,$00,$00,$00
                !byte $00,$00,$00,$00,$00,$00,$00,$00
                !byte $00,$00,$00,$00,$00,$00,$00,$00
                !byte $00,$00,$00,$00,$00,$00,$00,$00
                !byte $00,$00,$00,$00,$00,$00,$00,$00
                !byte $00,$00,$06,$06,$0E,$0E,$03,$03
                !byte $01,$01,$03,$03,$0E,$0E,$06,$06
                !byte $00,$09,$09,$08,$08,$07,$07,$08
                !byte $08,$09,$09,$00

                *=$2358 ; Main exe code
                LDA $29BF
                STA $D828
                STA $D84E
                STA $D84F
                STA $22B9
                STA $22ED
                STA $D8CB
                STA $D8ED
                STA $D8F4
                STA $D914
                LDY #$00
bbranch0        LDA $D828,Y
                STA $D827,Y
                LDA $D801,Y
                STA $D800,Y
                STA $DB70,Y
                STA $DB99,Y
                INY
                CPY #$29
                BNE bbranch0
                LDY #$00
bbranch1        LDA $D905,Y
                STA $D904,Y
                LDA $D8DD,Y
                STA $D8DC,Y
                INY
                CPY #$11
                BNE bbranch1
                LDX #$0E
bbranch2        LDA $D8F4,X
                STA $D8F5,X
                LDA $D8CB,X
                STA $D8CC,X
                DEX
                BPL bbranch2
                RTS
                LDA $29BC
                SEC
                SBC #$02
                STA $29BC
                BPL bbranch3
                AND #$07
                STA $29BC
                LDA #$1B
                STA $D011
                JSR llabel0
bbranch3        RTS
llabel0         LDY #$00
                LDA ($4E),Y
                AND #$3F
                BNE bbranch4
                JMP llabel1
bbranch4        STA $0427
                CLC
                ADC #$80
                STA $044F
                INC $4E
                BNE bbranch5
                INC $4F
bbranch5        NOP
                LDX #$00
bbranch6        LDA $0429,X
                STA $0428,X
                LDA $0401,X
                STA $0400,X
                INX
                CPX #$27
                BNE bbranch6
                RTS
llabel1         LDA #$05
                STA $4E
                LDA #$24
                STA $4F
                rts

;               *=$2405
                !text "WELCOME TO A WILD DEMO IV  ... ANOTHER IN THE CONTINUING SAGA OF BOUNCY DEMOS FROM THE WILD STYLES OF THE SIGMA CREW !!"
                !text "  THE CODE FOR THIS PART WAS PERFORMED BY THE MAGIC KNIGHT AND XOR, TUNE RIPPING , TEXT AND GRAPHIX BY THE MAGIC KNIGHT "
                !text "ALSO .....     LOOK OUT FOR OUR PREVIOUS EFFORTS, I.E.  WILD DEMO 1-3 AND NOW NUMERO 4 IS ALIVE AND KICKING !!  TRY OUT "
                !text "KEYS 1-4 FOR THE VARIOUS TUNES, AND ALSO THE F-KEYS FOR THE SCROLL SPEEDS ....  SPACE JUMPS TO THE NEXT CHUNK .....     "
                !text "      RIGHT LETS GET DOWN TO IT !  THE GREETINGS WILL COME IN ANOTHER PART    MANY THANKS TO LYNX OF SIGMA FOR THE COOL "
                !text "CONFERENCE CALLS,  RIGHT IF YOU ARE AN ORIGINAL SUPPLIER / COOL CONTACT THEN WRITE TO IAN  .. NOW SOME MESSAGES TO A FEW "
                !text "PEOPLE,              WHEN ARE YOU GONNA GET THEM MODEMS PAUL - WERE WAITING !    WHY DO CERTAIN PEOPLE THINK THERE SIGMA "
                !text "MEMBERS WHEN THERES NO CHANCE THEY WOULD GET IN ?   WHOS GOT THE HUBBARD EDITOR ?    MEGA GREETS TO THE REST OF THE SIGMA "
                !text "CLAN WHO ARE :- MAX , BIG H , LYNX , JOUST , X-FACTOR , JNP , BUTCHER , AGENT X9 , NODOOLES , AND OF COURSE BUSTERS ...  "
                !text "GOLDEN HELLOS GOTO ALL OUR CONTACTS FOR ALL THIER SENDINGS   TODAYS DATE 27/12/87 AND CHRISTMAS IS NEARLY OVER, CANT SAY "
                !text "THAT IM BOTHERED THOUGH !  IM KEEPING THIS TEXT SHORT SO ENJOY THE SOUNDS WHICH ARE FROM HUNTERS MOON AND BANGKOK KNIGHTS "
                !text "[OR SHOULD THAT BE MAGIC KNIGHTS ?] ....                                         @"

label2 = $23FC
label4 = $1FA9
label11 = $2283
label12 = $2358
label13 = $0D9E
label15 = $2260
label16 = $23B4
label14 = $EA7E
label10 = $EA31
label1 = $E544
label5 = $FFE4
label6 = $8100

                *=$2a00
                !bin "../binaries/code-2a00-4000.bin"

                *=$6000
                !byte $E5,$DB,$D2,$CA,$C3,$BD,$B8,$B3
                !byte $AF,$AD,$AB,$A9,$A9,$A9,$AB,$AD
                !byte $B0,$B4,$B9,$BE,$C5,$CC,$D4,$DD
                !byte $E5,$E3,$E3,$E3,$00,$00,$00,$00
