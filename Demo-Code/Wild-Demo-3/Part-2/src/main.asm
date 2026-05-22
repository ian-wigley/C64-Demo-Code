; ************* Part-2 ************* ;
;                                    ;
;          SYS 2816 to start         ;
;                                    ;
; ********************************** ;
;                *=$0800
;                !binary "./binaries/memory-0800-6000.bin"

                *=$0B00
                SEI
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                LDA #$37
                STA $01
                LDA #$40
                STA $554A
                JSR label0
                JSR label1
                JSR label2
                CLI
                CLC
label3          JMP label3
label1          SEI
                LDA #$7F
                AND $D011
                STA $D011
                LDA #$08
                ORA #$C0
                STA $D016
                LDA #$FF
                STA $D015
                STA $D01D
                LDA #$00
                STA $D017
                STA $D01B
                STA $D01C
                STA $3FFF
                LDA #$1A
                STA $D018
                LDA #$F0
                STA $D000
                LDX #$00
branch0         LDA #$28
                STA $D002,X
                LDA #$F9
                STA $D001,X
                LDA $0B66
                CLC
                ADC #$30
                STA $0B66
                INX
                INX
                CPX #$10
                BNE branch0
                LDA #$C1
                STA $D010
                LDX #$00
branch1         LDA #$01
                STA $D027,X
                INX
                CPX #$08
                BNE branch1
                LDX #$00
branch2         LDA $3F40,X
                STA $0400,X
                LDA $4040,X
                STA $0500,X
                LDA $4140,X
                STA $0600,X
                LDA $4240,X
                STA $0700,X
                LDA $4328,X
                STA $D800,X
                LDA $4428,X
                STA $D900,X
                LDA $4528,X
                STA $DA00,X
                LDA $4628,X
                STA $DB00,X
                LDA #$00
                STA $0800,X
                STA $0900,X
                STA $0A00,X
                INX
                BNE branch2
                LDX #$20
                STX $07F8
                INX
                STX $07F9
                INX
                STX $07FA
                INX
                STX $07FB
                INX
                STX $07FC
                INX
                STX $07FD
                INX
                STX $07FE
                INX
                STX $07FF
                CLI
                RTS
label2          SEI
                LDA $DC0D
                LDA #$7F
                STA $DC0D
                LDA #$01
                STA $D019
                STA $D01A
                LDX #$41
                LDY #$0C
                STX $FFFE
                STY $FFFF
                LDX #$40
                LDY #$0C
                STX $FFFA
                STY $FFFB
                LDA #$35
                STA $01
                CLI
                LDA #$00
                TAX
                TAY
                RTS
label4          STA $0ED8
                STY $0ED9
                STX $0EDA
                CLC
branch3         LDA $D019
                AND #$01
                BEQ branch3
                STA $D019
                RTS
label8          CLI
                LDA $0ED8
                LDY $0ED9
                LDX $0EDA
                RTI
                JSR label4
                LDA #$07
                ORA #$70
                STA $D011
                LDA #$08
                ORA #$C0
                STA $D016
                LDA #$00
                STA $D020
                STA $D021
                LDA #$31
                STA $D012
                LDX #$86
                LDY #$0C
                STX $FFFE
                STY $FFFF
                CLI
                JSR label5
                JSR label6
                LDA $DC01
                CMP #$EF
                BNE branch4
                LDA #$60
                STA $0B31
                LDA #$37
                STA $01
                JMP label7
branch4         JMP label8
                JSR label4
                LDA #$08
                ORA #$10
                STA $D011
                LDA #$08
                ORA #$D0
                STA $D016
                LDA #$F8
                STA $D012
                LDX #$41
                LDY #$0C
                STX $FFFE
                STY $FFFF
                CLI
                JSR label9
                LDA #$01
                STA $D020
                STA $D021
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                LDA $3F3F
                STA $D020
                STA $D021
                JSR label10
                JMP label8
label10         CLC
                LDX #$00
branch5         ROL $0A02,X
                ROL $0A01,X
                ROL $0A00,X
                ROL $09C2,X
                ROL $09C1,X
                ROL $09C0,X
                ROL $0982,X
                ROL $0981,X
                ROL $0980,X
                ROL $0942,X
                ROL $0941,X
                ROL $0940,X
                ROL $0902,X
                ROL $0901,X
                ROL $0900,X
                ROL $08C2,X
                ROL $08C1,X
                ROL $08C0,X
                ROL $0882,X
                ROL $0881,X
                ROL $0880,X
                ROL $0842,X
                ROL $0841,X
                ROL $0840,X
                ROL $0802,X
                ROL $0801,X
                ROL $0800,X
                INX
                INX
                INX
                CPX #$3F
                BNE branch5
                INC $0EDD
                LDX $0EDD
                CPX #$08
                BNE branch6
                LDA #$00
                STA $0EDD
                JSR label11
branch6         JSR label12
                JSR label13
                RTS
label11          LDY #$00
                LDA ($02),Y
                AND #$3F
                BNE branch7
                JSR label0
                JMP label14
branch7         STA $08
                INC $02
                BNE branch8
                INC $03
branch8         LDA #$48
                STA $09
                LDA $08
                CLC
                ASL
                ROL
                ASL
                STA $08
                BCC $0D70
                INC $09
branch9         LDA #$00
                TAX
                TAY
branch10        LDA ($08),Y
                STA $0A0A,X
                INX
                INX
                INX
                INX
                INX
                INX
                INY
                CPY #$08
                BNE branch10
label14         RTS
label0          LDA #$ED
                STA $02
                LDA #$10
                STA $03
                RTS
label5          NOP
                NOP
                NOP
                NOP
                NOP
                LDX #$15
                LDY #$06
branch11        DEY
                BPL branch11
                NOP
branch12        NOP
                NOP
                DEC $D016
                INC $D016
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                BIT $00
                DEX
                BNE branch12
                RTS
label9          LDX $0DE5
                CPX #$00
                BEQ branch13
                LDX #$00
branch15        NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                BIT $00
                LDA $D012
                PHA
                LDA $0F5C,X
                STA $D020
                STA $D021
                PLA
branch14        CMP $D012
                BEQ branch14
                CMP #$D0
                BCS $0DF5
                AND #$07
                ORA #$38
                STA $D011
                INX
                CPX #$05
                BNE branch15
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                BIT $00
branch13        RTS
label13         LDA #$01
                BIT $DC00
                BNE branch16
                LDA $0DE5
                CMP #$02
                BCC $0E07
                DEC $0DE5
branch16        LDA #$02
                BIT $DC00
                BNE branch17
                LDA $0DE5
                CMP #$4D
                BCS $0E18
                INC $0DE5
branch17        CLI
                RTS
label12         LDX #$00
branch18        LDA $0EE1,X
                STA $0F5C,X
                INX
                CPX #$4E
                BNE branch18
                LDX #$00
                LDY $0EC3
branch19        LDA $0F53,X
                STA $0F5C,Y
                INY
                INX
                CPX #$09
                BNE branch19
                LDX #$00
                LDY $0EC7
branch20        LDA $0F4A,X
                STA $0F5C,Y
                INY
                INX
                CPX #$09
                BNE branch20
                LDX #$00
                LDY $0ECB
branch21        LDA $0F41,X
                STA $0F5C,Y
                INY
                INX
                CPX #$09
                BNE branch21
                LDX #$00
                LDY $0ECF
branch22        LDA $0F38,X
                STA $0F5C,Y
                INY
                INX
                CPX #$09
                BNE branch22
                LDX #$00
                LDY $0ED3
branch23        LDA $0F2F,X
                STA $0F5C,Y
                INY
                INX
                CPX #$09
                BNE branch23
                LDX #$00
branch24        LDA $0EC4,X
                STA $0EC3,X
                INX
                CPX #$10
                BNE branch24
                LDY $0EDE
                LDA $0FB6,Y
                CMP #$88
                BNE branch25
                LDY #$00
                STY $0EDE
branch25        LDA $0ED3
                CLC
                ADC $0FB6,Y
                STA $0ED3
                INC $0EDE
                LDA $10EC
                BNE branch26
                LDY $0EDF
                LDA $0FE9,Y
                CMP #$FF
                BNE branch27
                LDY #$00
                STY $0EDF
branch27        LDA $0FE9,Y
                STA $0DE5
                INC $0EDF
branch26        RTS

label6 = $5009
label7 = $9000


                ; $0ec3-$10ec ???

                *=$10ed
                !text "HELLO DUDES !!. WELCOME TO PART '2' OF THE WILD DEMO 3 . WRITTEN BY - BUSTERS - "
                !text ", AND GRAPHIXS BY - SIT - . WELL WHERE SHALL I START ??? ... MANY THANKS TO THE GUYS "
                !text "WHO RANG ME UP ON CONFERENCE  . IT'S CHRISTMAS DAY AT THE PRESENT OF TYPING , AFTER "
                !text "OPENING ALL MI PREZIES IM BORD SO IF THE TEXT TURNS OUT TO BE A LOAD OF WOFEL , SOZ "
                !text "!!! . RIGHT ON WITH THE GREETINGS , GREETINGS IN NO RANKING ORDER !, GREETINGS TO -: "
                !text "JENS OF THE ISD , STARFIRE INC , PAUL & PHIL OF SIGMA , TFT , BOD OF HOTLINE , FLAT 3 , "
                !text "7 UP CREW ,  ACSC , ON LEE - BLUES BROTHERS , WOLFY , JESTER , JOE COOL , AXENON , SHEILD , "
                !text "ZETRIX , TFD/TWGI , STACK/SNAKE , SCG , BWB , THE LORDS/TLS SOFTEATERS , TRILOGY , GSS , "
                !text "THE JUDGES , FAC , 1001 , FTL , FRONTLINE , TEF , M.WINTERBERG , FBR , GAMEBUSTERS 1541 , "
                !text "GI-JO , (D) USA TEAM , MR ZER0PAGE , SHARKS , LLS , FCG , THE POWER SLAVE , CAP , TRAID , "
                !text "MCM , HCA , CUC , USC , ICT , BEASTIE BOYS , JEWELS , PAR , TT , JE-HA , TCS , PAPILLONS , "
                !text "THE TROOPERS , LCC , SIT AND DAZ , MAT , TRIANGLE , FP , ILLUSION , THE SHADOWS , TXT , "
                !text "WILD BOYS , CCS , VORTEX 42 , FAZE 7 , TLC , THATS ALL I CAN REMEMBER RIGHT NOW , SORRY IF "
                !text "I MISSED YOU !!! . WHY NOT PRESS SPACE TO GO ON !!! ....            END OF TEXT              "

                ; Font  @ $4800 - 4B00
                *=$4800
                !binary "./binaries/memory-4800-4B00.bin"
                ; Music @ $5000
                *=$5000
                !binary "./binaries/memory-5000-6000.bin"
