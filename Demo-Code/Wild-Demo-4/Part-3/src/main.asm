; ************* Part-3 ************* ;
;                                    ;
;          SYS xxxx to start         ;
;                                    ;
; ********************************** ;
                *=$1000
                LDA #$18
                STA $D018
                LDX #$01
                JSR label0
                JSR label1
                LDA #$01
                STA $12FE
                LDA #$00
                STA $12FF
                LDA #$96
                STA $148A
                LDA #$08
                STA $148C
                LDA #$07
                STA $D022
                LDA #$0A
                STA $D023
                LDX #$00
branch0         LDA #$1C
                STA $0400,X
                STA $0500,X
                STA $0558,X
                LDA #$00
                STA $0658,X
                STA $0700,X
                STA $D800,X
                STA $D900,X
                STA $D958,X
                LDA #$FF
                STA $2400,X
                LDA #$0A
                STA $DA58,X
                STA $DB00,X
                INX
                BNE branch0
                JSR label2
                LDA #$FF
                STA $D01C
                STA $D01B
                LDA #$07
                STA $D010
                LDA #$03
                STA $D025
                LDA #$06
                STA $D026
                LDA #$00
                STA $D008
                STA $D00A
                LDA #$18
                STA $D006
                LDA #$01
                STA $1302
                STA $1303
                LDA #$A0
                STA $D00C
                LDA #$B8
                STA $D00E
                LDA #$6E
                STA $D000
                LDA #$8A
                STA $D002
                LDA #$A6
                STA $D004
                LDX #$00
branch1         LDA #$0E
                STA $D027,X
                LDA $1482,X
                STA $2000,X
                LDA #$00
                STA $3800,X
                INX
                CPX #$08
                BNE branch1
                LDA #$C0
                STA $07F8
                LDA #$C1
                STA $07F9
                LDA #$C2
                STA $07FA
                JSR label3
                SEI
                LDA #$51
                STA $0314
                LDA #$11
                STA $0315
                LDA #$00
                STA $DC0E
                STA $04
                STA $05
                STA $5F
                STA $1300
                STA $13DD
                STA $13DE
                STA $142F
                STA $1480
                STA $1481
                STA $148B
                STA $D021
                STA $D020
                LDA #$01
                STA $4E
                LDA #$01
                STA $D01A
                LDA #$1B
                STA $D011
                CLI
                LDX #$00
                JMP label4
label8          LDX #$00
branch4         JSR label5
label4          LDA $1401,X
                STA $D015
                INX
                LDA $1401,X
                STA $D025
                INX
                LDA $1401,X
                STA $D026
                INX
                LDA $1401,X
                JSR label6
                INX
                LDA $1401,X
                STA $4E
                JSR label7
                LDY #$00
branch3         LDA #$01
                STA $1415
branch2         LDA $1415
                BNE branch2
                INY
                CPY #$02
                BNE branch3
                INX
                CPX #$14
                BNE branch4
                JMP label8
                LDA #$01
                STA $D019
                LDA #$47
                LDX #$33
                LDY #$C3
                JSR label9
                JSR label10
                JSR label11
                JSR label12
                JSR label13
                JSR label13
                JSR label14
                LDA $142A
                STA $D00A
                JSR label15
                INC $1415
                JSR label16
                LDA #$8E
                STA $0314
                LDA #$11
                STA $0315
                CLI
                JMP label17
                LDA #$01
                STA $D019
                LDA #$5F
                LDX #$4A
                LDY #$C4
                JSR label9
                LDA $1425
                STA $D00A
                JSR label15
                LDA #$B3
                STA $0314
                LDA #$11
                STA $0315
                CLI
                JMP label17
                LDA #$01
                STA $D019
                LDA #$75
                LDX #$61
                LDY #$C5
                JSR label9
                LDA $1420
                STA $D00A
                JSR label15
                LDA #$D8
                STA $0314
                LDA #$11
                STA $0315
                CLI
                JMP label17
                LDA #$01
                STA $D019
                LDA #$8B
                LDX #$78
                LDY #$C6
                JSR label9
                LDA $141B
                STA $D00A
                JSR label15
                JSR label18
                LDA #$00
                STA $0314
                LDA #$12
                STA $0315
                CLI
                JMP label17
                LDA #$01
                STA $D019
                LDA #$A0
                LDX #$8F
                LDY #$C7
                JSR label9
                LDA $1416
                STA $D00A
                JSR label15
                LDA #$25
                STA $0314
                LDA #$12
                STA $0315
                CLI
                JMP label17
                LDA #$01
                STA $D019
                LDA #$FA
                STA $D012
                LDY #$F0
branch5         INY
                BNE branch5
                JSR label19
                LDA $148A
                ORA #$D0
                STA $D016
                LDA #$FF
                STA $D012
                LDA $DC01
                CMP #$FE
                BNE branch6
                LDA $12FE
                BNE branch7
                LDA #$01
                STA $12FE
                LDA #$00
                STA $12FF
                JSR label1
branch6         CMP #$F7
                BNE branch7
                LDA $12FF
                BNE branch7
                LDA #$01
                STA $12FF
                LDA #$00
                STA $12FE
                JSR label20
branch7         CMP #$EF
                BNE branch8
                JMP label21
branch8         LDA $12FE
                CMP #$01
                BNE branch9
                JSR label22
                JMP label23
branch9         JSR label24
label23          LDA #$51
                STA $0314
                LDA #$11
                STA $0315
                CLI
                JMP label17
label9          STA $D012
                STX $D007
                STX $D009
                STX $D00B
                STX $D00D
                STX $D00F
                TYA
                STA $07FB
                CLC
                ADC #$05
                STA $07FF
                STA $07FE
                CLC
                ADC #$05
                STA $07FC
                STA $07FD
                LDA #$C8
                ORA #$D0
                STA $D016
                RTS
label10         LDX $1300
                LDA $6000,X
                SEC
                SBC #$61
                STA $130F
                INX
                CPX #$49
                BNE branch10
                LDX #$00
branch10        STX $1300
                LDX #$00
branch11        LDA $1305,X
                STA $1304,X
                INX
                CPX #$0C
                BNE branch11
                LDA $1304
                STA $D001
                LDA $1309
                STA $D003
                LDA $130E
                STA $D005
                RTS
                ORA ($00,X)
                NOP
branch14        CMP $0100,X
                SRE ($50),Y
                LSR $494B
                SRE $44
                JAM
                EOR ($3F,X)
                AND $0101,X
                ORA ($02,X)
                JAM
                NOP $04
label11         LDA $1303
                BNE branch12
                LDX #$00
branch15        LDA $D000,X
                CLC
                ADC #$01
                STA $1301
                BCC $1336
                LDA $D010
                EOR $10,X
                SLO ($8D),Y
                BPL branch14
                LDA #$01
                STA $1302
branch13        LDA $1301
                STA $D000,X
                INX
                INX
                CPX #$06
                BNE branch15
label25         LDA $D004
                CMP #$41
                BNE branch16
                LDA $1302
branch19        BEQ branch16
                LDA #$01
                STA $1303
                RTS
branch16        LDA $D000
                CMP #$18
                BNE branch17
                LDA $1302
                BNE branch17
                LDA #$00
                STA $1303
branch17        RTS
branch12        LDX #$00
branch20        LDA $D000,X
                CLC
                ADC #$FF
                STA $1301
                BCS $1381
                LDA $D010
                EOR $10,X
                SLO ($8D),Y
                BPL branch19
                LDA #$00
                STA $1302
branch18        LDA $1301
                STA $D000,X
                INX
                INX
                CPX #$06
                BNE branch20
                JMP label25
label12         LDX $13DD
                LDA $D00C
                SEC
                SBC $6100,X
                STA $D00C
                LDA $D00E
                CLC
                ADC $6100,X
                STA $13DF
                LDA $6100,X
                BMI $13B1
                BPL branch22
                JMP label26
branch21        LDA $13DF
                BCC $13C1
                JMP label26
branch22        LDA $13DF
                BCS $13C1
                JMP label26
branch23        STA $13DF
                LDA $D010
                EOR #$80
                STA $D010
                LDA $13DF
label26         STA $D00E
                INX
                CPX #$6C
                BNE branch24
                LDX #$00
branch24        STX $13DD
                RTS
                JSR $295C
                LDX $13DE
                LDA $3F40,X
                STA $142C
                INX
                CPX #$7C
                BNE branch25
                LDX #$00
branch25        STX $13DE
                LDX #$00
branch26        LDA $1417,X
                STA $1416,X
                INX
                CPX #$19
                BNE branch26
                RTS

*=$1401
!byte $C7, $01
!byte $08
!byte $07, $40
!byte $37, $0F
!byte $0B, $0C
!byte $41, $0F
!byte $07, $02
!byte $0A
!byte $42
!byte $FF, $03, $06
!byte $0E, $43, $FF
!byte $7F, $7C, $78
!byte $75, $73
!byte $70, $6D
!byte $6B, $69
!byte $67, $65
!byte $63, $62
!byte $60
!byte $5F, $5E, $5E
!byte $5D, $5D
!byte $5D, $5D
!byte $5E, $41, $42
!byte $42
!byte $43, $3B

label15         LDA $D00A
                SEC
                SBC #$5A
                EOR #$FF
                STA $D008
                RTS
label14         LDX $142F
                LDA $D006
                CLC
                ADC $6170,X
                STA $1430
                LDA $6170,X
                BMI $1454
                BPL branch29
                JMP label27
branch28        LDA $1430
                BCC $1464
                JMP label27
branch29        LDA $1430
                BCS $1464
                JMP label27
branch30        STA $1430
                LDA $D010
                EOR #$08
                STA $D010
                LDA $1430
label27         STA $D006
                INX
                CPX #$9A
                BNE branch31
                LDX #$00
branch31        STX $142F
                RTS
*=$1480
!byte $00
!byte $00
!byte $FC, $FC, $CC
!byte $CC, $CC, $FC
!byte $FC, $00, $80
!byte $00
!byte $04

                LDA $148A
                SEC
                SBC $148C
                STA $148A
                BMI $14A1
                ADC #$07
                STA $148A
                JMP label28
branch32        STA $148A
                RTS
label28         LDX #$00
branch33        LDA $0681,X
                STA $0680,X
                LDA $0721,X
                STA $0720,X
                INX
                CPX #$A0
                BNE branch33
                LDA #$00
                STA $06A7
                STA $06CF
                STA $06F7
                STA $071F
                STA $0747
                STA $076F
                STA $0797
                STA $07BF
                INC $FE
                LDA $FE
                CMP #$09
                BNE branch34
                LDA #$00
                STA $FE
                LDY $FD
                LDA ($02),Y
                AND #$3F
                CMP #$20
                BNE branch35
                LDA #$23
                JMP  $150F ; label29
branch35        CMP #$1F
                BNE branch36
                INY
                BNE branch37
                INC $03
branch37        LDA ($02),Y
                AND #$3F
                SEC
                SBC #$30
                STA $148C
                INY
                BNE branch38
                INC $03
branch38        LDA ($02),Y
                AND #$3F
                CMP #$20
                BNE branch36
                LDA #$23
branch36        CMP #$00
                BNE branch39
label3          LDA #$00
                STA $FD
                STA $FE
                LDA #$08
                STA $02
                LDA #$16
                STA $03
                RTS
branch39        INY
                BNE branch40
                INC $03
branch40        STY $FD
                STA $FC
                LDA #$20
                STA $05
                LDA #$00
                STA $04
                LDY #$00
branch42        CLC
                ADC #$08
                BNE branch41
                INC $05
branch41        INY
                CPY $FC
                BNE branch42
                STA $04
                LDY #$00
branch43        LDA ($04),Y
                STA $3800,Y
                INY
                CPY #$08
                BNE branch43
branch34        LDA $3800
                ASL
                BCC $155A
                LDY $4E
                STY $06A7
branch44        STA $3800
                LDA $3801
                ASL
                BCC $1568
                LDY $4E
                STY $06CF
branch45        STA $3801
                LDA $3802
                ASL
                BCC $1576
                LDY $4E
                STY $06F7
branch46        STA $3802
                LDA $3803
                ASL
                BCC $1584
                LDY $4E
                STY $071F
branch47        STA $3803
                LDA $3804
                ASL
                BCC $1592
                LDY $4E
                STY $0747
branch48        STA $3804
                LDA $3805
                ASL
                BCC $15A0
                LDY $4E
                STY $076F
branch49        STA $3805
                LDA $3806
                ASL
                BCC $15AE
                LDY $4E
                STY $0797
branch50        STA $3806
                LDA $3807
                ASL
                BCC $15BC
                LDY $4E
                STY $07BF
branch51        STA $3807
                RTS
label19         LDY $2000
                LDX #$00
branch52        LDA $2001,X
                STA $2000,X
                INX
                CPX #$08
                BNE branch52
                STY $2007
                RTS
label18         LDY #$00
branch55        LDX #$00
branch54        LDA $2000,X
                CLC
                ROR
                BCC $15E1
                ORA #$80
branch53        STA $2000,X
                INX
                CPX #$08
                BNE branch54
                INY
                CPY #$02
                BNE branch55
                RTS
label6          STA $D027
                STA $D028
                STA $D029
                STA $D02A
                STA $D02B
                STA $D02C
                STA $D02D
                STA $D02E
                RTS
label0 = $6CE8
label1 = $692A
label2 = $182B
label5 = $188A
label7 = $18A5
label13 = $13E0
label16 = $148D
label17 = $EA7E
label20 = $502A
label21 = $1900
label22 = $695A
label24 = $505A

                *=$160b
                !text " HELLO PEOPLE  _5  HOW ARE YOU..??? !!!  _4  THIS IS PART 0 OF THIS 4 PART MUSIC DEMO, THE CREDITS MUST GO TO XOR FOR ALL THE CODE IN THIS PART OF THE DEMO , THE MOOSIK IS FROM 'BONE CRUNCHER' _5 AND WAS COMPOSED BY M.WINTERBERG .. THIS TEXT TOOK PLACE ON THE 29/12/87 AT APPROXIMATELY 2:58:12 PM !!  NO HELLO'S IN THIS PART ...  _6 PRESS YOUR LONG ONE TO CONTINUE _4 OR USE KEYS 1 OR 2 FOR THE COOL MOOSIK.....HELLO XOR HERE....  _8 JUST_1 A_4 QUICK_7 WORD_3 TO_6 DEMONSTRATE_2 THE_8 MULTI-SPEED_8 S_7C_6R_5O_4L_3L_7 _1 _4 _6 _3             @"

