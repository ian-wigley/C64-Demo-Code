; Miami Vice Intro
; SYS4096 ($1000) to start

; --------------------------------------
; Info
; ---------------------------------------
; Font bytes from $0800-$0FC0
; Main code from $1000
; Scroll text from $1300-$19C6
; Screen data from $1C00–$1FFF
; Color data from $4000–$43FF
; Background image from $2800-$3F38 (ish) 8x8 Chars
; Sid from $E000

               *=$07fe
                jmp start
                !bin "../FONT.BIN"
                BRK
				BRK
;                RRA $4420,X
;                SBC $A9
start
                JSR $E544
                LDA #$18
                STA $D016
                LDA #$1A
                STA $D018
                LDA #$13
                STA $5C
                LDA #$00
                STA $5B
                LDA #$0F
                STA $D015
                LDA #$00
                STA $D01C
                LDA #$07
                STA $D025
                LDA #$02
                STA $D026
                LDX #$00
branch7         LDA $1C00,X
                STA $0400,X
                LDA $1D00,X
                STA $0500,X
                LDA $1E00,X
                STA $0600,X
                LDA $1F00,X
                STA $0700,X
                LDA $4000,X
                STA $D800,X
                LDA $4100,X
                STA $D900,X
                LDA $4200,X
                STA $DA00,X
                LDA $4300,X
                STA $DB00,X
                INX
                BNE branch7
                LDA #$FF
branch8         STA $0340,X
                INX
                CPX #$3F
                BNE branch8
                LDX #$00
                LDA #$3F
branch9         STA $07F8,X
                INX
                CPX #$08
                BNE branch9
                LDA #$07
                STA $D027
                LDA #$0A
                STA $D028
                LDA #$04
                STA $D029
                LDA #$02
                STA $D02A
                LDX #$00
                LDA #$18
branch10         STA $D000,X
                INX
                INX
                CLC
                ADC #$19
                STA $D000,X
                CPX #$10
                BNE branch10
                LDX #$00
branch11         LDA $11E5,X
                STA $11C6,X
                LDA $11EF,X
                STA $11D0,X
                LDA #$DF
                STA $11DA,X
                INX
                CPX #$0A
                BNE branch11
                STA $11E4
                SEI
                LDA #$35
                STA $01
                LDA #$00
                LDX #$00
                LDY #$0B
                JSR label0
                LDA #$1D
                STA $FFFE
                LDA #$11
                STA $FFFF
                LDA #$BE
                STA $FFFA
                LDA #$11
                STA $FFFB
                LDA #$00
                STA $DC0E
                STA $D010
                STA $11BF
                STA $11C0
                STA $11C1
                STA $11C2
                STA $D021
                STA $D020
                STA $11C3
                STA $11C4
                STA $11C5
                STA $D010
                STA $D01D
                STA $D01C
                STA $D017
                LDA #$01
                STA $D01A
                STA $D019
                LDA #$3B
                STA $D011
                LDA #$00
                STA $D012
                CLI
label1          JMP label1
                LDA #$01
                STA $D019
                LDX $11BF
                LDA $11C6,X
                STA $D012
                LDA $11D0,X
                JSR label2
                LDA $11DA,X
                JSR label3
                INX
                CPX #$0A
                BNE branch12
                JSR label4
                LDX #$00
                STX $11BF
                LDA $11C5
                BEQ branch13
                JSR label5
                JMP label6
branch13         JSR label7
label6          LDA $DC01
                CMP #$FE
                BNE branch14
                LDA $11C3
                BEQ branch15
                RTI
branch15         LDA #$00
                LDX #$00
                LDY #$0B
                JSR label0
                LDA #$01
                STA $11C3
                LDA #$00
                STA $11C4
                STA $11C5
                RTI
branch14         CMP #$F7
                BNE branch16
                LDA $11C4
                BEQ branch17
                RTI
branch17         LDA #$00
                LDX #$00
                LDY #$05
                JSR label0
                LDA #$01
                STA $11C4
                LDA #$00
                STA $11C3
                STA $11C5
                RTI
branch16         CMP #$FD
                BNE branch18
                LDA $11C5
                BEQ branch19
                RTI
branch19         LDA #$01
                STA $C00F
                LDA #$01
                STA $11C5
                LDA #$00
                STA $11C3
                STA $11C4
                RTI
branch12         STX $11BF
                CPX #$01
                BNE branch18
                JSR label8
branch18         RTI
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                SRE $5E
                ADC $8C,X
                LAX ($BA,X)
                NOP ;CMP
                INX
                NOP ;ISB $3216,X#
                NOP

                EOR #$60
                RRA $8E,X
                LDA $BC
                DCP ($EA),Y
                SBC $C1C0,X
                NOP #$C3
                CPY $C5
                DEC $C7
                INY
                CMP #$CA
                SRE $5E
                ADC $8C,X
                LAX ($BA,X)
                nop; CMP
                INX
                
                NOP;ISB $3217,x ;6,X
                NOP

                EOR #$60
                RRA $8E,X
                LDA $BC
                DCP ($EA),Y
                SBC $0000,X
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
label2          STA $D001
                STA $D003
                STA $D005
                STA $D007
                RTS
label3          STA $07F8
                STA $07F9
                STA $07FA
                STA $07FB
                RTS
label4          DEC $11C6
                DEC $11D0
                LDX #$01
                LDA $11C6
branch20         CLC
                ADC #$17
                STA $11C6,X
                INX
                CPX #$0A
                BNE branch20
                LDX #$01
                LDA $11D0
branch21         CLC
                ADC #$17
                STA $11D0,X
                INX
                CPX #$0A
                BNE branch21
                INC $11C2
                LDA $11C2
                CMP #$17
                BEQ branch22
                RTS
label9          LDX #$00
                STX $11C2
branch23         LDA $11E5,X
                STA $11C6,X
                LDA $11EF,X
                STA $11D0,X
                INX
                CPX #$0A
                BNE branch23
                RTS
branch22         JSR label9
                LDY $11C0
                LDA ($5B),Y
                CMP #$40
                BEQ branch24
                CMP #$2E
                BNE branch25
                LDA #$1B
                JMP $1292;label10
branch25         CMP #$3F
                BNE branch26
                LDA #$1C
                JMP $1292;label10
branch26         CMP #$21
                BNE branch27
                LDA #$1D
                JMP $1292;label10
branch27         CMP #$2F
                BNE branch28
                LDA #$1E
branch28         AND #$3F
                JMP label11
branch24         LDA #$00
                STA $11C2
                STA $11C0
                LDA #$00
                STA $5B
                LDA #$13
                STA $5C
                JSR label9
                RTS
label11          CLC
                ADC #$1F
                STA $11E4
                INY
                BNE branch29
                INC $5C
branch29         STY $11C0
                LDX #$00
branch30         LDA $11DB,X
                STA $11DA,X
                INX
                CPX #$0A
                BNE branch30
                RTS
label8          LDX $11C1
                LDA $3F40,X
                STA $11FF
                INX
                CPX #$7C
                BNE branch31
                LDX #$00
branch31         STX $11C1
                LDA $11FF
                STA $D000
                LDA $11FD
                STA $D002
                LDA $11FB
                STA $D004
                LDA $11F9
                STA $D006
                LDX #$00
branch32        LDA $11FA,X
                STA $11F9,X
                INX
                CPX #$06
                BNE branch32
                RTS
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label13
                EOR $4C
                JMP label14
                EOR ($4C,X)
                JMP label15
                JSR label16
                EOR $50
                SRE ($20),Y
                AND ($21,X)
                AND ($20,X)
                NOP $48,X
                EOR $20
                EOR $4741
                EOR #$43
                JSR label17
                EOR #$47
                PHA
                NOP $20,X
                NOP $59,X
                
                NOP ;BVC $1382
                NOP

                LSR $2047
                SRE $49,X
                NOP $48,X
                JSR label18
                JAM
                JSR label19
                SRE ($54,X)
                EOR ($54,X)
                EOR #$4E
                SRE $2E
                ROL $4320
                SRE $205A
                PHA
                EOR $20
                SRE $52,X
                SRE $4554
                JSR label20
                EOR #$53
                JSR label21
                JAM
                NOP $20,X
                SRE $2046
                NOP $48,X
                EOR $20
                NOP $45
                EOR $204F
                EOR ($4E,X)
                NOP $20
                NOP $45
                SRE ($49),Y
                SRE $4E
                EOR $44
                JSR label20
                EOR $20
                SRE ($50),Y
                JAM
                EOR #$54
                EOR $53
                ROL $4120
                JMP label22
                EOR #$20
                NOP $49
                NOP $20
                SRE $4F,X
                NOP
                JSR label23
                JSR label17
                SRE $4B43
                JSR label24
                JSR label20
                EOR $20
                PHA
                EOR #$20
                JAM
                EOR $53
                JSR label25
                SRE ($43,X)
                EOR $20,Y
                ROL $2E2E
                ROL $4220
                EOR $20,Y
                NOP $48,X
                EOR $20
                SRE $41,X
                EOR $20,Y

                NOP ;BVC $141D
                NOP
                
                EOR $53
                SRE ($20),Y
                ASR #$45
                EOR $53,Y
                JSR label26
                EOR $20
                SRE $2052
                NOP $57,X
                SRE $4F20
                JAM
                JSR label27
                SRE ($4B,X)
                EOR ($52,X)
                JAM
                SRE $2057
                LSR $4F
                JAM
                JSR label20
                EOR $20
                NOP $55,X
                LSR $5345
                JSR label28
                ROL $2E2E
                JSR label12

                NOP ;BVC $1450
                NOP

                EOR $41
                SRE ($45),Y
                JSR label29
                LSR $2054
                SRE $52
                EOR $45
                NOP $20,X
                NOP $48,X
                EOR $20
                SRE $49,X
                JMP label30
branch34         SRE ($54),Y
                EOR $4C,Y
                EOR $53
                JSR label31
                EOR $4D,Y
                SRE $4552
                JSR label32
                JSR label33
                NOP
                JSR label34
                JSR label35
                LSR $45,X
                JSR label36
                EOR #$4E
                EOR $44
                JSR label37
                EOR $4745
                EOR ($20,X)
                SRE $52
                SRE $5055
                JSR label38
                JMP label39
                NOP $20
                SRE ($49),Y
                SRE $4D
                EOR ($2E,X)
                JSR label40
                JSR label41
                SRE $20,X
                SRE $45,X
                JSR label42
                JMP label22
                SRE ($52,X)
                EOR ($43,X)
                ASR #$20
                EOR $4E,X
                NOP $45
                JAM
                JSR label43
                SRE $4D
                EOR ($20,X)
                ROL $2E2E
                ROL $5920
                EOR $41
                PHA
                PHA
                PHA
                JSR label32
                AND ($21,X)
                AND ($20,X)
                JSR label12
                JSR label44
                SRE $41
                JSR label20
                EOR ($4E,X)
                ASR #$53
                JSR label23
                JSR label21
                EOR $4C,X
                ROL $4A20
                EOR #$4D
                JSR label31
                NOP $20

                NOP ;BVC $14FB
                NOP

                EOR #$4C
                JSR label31
                NOP $20
                NOP $48,X
                EOR $20
                SRE $4854
                EOR $52
                JSR label44
                EOR $4542
                JAM
                SRE ($20),Y
                SRE $2046
                NOP $48,X
                EOR $20
                SRE $52
                EOR $41
                NOP $20,X
                SRE ($49),Y
                SRE $4D
                EOR ($20,X)
                JSR label12
                EOR ($4E,X)
                EOR $57,Y
                EOR ($59,X)
                JSR label41
                SRE $20,X
                EOR #$4C
                JMP label45
                SRE $5420
                PHA
                EOR $20
                EOR $4E,X
                JAM
branch36         EOR ($4E,X)
                ASR #$45
                NOP $20
                SRE $52
                EOR $45
                NOP $49,X
                LSR $5347
                JSR label28
                JSR label46
                EOR $47
                EOR ($20,X)
                PHA
                EOR $4C
                JMP label47
                JSR label48
                NOP $4F,X
                JSR label49
                ROL $2E53
                NOP $20
                ROL $4820
                NOP $4C,X
                JSR label50
                BVC $1576
                SRE ($49,X)
                EOR ($4C,X)
                JMP label51
                JAM
                SRE $2044
                ROL $4320
                ROL $2E4A
                JSR label52
                JSR label53
                LSR $2E,X
                SRE ($20,X)
                ROL $5320
                NOP $41,X
                JAM
                LSR $49
                JAM
                EOR $20
                EOR #$4E
                SRE ($20,X)
                ROL $5420
                LSR $54
                JSR label54
                NOP $43,X
                SRE ($20),Y
                ROL $4C20
                JMP label55
                ROL $5420
                EOR $2F43
                SRE ($43),Y
                SRE $504F
                JSR label54
                NOP $52,X
                EOR #$41
                NOP $20
                ROL $4220
                EOR $41
                SRE ($54),Y
                EOR #$45
                JSR label56
                EOR $53,Y
                JSR label54
                CLI
                EOR ($4B,X)
                ASR #$20
                ROL $4220
                JMP label57
                SRE ($20),Y
                JAM
                JAM
                SRE $2053
                ROL $4620
                JMP label58
                JSR label20
                JAM
                EOR $45
                JSR label54
                SRE ($48,X)
                EOR #$47
                JMP label59
                JSR label54
                EOR $5441
                JSR label54
                BVC $1606

                NOP; BVC $1610
                NOP

                JMP label60
                SRE $534E
                JSR label54
                SRE ($48),Y
                EOR #$45
                JMP label30
                ROL $5720
                EOR #$5A
                EOR ($58,X)
                JSR label54
                NOP $46,X
                NOP $2F
                NOP $57,X
                SRE $49
                JSR label54
                SRE ($54),Y
                EOR ($43,X)
                ASR #$20
                EOR ($4E,X)
                NOP $20
                SRE ($4E),Y
                EOR ($4B,X)
                EOR $20
                ROL $5320
                SRE ($47,X)
                JSR label54
                JAM
                SRE $42,X
                JSR label54
                NOP $48,X
                EOR $20
                JMP label61
                NOP $53

                NOP ;RLA 4C54
                NOP
                
                SRE ($20),Y
                ROL $5320
                SRE $5446
                EOR $41
                NOP $45,X
                JAM
                SRE ($20),Y
                ROL $5420
                JAM
                EOR #$41
                LSR $4C47
                EOR $20
                ROL $5420
                JAM
                EOR #$4C
                SRE $5947
                JSR label54
                SRE $53
                SRE ($20),Y
                ROL $4A20
                EOR $44,X
                SRE $45
                SRE ($20),Y
                ROL $4620
                EOR ($43,X)
                
                NOP ; RLA 4F52
                NOP

                SRE ($4B,X)
                EOR $20,Y
                ROL $4F20
                LSR $2045
                NOP $48,X
                SRE $5355
                EOR ($4E,X)
                NOP $20
                EOR ($4E,X)
                NOP $20
                SRE $454E
                JSR label54
                LSR $52
                SRE $544E
                JMP label62
                EOR $20
                ROL $5420
                EOR $46
                JSR label54
                EOR $572E
                EOR #$4E
                NOP $45,X
                JAM
                JAM
                EOR $52
                SRE $20
                ROL $4620
                JAM
                JAM
                JSR label54
                SRE $41
                EOR $2045
                JAM
                EOR $53,X
                NOP $45,X
                JAM
                SRE ($20),Y
                ROL $4720
                EOR #$20
                LSR
                SRE $2E20
                JSR label63
                EOR ($20,X)
                NOP $45,X
                EOR ($4D,X)
                JSR label54
                EOR $2052
                NOP
                EOR $52
                SRE $4150
                SRE $45
                JSR label54
                SRE ($46,X)
                JAM
                RLA 5548
                EOR $4E41
                JSR label54
                SRE ($48),Y
                EOR ($52,X)
                ASR #$20
                ROL $4320
                SRE ($53,X)
                JSR label54
                EOR ($4E,X)
                NOP $20
                NOP $48,X
                EOR $20
                JAM
                EOR $53
                NOP $20,X
                SRE $2046
                NOP $48,X
                EOR $20
                SRE $55
                EOR $53,Y
                SRE $5455
                JSR label20
                EOR $52
                EOR $20
                EOR $53
                BVC $174A
                SRE ($49,X)
                EOR ($4C,X)
                JMP label51
                NOP $48,X
                EOR $53
                EOR $20
                PHA
                EOR $4C
                JMP label47
                JSR label23
                JSR label20
                EOR $20
                EOR ($4D,X)
                EOR #$47
                EOR ($20,X)
                LSR $52
                EOR $41
                ASR #$53
                JSR label28
                JSR label13
                EOR $4E,X
                NOP $45,X
                JAM
                SRE ($20),Y
                ROL $5420
                JAM
                EOR #$4C
                SRE $5947
                JSR label54
                SRE ($48),Y
                EOR $49
                JMP label30
                ROL $5220
                ROL $2E42
                JAM
                JSR label54
                LSR $41
                LSR $5441
                EOR #$43
                JSR label54
                EOR #$4E
                NOP $52,X
                EOR $44,X
                EOR $52
                JSR label54
                SRE $49,X
                NOP
                EOR ($58,X)
                JSR label54
                JMP label61
                NOP $53
                JSR label54
                EOR $5341
                NOP $45,X
                JAM
                JSR label54
                BVC $17C7
                
                NOP; BVC $17D1
                NOP

                JMP label60
                SRE $534E
                JSR label54
                ASR #$45
                LSR $2054
                NOP $45,X
                EOR ($4D,X)
                RLA 4142
                EOR $4749
                EOR ($20,X)
                SRE ($45),Y
                SRE ($54,X)
                SRE $2052
                SRE $454E
                JSR label54
                JSR label64
                NOP $20
                SRE ($45),Y
                SRE ($54,X)
                SRE $2052
                ROL $5420
                LSR $54
                JSR label54

                NOP ;BVC $180D
                NOP

                JAM
                JSR label65
                EOR $57
                JSR label54
                LSR $524F
branch42         NOP $48,X
                EOR $52
                LSR $4C20
                EOR #$47
                PHA
                NOP $53,X
                JSR label54
                LSR $49
                LSR $54
                PHA
                JSR label19
                EOR $4E45
                SRE ($49),Y
                SRE $204E
                ROL $4320
                SRE $4E4E
                EOR $43
                NOP $49,X
                SRE $2F4E
                EOR ($4D,X)
                EOR #$47
                SRE $2E20
                JSR label66
                SRE ($20,X)
                ROL $5320
                LSR $20
                ROL $5420
                JAM
                EOR #$41
                NOP $20
                ROL $5420
                SRE ($4B),Y
                JSR label54
                NOP $45
                JMP label67
                JSR label68
                JAM
                SRE ($45,X)
                JSR label54
                EOR $4E,X
                NOP $45
                JAM
                SRE $52
                SRE $4E55
                NOP $20
                SRE ($4F),Y
                LSR $54
                SRE $41,X
                JAM
                EOR $20
                ROL $4820
                NOP $4C,X
                JSR label54
                NOP $52
                ROL $4D20
                EOR ($42,X)
                EOR $53,X
                EOR $20
                ROL $4720
                EOR $52,X
                EOR $20,X
                EOR $5341
                NOP $45,X
                JAM
                JSR label54
                NOP $48,X
                EOR $20
                SRE $4752
                EOR ($4E,X)
                EOR #$53
                EOR $44
                JSR label65
                EOR #$4D
                EOR $20
                ROL $4A20
                EOR $44,X
                SRE $45
                SRE ($20),Y
                ROL $4D20
                NOP
                BVC $18A7
                ROL $4420
                ROL $5355
                EOR ($20,X)
                NOP $45,X
                EOR ($4D,X)
                JSR label54
                SRE ($46,X)
                JAM
                RLA 5548
                EOR $4E41
                JSR label54
                SRE $454E
                JSR label20
                SRE $5355
                EOR ($4E,X)
                NOP $20
                EOR ($4E,X)
                NOP $20
                SRE $454E
                JSR label65
                EOR $57
                ROL $2E2E
                ROL $202E
                JSR label69
                SRE $5252
                EOR $20,Y
                EOR #$46
                JSR label34
                JSR label70
                SRE ($53),Y
                EOR $44
                JSR label71
                JSR label72
                NOP $20,X
                EOR ($4E,X)
                NOP $20
                SRE ($4F),Y
                NOP
                JSR label33
                NOP
                JSR label34
                JSR label73
                LSR $2054
                SRE $4F
                NOP $20,X
                LSR $4D55
                JAM
                EOR $52
                JSR label74
                JAM
                EOR #$54
                EOR $53
                JSR label54
                EOR ($4E,X)
                EOR $57,Y
                EOR ($59,X)
                JSR label75
                LSR
                SRE $2059
                NOP $48,X
                EOR #$53
                JSR label76
                EOR $48
                EOR #$53
                NOP $4F,X
                JAM
                EOR #$43
                JSR label23
                SRE $454E
                ROL $4320
                SRE $205A
                SRE $45,X
                JSR label73
                LSR $2054
                SRE $4F
                NOP $20,X
                EOR ($20,X)
                NOP $49
                SRE $49
                NOP $49,X
                NOP
                EOR $52
                JSR label34
                JSR label33
                EOR $4C,X
                NOP $4E
                NOP $20,X
                JAM
                JMP label77
                JSR label78
                JAM
                JSR label79
                JAM
                SRE ($20),Y
                SRE $5455
                JSR label32
                AND ($20,X)
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label80
                EOR $20
                LSR $4F
                JAM
                JSR label41
                SRE $20,X
                ROL $2E2E
                ROL $2E2E
                ROL $2E2E
                ROL $2E2E
                ROL $2E2E
                ROL $2E2E
                ROL $2E2E
                ROL $202E
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label12
                JSR label81
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $36
                ROL $E6,X
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                ROL $36,X
                ROL $36,X
                ROL $36,X
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                ROL $36,X
                ROL $36,X
                ROL $36,X
                ROL $E6,X
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                ROL $36,X
                INC $36
                ROL $36,X
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $36
                ROL $36,X
                ROL $36,X
                ROL $36,X
                ROL $E6,X
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                ROL $36,X
                ROL $36,X
                ROL $36,X
                INC $E6
                INC $E6
                INC $E6
                INC $E6
                INC $36
                ROL $36,X
                INC $36
                ROL $36,X
                ROL $E6,X
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                RLA ($33),Y
;                ISB ($E6,X)
;                ROL $33,X
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($36,X)
;                ISB ($36,X)
;                ROL $36,X
;                ROL $E3,X
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                RLA ($33),Y
;                ISB ($E6,X)
;                ROL $33,X
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($36,X)
;                ISB ($E6,X)
;                ROL $36,X
;                ROL $E3,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($36),Y
;                ROL $36,X
;                ROL $33,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($36),Y
;                INC $E6
;                ROL $36,X
;                ROL $E3,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($36),Y
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                INC $E6
;                INC $E6
;                INC $E3
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($E3),Y
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($E3),Y
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($E3),Y
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($E3),Y
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                ROL $33,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                ROL $33,X
;                RLA ($33),Y
;                RLA ($36),Y
;                RLA ($33),Y
;                RLA ($36),Y
;                ROL $33,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                ROL $33,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $33,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $33,X
;                ROL $36,X
;                ROL $36,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                RLA ($33),Y
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                ROL $36,X
;                RLA ($33),Y
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                INC $E6
;                RLA ($E3),Y
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                INC $E6
;                INC $E6
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E6,X)
;                INC $E6
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB ($E3,X)
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $6061,X
;                ISB $FFFF,X
;                ISB $00FF,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label12          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label54          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label37          BRK
;                BRK
;                BRK
;label30          BRK
;label89          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label22          BRK
;                BRK
;                BRK
;label14          BRK
;                BRK
;                BRK
;                BRK
;label55          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label51          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label83          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label32          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label345          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BPL branch45
;                NOP $14,X
;                ORA $15,X
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                RTI
;                RTI
;                BRK
;                BRK
;branch45         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                NOP $04
;                ORA $15,X
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $15,X
;                ORA $15,X
;                ORA $15,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                NOP $04
;                ORA $15,X
;                ORA $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                RTI
;                RTI
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA $05
;                BRK
;                BRK
;                RTI
;                RTI
;                
;                NOP ;BVC $29DE
;                NOP
;                
;                NOP $54,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA $05
;                BRK
;                BRK
;                RTI
;                RTI
;                BVC $29F6
;                BVC $29F8
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                NOP $54,X
;                NOP $54,X
;                NOP $54,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch46         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch47         BRK
;                BRK
;branch48         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($01,X)
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BVC $2A9A
;                NOP $54,X
;                EOR $55,X
;                EOR $55,X
;                ORA ($01,X)
;                ORA $05
;                ORA $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                BVC $2AB7
;                BVC $2A69
;branch51         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $15,X
;                ORA $15,X
;                ORA $15,X
;                ORA $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($05,X)
;                ORA $05
;                ORA $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $40,X
;                BVC $2AF3
;                BVC $2AF9
;                NOP $54,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch50         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $05
;                ORA $05
;                ORA $15,X
;                ORA $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                RTI
;                RTI
;                EOR ($51),Y
;                EOR $55,X
;                ORA $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                NOP $54,X
;                NOP $54,X
;                NOP $55,X
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                NOP $54,X
;                NOP $54,X
;                NOP $54,X
;                NOP $54,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA $05
;                ORA $05
;                EOR $45,X
;                EOR $41
;                EOR ($00,X)
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $54,X
;                NOP $10,X
;                EOR $45,X
;                EOR $05
;                ORA $01
;                ORA ($01,X)
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BVC $2BF6
;                NOP $54,X
;                NOP $55,X
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $15,X
;                ORA $15,X
;                ORA $15,X
;                ORA $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($15,X)
;                ORA ($51),Y
;                RTI
;                RTI
;                RTI
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                ORA $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                RTI
;                RTI
;                RTI
;                BVC $2C3F
;                BVC $2BF1
;branch56         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch54         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $14,X
;                NOP $14,X
;                NOP $50,X
;                BVC $2C58
;                EOR $55,X
;                EOR $15,X
;                ORA $05,X
;                ORA $01
;                EOR $54,X
;                NOP $50,X
;                BVC $2C56
;                RTI
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $15,X
;                ORA $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                RTI
;                RTI
;                RTI
;                RTI
;                BVC $2C7F
;                BVC $2C32
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($55,X)
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;branch55         EOR $54,X
;                NOP $54,X
;                NOP $54,X
;                NOP $54,X
;                NOP $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch58         BRK
;                BRK
;branch57         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch59         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $05
;                ORA $14
;                NOP $14,X
;                NOP $14,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BPL branch61
;branch61         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                RTI
;                RTI
;                RTI
;                RTI
;                BVC $2D40
;                ORA $15,X
;                ORA $15,X
;                ORA $15,X
;                ORA $15,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                ORA $05
;                ORA $14
;                NOP $14,X
;                BVC $2D60
;                BRK
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $55,X
;                EOR $01,X
;                ORA ($00,X)
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                NOP $54,X
;                NOP $55,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                RTI
;                RTI
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($50,X)
;                BVC $2D93
;                RTI
;                RTI
;                RTI
;                RTI
;                RTI
;                ORA ($00,X)
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $15,X
;                ORA $05
;                ORA $05
;                ORA $01
;branch63         EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BVC $2DBA
;                NOP $54,X
;                NOP $54,X
;                EOR $55,X
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                NOP $54,X
;                NOP $54,X
;                NOP $54,X
;                NOP $54,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch64         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch65         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                NOP $14,X
;                NOP $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $15,X
;                ORA $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BVC $2E7A
;                BVC $2E2C
;branch67         BRK
;                BRK
;label28          BRK
;                BRK
;                ORA $15,X
;                ORA $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                RTI
;                EOR ($41,X)
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                RTI
;label53          RTI
;                RTI
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA $15,X
;                ORA $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                RTI
;                BVC $2EC3
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;branch66         ORA ($00,X)
;                BRK
;                BRK
;                BRK
;                BRK
;                RTI
;                RTI
;                RTI
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($00,X)
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                ORA ($01,X)
;                ORA ($00,X)
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                NOP $54,X
;                NOP $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $7F,X
;                RRA $7F7F,X
;                EOR $55,X
;                EOR $55,X
;                ISB $FFFF,X
;                ISB $5555,X
;                EOR $55,X
;                SBC $FDFD,X
;                SBC $5555,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $57,X
;                SRE $5F,X
;                EOR $55,X
;                EOR $55,X
;                CMP $D5,X
;                CMP $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $57,X
;                SRE $57,X
;                EOR $55,X
;                EOR $55,X
;                ISB $FFFF,X
;                ISB $5555,X
;                EOR $55,X
;                SBC $FDFD,X
;                SBC $5555,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $5F,X
;                EOR $55,X
;                EOR $5F,X
;                RRA $FFFF,X
;                ISB $5555,X
;                EOR $7D,X
;                RRA $5557,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                CMP $F5,X
;                ADC $5555,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $5F5F,X
;                SRE $5555,X
;                EOR $55,X
;                ISB $FFFF,X
;                ISB $5555,X
;                EOR $55,X
;                SBC $F5,X
;                SBC $F5,X
;                EOR $55,X
;                EOR $55,X
;                ISB $55FF,X
;                EOR $55,X
;                EOR $55,X
;                EOR $FF,X
;                ISB $5555,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $5F5F,X
;                SRE $5757,X
;                SRE $57,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FDFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $5555,X
;                EOR $55,X
;                EOR $D5,X
;                CMP $D5,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $7D5F,X
;                ADC $F57D,X
;                SBC $F5,X
;                EOR $55,X
;                ADC #$69
;                ADC #$A5
;                LDA $A5
;                SRE $57,X
;                SRE $57,X
;                SRE $57,X
;                SRE $57,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FDFF,X
;                SBC $FEFE,X
;                INC $FEFE,X
;                INC $5555,X
;                LDA $A5
;                LDA $A5
;                LDA $A5
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $57,X
;                SRE $7F7F,X
;                RRA $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $5555,X
;                ADC #$A9
;                LDA #$A9
;                LDA #$A9
;                ADC $AF5F,X
;                LAX $565A
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $95,X
;                STA $A5,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $5F5F,X
;                SRE $5F5F,X
;                SRE $FF5F,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $F5F5,X
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                EOR $55,X
;                STX $96,Y
;                STA $95,X
;                STA $95,X
;                EOR $55,X
;                TAX
;                TAX
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                LDA #$A9
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                ISB $FFFF,X
;                ISB $7F7F,X
;                RRA $FF7F,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $D5D5,X
;                SBC $F5,X
;                SBC $F5,X
;                SBC $57FD,X
;                SRE $57,X
;                SRE $5F5F,X
;                ADC $D67D,X
;                DEC $D6,X
;                NOP
;                NOP
;                ADC #$69
;                ADC #$95
;                STA $95,X
;                EOR $55,X
;                EOR $55,X
;                EOR $57,X
;                SRE $57,X
;                SRE $57,X
;                SRE $57,X
;                SRE $FF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FEFE,X
;                INC $FEFE,X
;                INC $FEFE,X
;                LDA $A5
;                LDA $A5
;                LDA $A5
;                LDA $A5
;                SRE $57,X
;                SRE $57,X
;                SRE $57,X
;                SRE $57,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $A9A9,X
;                LDA #$A9
;                LDA #$A9
;                LDA #$A9
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                ADC #$69
;                NOP
;                NOP
;                NOP
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $5F,X
;                SRE $5F5F,X
;                SRE $5F5F,X
;                SRE $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                STA $95,X
;                STA $FF,X
;                ISB $9595,X
;                STA $55,X
;                EOR $55,X
;                SBC $55FD,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $5F5F,X
;                SRE $5757,X
;                SRE $57,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FDFF,X
;                SBC $FFFD,X
;                ISB $FFFF,X
;                ISB $F57D,X
;                ADC $76,X
;                LSR $56,X
;                NOP
;                TXS
;                LDA $A5
;                LDA $95
;                STA $95,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $57,X
;                SRE $57,X
;                SRE $57,X
;                SRE $57,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FEFF,X
;                INC $FEFE,X
;                INC $FEFE,X
;                INC $A5A5,X
;                LDA $A5
;                LDA $A5
;                LDA $A5
;                SRE $57,X
;                SRE $57,X
;                SRE $55,X
;                EOR $55,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $A9A9,X
;                LDA #$A9
;                LDA #$A9
;                LDA #$A9
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                SRE $5F5F,X
;                SRE $5F5F,X
;                SRE $FF5F,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FAFA,X
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                STA $96,X
;                STX $95,Y
;                STA $95,X
;                STA $95,X
;                EOR $AA,X
;                TAX
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                LDA #$A9
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                ISB $FFFF,X
;                ISB $3F7F,X
;                RLA $FF3F,X
;                INC $FEFE,X
;                NOP
;                NOP
;                NOP
;                NOP
;                TXS
;                STA $95,X
;                LDA $A5
;                NOP #$80
;                NOP #$55
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                SRE $57,X
;                SRE $57,X
;                SRE $03,X
;                SLO ($03,X)
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FEFF,X
;                INC $FEFE,X
;                INC $FEFE,X
;                INC $A5A5,X
;                LDA $A5
;                LDA $A0
;                LDY #$A0
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                RRA $7F7F,X
;                SRE $0B5F,X
;                JAM
;                BRK
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $A9BF,X
;                LDA #$A9
;                LDA #$A9
;                TAY
;                LXA #$BF
;                SRE $5F5F,X
;                ADC $F07D,X
;                CPY #$00
;                EOR $55,X
;                EOR $55,X
;                NOP
;                ASL
;                ASL
;                PLP
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                SRE $5F5F,X
;                SRE $0F5F,X
;                SLO $FF0F
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FAFA,X
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                NOP
;                STA $95,X
;                STA $95,X
;                STA $80,X
;                ISB $55FF,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                NOP $55FC,X
;                EOR $55,X
;                EOR $55,X
;                BRK
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                EOR $55,X
;                EOR $55,X
;                EOR $00,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ASL
;                ASL
;                ASL
;                JAM
;                JAM
;                JAM
;                BRK
;                BRK
;                TAX
;                TAX
;                TAX
;                TAY
;                TAY
;                TAY
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                BRK
;                BRK
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                BRK
;                BRK
;                LDY #$A0
;                LDY #$A0
;                LDY #$A0
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                LAX $2A2A
;                ASL
;                JAM
;                BRK
;                BRK
;                BRK
;                LDY $A8A8,X
;                TAY
;                TAY
;                PLP
;                BRK
;                BRK
;                BRK
;                BRK
;                JAM
;                ASL
;                TAY
;                LDY #$00
;                BRK
;                PLP
;                LDY #$80
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ROL
;                ROL
;                ROL
;                ROL
;                ROL
;                ROL
;                BRK
;                BRK
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                BRK
;                BRK
;                NOP #$80
;                NOP #$80
;                NOP #$82
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                TAX
;                TAX
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                TAY
;                TAY
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                NOP $FCFC,X
;                NOP $FCFC,X
;                NOP $F0FC,X
;                NOP $0FFF,X
;                SLO $0303
;                SLO ($00,X)
;                BRK
;                BRK
;                BRK
;                CPY #$C0
;                CPY #$F0
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ISB $FFFF,X
;                NOP $FCFC,X
;                NOP $FCFF,X
;                NOP $00FC,X
;                BRK
;                BRK
;                BRK
;                NOP $0000,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                RLA $3F3F,X
;                RLA $3F3F,X
;                RLA $003F,X
;                BRK
;                BRK
;                DCP ($C3,X)
;                ISB $FFFF,X
;                NOP $FCFC,X
;                NOP $FCFC,X
;                NOP $00FC,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                SLO ($0F,X)
;                SLO $3C3F
;branch69         NOP $CCFC,X
;                DCP $03CF
;                SLO ($00,X)
;                BRK
;                BRK
;                BRK
;                BRK
;                CPY #$C0
;branch70         BEQ branch69
;                BEQ branch70
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                NOP $FCFC,X
;                NOP $FCFC,X
;                NOP $03FC,X
;                SLO ($03,X)
;                SLO $FF0F
;                NOP $F0F0,X
;                CPY #$C0
;                CPY #$00
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                ISB $FCFC,X
;                NOP $FFFC,X
;                ISB $FCFF,X
;                BRK
;                BRK
;                BRK
;                BRK
;                NOP $FCFC,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                RLA $3F3F,X
;                RLA $3F3F,X
;                RLA $3C3F,X
;                NOP $3C3C,X
;                BRK
;branch71         BRK
;                BRK
;                BRK
;                NOP $FCFC,X
;                NOP $FCFC,X
;                NOP $00FC,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                NOP $3C3C,X
;                RLA $0F0F,X
;                SLO ($00,X)
;                BRK
;                BRK
;                BRK
;                SLO ($03,X)
;                DCP $CCCF
;                NOP $F0F0,X
;                BEQ branch71
;                CPY #$00
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;branch74         BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                EOR $5E,X
;                LSR $605F,X
;                JAM
;                RRA ($65,X)
;                RRA $69
;                ARR #$6D
;                BVS $3FC1
;                ADC $78,X
;                NOP $827F,X
;                STX $89
;                STA $9490
;                TYA
;                SHY $A4A0,X
;                TAY
;                LDY $B4B0
;                CLV
;                LDY $C3C0,X
;                DCP $CB
;                DCP $D6D2
;                CMP $E0DC,Y
;                ISB ($E5,X)
;                INX
;                SBC #$ED
;                ISB $F3F2
;                SBC $F7,X
;                SED
;                SBC $FBFA,Y
;                NOP $FCFC,X
;                NOP $FCFC,X
;                ISB $F9FA,Y
;                SED
;                ISB $F5,X
;                ISB ($F2),Y
;                ISB $EBED
;                INX
;                SBC $E3
;                CPX #$DC
;                CMP $D2D6,Y
;                DCP $C7CB
;                DCP ($C0,X)
;                LDY $B4B8,X
;                BCS $3F49
;                TAY
;                LDY $A0
;                SHY $9498,X
;                BCC $3F32
;                NOP #$86
;                NOP #$7F
;                NOP $7578,X
;                RRA ($70),Y
;                ADC $696B
;                RRA $65
;                RRA ($62,X)
;                RTS
;                SRE $5E5E,X
;                EOR $5D,X
;                EOR $7F,X
;                PHP
;                SRE $7F73,X
;branch72         BRK
;                RRA $7F08,X
;                BRK
;                RRA $7F08,X
;                BRK
;                RRA $7F08,X
;                BRK
;                SRE $5F00,X
;                JSR label82
;                RRA $7F00,X
;                PHA
;                RRA $08,X
;                RRA $08,X
;                RRA $5F00,X
;                JSR label83
;                RRA $7F08,X
;                PHP
;                RRA $1F00,X
;                BRK
;                RRA $7F08,X
;                PHP
;                RRA $5F20,X
;                JSR label82
;                RRA $7F08,X
;                RRA $003F,X
;                RRA $7F00,X
;                RRA $287F,X
;                CMP ($01,X)
;                LDA ($91,X)
;                STA ($01),Y
;                ORA ($01,X)
;                SBC ($F1),Y
;                ORA ($A1,X)
;                SBC ($F1),Y
;                ORA ($01,X)
;                STA ($91),Y
;                ASL
;                TAX
;                DEX
;                CMP ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($C1,X)
;                CMP ($01,X)
;                ORA ($91,X)
;                STA ($01),Y
;                ORA ($A1,X)
;                SBC ($F1),Y
;                ORA ($01,X)
;                SBC ($F1),Y
;                ORA ($A1,X)
;                STA ($91),Y
;                ORA ($01,X)
;                CMP ($C1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($C1,X)
;                DEX
;                DEX
;                TAX
;                TXS
;                STA ($91),Y
;                ORA ($01,X)
;                ORA ($F1,X)
;                SBC ($01),Y
;                ORA ($F1,X)
;                SBC ($01),Y
;                TXS
;                TXS
;                ADC ($A1,X)
;                CMP ($C1,X)
;                AND ($01),Y
;                ORA ($01,X)
;                SBC ($A1),Y
;                CMP ($C1,X)
;                ORA ($01,X)
;                STA ($91),Y
;                ORA ($A1,X)
;                LDA ($F1,X)
;                SBC ($01),Y
;                ASL
;                DEX
;                NOP
;                ASL
;                LDA ($61,X)
;                STA ($91),Y
;                ORA ($01,X)
;                CMP ($C1,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ASL
;                ROR
;                DEX
;                ASL
;                TAX
;                TXS
;                STA ($91),Y
;                ORA ($01,X)
;                ORA ($F1,X)
;                SBC ($A1),Y
;                AND ($F1),Y
;                SBC ($01),Y
;                ADC ($91,X)
;                STA ($A1),Y
;                CMP ($C1,X)
;                DEX
;                ASL
;                ASL
;                ASL
;                ORA ($A1,X)
;                CMP ($C1,X)
;                ORA ($01,X)
;                SBC ($91,X)
;                ORA ($A1,X)
;                LDA ($F1,X)
;                NOP
;                NOP
;                ASL
;                SBC ($F1),Y
;                ASL
;                LDA ($91,X)
;                STA ($01),Y
;                ORA ($C1,X)
;                CMP ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($C1,X)
;                CMP ($01,X)
;                LDA ($91,X)
;                TXS
;                ASL
;                ASL
;                ASL
;                SBC ($F1),Y
;                ORA ($A1,X)
;                SBC ($F1),Y
;                ORA ($01,X)
;                STA ($91),Y
;                ORA ($A1,X)
;                DEX
;                DEX
;                ASL
;                ASL
;                ASL
;                ASL
;                ORA ($01,X)
;                CMP ($C1,X)
;                ORA ($91,X)
;                STA ($91),Y
;                LDA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ASL
;                ASL
;                ASL
;                ASL
;                ORA ($01,X)
;                ORA ($A1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                ASL
;                ASL
;                ASL
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($9A,X)
;                TXS
;                ASL
;                LDA ($A1,X)
;                SBC ($F1),Y
;                SBC ($01),Y
;                SBC ($F1),Y
;                ORA ($A1,X)
;                STA ($91),Y
;                ORA ($0A,X)
;                DEX
;                DEX
;                ASL
;                TAX
;                ASL
;                ORA ($01,X)
;                ORA ($C1,X)
;                CMP ($01,X)
;                LDA ($91,X)
;                STA ($01),Y
;                ORA ($01,X)
;                SBC ($F1),Y
;                ORA ($A1,X)
;                SBC ($F1),Y
;                ORA ($01,X)
;                STA ($91),Y
;                ORA ($A1,X)
;                CMP ($C1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                CMP ($C1,X)
;                ORA ($9A,X)
;                STA ($91),Y
;                LDA ($01,X)
;                LDA ($F1,X)
;                SBC ($01),Y
;label38          ORA ($F1,X)
;label79          SBC ($01),Y
;                ORA ($91,X)
;                STA ($01),Y
;                CMP ($C1,X)
;                CMP ($A1,X)
;label84          ORA ($01,X)
;                ORA ($01,X)
;                CMP ($C1,X)
;                CMP ($A1,X)
;                STA ($91),Y
;label71          STA ($01),Y
;                ORA ($F1,X)
;                SBC ($F1),Y
;                LDA ($F1,X)
;                SBC ($F1),Y
;                ORA ($91,X)
;                STA ($91),Y
;                LDA ($C1,X)
;                CMP ($C1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($C1,X)
;                CMP ($C1,X)
;                ORA ($91,X)
;                STA ($91),Y
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                AND ($31),Y
;                ADC ($01,Y)
;                ADC ($61,X)
;                ADC ($A1,X)
;                ADC ($01,X)
;                ORA ($01,X)
;                ADC ($01,X)
;                ORA ($A1,X)
;                ADC ($01,X)
;                ORA ($01,X)
;                ADC ($F1,X)
;                ORA ($A1,X)
;                LDA ($F1,X)
;                SBC ($F1),Y
;                ORA ($31,X)
;                SBC ($F1),Y
;                LDA ($61,X)
;                STA ($91),Y
;                ORA ($C1,X)
;                CMP ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($C1,X)
;                CMP ($01,X)
;                LDA ($91,X)
;                STA ($01),Y
;                ORA ($01,X)
;                SBC ($F1),Y
;                ORA ($A1,X)
;                SBC ($F1),Y
;                ORA ($01,X)
;                STA ($91),Y
;                ORA ($A1,X)
;                CMP ($C1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                CMP ($C1,X)
;                ORA ($01,X)
;                STA ($91),Y
;                ORA ($01,X)
;                LDA ($F1,X)
;                SBC ($01),Y
;                ORA ($F1,X)
;                SBC ($01),Y
;                LDA ($91,X)
;                STA ($01),Y
;                ORA ($C1,X)
;                CMP ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                CMP ($C1,X)
;                CMP ($A1,X)
;                STA ($91),Y
;                STA ($01),Y
;                ORA ($01,X)
;                SBC ($F1),Y
;                ORA ($01,X)
;                SBC ($F1),Y
;                ORA ($91,X)
;                STA ($91),Y
;                LDA ($C1,X)
;                CMP ($C1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                LDA ($F1,X)
;                SBC ($F1),Y
;                ORA ($F1,X)
;                SBC ($F1),Y
;                LDA ($9A,X)
;                TXS
;                TXS
;                ASL
;                ROR
;                ROR
;                ASL
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                DEX
;                DEX
;                ASL
;                TAX
;                TXS
;                TXS
;                ASL
;                ASL
;                ASL
;                NOP
;                NOP
;                ASL
;                TAX
;                NOP
;                NOP
;                ASL
;                ASL
;                TXS
;                TXS
;                ASL
;                TAX
;                CMP ($C1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($AA,X)
;                DEX
;                DEX
;                ASL
;                ASL
;                TXS
;                TXS
;                ASL
;                ASL
;                TAX
;                NOP
;                NOP
;                ASL
;                ASL
;                NOP
;                NOP
;                ASL
;                TAX
;                TXS
;                TXS
;                ASL
;                ASL
;                DEX
;                DEX
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                DEX
;                DEX
;                DEX
;                TAX
;                STA ($91),Y
;                STA ($01),Y
;                ORA ($01,X)
;                SBC ($FA),Y
;                ASL
;                ASL
;                NOP
;                NOP
;                ASL
;                TXS
;                TXS
;                TXS
;                TAX
;                DEX
;                DEX
;                DEX
;                ASL
;                ASL
;                ASL
;                ASL
;                TAX
;                DEX
;                DEX
;                DEX
;                ASL
;                TXS
;                TXS
;                TXS
;                TAX
;                TAX
;                NOP
;                NOP
;                NOP
;                ASL
;                SBC ($FA),Y
;                SBC ($A1),Y
;                STA ($91),Y
;                STA ($01),Y
;                CMP ($C1,X)
;                DEX
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                DEX
;                DEX
;                DEX
;                TAX
;                TXS
;                TXS
;                TXS
;                ASL
;                ASL
;                ASL
;                NOP
;                ASL
;                TAX
;                NOP
;                TXS
;                NOP
;                ASL
;                ROR
;                TXS
;                ROR
;                TAX
;                ASL
;                TXS
;                ROR
;                ORA ($6A,X)
;                ORA ($01,X)
;                LDA ($61,X)
;                ADC ($01,X)
;                ORA ($61,X)
;                ROR
;                ASL
;                TAX
;                TAX
;                NOP
;                NOP
;                NOP
;                ASL
;                NOP
;                NOP
;                ASL
;                TAX
;                TXS
;                TXS
;                ASL
;                ASL
;                DEX
;                DEX
;                ASL
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                DEX
;                DEX
;                ASL
;                TAX
;                TXS
;                TXS
;                ASL
;                ASL
;                ORA ($F1,X)
;                SBC ($01),Y
;                LDA ($F1,X)
;                SBC ($01),Y
;                ORA ($9A,X)
;                TXS
;                ASL
;                LDA ($C1,X)
;                CMP ($01,X)
;                ASL
;                ORA ($01,X)
;                ORA ($01,X)
;                DEX
;                DEX
;                ORA ($9A,X)
;                TXS
;                TXS
;                LDA ($01,X)
;                LDA ($F1,X)
;                NOP
;                ORA ($01,X)
;                SBC ($FA),Y
;                ASL
;                ASL
;                TXS
;                TXS
;                ORA ($C1,X)
;                CMP ($C1,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($C1,X)
;                CMP ($01,X)
;                ORA ($A1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                ASL
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ASL
;                ORA ($AA,X)
;                ASL
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                ORA ($0A,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ASL
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($AA,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                ASL
;                ASL
;                ORA ($01,X)
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                LDA ($01,X)
;                ORA ($01,X)
;                ORA ($0A,X)
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                TAX
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($A1,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($0A,X)
;                ASL
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                TAX
;label86          ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                TAX
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $FFFF,X
;                ISB $F8FE,X
;                BEQ branch75
;                ISB $C0E0,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label45          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label99          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label39          BRK
;label44          BRK
;                BRK
;                BRK
;label16          BRK
;                BRK
;label64          BRK
;                BRK
;                BRK
;label57          BRK
;                BRK
;label34          BRK
;                BRK
;label78          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label52          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label94          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label13          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label20          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label49          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label73          BRK
;                BRK
;                BRK
;label19          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label60          BRK
;label70          BRK
;                BRK
;                BRK
;label25          BRK
;                BRK
;                BRK
;label43          BRK
;                BRK
;                BRK
;                BRK
;label42          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label66          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label46          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label92          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label31          BRK
;                BRK
;                BRK
;                BRK
;label75          BRK
;                BRK
;                BRK
;                BRK
;label62          BRK
;                BRK
;label17          BRK
;                BRK
;                BRK
;                BRK
;label26          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label91          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label56          BRK
;label33          BRK
;label29          BRK
;                BRK
;label68          BRK
;label48          BRK
;                BRK
;                BRK
;label36          BRK
;                BRK
;                BRK
;                BRK
;label41          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label40          BRK
;label23          BRK
;                BRK
;                BRK
;                BRK
;label18          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label90          BRK
;                BRK
;                BRK
;                BRK
;label74          BRK
;                BRK
;label24          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label97          BRK
;                BRK
;label65          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label61          BRK
;label76          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label69          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label50          BRK
;                BRK
;                BRK
;                BRK
;label85          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label47          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label63          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label58          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label15          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label380          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label72          BRK
;                BRK
;label95          BRK
;                BRK
;label96          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label77          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label80          BRK
;                BRK
;                BRK
;label59          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                STY $E3,X
;                RRA $43E3,Y
;                JAM
;                EOR $4142
;                SRE ($49),Y
;                SRE ($30,X)
;                TAY
;                EOR ($A7,X)
;                ORA $F7AD,X
;                TAY
;                LDY $AB
;                LDX $80AB,Y
;                BCS $A020
;                LDY $A9A4
;                SHA $70A8,Y
;                TAY
;                RLA A9
;                NOP $82A8,X
;                TAY
;                CMP
;                TAY
;                NOP
;                LDA #$2E
;                TAY
;                LSR
;                LDA #$2C
;                CLV
;                RRA $E1
;                EOR $E1,X
;                NOP $E1
;                JAM
;                LAX ($23),Y
;                CLV
;                RRA $9FAA,X
;                TAX
;                LSR $A8,X
;                SHS $5DA6,Y
;                LDX $85
;                TAX
;                AND #$E1
;                LDA $C6E1,X
;                SBC ($7A,X)
;                LXA #$41
;                LDX $39
;                LDY $BCCC,X
;                CLI
;                LDY $0310,X
;                ADC $9EB3,X
;                LAX ($71),Y
;                LAX $E097,Y
;                NOP
;                LDA $BFED,Y
;                NOP $E2
;                ARR #$E2
;                LDY $E2,X
;                ASL $0DE3
;                CLV
;                NOP $65B7,X
;                LDY $AD,X
;                LAX $8B,Y
;                LAX $EC,Y
;branch77         LDX $00,Y
;                LAX $2C,Y
;                LAX $37,Y
;                LAX $79,Y
;                ADC #$B8
;                ADC $B852,Y
;                RRA $BA2A,Y
;                RRA $BB11,Y
;                RRA $BF7A,X
;                BVC $A079
;                LAX $E546
;                LAX $B37D
;                LAX $D35A,Y
;                LDX $1564
;                BCS $A0E4
;                LSR $46C4
;                SRE $4ED2
;                EOR $58
;                NOP $44,X
;                EOR ($54,X)
;                CMP ($49,X)
;                LSR $5550
;                NOP $A3,X
;                EOR #$4E
;                BVC $A10B
;                NOP $44,X
;                EOR #$CD
;                JAM
;                EOR $41
;                CPY $4C
;                EOR $D4
;                SRE $4F
;                NOP $CF,X
;                JAM
;                EOR $CE,X
;                EOR #$C6
;                JAM
;                EOR $53
;                NOP $4F,X
;                JAM
;                CMP $47
;                SRE $5553
;                NOP #$52
;                EOR $54
;                EOR $52,X
;                DEC $4552
;                CMP $5453
;                SRE $4FD0
;branch78         DEC $4157
;                EOR #$D4
;                JMP label84
;                CPY $53
;                EOR ($56,X)
;                CMP $56
;                EOR $52
;                EOR #$46
;                CMP $4544,Y
;                DEC $50
;                SRE $C54B
;                BVC $A152
;                EOR #$4E
;                NOP $A3,X
;                BVC $A158
;                EOR #$4E
;                NOP $43,X
;                SRE $D44E
;                JMP label85
;                NOP $43,X
;                JMP label86
;                EOR $53C4
;                EOR $D3,Y
;                SRE $4550
;                DEC $4C43
;                SRE $C553
;                SRE $45
;                NOP $4E,X
;                EOR $D7
;                NOP $41,X
;                JAM
;                TAY
;                NOP $CF,X
;                LSR $CE
;                SRE ($50),Y
;                SRE ($A8,X)
;                NOP $48,X
;                EOR $CE
;                LSR $D44F
;                SRE ($54),Y
;                EOR $D0
;                LXA #$AD
;                TAX
;                LAX $41DE
;                LSR $4FC4
;                JAM
;                LDX $BCBD,Y
;                SRE ($47),Y
;                DEC $4E49
;branch80         NOP $41,X
;                JAM
;                DCP ($55),Y
;                SRE ($D2),Y
;                LSR $52
;                CMP $50
;                SRE $53D3
;                EOR ($D2),Y
;                JAM
;                LSR $4CC4
;                SRE $45C7
;                CLI
;                BNE branch82
;                SRE $53D3
;                EOR #$CE
;                NOP $41,X
;                DEC $5441
;                DEC $4550
;                EOR $CB
;                JMP label87
;                SRE ($54),Y
;                JAM
;                LDY $56
;                EOR ($CC,X)
;                EOR ($53,X)
;                DCP ($43,X)
;                PHA
;                JAM
;                LDY $4C
;                EOR $46
;                NOP $A4,X
;                JAM
;                EOR #$47
;                PHA
;                NOP $A4,X
;                EOR $4449
;                LDY $47
;                DCP $5400
;                SRE $204F
;                EOR $4E41
;                EOR $20,Y
;                LSR $49
;                JMP label88
;                LSR $49
;                JMP label89
;                SRE $4550
;                DEC $4946
;                JMP label89
;                LSR $544F
;                JSR label90
;                EOR $CE
;                LSR $49
;                JMP label89
;                LSR $544F
;                JSR label68
;                EOR $4E,X
;                CPY $44
;                EOR $56
;                EOR #$43
;                EOR $20
;                LSR $544F
;                JSR label76
;                EOR $53
;                EOR $4E
;                NOP $4E,X
;                SRE $2054
;                EOR #$4E
;                BVC $A23F
;                NOP $20,X
;                LSR $49
;                JMP label91
;                SRE $2054
;                SRE $5455
;                BVC $A24E
;                NOP $20,X
;                LSR $49
;                JMP label92
;                EOR #$53
;                SRE ($49),Y
;                LSR $2047
;                LSR $49
;                JMP label89
;                LSR $4D41
;                CMP $49
;                JMP label39
;                SRE $41
;                JMP label45
;                EOR $56
;                EOR #$43
;                EOR $20
;                LSR $4D55
;                JAM
;                EOR $D2
;                LSR $5845
;                NOP $20,X
;                SRE $49,X
;                NOP $48,X
;                SRE $5455
;                JSR label68
;                JAM
;                SRE ($59),Y
;                LSR $4154
;                CLD
;                JAM
;                EOR $54
;                EOR $52,X
;                LSR $5720
;                EOR #$54
;                PHA
;                SRE $5455
;                JSR label48
;                SRE ($55),Y
;branch84         NOP #$4F
;                EOR $54,X
;                JSR label52
;                JSR label93
;                NOP $C1,X
;                EOR #$4C
;                JMP label94
;                EOR ($4C,X)
;                JSR label95
;                EOR ($4E,X)
;                NOP $49,X
;                NOP $D9,X
;                SRE $4556
;                JAM
;                LSR $4C
;                SRE $4FD7
;                EOR $54,X
;                JSR label52
;                JSR label44
;                EOR $524F
;                CMP $4E55,Y
;                NOP $45
;                LSR $27
;                NOP $20
;                SRE ($54),Y
;                EOR ($54,X)
;                EOR $4D
;                EOR $4E
;                NOP $42,X
;                EOR ($44,X)
;                JSR label96
;                JAM
;                SRE ($43),Y
;                JAM
;                EOR #$50
;                NOP $52,X
;                EOR $44
;                EOR #$4D
;                RLA 44
;                JSR label97
;                JAM
;                EOR ($D9,X)
;                NOP $49
;                LSR $49,X
;                SRE ($49),Y
;                SRE $204E
;                JAM
;                EOR $20,Y
;                NOP
;                EOR $52
;                DCP $4C49
;                JMP label94
;                EOR ($4C,X)
;                JSR label19
;                JAM
;                EOR $43
;                NOP $54,X
;                EOR $50,Y
;                EOR $20
;                EOR $5349
;                EOR $5441
;                SRE ($C8,X)
;                SRE ($54),Y
;                JAM
;                EOR #$4E
;                SRE $20
;                NOP $4F,X
;                SRE $4C20
;                SRE $C74E
;                LSR $49
;                JMP label89
;                NOP $41
;                NOP $C1,X
;                LSR $4F
;                JAM
;                EOR $4C55
;                EOR ($20,X)
;                NOP $4F,X
;                SRE $4320
;                SRE $504D
;                JMP label98
;                SRE ($41,X)
;                LSR $5427
;                JSR label33
;                LSR $4954
;                LSR $C555
;                EOR $4E,X
;                NOP $45
;                LSR $27
;                NOP $20
;                LSR $55
;                LSR $5443
;                EOR #$4F
;                DEC $4556
;                JAM
;                EOR #$46
;                CMP $4F4C,Y
;                EOR ($C4,X)
;                SHX $ACA1,Y
;                LDA ($B5,X)
;                LDA ($C2,X)
;                LDA ($D0,X)
;                LDA ($E2,X)
;                LDA ($F0,X)
;                LDA ($FF,X)
;                LDA ($10,X)
;                LDX #$25
;                LDX #$35
;                LDX #$3B
;                LDX #$4F
;                LDX #$5A
;                LDX #$6A
;                LDX #$72
;                LDX #$7F
;                LDX #$90
;                LDX #$9D
;                LDX #$AA
;                LDX #$BA
;                LDX #$C8
;                LDX #$D5
;                LDX #$E4
;                LDX #$ED
;                LDX #$00
;                LAX ($0E,X)
;                LAX ($1E,X)
;                LAX ($24,X)
;                LAX ($83,X)
;                LAX ($0D,X)
;                SRE $0D4B
;                BRK
;                JSR label99
;                JAM
;                JAM
;                SRE $0052
;                JSR label62
;                JSR label100
;                ASL
;                JAM
;                EOR $41
;                NOP $59
;                ROL $0A0D
;                BRK
;                ORA $420A
;                JAM
;                EOR $41
;                ASR #$00
;                LDY #$BA
;                INX
;                INX
;                INX
;                INX
;branch88         LDA $0101,X
;                CMP #$81
;                BNE branch85
;                LDA $4A
;                BNE branch86
;                LDA $0102,X
;                STA $49
;                LDA $0103,X
;                STA $4A
;branch86         CMP $0103,X
;                BNE branch87
;                LDA $49
;                CMP $0102,X
;                BEQ branch85
;branch87         TXA
;                CLC
;                ADC #$12
;                TAX
;                BNE branch88
;branch85         RTS
;label119          JSR label101
;                STA $31
;                STY $32
;label263          SEC
;                LDA $5A
;                SBC $5F
;                STA $22
;                TAY
;                LDA $5B
;                SBC $60
;                TAX
;                INX
;                TYA
;                BEQ branch89
;                LDA $5A
;                SEC
;                SBC $22
;                STA $5A
;                BCS $A3DC
;                DEC $5B
;                SEC
;branch90         LDA $58
;                SBC $22
;                STA $58
;                BCS $A3EC
;                DEC $59
;                BCC $A3EC
;branch92         LDA ($5A),Y
;                STA ($58),Y
;branch91         DEY
;                BNE branch92
;                LDA ($5A),Y
;                STA ($58),Y
;branch89         DEC $5B
;                DEC $59
;                DEX
;                BNE branch91
;                RTS
;label133          ASL
;                ADC #$3E
;                BCS $A435
;                STA $22
;                TSX
;                CPX $22
;                BCC $A435
;                RTS
;label101          CPY $34
;                BCC $A434
;                BNE branch95
;                CMP $33
;                BCC $A434
;branch95         PHA
;                LDX #$09
;                TYA
;branch96         PHA
;                LDA $57,X
;                DEX
;                BPL branch96
;                JSR label102
;                LDX #$F7
;branch97         PLA
;                STA $61,X
;                INX
;                BMI $A421
;                PLA
;                TAY
;                PLA
;                CPY $34
;                BCC $A434
;                BNE branch93
;                CMP $33
;                BCS $A435
;branch94         RTS
;branch93         LDX #$10
;label122          JMP ($0300)
;                TXA
;                ASL
;                TAX
;                LDA $A326,X
;                STA $22
;                LDA $A327,X
;                STA $23
;                JSR label103
;                LDA #$00
;                STA $13
;                JSR label104
;                JSR label105
;                LDY #$00
;branch98         LDA ($22),Y
;                PHA
;                AND #$7F
;                JSR label106
;                INY
;                PLA
;                BPL branch98
;                JSR label107
;                LDA #$69
;                LDY #$A3
;label148          JSR label108
;                LDY $3A
;                INY
;                BEQ branch99
;                JSR label109
;branch99         LDA #$76
;                LDY #$A3
;                JSR label108
;                LDA #$80
;                JSR label110
;branch100         JMP ($0302)
;                JSR label111
;                STX $7A
;                STY $7B
;                JSR label112
;                TAX
;                BEQ branch100
;                LDX #$FF
;                STX $3A
;                BCC $A49C
;                JSR label113
;                JMP label114
;branch101         JSR label115
;                JSR label113
;                STY $0B
;                JSR label116
;                BCC $A4ED
;                LDY #$01
;                LDA ($5F),Y
;                STA $23
;                LDA $2D
;                STA $22
;                LDA $60
;                STA $25
;                LDA $5F
;                DEY
;                SBC ($5F),Y
;                CLC
;                ADC $2D
;                STA $2D
;                STA $24
;                LDA $2E
;                ADC #$FF
;                STA $2E
;                SBC $60
;                TAX
;                SEC
;                LDA $5F
;                SBC $2D
;                TAY
;                BCS $A4D7
;                INX
;                DEC $25
;branch103         CLC
;                ADC $22
;                BCC $A4DF
;                DEC $23
;                CLC
;branch104         LDA ($22),Y
;                STA ($24),Y
;                INY
;                BNE branch104
;                INC $23
;                INC $25
;                DEX
;                BNE branch104
;branch102         JSR label117
;                JSR label118
;                LDA $0200
;                BEQ branch100
;                CLC
;                LDA $2D
;                STA $5A
;                ADC $0B
;                STA $58
;                LDY $2E
;                STY $5B
;                BCC $A508
;                INY
;branch105         STY $59
;                JSR label119
;                LDA $14
;                LDY $15
;                STA $01FE
;                STY $01FF
;                LDA $31
;                LDY $32
;                STA $2D
;                STY $2E
;                LDY $0B
;                DEY
;branch106         LDA $01FC,Y
;                STA ($5F),Y
;                DEY
;                BPL branch106
;                JSR label117
;                JSR label118
;                JMP label120
;label118          LDA $2B
;                LDY $2C
;                STA $22
;                STY $23
;                CLC
;branch109         LDY #$01
;                LDA ($22),Y
;                BEQ branch107
;                LDY #$04
;branch108         INY
;                LDA ($22),Y
;                BNE branch108
;                INY
;                TYA
;                ADC $22
;                TAX
;                LDY #$00
;                STA ($22),Y
;                LDA $23
;                ADC #$00
;                INY
;                STA ($22),Y
;                STX $22
;                STA $23
;                BCC $A53C
;branch107         RTS
;label111          LDX #$00
;branch111         JSR label121
;                CMP #$0D
;                BEQ branch110
;                STA $0200,X
;                INX
;                CPX #$59
;                BCC $A562
;                LDX #$17
;                JMP label122
;branch110         JMP label123
;label113          JMP ($0304)
;                LDX $7A
;                LDY #$04
;                STY $0F
;branch114         LDA $0200,X
;                BPL branch112
;                CMP #$FF
;                BEQ branch113
;                INX
;                BNE branch114
;branch112         CMP #$20
;                BEQ branch113
;                STA $08
;                CMP #$22
;                BEQ branch115
;                BIT $0F
;                BVS $A5C9
;                CMP #$3F
;                BNE branch116
;                LDA #$99
;                BNE branch113
;branch116         CMP #$30
;                BCC $A5AC
;                CMP #$3C
;                BCC $A5C9
;branch117         STY $71
;                LDY #$00
;                STY $0B
;                DEY
;                STX $7A
;                DEX
;branch118         INY
;                INX
;branch125         LDA $0200,X
;                SEC
;                SBC $A09E,Y
;                BEQ branch118
;                CMP #$80
;                BNE branch119
;                ORA $0B
;branch126         LDY $71
;branch113         INX
;                INY
;                STA $01FB,Y
;                LDA $01FB,Y
;                BEQ branch120
;                SEC
;                SBC #$3A
;                BEQ branch121
;                CMP #$49
;                BNE branch122
;branch121         STA $0F
;branch122         SEC
;                SBC #$55
;                BNE branch114
;                STA $08
;branch123         LDA $0200,X
;                BEQ branch113
;                CMP $08
;                BEQ branch113
;branch115         INY
;                STA $01FB,Y
;                INX
;                BNE branch123
;branch119         LDX $7A
;                INC $0B
;branch124         INY
;                LDA $A09D,Y
;                BPL branch124
;                LDA $A09E,Y
;                BNE branch125
;                LDA $0200,X
;                BPL branch126
;branch120         STA $01FD,Y
;                DEC $7B
;                LDA #$FF
;                STA $7A
;                RTS
;label116          LDA $2B
;                LDX $2C
;branch131         LDY #$01
;                STA $5F
;                STX $60
;                LDA ($5F),Y
;                BEQ branch127
;                INY
;                INY
;                LDA $15
;                CMP
;                SRE $1890,X
;                BEQ branch128
;                DEY
;                BNE branch129
;branch128         LDA $14
;                DEY
;                CMP
;                SRE $0C90,X
;                BEQ branch130
;branch129         DEY
;                LDA ($5F),Y
;                TAX
;                DEY
;                LDA ($5F),Y
;                BCS $A617
;branch127         CLC
;branch130         RTS
;                BNE branch130
;                LDA #$00
;                TAY
;                STA ($2B),Y
;                INY
;                STA ($2B),Y
;                LDA $2B
;                CLC
;                ADC #$02
;                STA $2D
;                LDA $2C
;                ADC #$00
;                STA $2E
;label117          JSR label124
;                LDA #$00
;                BNE branch132
;label149          JSR label125
;                LDA $37
;                LDY $38
;                STA $33
;                STY $34
;                LDA $2D
;                LDY $2E
;                STA $2F
;                STY $30
;                STA $31
;                STY $32
;                JSR label126
;label107          LDX #$19
;                STX $16
;                PLA
;                TAY
;                PLA
;                LDX #$FA
;                TXS
;                PHA
;                TYA
;                PHA
;                LDA #$00
;                STA $3E
;                STA $10
;branch132         RTS
;label124          CLC
;                LDA $2B
;                ADC #$FF
;                STA $7A
;                LDA $2C
;                ADC #$FF
;                STA $7B
;                RTS
;                BCC $A6A4
;                BEQ branch133
;                CMP #$AB
;                BNE branch132
;branch133         JSR label115
;                JSR label116
;                JSR label127
;                BEQ branch134
;                CMP #$AB
;                BNE branch130
;                JSR label112
;                JSR label115
;                BNE branch130
;branch134         PLA
;                PLA
;                LDA $14
;                ORA $15
;                BNE branch135
;                LDA #$FF
;                STA $14
;                STA $15
;branch135         LDY #$01
;                STY $0F
;                LDA ($5F),Y
;                BEQ branch136
;                JSR label128
;                JSR label104
;                INY
;                LDA ($5F),Y
;                TAX
;                INY
;                LDA ($5F),Y
;                CMP $15
;                BNE branch137
;                CPX $14
;                BEQ branch138
;branch137         BCS $A714
;branch138         STY $49
;                JSR label129
;                LDA #$20
;branch145         LDY $49
;                AND #$7F
;branch141         JSR label106
;                CMP #$22
;                BNE branch139
;                LDA $0F
;                EOR #$FF
;                STA $0F
;branch139         INY
;                BEQ branch136
;                LDA ($5F),Y
;                BNE branch140
;                TAY
;                LDA ($5F),Y
;                TAX
;                INY
;                LDA ($5F),Y
;                STX $5F
;                STA $60
;                BNE branch135
;branch136         JMP label130
;branch140         JMP ($0306)
;                BPL branch141
;                CMP #$FF
;                BEQ branch141
;                BIT $0F
;                BMI $A6F3
;                SEC
;                SBC #$7F
;                TAX
;                STY $49
;                LDY #$FF
;branch144         DEX
;                BEQ branch142
;branch143         INY
;                LDA $A09E,Y
;                BPL branch143
;                BMI $A72C
;branch142         INY
;                LDA $A09E,Y
;                BMI $A6EF
;                JSR label106
;                BNE branch142
;                LDA #$80
;                STA $10
;                JSR label131
;                JSR label132
;                BNE branch146
;                TXA
;                ADC #$0F
;                TAX
;                TXS
;branch146         PLA
;                PLA
;                LDA #$09
;                JSR label133
;                JSR label134
;                CLC
;                TYA
;                ADC $7A
;                PHA
;                LDA $7B
;                ADC #$00
;                PHA
;                LDA $3A
;                PHA
;                LDA $39
;                PHA
;                LDA #$A4
;                JSR label135
;                JSR label136
;                JSR label137
;                LDA $66
;                ORA #$7F
;                AND $62
;                STA $62
;                LDA #$8B
;                LDY #$A7
;                STA $22
;                STY $23
;                JMP label138
;                LDA #$BC
;                LDY #$B9
;                JSR label139
;                JSR label127
;                CMP #$A9
;                BNE branch147
;                JSR label112
;                JSR label137
;branch147         JSR label140
;                JSR label141
;                LDA $4A
;                PHA
;                LDA $49
;                PHA
;                LDA #$81
;                PHA
;label144          JSR label128
;                LDA $7A
;                LDY $7B
;                CPY #$02
;                NOP
;                BEQ branch148
;                STA $3D
;                STY $3E
;branch148         LDY #$00
;                LDA ($7A),Y
;                BNE branch149
;                LDY #$02
;                LDA ($7A),Y
;                CLC
;                BNE branch150
;                JMP label142
;branch150         INY
;                LDA ($7A),Y
;                STA $39
;                INY
;                LDA ($7A),Y
;                STA $3A
;                TYA
;                ADC $7A
;                STA $7A
;                BCC $A7E1
;                INC $7B
;branch151         JMP ($0308)
;                JSR label112
;                JSR label143
;                JMP label144
;label143          BEQ branch152
;label155          SBC #$80
;                BCC $A804
;                CMP #$23
;                BCS $A80E
;                ASL
;                TAY
;                LDA $A00D,Y
;                PHA
;                LDA $A00C,Y
;                PHA
;                JMP label112
;branch153         JMP label131
;branch149         CMP #$3A
;                BEQ branch151
;branch155         JMP label145
;branch154         CMP #$4B
;                BNE branch155
;                JSR label112
;                LDA #$A4
;                JSR label135
;                JMP label146
;label126          SEC
;                LDA $2B
;                SBC #$01
;                LDY $2C
;                BCS $A827
;                DEY
;branch156         STA $41
;                STY $42
;branch152         RTS
;label128          JSR label147
;                BCS $A832
;                CLC
;branch157         BNE branch158
;                LDA $7A
;                LDY $7B
;                LDX $3A
;                INX
;                BEQ branch159
;                STA $3D
;                STY $3E
;                LDA $39
;                LDY $3A
;                STA $3B
;                STY $3C
;branch159         PLA
;                PLA
;label142          LDA #$81
;                LDY #$A3
;                BCC $A854
;                JMP label148
;branch160         JMP label130
;                BNE branch158
;                LDX #$1A
;                LDY $3E
;                BNE branch161
;                JMP label122
;branch161         LDA $3D
;                STA $7A
;                STY $7B
;                LDA $3B
;                LDY $3C
;                STA $39
;                STY $3A
;branch158         RTS
;                PHP
;                LDA #$00
;                JSR label110
;                PLP
;                BNE branch162
;                JMP label117
;branch162         JSR label149
;                JMP label150
;                LDA #$03
;                JSR label133
;                LDA $7B
;                PHA
;                LDA $7A
;                PHA
;                LDA $3A
;                PHA
;                LDA $39
;                PHA
;                LDA #$8D
;                PHA
;label150          JSR label127
;                JSR label146
;                JMP label144
;label146          JSR label115
;                JSR label151
;                SEC
;                LDA $39
;                SBC $14
;                LDA $3A
;                SBC $15
;                BCS $A8BC
;                TYA
;                SEC
;                ADC $7A
;                LDX $7B
;                BCC $A8C0
;                INX
;                BCS $A8C0
;branch163         LDA $2B
;                LDX $2C
;branch164         JSR label152
;                BCC $A8E3
;                LDA $5F
;                SBC #$01
;                STA $7A
;                LDA $60
;                SBC #$00
;                STA $7B
;branch166         RTS
;                BNE branch166
;                LDA #$FF
;                STA $4A
;                JSR label132
;                TXS
;                CMP #$8D
;                BEQ branch167
;                LDX #$0C
;                BIT $11A2
;                JMP label122
;branch176         JMP label145
;branch167         PLA
;                PLA
;                STA $39
;                PLA
;                STA $3A
;                PLA
;                STA $7A
;                PLA
;                STA $7B
;label197          JSR label134
;branch173         TYA
;                CLC
;                ADC $7A
;                STA $7A
;                BCC $A905
;                INC $7B
;branch168         RTS
;label134          LDX #$3A
;                BIT $00A2
;                STX $07
;                LDY #$00
;                STY $08
;branch170         LDA $08
;                LDX $07
;                STA $07
;                STX $08
;branch169         LDA ($7A),Y
;                BEQ branch168
;                CMP $08
;                BEQ branch168
;                INY
;                CMP #$22
;                BNE branch169
;                BEQ branch170
;                JSR label153
;                JSR label127
;                CMP #$89
;                BEQ branch171
;                LDA #$A7
;                JSR label135
;branch171         LDA $61
;                BNE branch172
;                JSR label151
;                BEQ branch173
;branch172         JSR label127
;                BCS $A948
;                JMP label146
;branch174         JMP label143
;                JSR label154
;                PHA
;                CMP #$8D
;                BEQ branch175
;branch179         CMP #$89
;                BNE branch176
;branch175         DEC $65
;                BNE branch177
;                PLA
;                JMP label155
;branch177         JSR label112
;                JSR label115
;                CMP #$2C
;                BEQ branch175
;                PLA
;branch178         RTS
;label115          LDX #$00
;                STX $14
;                STX $15
;label156          BCS $A96A
;                SBC #$2F
;                STA $07
;                LDA $15
;                STA $22
;                CMP #$19
;                BCS $A953
;                LDA $14
;                ASL
;                ROL $22
;                ASL
;                ROL $22
;                ADC $14
;                STA $14
;                LDA $22
;                ADC $15
;                STA $15
;                ASL $14
;                ROL $15
;                LDA $14
;                ADC $07
;                STA $14
;                BCC $A99F
;                INC $15
;branch180         JSR label112
;                JMP label156
;label131          JSR label157
;                STA $49
;                STY $4A
;                LDA #$B2
;                JSR label135
;                LDA $0E
;                PHA
;                LDA $0D
;                PHA
;                JSR label153
;                PLA
;                ROL
;                JSR label158
;                BNE branch181
;                PLA
;label205          BPL branch182
;                JSR label159
;                JSR label160
;                LDY #$00
;                LDA $64
;                STA ($49),Y
;                INY
;                LDA $65
;                STA ($49),Y
;                RTS
;branch182         JMP label161
;branch181         PLA
;label202          LDY $4A
;                CPY #$BF
;                BNE branch183
;                JSR label162
;                CMP #$06
;                BNE branch184
;                LDY #$00
;                STY $61
;                STY $66
;branch186         STY $71
;                JSR label163
;                JSR label164
;                INC $71
;                LDY $71
;                JSR label163
;                JSR label165
;                TAX
;                BEQ branch185
;                INX
;                TXA
;                JSR label166
;branch185         LDY $71
;                INY
;                CPY #$06
;                BNE branch186
;                JSR label164
;                JSR label167
;                LDX $64
;                LDY $63
;                LDA $65
;                JMP label168
;label163          LDA ($22),Y
;                JSR label169
;                BCC $AA27
;branch184         JMP label170
;branch187         SBC #$2F
;                JMP label171
;branch183         LDY #$02
;                LDA ($64),Y
;                CMP $34
;                BCC $AA4B
;                BNE branch189
;                DEY
;                LDA ($64),Y
;                CMP $33
;                BCC $AA4B
;branch189         LDY $65
;                CPY $2E
;                BCC $AA4B
;                BNE branch190
;                LDA $64
;                CMP $2D
;                BCS $AA52
;branch188         LDA $64
;                LDY $65
;                JMP label172
;branch190         LDY #$00
;                LDA ($64),Y
;                JSR label173
;                LDA $50
;                LDY $51
;                STA $6F
;                STY $70
;                JSR label174
;                LDA #$61
;                LDY #$00
;label172          STA $50
;                STY $51
;                JSR label175
;                LDY #$00
;                LDA ($50),Y
;                STA ($49),Y
;                INY
;                LDA ($50),Y
;                STA ($49),Y
;                INY
;                LDA ($50),Y
;                STA ($49),Y
;                RTS
;                JSR label176
;                JMP label177
;label176          JSR label154
;                BEQ branch191
;                LDA #$2C
;                JSR label135
;branch191         PHP
;                STX $13
;                JSR label178
;                PLP
;                JMP label179
;branch197         JSR label180
;branch198         JSR label127
;label179          BEQ branch192
;label186          BEQ branch193
;                CMP #$A3
;                BEQ branch194
;                CMP #$A6
;                CLC
;                BEQ branch194
;                CMP #$2C
;                BEQ branch195
;                CMP #$3B
;                BEQ branch196
;                JSR label153
;                BIT $0D
;                BMI $AA9A
;                JSR label181
;                JSR label182
;                JSR label180
;                JSR label183
;                BNE branch198
;label123          LDA #$00
;                STA $0200,X
;                LDX #$FF
;                LDY #$01
;                LDA $13
;                BNE branch193
;branch192         LDA #$0D
;                JSR label106
;                BIT $13
;                BPL branch199
;                LDA #$0A
;                JSR label106
;branch199         EOR #$FF
;branch193         RTS
;branch195         SEC
;                JSR label184
;                TYA
;                SEC
;branch200         SBC #$0A
;                BCS $AAEE
;                EOR #$FF
;                ADC #$01
;                BNE branch201
;branch194         PHP
;                SEC
;                JSR label184
;                STY $09
;                JSR label185
;                CMP #$29
;                BNE branch202
;                PLP
;                BCC $AB0F
;                TXA
;                SBC $09
;                BCC $AB13
;branch201         TAX
;branch203         INX
;branch205         DEX
;                BNE branch204
;branch196         JSR label112
;                JMP label186
;branch204         JSR label183
;                BNE branch205
;label108          JSR label182
;label180          JSR label162
;                TAX
;                LDY #$00
;                INX
;branch206         DEX
;                BEQ branch193
;                LDA ($22),Y
;                JSR label106
;                INY
;                CMP #$0D
;                BNE branch206
;                JSR label187
;                JMP label188
;label183          LDA $13
;                BEQ branch207
;                LDA #$20
;                BIT $1DA9
;                BIT $3FA9
;label106          JSR label189
;                AND #$FF
;                RTS
;label206          LDA $11
;                BEQ branch208
;                BMI $AB57
;                LDY #$FF
;                BNE branch210
;branch209         LDA $3F
;                LDY $40
;branch210         STA $39
;                STY $3A
;branch202         JMP label145
;branch208         LDA $13
;                BEQ branch211
;                LDX #$18
;                JMP label122
;branch211         LDA #$0C
;                LDY #$AD
;                JSR label108
;                LDA $3D
;                LDY $3E
;                STA $7A
;                STY $7B
;                RTS
;                JSR label190
;                CMP #$23
;                BNE branch212
;                JSR label112
;                JSR label154
;                LDA #$2C
;                JSR label135
;                STX $13
;                JSR label191
;branch212         LDX #$01
;                LDY #$02
;                LDA #$00
;                STA $0201
;                LDA #$40
;                JSR label192
;                LDX $13
;                BNE branch213
;                RTS
;                JSR label154
;                LDA #$2C
;                JSR label135
;                STX $13
;                JSR label191
;                JSR label193
;label177          LDA $13
;branch213         JSR label103
;                LDX #$00
;                STX $13
;                RTS
;                CMP #$22
;                BNE branch214
;                JSR label194
;                LDA #$3B
;                JSR label135
;                JSR label180
;branch214         JSR label190
;                LDA #$2C
;                STA $01FF
;branch217         JSR label195
;                LDA $13
;                BEQ branch215
;                JSR label196
;                AND #$02
;                BEQ branch215
;                JSR label177
;                JMP label197
;branch215         LDA $0200
;                BNE branch216
;                LDA $13
;                BNE branch217
;                JSR label134
;                JMP label198
;label195          LDA $13
;                BNE branch218
;                JSR label105
;                JSR label183
;branch218         JMP label111
;                LDX $41
;                LDY $42
;                LDA #$98
;                BIT $00A9
;label192          STA $11
;                STX $43
;                STY $44
;label208          JSR label157
;                STA $49
;                STY $4A
;                LDA $7A
;                LDY $7B
;                STA $4B
;                STY $4C
;                LDX $43
;                LDY $44
;                STX $7A
;                STY $7B
;                JSR label127
;                BNE branch219
;                BIT $11
;                BVC $AC41
;                JSR label199
;                STA $0200
;                LDX #$FF
;                LDY #$01
;                BNE branch221
;branch220         BMI $ACB8
;                LDA $13
;                BNE branch223
;                JSR label105
;branch223         JSR label195
;branch221         STX $7A
;                STY $7B
;branch219         JSR label112
;                BIT $0D
;                BPL branch224
;                BIT $11
;                BVC $AC65
;                INX
;                STX $7A
;                LDA #$00
;                STA $07
;                BEQ branch226
;branch225         STA $07
;                CMP #$22
;                BEQ branch227
;                LDA #$3A
;                STA $07
;                LDA #$2C
;branch226         CLC
;branch227         STA $08
;                LDA $7A
;                LDY $7B
;                ADC #$00
;                BCC $AC7D
;                INY
;branch228         JSR label200
;                JSR label201
;                JSR label202
;                JMP label203
;branch224         JSR label204
;                LDA $0E
;                JSR label205
;label203          JSR label127
;                BEQ branch229
;                CMP #$2C
;                BEQ branch229
;                JMP label206
;branch229         LDA $7A
;                LDY $7B
;                STA $43
;                STY $44
;                LDA $4B
;                LDY $4C
;                STA $7A
;                STY $7B
;                JSR label127
;                BEQ branch230
;                JSR label207
;                JMP label208
;branch222         JSR label134
;                INY
;                TAX
;                BNE branch231
;                LDX #$0D
;                INY
;                LDA ($7A),Y
;                BEQ branch232
;                INY
;                LDA ($7A),Y
;                STA $3F
;                INY
;                LDA ($7A),Y
;                INY
;                STA $40
;branch231         JSR label198
;                JSR label127
;                TAX
;                CPX #$83
;                BNE branch222
;                JMP label209
;branch230         LDA $43
;                LDY $44
;                LDX $11
;                BPL branch233
;                JMP label210
;branch233         LDY #$00
;                LDA ($43),Y
;                BEQ branch234
;                LDA $13
;                BNE branch234
;                LDA #$FC
;                LDY #$AC
;                JMP label108
;branch234         RTS
;                RLA $5845,X
;                NOP $52,X
;                EOR ($20,X)
;                EOR #$47
;                LSR $524F
;                EOR $44
;                ORA $3F00
;                JAM
;                EOR $44
;                SRE $4620
;                JAM
;                SRE $204D
;                SRE ($54),Y
;                EOR ($52,X)
;                NOP $0D,X
;                BRK
;                BNE branch235
;                LDY #$00
;                BEQ branch236
;branch235         JSR label157
;branch236         STA $49
;                STY $4A
;                JSR label132
;                BEQ branch237
;                LDX #$0A
;branch232         JMP label122
;branch237         TXS
;                TXA
;                CLC
;                ADC #$04
;                PHA
;                ADC #$06
;                STA $24
;                PLA
;                LDY #$01
;                JSR label139
;                TSX
;                LDA $0109,X
;                STA $66
;                LDA $49
;                LDY $4A
;                JSR label211
;                JSR label161
;                LDY #$01
;                JSR label212
;                TSX
;                SEC
;                SBC $0109,X
;                BEQ branch238
;                LDA $010F,X
;                STA $39
;                LDA $0110,X
;                STA $3A
;                LDA $0112,X
;                STA $7A
;                LDA $0111,X
;                STA $7B
;branch239         JMP label144
;branch238         TXA
;                ADC #$11
;                TAX
;                TXS
;                JSR label127
;                CMP #$2C
;                BNE branch239
;                JSR label112
;                JSR label213
;label137          JSR label153
;label136          CLC
;                BIT $38
;label158          BIT $0D
;                BMI $AD97
;                BCS $AD99
;branch242         RTS
;branch240         BCS $AD96
;branch241         LDX #$16
;                JMP label122
;label153          LDX $7A
;                BNE branch243
;                DEC $7B
;branch243         DEC $7A
;                LDX #$00
;                BIT $48
;                TXA
;                PHA
;                LDA #$01
;                JSR label133
;                JSR label214
;                LDA #$00
;                STA $4D
;label267          JSR label127
;label215          SEC
;                SBC #$B1
;                BCC $ADD7
;                CMP #$03
;                BCS $ADD7
;                CMP #$01
;                ROL
;                EOR #$01
;                EOR $4D
;                CMP $4D
;                BCC $AE30
;                STA $4D
;                JSR label112
;                JMP label215
;branch244         LDX $4D
;                BNE branch246
;                BCS $AE58
;                ADC #$07
;                BCC $AE58
;                ADC $0D
;                BNE branch248
;                JMP label216
;branch248         ADC #$FF
;                STA $22
;                ASL
;                ADC $22
;                TAY
;branch254         PLA
;                CMP $A080,Y
;                BCS $AE5D
;                JSR label136
;branch255         PHA
;label226          JSR label217
;                PLA
;                LDY $4B
;                BPL branch250
;                TAX
;                BEQ branch251
;                BNE branch252
;branch246         LSR $0D
;                TXA
;                ROL
;                LDX $7A
;                BNE branch253
;                DEC $7B
;branch253         DEC $7A
;                LDY #$1B
;                STA $4D
;                BNE branch254
;branch250         CMP $A080,Y
;                BCS $AE66
;                BCC $ADF9
;label217          LDA $A082,Y
;                PHA
;                LDA $A081,Y
;                PHA
;                JSR label218
;                LDA $4D
;                JMP label219
;branch245         JMP label145
;label218          LDA $66
;                LDX $A080,Y
;label141          TAY
;                PLA
;                STA $22
;                INC $22
;                PLA
;                STA $23
;                TYA
;                PHA
;label138          JSR label159
;                LDA $65
;                PHA
;                LDA $64
;                PHA
;                LDA $63
;                PHA
;                LDA $62
;                PHA
;                LDA $61
;                PHA
;                JMP ($0022)
;branch247         LDY #$FF
;                PLA
;branch251         BEQ branch256
;branch249         CMP #$64
;                BEQ branch257
;                JSR label136
;branch257         STY $4B
;branch252         PLA
;                LSR
;                STA $12
;                PLA
;                STA $69
;                PLA
;                STA $6A
;                PLA
;                STA $6B
;                PLA
;                STA $6C
;                PLA
;                STA $6D
;                PLA
;                STA $6E
;                EOR $66
;                STA $6F
;branch256         LDA $61
;                RTS
;label214          JMP ($030A)
;                LDA #$00
;                STA $0D
;branch263         JSR label112
;                BCS $AE92
;branch261         JMP label204
;branch258         JSR label220
;                BCC $AE9A
;                JMP label221
;branch259         CMP #$FF
;                BNE branch260
;                LDA #$A8
;                LDY #$AE
;                JSR label139
;                JMP label112
;                NOP #$49
;                SLO $A1DA
;branch260         CMP #$2E
;                BEQ branch261
;                CMP #$AB
;                BEQ branch262
;                CMP #$AA
;                BEQ branch263
;                CMP #$22
;                BNE branch264
;label194          LDA $7A
;                LDY $7B
;                ADC #$00
;                BCC $AEC6
;                INY
;branch265         JSR label182
;                JMP label201
;branch264         CMP #$A8
;                BNE branch266
;                LDY #$18
;                BNE branch267
;                JSR label160
;                LDA $65
;                EOR #$FF
;                TAY
;                LDA $64
;                EOR #$FF
;                JMP label222
;branch266         CMP #$A5
;                BNE branch268
;                JMP label223
;branch268         CMP #$B4
;                BCC $AEF1
;                JMP label224
;branch269         JSR label225
;                JSR label153
;label245          LDA #$29
;                BIT $28A9
;                BIT $2CA9
;label135          LDY #$00
;                CMP
;                NOP
;                BNE branch270
;                JMP label112
;branch270         LDX #$0B
;                JMP label122
;branch262         LDY #$15
;branch267         PLA
;                PLA
;                JMP label226
;label227          SEC
;                LDA $64
;                SBC #$00
;                LDA $65
;                SBC #$A0
;                BCC $AF27
;                LDA #$A2
;                SBC $64
;                LDA #$E3
;                SBC $65
;branch271         RTS
;label221          JSR label157
;                STA $64
;                STY $65
;                LDX $45
;                LDY $46
;                LDA $0D
;                BEQ branch272
;                LDA #$00
;                STA $70
;                JSR label227
;                BCC $AF5C
;                CPX #$54
;                BNE branch273
;                CPY #$C9
;                BNE branch273
;                JSR label228
;                STY $5E
;                DEY
;                STY $71
;                LDY #$06
;                STY $5D
;                LDY #$24
;                JSR label229
;                JMP label230
;branch273         RTS
;branch272         BIT $0E
;                BPL branch274
;                LDY #$00
;                LDA ($64),Y
;                TAX
;                INY
;                LDA ($64),Y
;                TAY
;                TXA
;                JMP label222
;branch274         JSR label227
;                BCC $AFA0
;                CPX #$54
;                BNE branch276
;                CPY #$49
;                BNE branch275
;                JSR label228
;                TYA
;                LDX #$A0
;                JMP label231
;label228          JSR label232
;                STX $64
;                STY $63
;                STA $65
;                LDY #$00
;                STY $62
;                RTS
;branch276         CPX #$53
;                BNE branch275
;                CPY #$54
;                BNE branch275
;                JSR label196
;                JMP label233
;branch275         LDA $64
;                LDY $65
;                JMP label139
;label224          ASL
;                PHA
;                TAX
;                JSR label112
;                CPX #$8F
;                BCC $AFD1
;                JSR label225
;                JSR label153
;                JSR label207
;                JSR label234
;                PLA
;                TAX
;                LDA $65
;                PHA
;                LDA $64
;                PHA
;                TXA
;                PHA
;                JSR label154
;                PLA
;                TAY
;                TXA
;                PHA
;                JMP label235
;branch277         JSR label236
;                PLA
;                TAY
;label235          LDA $9FEA,Y
;                STA $55
;                LDA $9FEB,Y
;                STA $56
;                JSR label237
;                JMP label136
;                LDY #$FF
;                BIT $00A0
;                STY $0B
;                JSR label160
;                LDA $64
;                EOR $0B
;                STA $07
;                LDA $65
;                EOR $0B
;                STA $08
;                JSR label238
;                JSR label160
;                LDA $65
;                EOR $0B
;                AND $08
;                EOR $0B
;                TAY
;                LDA $64
;                EOR $0B
;                AND $07
;                EOR $0B
;                JMP label222
;                JSR label158
;                BCS $B02E
;                LDA $6E
;                ORA #$7F
;                AND $6A
;                STA $6A
;                LDA #$69
;                LDY #$00
;                JSR label239
;                TAX
;                JMP label240
;branch278         LDA #$00
;                STA $0D
;                DEC $4D
;                JSR label162
;                STA $61
;                STX $62
;                STY $63
;                LDA $6C
;                LDY $6D
;                JSR label241
;                STX $6C
;                STY $6D
;                TAX
;                SEC
;                SBC $61
;                BEQ branch279
;                LDA #$01
;                BCC $B056
;                LDX $61
;                LDA #$FF
;branch279         STA $66
;                LDY #$FF
;                INX
;branch282         INY
;                DEX
;                BNE branch280
;                LDX $66
;label240          BMI $B072
;                CLC
;                BCC $B072
;branch280         LDA ($6C),Y
;                CMP
;                JAM
;                BEQ branch282
;                LDX #$FF
;                BCS $B072
;                LDX #$01
;branch281         INX
;                TXA
;                ROL
;                AND $12
;                BEQ branch283
;                LDA #$FF
;branch283         JMP label233
;branch284         JSR label207
;                TAX
;                JSR label242
;                JSR label127
;                BNE branch284
;                RTS
;label157          LDX #$00
;                JSR label127
;label242          STX $0C
;label255          STA $45
;                JSR label127
;                JSR label220
;                BCS $B09F
;branch292         JMP label145
;branch285         LDX #$00
;                STX $0D
;                STX $0E
;                JSR label112
;                BCC $B0AF
;                JSR label220
;                BCC $B0BA
;branch286         TAX
;branch288         JSR label112
;                BCC $B0B0
;                JSR label220
;                BCS $B0B0
;branch287         CMP #$24
;                BNE branch289
;                LDA #$FF
;                STA $0D
;                BNE branch290
;branch289         CMP #$25
;                BNE branch291
;                LDA $10
;                BNE branch292
;                LDA #$80
;                STA $0E
;                ORA $45
;                STA $45
;branch290         TXA
;                ORA #$80
;                TAX
;                JSR label112
;branch291         STX $46
;                SEC
;                ORA $10
;                SBC #$28
;                BNE branch293
;                JMP label243
;branch293         LDY #$00
;                STY $10
;                LDA $2D
;                LDX $2E
;branch297         STX $60
;branch296         STA $5F
;                CPX $30
;                BNE branch294
;                CMP $2F
;                BEQ branch295
;branch294         LDA $45
;                CMP
;                SRE $08D0,X
;                LDA $46
;                INY
;                CMP
;                SRE $7DF0,X
;                DEY
;                CLC
;                LDA $5F
;                ADC #$07
;                BCC $B0F1
;                INX
;                BNE branch297
;label220          CMP #$41
;                BCC $B11C
;                SBC #$5B
;                SEC
;                SBC #$A5
;branch298         RTS
;branch295         PLA
;                PHA
;                CMP #$2A
;                BNE branch299
;branch301         LDA #$13
;                LDY #$BF
;branch307         RTS
;branch299         LDA $45
;                LDY $46
;                CMP #$54
;                BNE branch300
;                CPY #$C9
;                BEQ branch301
;                CPY #$49
;                BNE branch300
;branch303         JMP label145
;branch300         CMP #$53
;                BNE branch302
;                CPY #$54
;                BEQ branch303
;branch302         LDA $2F
;                LDY $30
;                STA $5F
;                STY $60
;                LDA $31
;                LDY $32
;                STA $5A
;                STY $5B
;                CLC
;                ADC #$07
;                BCC $B159
;                INY
;branch304         STA $58
;                STY $59
;                JSR label119
;                LDA $58
;                LDY $59
;                INY
;                STA $2F
;                STY $30
;                LDY #$00
;                LDA $45
;                STA ($5F),Y
;                INY
;                LDA $46
;                STA ($5F),Y
;                LDA #$00
;                INY
;                STA ($5F),Y
;                INY
;                STA ($5F),Y
;                INY
;                STA ($5F),Y
;                INY
;                STA ($5F),Y
;                INY
;                STA ($5F),Y
;                LDA $5F
;                CLC
;                ADC #$02
;                LDY $60
;                BCC $B18F
;                INY
;branch305         STA $47
;                STY $48
;                RTS
;label246          LDA $0B
;                ASL
;                ADC #$05
;                ADC $5F
;                LDY $60
;                BCC $B1A0
;                INY
;branch306         STA $58
;                STY $59
;                RTS
;                BCC $B127
;                BRK
;                BRK
;                BRK
;                JSR label160
;                LDA $64
;                LDY $65
;                RTS
;label244          JSR label112
;                JSR label153
;label275          JSR label136
;                LDA $66
;                BMI $B1CC
;label160          LDA $61
;                CMP #$90
;                BCC $B1CE
;                LDA #$A5
;                LDY #$B1
;                JSR label239
;branch308         BNE branch310
;branch309         JMP label167
;label243          LDA $0C
;                ORA $0E
;                PHA
;                LDA $0D
;                PHA
;                LDY #$00
;branch311         TYA
;                PHA
;                LDA $46
;                PHA
;                LDA $45
;                PHA
;                JSR label244
;                PLA
;                STA $45
;                PLA
;                STA $46
;                PLA
;                TAY
;                TSX
;                LDA $0102,X
;                PHA
;                LDA $0101,X
;                PHA
;                LDA $64
;                STA $0102,X
;                LDA $65
;                STA $0101,X
;                INY
;                JSR label127
;                CMP #$2C
;                BEQ branch311
;                STY $0B
;                JSR label245
;                PLA
;                STA $0D
;                PLA
;                STA $0E
;                AND #$7F
;                STA $0C
;                LDX $2F
;                LDA $30
;branch315         STX $5F
;                STA $60
;                CMP $32
;                BNE branch312
;                CPX $31
;                BEQ branch313
;branch312         LDY #$00
;                LDA ($5F),Y
;                INY
;                CMP $45
;                BNE branch314
;                LDA $46
;                CMP
;                SRE $16F0,X
;branch314         INY
;                LDA ($5F),Y
;                CLC
;                ADC $5F
;                TAX
;                INY
;                LDA ($5F),Y
;                ADC $60
;                BCC $B21C
;label249          LDX #$12
;                BIT $0EA2
;branch316         JMP label122
;                LDX #$13
;                LDA $0C
;                BNE branch316
;                JSR label246
;                LDA $0B
;                LDY #$04
;                CMP
;                SRE $E7D0,X
;                JMP label247
;branch313         JSR label246
;                JSR label101
;                LDY #$00
;                STY $72
;                LDX #$05
;                LDA $45
;                STA ($5F),Y
;                BPL branch317
;                DEX
;branch317         INY
;                LDA $46
;                STA ($5F),Y
;                BPL branch318
;                DEX
;                DEX
;branch318         STX $71
;                LDA $0B
;                INY
;                INY
;                INY
;                STA ($5F),Y
;branch320         LDX #$0B
;                LDA #$00
;                BIT $0C
;                BVC $B296
;                PLA
;                CLC
;                ADC #$01
;                TAX
;                PLA
;                ADC #$00
;branch319         INY
;                STA ($5F),Y
;                INY
;                TXA
;                STA ($5F),Y
;                JSR label248
;                STX $71
;                STA $72
;                LDY $22
;                DEC $0B
;                BNE branch320
;                ADC $59
;                BCS $B30B
;                STA $59
;                TAY
;                TXA
;                ADC $58
;                BCC $B2B9
;                INY
;                BEQ branch321
;branch322         JSR label101
;                STA $31
;                STY $32
;                LDA #$00
;                INC $72
;                LDY $71
;                BEQ branch323
;branch324         DEY
;                STA ($58),Y
;                BNE branch324
;branch323         DEC $59
;                DEC $72
;                BNE branch324
;                INC $59
;                SEC
;                LDA $31
;                SBC $5F
;                LDY #$02
;                STA ($5F),Y
;                LDA $32
;                INY
;                SBC $60
;                STA ($5F),Y
;                LDA $0C
;                BNE branch325
;                INY
;label247          LDA ($5F),Y
;                STA $0B
;                LDA #$00
;                STA $71
;branch328         STA $72
;                INY
;                PLA
;                TAX
;                STA $64
;                PLA
;                STA $65
;                CMP
;                SRE $0E90,X
;                BNE branch326
;                INY
;                TXA
;                CMP
;                SRE $0790,X
;branch326         JMP label249
;branch321         JMP label250
;                INY
;                LDA $72
;                ORA $71
;                CLC
;                BEQ branch327
;                JSR label248
;                TXA
;                ADC $64
;                TAX
;                TYA
;                LDY $22
;branch327         ADC $65
;                STX $71
;                DEC $0B
;                BNE branch328
;                STA $72
;                LDX #$05
;                LDA $45
;                BPL branch329
;                DEX
;branch329         LDA $46
;                BPL branch330
;                DEX
;                DEX
;branch330         STX $28
;                LDA #$00
;                JSR label251
;                TXA
;                ADC $58
;                STA $47
;                TYA
;                ADC $59
;                STA $48
;                TAY
;                LDA $47
;branch325         RTS
;label248          STY $22
;                LDA ($5F),Y
;                STA $28
;                DEY
;                LDA ($5F),Y
;label251          STA $29
;                LDA #$10
;                STA $5D
;                LDX #$00
;                LDY #$00
;branch332         TXA
;                ASL
;                TAX
;                TYA
;                ROL
;                TAY
;                BCS $B30B
;                ASL $71
;                ROL $72
;                BCC $B378
;                CLC
;                TXA
;                ADC $28
;                TAX
;                TYA
;                ADC $29
;                TAY
;                BCS $B30B
;branch331         DEC $5D
;                BNE branch332
;                RTS
;                LDA $0D
;                BEQ branch333
;                JSR label162
;branch333         JSR label102
;                SEC
;                LDA $33
;                SBC $31
;                TAY
;                LDA $34
;                SBC $32
;branch334         LDX #$00
;                STX $0D
;                STA $62
;                STY $63
;                LDX #$90
;                JMP label252
;                SEC
;                JSR label184
;label273          LDA #$00
;                BEQ branch334
;label190          LDX $3A
;                INX
;                BNE branch325
;                LDX #$15
;                BIT $1BA2
;                JMP label122
;                JSR label253
;                JSR label190
;                JSR label225
;                LDA #$80
;                STA $10
;                JSR label157
;                JSR label136
;                JSR label245
;                LDA #$B2
;                JSR label135
;                PHA
;                LDA $48
;                PHA
;                LDA $47
;                PHA
;                LDA $7B
;                PHA
;                LDA $7A
;                PHA
;                JSR label197
;                JMP label254
;label253          LDA #$A5
;                JSR label135
;                ORA #$80
;                STA $10
;                JSR label255
;                STA $4E
;                STY $4F
;                JMP label136
;label223          JSR label253
;                LDA $4F
;                PHA
;                LDA $4E
;                PHA
;                JSR label236
;                JSR label136
;                PLA
;                STA $4E
;                PLA
;                STA $4F
;                LDY #$02
;                LDA ($4E),Y
;                STA $47
;                TAX
;                INY
;                LDA ($4E),Y
;                BEQ branch335
;                STA $48
;                INY
;branch336         LDA ($47),Y
;                PHA
;                DEY
;                BPL branch336
;                LDY $48
;                JSR label256
;                LDA $7B
;                PHA
;                LDA $7A
;                PHA
;                LDA ($4E),Y
;                STA $7A
;                INY
;                LDA ($4E),Y
;                STA $7B
;                LDA $48
;                PHA
;                LDA $47
;                PHA
;                JSR label137
;                PLA
;                STA $4E
;                PLA
;                STA $4F
;                JSR label127
;                BEQ branch337
;                JMP label145
;branch337         PLA
;                STA $7A
;                PLA
;                STA $7B
;label254          LDY #$00
;                PLA
;                STA ($4E),Y
;                PLA
;                INY
;                STA ($4E),Y
;                PLA
;                INY
;                STA ($4E),Y
;                PLA
;                INY
;                STA ($4E),Y
;                PLA
;                INY
;                STA ($4E),Y
;                RTS
;                JSR label136
;                LDY #$00
;                JSR label257
;                PLA
;                PLA
;label230          LDA #$FF
;                LDY #$00
;                BEQ branch338
;label173          LDX $64
;                LDY $65
;                STX $50
;                STY $51
;label269          JSR label258
;                STX $62
;                STY $63
;                STA $61
;                RTS
;branch338         LDX #$22
;                STX $07
;                STX $08
;label200          STA $6F
;                STY $70
;                STA $62
;                STY $63
;                LDY #$FF
;branch341         INY
;                LDA ($6F),Y
;                BEQ branch339
;                CMP $07
;                BEQ branch340
;                CMP $08
;                BNE branch341
;branch340         CMP #$22
;                BEQ branch342
;branch339         CLC
;branch342         STY $61
;                TYA
;                ADC $6F
;                STA $71
;                LDX $70
;                BCC $B4B5
;                INX
;branch343         STX $72
;                LDA $70
;                BEQ branch344
;                CMP #$02
;                BNE branch345
;branch344         TYA
;                JSR label173
;                LDX $6F
;                LDY $70
;                JSR label259
;branch345         LDX $16
;                CPX #$22
;                BNE branch346
;                LDX #$19
;branch350         JMP label122
;branch346         LDA $61
;                STA $00,X
;                LDA $62
;                STA $01,X
;                LDA $63
;                STA $02,X
;                LDY #$00
;                STX $64
;                STY $65
;                STY $70
;                DEY
;                STY $0D
;                STX $17
;                INX
;                INX
;                INX
;                STX $16
;                RTS
;label258          LSR $0F
;branch351         PHA
;                EOR #$FF
;                SEC
;                ADC $33
;                LDY $34
;                BCS $B501
;                DEY
;branch347         CPY $32
;                BCC $B516
;                BNE branch349
;                CMP $31
;                BCC $B516
;branch349         STA $33
;                STY $34
;                STA $35
;                STY $36
;                TAX
;                PLA
;                RTS
;branch348         LDX #$10
;                LDA $0F
;                BMI $B4D2
;                JSR label102
;                LDA #$80
;                STA $0F
;                PLA
;                BNE branch351
;label102          LDX $37
;                LDA $38
;label264          STX $33
;                STA $34
;                LDY #$00
;                STY $4F
;                STY $4E
;                LDA $31
;                LDX $32
;                STA $5F
;                STX $60
;                LDA #$19
;                LDX #$00
;                STA $22
;                STX $23
;branch353         CMP $16
;                BEQ branch352
;                JSR label260
;                BEQ branch353
;branch352         LDA #$07
;                STA $53
;                LDA $2D
;                LDX $2E
;                STA $22
;                STX $23
;branch356         CPX $30
;                BNE branch354
;                CMP $2F
;                BEQ branch355
;branch354         JSR label261
;                BEQ branch356
;branch355         STA $58
;                STX $59
;                LDA #$03
;                STA $53
;branch358         LDA $58
;                LDX $59
;branch361         CPX $32
;                BNE branch357
;                CMP $31
;                BNE branch357
;                JMP label262
;branch357         STA $22
;                STX $23
;                LDY #$00
;                LDA ($22),Y
;                TAX
;                INY
;                LDA ($22),Y
;                PHP
;                INY
;                LDA ($22),Y
;                ADC $58
;                STA $58
;                INY
;                LDA ($22),Y
;                ADC $59
;                STA $59
;                PLP
;                BPL branch358
;                TXA
;                BMI $B56E
;                INY
;                LDA ($22),Y
;                LDY #$00
;                ASL
;                ADC #$05
;                ADC $22
;                STA $22
;                BCC $B5AE
;                INC $23
;branch359         LDX $23
;branch362         CPX $59
;                BNE branch360
;                CMP $58
;                BEQ branch361
;branch360         JSR label260
;                BEQ branch362
;label261          LDA ($22),Y
;                BMI $B5F6
;                INY
;                LDA ($22),Y
;                BPL branch363
;                INY
;label260          LDA ($22),Y
;                BEQ branch363
;                INY
;                LDA ($22),Y
;                TAX
;                INY
;                LDA ($22),Y
;                CMP $34
;                BCC $B5DC
;                BNE branch363
;                CPX $33
;                BCS $B5F6
;branch364         CMP $60
;                BCC $B5F6
;                BNE branch365
;                CPX $5F
;                BCC $B5F6
;branch365         STX $5F
;                STA $60
;                LDA $22
;                LDX $23
;                STA $4E
;                STX $4F
;                LDA $53
;                STA $55
;branch363         LDA $53
;                CLC
;                ADC $22
;                STA $22
;                BCC $B601
;                INC $23
;branch366         LDX $23
;                LDY #$00
;                RTS
;label262          LDA $4F
;                ORA $4E
;                BEQ branch366
;                LDA $55
;                AND #$04
;                LSR
;                TAY
;                STA $55
;                LDA ($4E),Y
;                ADC $5F
;                STA $5A
;                LDA $60
;                ADC #$00
;                STA $5B
;                LDA $33
;                LDX $34
;                STA $58
;                STX $59
;                JSR label263
;                LDY $55
;                INY
;                LDA $58
;                STA ($4E),Y
;                TAX
;                INC $59
;                LDA $59
;                INY
;                STA ($4E),Y
;                JMP label264
;label216          LDA $65
;                PHA
;                LDA $64
;                PHA
;                JSR label214
;                JSR label234
;                PLA
;                STA $6F
;                PLA
;                STA $70
;                LDY #$00
;                LDA ($6F),Y
;                CLC
;                ADC ($64,Y)
;                BCC $B65D
;                LDX #$17
;                JMP label122
;branch367         JSR label173
;                JSR label174
;                LDA $50
;                LDY $51
;                JSR label241
;                JSR label265
;                LDA $6F
;                LDY $70
;                JSR label241
;                JSR label266
;                JMP label267
;label174          LDY #$00
;                LDA ($6F),Y
;                PHA
;                INY
;                LDA ($6F),Y
;                TAX
;                INY
;                LDA ($6F),Y
;                TAY
;                PLA
;label259          STX $22
;                STY $23
;label265          TAY
;                BEQ branch368
;                PHA
;branch369         DEY
;                LDA ($22),Y
;                STA ($35),Y
;                TYA
;                BNE branch369
;                PLA
;branch368         CLC
;                ADC $35
;                STA $35
;branch374         BCC $B6A2
;                INC $36
;branch370         RTS
;label274          JSR label234
;label162          LDA $64
;                LDY $65
;label241          STA $22
;                STY $23
;                JSR label175
;                PHP
;                LDY #$00
;                LDA ($22),Y
;                PHA
;                INY
;                LDA ($22),Y
;                TAX
;                INY
;                LDA ($22),Y
;                TAY
;                PLA
;                PLP
;                BNE branch371
;                CPY $34
;                BNE branch371
;                CPX $33
;                BNE branch371
;                PHA
;                CLC
;                ADC $33
;                STA $33
;                BCC $B6D5
;                INC $34
;branch372         PLA
;branch371         STX $22
;                STY $23
;                RTS
;label175          CPY $18
;                BNE branch373
;                CMP $17
;                BNE branch373
;                STA $16
;                SBC #$03
;                STA $17
;                LDY #$00
;branch373         RTS
;                JSR label268
;                TXA
;                PHA
;                LDA #$01
;                JSR label269
;                PLA
;                LDY #$00
;                STA ($62),Y
;                PLA
;                PLA
;                JMP label266
;                JSR label270
;                CMP
;                BVC $B69E
;label271          BCC $B70C
;                LDA ($50),Y
;                TAX
;                TYA
;branch375         PHA
;branch379         TXA
;branch380         PHA
;                JSR label269
;                LDA $50
;                LDY $51
;                JSR label241
;                PLA
;                TAY
;                PLA
;                CLC
;                ADC $22
;                STA $22
;                BCC $B725
;                INC $23
;branch376         TYA
;                JSR label265
;                JMP label266
;                JSR label270
;                CLC
;                SBC ($50),Y
;                EOR #$FF
;                JMP label271
;                LDA #$FF
;                STA $65
;                JSR label127
;                CMP #$29
;                BEQ branch377
;                JSR label207
;                JSR label154
;branch377         JSR label270
;                BEQ branch378
;                DEX
;                TXA
;                PHA
;                CLC
;                LDX #$00
;                SBC ($50),Y
;                BCS $B70D
;                EOR #$FF
;                CMP $65
;                BCC $B70E
;                LDA $65
;                BCS $B70E
;label270          JSR label245
;                PLA
;                TAY
;                PLA
;                STA $55
;                PLA
;                PLA
;                PLA
;                TAX
;                PLA
;                STA $50
;                PLA
;                STA $51
;                LDA $55
;                PHA
;                TYA
;                PHA
;                LDY #$00
;                TXA
;                RTS
;                JSR label272
;                JMP label273
;label272          JSR label274
;                LDX #$00
;                STX $0D
;                TAY
;                RTS
;                JSR label272
;                BEQ branch378
;                LDY #$00
;                LDA ($22),Y
;                TAY
;                JMP label273
;branch378         JMP label170
;label185          JSR label112
;label154          JSR label137
;label268          JSR label275
;                LDX $64
;                BNE branch378
;                LDX $65
;                JMP label127
;                JSR label272
;                BNE branch381
;                JMP label276
;branch381         LDX $7A
;                LDY $7B
;                STX $71
;                STY $72
;                LDX $22
;                STX $7A
;                CLC
;                ADC $22
;                STA $24
;                LDX $23
;                STX $7B
;                BCC $B7CD
;                INX
;branch382         STX $25
;                LDY #$00
;                LDA ($24),Y
;                PHA
;                TYA
;                STA ($24),Y
;                JSR label127
;                JSR label204
;                PLA
;                LDY #$00
;                STA ($24),Y
;label201          LDX $71
;                LDY $72
;                STX $7A
;                STY $7B
;                RTS
;label278          JSR label137
;                JSR label277
;label279          JSR label207
;                JMP label154
;label277          LDA $66
;                BMI $B798
;                LDA $61
;                CMP #$91
;                BCS $B798
;                JSR label167
;                LDA $64
;                LDY $65
;                STY $14
;                STA $15
;                RTS
;                LDA $15
;                PHA
;                LDA $14
;                PHA
;                JSR label277
;                LDY #$00
;                LDA ($14),Y
;                TAY
;                PLA
;                STA $14
;                PLA
;                STA $15
;                JMP label273
;                JSR label278
;                TXA
;                LDY #$00
;                STA ($14),Y
;                RTS
;                JSR label278
;                STX $49
;                LDX #$00
;                JSR label127
;                BEQ branch383
;                JSR label279
;branch383         STX $4A
;                LDY #$00
;branch384         LDA ($14),Y
;                EOR $4A
;                AND $49
;                BEQ branch384
;branch387         RTS
;label315          LDA #$11
;                LDY #$BF
;                JMP label211
;label287          JSR label280
;                LDA $66
;                EOR #$FF
;                STA $66
;                EOR $6E
;                STA $6F
;                LDA $61
;                JMP label281
;branch390         JSR label282
;                BCC $B8A3
;label211          JSR label280
;label281          BNE branch386
;                JMP label238
;branch386         LDX $70
;                STX $56
;                LDX #$69
;                LDA $69
;label297          TAY
;                BEQ branch387
;                SEC
;                SBC $61
;                BEQ branch385
;                BCC $B893
;                STY $61
;                LDY $6E
;                STY $66
;                EOR #$FF
;                ADC #$00
;                LDY #$00
;                STY $56
;                LDX #$61
;                BNE branch389
;branch388         LDY #$00
;                STY $70
;branch389         CMP #$F9
;                BMI $B862
;                TAY
;                LDA $70
;                LSR $01,X
;                JSR label283
;branch385         BIT $6F
;                BPL branch391
;                LDY #$61
;                CPX #$69
;                BEQ branch392
;                LDY #$69
;branch392         SEC
;                EOR #$FF
;                ADC $56
;                STA $70
;                LDA $0004,Y
;                SBC $04,X
;                STA $65
;                LDA $0003,Y
;                SBC $03,X
;                STA $64
;                LDA $0002,Y
;                SBC $02,X
;                STA $63
;                LDA $0001,Y
;                SBC $01,X
;                STA $62
;label303          BCS $B8D7
;                JSR label284
;branch393         LDY #$00
;                TYA
;                CLC
;branch395         LDX $62
;                BNE branch394
;                LDX $63
;                STX $62
;                LDX $64
;                STX $63
;                LDX $65
;                STX $64
;                LDX $70
;                STX $65
;                STY $70
;                ADC #$08
;                CMP #$20
;                BNE branch395
;branch397         LDA #$00
;label316          STA $61
;label295          STA $66
;                RTS
;branch391         ADC $56
;                STA $70
;                LDA $65
;                ADC $6D
;                STA $65
;                LDA $64
;                ADC $6C
;                STA $64
;                LDA $63
;                ADC $6B
;                STA $63
;                LDA $62
;                ADC $6A
;                STA $62
;                JMP label285
;branch396         ADC #$01
;                ASL $70
;                ROL $65
;                ROL $64
;                ROL $63
;                ROL $62
;branch394         BPL branch396
;                SEC
;                SBC $61
;                BCS $B8F7
;                EOR #$FF
;                ADC #$01
;                STA $61
;label285          BCC $B946
;label302          INC $61
;                BEQ branch399
;                ROR $62
;                ROR $63
;                ROR $64
;                ROR $65
;                ROR $70
;branch398         RTS
;label284          LDA $66
;                EOR #$FF
;                STA $66
;label305          LDA $62
;                EOR #$FF
;                STA $62
;                LDA $63
;                EOR #$FF
;                STA $63
;                LDA $64
;                EOR #$FF
;                STA $64
;                LDA $65
;                EOR #$FF
;                STA $65
;                LDA $70
;                EOR #$FF
;                STA $70
;                INC $70
;                BNE branch400
;label301          INC $65
;                BNE branch400
;                INC $64
;                BNE branch400
;                INC $63
;                BNE branch400
;                INC $62
;branch400         RTS
;branch399         LDX #$0F
;                JMP label122
;label294          LDX #$25
;branch401         LDY $04,X
;                STY $70
;                LDY $03,X
;                STY $04,X
;                LDY $02,X
;                STY $03,X
;                LDY $01,X
;                STY $02,X
;                LDY $68
;                STY $01,X
;label282          ADC #$08
;                BMI $B985
;                BEQ branch401
;                SBC #$08
;                TAY
;                LDA $70
;                BCS $B9BA
;branch404         ASL $01,X
;                BCC $B9AC
;                INC $01,X
;branch403         ROR $01,X
;                ROR $01,X
;label283          ROR $02,X
;                ROR $03,X
;                ROR $04,X
;                ROR
;                INY
;                BNE branch404
;branch402         CLC
;                RTS
;                STA ($00,X)
;                BRK
;                BRK
;                BRK
;                SLO ($7F,X)
;                LSR $CB56,X
;                ADC $1380,Y
;                SHS $640B,Y
;                NOP #$76
;                SEC
;                SHA ($16),Y
;                NOP #$38
;                TAX
;                RLA $8020,Y
;                AND $04,X
;                ISB ($34),Y
;                STA ($35,X)
;                NOP $F3
;                NOP $80,X
;                NOP #$00
;                BRK
;                BRK
;                NOP #$31
;                JAM
;                SLO $F8,X
;label319          JSR label140
;                BEQ branch405
;                BPL branch406
;branch405         JMP label170
;branch406         LDA $61
;                SBC #$7F
;                PHA
;                LDA #$80
;                STA $61
;                LDA #$D6
;                LDY #$B9
;                JSR label211
;                LDA #$DB
;                LDY #$B9
;                JSR label286
;                LDA #$BC
;                LDY #$B9
;                JSR label287
;                LDA #$C1
;                LDY #$B9
;                JSR label288
;                LDA #$E0
;                LDY #$B9
;                JSR label211
;                PLA
;                JSR label171
;                LDA #$E5
;                LDY #$B9
;label314          JSR label280
;                BNE branch407
;                JMP label289
;branch407         JSR label290
;                LDA #$00
;                STA $26
;                STA $27
;                STA $28
;                STA $29
;                LDA $70
;                JSR label291
;                LDA $65
;                JSR label291
;                LDA $64
;                JSR label291
;                LDA $63
;                JSR label291
;                LDA $62
;                JSR label292
;                JMP label293
;label291          BNE branch408
;                JMP label294
;branch408         LSR
;                ORA #$80
;branch410         TAY
;                BCC $BA7D
;                CLC
;                LDA $29
;                ADC $6D
;                STA $29
;                LDA $28
;                ADC $6C
;                STA $28
;                LDA $27
;                ADC $6B
;                STA $27
;                LDA $26
;                ADC $6A
;                STA $26
;branch409         ROR $26
;                ROR $27
;                ROR $28
;                ROR $29
;                ROR $70
;                TYA
;                LSR
;                BNE branch410
;label289          RTS
;label280          STA $22
;                STY $23
;                LDY #$04
;                LDA ($22),Y
;                STA $6D
;                DEY
;                LDA ($22),Y
;                STA $6C
;                DEY
;                LDA ($22),Y
;                STA $6B
;                DEY
;                LDA ($22),Y
;                STA $6E
;                EOR $66
;                STA $6F
;                LDA $6E
;                ORA #$80
;                STA $6A
;                DEY
;                LDA ($22),Y
;                STA $69
;                LDA $61
;                RTS
;label290          LDA $69
;                BEQ branch411
;                CLC
;                ADC $61
;                BCC $BAC4
;                BMI $BADF
;                CLC
;                BIT $1410
;                ADC #$80
;                STA $61
;                BNE branch414
;                JMP label295
;branch414         LDA $6F
;                STA $66
;                RTS
;                LDA $66
;                EOR #$FF
;                BMI $BADF
;branch411         PLA
;                PLA
;                JMP label276
;branch413         JMP label296
;label164          JSR label165
;                TAX
;                BEQ branch415
;                CLC
;                ADC #$02
;                BCS $BADF
;label166          LDX #$00
;                STX $6F
;                JSR label297
;                INC $61
;                BEQ branch413
;branch415         RTS
;                STY $20
;                BRK
;                BRK
;                BRK
;label307          JSR label165
;                LDA #$F9
;                LDY #$BA
;                LDX #$00
;                STX $6F
;                JSR label139
;                JMP label298
;label286          JSR label280
;label298          BEQ branch416
;                JSR label159
;                LDA #$00
;                SEC
;                SBC $61
;                STA $61
;                JSR label290
;                INC $61
;                BEQ branch413
;                LDX #$FC
;                LDA #$01
;branch422         LDY $6A
;                CPY $62
;                BNE branch417
;                LDY $6B
;                CPY $63
;                BNE branch417
;                LDY $6C
;                CPY $64
;                BNE branch417
;                LDY $6D
;                CPY $65
;branch417         PHP
;                ROL
;                BCC $BB4C
;                INX
;                STA $29,X
;                BEQ branch419
;                BPL branch420
;                LDA #$01
;branch418         PLP
;                BCS $BB5D
;label299          ASL $6D
;                ROL $6C
;                ROL $6B
;                ROL $6A
;                BCS $BB3F
;                BMI $BB29
;                BPL branch417
;branch421         TAY
;                LDA $6D
;                SBC $65
;                STA $6D
;                LDA $6C
;                SBC $64
;                STA $6C
;                LDA $6B
;                SBC $63
;                STA $6B
;                LDA $6A
;                SBC $62
;                STA $6A
;                TYA
;                JMP label299
;branch419         LDA #$40
;                BNE branch418
;branch420         ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                ASL
;                STA $70
;                PLP
;                JMP label293
;branch416         LDX #$14
;                JMP label122
;label293          LDA $26
;                STA $62
;                LDA $27
;                STA $63
;                LDA $28
;                STA $64
;                LDA $29
;                STA $65
;                JMP label300
;label139          STA $22
;                STY $23
;                LDY #$04
;                LDA ($22),Y
;                STA $65
;                DEY
;                LDA ($22),Y
;                STA $64
;                DEY
;                LDA ($22),Y
;                STA $63
;                DEY
;                LDA ($22),Y
;                STA $66
;                ORA #$80
;                STA $62
;                DEY
;                LDA ($22),Y
;                STA $61
;                STY $70
;                RTS
;                LDX #$5C
;                BIT $57A2
;                LDY #$00
;                BEQ branch423
;label161          LDX $49
;                LDY $4A
;branch423         JSR label159
;                STX $22
;                STY $23
;                LDY #$04
;                LDA $65
;                STA ($22),Y
;                DEY
;                LDA $64
;                STA ($22),Y
;                DEY
;                LDA $63
;                STA ($22),Y
;                DEY
;                LDA $66
;                ORA #$7F
;                AND $62
;                STA ($22),Y
;                DEY
;                LDA $61
;                STA ($22),Y
;                STY $70
;                RTS
;label238          LDA $6E
;label318          STA $66
;                LDX #$05
;branch424         LDA $68,X
;                STA $60,X
;                DEX
;                BNE branch424
;                STX $70
;                RTS
;label165          JSR label159
;                LDX #$06
;branch425         LDA $60,X
;                STA $68,X
;                DEX
;                BNE branch425
;                STX $70
;branch426         RTS
;label159          LDA $61
;                BEQ branch426
;                ASL $70
;                BCC $BC1A
;label321          JSR label301
;                BNE branch426
;                JMP label302
;branch428         LDA $61
;                BEQ branch427
;branch429         LDA $66
;label304          ROL
;                LDA #$FF
;                BCS $BC38
;                LDA #$01
;branch427         RTS
;                JSR label140
;label233          STA $62
;                LDA #$00
;                STA $63
;                LDX #$88
;label252          LDA $62
;                EOR #$FF
;                ROL
;label312          LDA #$00
;                STA $65
;                STA $64
;label231          STX $61
;                STA $70
;                STA $66
;                JMP label303
;                LSR $66
;                RTS
;label239          STA $24
;label212          STY $25
;                LDY #$00
;                LDA ($24),Y
;                INY
;                TAX
;                BEQ branch428
;                LDA ($24),Y
;                EOR $66
;                BMI $BC2F
;                CPX $61
;                BNE branch430
;                LDA ($24),Y
;                ORA #$80
;                CMP $62
;                BNE branch430
;                INY
;                LDA ($24),Y
;                CMP $63
;                BNE branch430
;                INY
;                LDA ($24),Y
;                CMP $64
;                BNE branch430
;                INY
;                LDA #$7F
;                CMP $70
;                LDA ($24),Y
;                SBC $65
;                BEQ branch431
;branch430         LDA $66
;                BCC $BC98
;                EOR #$FF
;branch432         JMP label304
;label167          LDA $61
;                BEQ branch433
;                SEC
;                SBC #$A0
;                BIT $66
;                BPL branch434
;                TAX
;                LDA #$FF
;                STA $68
;                JSR label305
;                TXA
;branch434         LDX #$61
;                CMP #$F9
;                BPL branch435
;                JSR label282
;                STY $68
;branch431         RTS
;branch435         TAY
;                LDA $66
;                AND #$80
;                LSR $62
;                ORA $62
;                STA $62
;                JSR label283
;                STY $68
;                RTS
;label317          LDA $61
;                CMP #$A0
;                BCS $BCF2
;                JSR label167
;                STY $70
;                LDA $66
;                STY $66
;                EOR #$80
;                ROL
;                LDA #$A0
;                STA $61
;                LDA $65
;                STA $07
;                JMP label303
;branch433         STA $62
;                STA $63
;                STA $64
;                STA $65
;                TAY
;branch436         RTS
;label204          LDY #$00
;                LDX #$0A
;branch437         STY $5D,X
;                DEX
;                BPL branch437
;                BCC $BD0D
;                CMP #$2D
;                BNE branch439
;                STX $67
;                BEQ branch440
;branch439         CMP #$2B
;                BNE branch441
;branch440         JSR label112
;branch438         BCC $BD6A
;branch441         CMP #$2E
;                BEQ branch443
;                CMP #$45
;                BNE branch444
;                JSR label112
;                BCC $BD33
;                CMP #$AB
;                BEQ branch446
;                CMP #$2D
;                BEQ branch446
;                CMP #$AA
;                BEQ branch447
;                CMP #$2B
;                BEQ branch447
;                BNE branch448
;branch446         ROR $60
;branch447         JSR label112
;branch445         BCC $BD91
;branch448         BIT $60
;                BPL branch444
;                LDA #$00
;                SEC
;                SBC $5E
;                JMP label306
;branch443         ROR $5F
;                BIT $5F
;                BVC $BD0A
;branch444         LDA $5E
;label306          SEC
;                SBC $5D
;                STA $5E
;                BEQ branch450
;                BPL branch451
;branch452         JSR label307
;                INC $5E
;                BNE branch452
;                BEQ branch450
;branch451         JSR label164
;                DEC $5E
;                BNE branch451
;branch450         LDA $67
;                BMI $BD67
;                RTS
;branch453         JMP label308
;branch442         PHA
;                BIT $5F
;                BPL branch454
;                INC $5D
;branch454         JSR label164
;                PLA
;                SEC
;                SBC #$30
;                JSR label171
;                JMP label309
;label171          PHA
;                JSR label165
;                PLA
;                JSR label233
;                LDA $6E
;                EOR $66
;                STA $6F
;                LDX $61
;                JMP label281
;branch449         LDA $5E
;                CMP #$0A
;                BCC $BDA0
;                LDA #$64
;                BIT $60
;                BMI $BDAE
;                JMP label296
;branch455         ASL
;                ASL
;                CLC
;                ADC $5E
;                ASL
;                CLC
;                LDY #$00
;                ADC ($7A,Y)
;                SEC
;                SBC #$30
;branch456         STA $5E
;                JMP label310
;                SHS $BC3E,Y
;                SLO 9EFD,X
;                ROR $276B
;                SBC $6E9E,X
;                ARR #$28
;                BRK
;label109          LDA #$71
;                LDY #$A3
;                JSR label311
;                LDA $3A
;                LDX $39
;label129          STA $62
;                STX $63
;                LDX #$90
;                SEC
;                JSR label312
;                JSR label257
;label311          JMP label108
;label181          LDY #$01
;label257          LDA #$20
;                BIT $66
;                BPL branch457
;                LDA #$2D
;branch457         STA $00FF,Y
;                STA $66
;                STY $71
;                INY
;                LDA #$30
;                LDX $61
;                BNE branch458
;                JMP label313
;branch458         LDA #$00
;                CPX #$80
;                BEQ branch459
;                BCS $BE09
;branch459         LDA #$BD
;                LDY #$BD
;                JSR label314
;                LDA #$F7
;branch460         STA $5D
;branch466         LDA #$B8
;                LDY #$BD
;                JSR label239
;                BEQ branch461
;                BPL branch462
;branch465         LDA #$B3
;                LDY #$BD
;                JSR label239
;                BEQ branch463
;                BPL branch464
;branch463         JSR label164
;                DEC $5D
;                BNE branch465
;branch462         JSR label307
;                INC $5D
;                BNE branch466
;branch464         JSR label315
;branch461         JSR label167
;                LDX #$01
;                LDA $5D
;                CLC
;                ADC #$0A
;                BMI $BE47
;                CMP #$0B
;                BCS $BE48
;                ADC #$FF
;                TAX
;                LDA #$02
;branch467         SEC
;branch468         SBC #$02
;                STA $5E
;                STX $5D
;                TXA
;                BEQ branch469
;                BPL branch470
;branch469         LDY $71
;                LDA #$2E
;                INY
;                STA $00FF,Y
;                TXA
;                BEQ branch471
;                LDA #$30
;                INY
;                STA $00FF,Y
;branch471         STY $71
;branch470         LDY #$00
;label229          LDX #$80
;branch473         LDA $65
;                CLC
;                ADC $BF19,Y
;                STA $65
;                LDA $64
;                ADC $BF18,Y
;                STA $64
;                LDA $63
;                ADC $BF17,Y
;                STA $63
;                LDA $62
;                ADC $BF16,Y
;                STA $62
;                INX
;                BCS $BE8E
;                BPL branch473
;                BMI $BE90
;branch472         BMI $BE6A
;branch474         TXA
;                BCC $BE97
;                EOR #$FF
;                ADC #$0A
;branch475         ADC #$2F
;                INY
;                INY
;                INY
;                INY
;                STY $47
;                LDY $71
;                INY
;                TAX
;                AND #$7F
;                STA $00FF,Y
;                DEC $5D
;                BNE branch476
;                LDA #$2E
;                INY
;                STA $00FF,Y
;branch476         STY $71
;                LDY $47
;                TXA
;                EOR #$FF
;                AND #$80
;                TAX
;                CPY #$24
;                BEQ branch477
;                CPY #$3C
;                BNE branch473
;branch477         LDY $71
;branch478         LDA $00FF,Y
;                DEY
;                CMP #$30
;                BEQ branch478
;                CMP #$2E
;                BEQ branch479
;                INY
;branch479         LDA #$2B
;                LDX $5E
;                BEQ branch480
;                BPL branch481
;                LDA #$00
;                SEC
;                SBC $5E
;                TAX
;                LDA #$2D
;branch481         STA $0101,Y
;                LDA #$45
;                STA $0100,Y
;                TXA
;                LDX #$2F
;                SEC
;branch482         INX
;                SBC #$0A
;                BCS $BEEF
;                ADC #$3A
;                STA $0103,Y
;                TXA
;                STA $0102,Y
;                LDA #$00
;                STA $0104,Y
;                BEQ branch483
;label313          STA $00FF,Y
;branch480         LDA #$00
;                STA $0100,Y
;branch483         LDA #$00
;                LDY #$01
;                RTS
;                NOP #$00
;                BRK
;                BRK
;                BRK
;                NOP
;                ASL
;                SLO 0000,X
;                TYA
;                STX $80,Y
;                ISB $BDF0,X
;                CPY #$00
;                ORA ($86,X)
;                LDY #$FF
;                ISB $F0D8,X
;                BRK
;                BRK
;                SLO ($E8,X)
;                ISB $FFFF,X
;                SHY $0000,X
;                BRK
;                ASL
;                ISB $FFFF,X
;                ISB $DFFF,X
;                ASL
;                NOP #$00
;                SLO ($4B,X)
;                CPY #$FF
;                ISB $6073,X
;                BRK
;                BRK
;                ASL $FF10
;                ISB $A8FD,X
;                BRK
;                BRK
;                BRK
;                NOP $AAEC,X
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;branch488         TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                TAX
;                JSR label165
;                LDA #$11
;                LDY #$BF
;                JSR label139
;                BEQ branch484
;                LDA $69
;                BNE branch485
;                JMP label316
;branch485         LDX #$4E
;                LDY #$00
;                JSR label256
;                LDA $6E
;                BPL branch486
;                JSR label317
;                LDA #$4E
;                LDY #$00
;                JSR label239
;                BNE branch486
;                TYA
;                LDY $07
;branch486         JSR label318
;                TYA
;                PHA
;                JSR label319
;                LDA #$4E
;                LDY #$00
;                JSR label314
;                JSR label320
;                PLA
;                LSR
;                BCC $BFBE
;label308          LDA $61
;                BEQ branch487
;                LDA $66
;                EOR #$FF
;                STA $66
;branch487         RTS
;                STA ($38,X)
;                TAX
;                RLA $0729,Y
;                ADC ($34,Y)
;                CLI
;                ROL $7456,X
;                ASL $7E,X
;                LAX ($1B),Y
;                RRA $2F,X
;                INC $85E3
;                NOP
;                ORA $1C84,X
;                ROL
;                NOP $5963,X
;                CLI
;                ASL
;                ROR $FD75,X
;                ISB $C6
;                NOP #$31
;                JAM
;                CLC
;                BPL branch488
;                BRK
;                BRK
;                BRK
;                BRK
;branch484         LDA #$BF
;                LDY #$BF
;                JSR label314
;                LDA $70
;                ADC #$50
;                BCC $BFFD
;                JSR label321
;branch489         JMP label322
;                JMP label323
;                JMP label324
;                JMP label325
;                JMP label326
;                JMP label327
;                ORA ($70,X)
;                BRK
;label323          SEI
;                LDA #$C0
;                STA $0315
;                LDA #$1F
;                STA $0314
;                CLI
;                RTS
;                SEI
;                LDA $01
;                STA $02C5
;                LDA #$36
;                STA $01
;                JSR label5
;                LDA $02C5
;                STA $01
;                JMP label328
;label348          LDA $CD82
;                BEQ branch490
;                LDX #$00
;                LDY #$00
;                STA $CD90
;                LDA $CD85
;                STA $CD88
;                LDA $CD8D
;                STA $CD89
;                LDA $CD8A
;                STA $CD91
;                JSR label329
;branch490         LDA $CD83
;                BEQ branch491
;                LDX #$07
;                LDY #$01
;                STA $CD90
;                LDA $CD86
;                STA $CD88
;                LDA $CD8E
;                STA $CD89
;                LDA $CD8B
;                STA $CD91
;                JSR label329
;branch491         LDA $CD84
;                BEQ branch492
;                LDX #$0E
;                LDY #$02
;                STA $CD90
;                LDA $CD87
;                STA $CD88
;                LDA $CD8F
;                STA $CD89
;                LDA $CD8C
;                STA $CD91
;                JSR label329
;branch492         RTS
;label329          LDA $CDB7,Y
;                STA $02C7
;                BEQ branch493
;                AND #$01
;                BNE branch494
;                LDA $02C7
;                AND #$02
;                BEQ branch493
;                JMP label330
;branch493         LDA $CDF5,X
;                CMP $CE0E,X
;                BEQ branch495
;                BCC $C0C7
;                BCS $C0CA
;branch495         LDA $CDF4,X
;                CMP $CE0D,X
;                BEQ branch498
;                BCC $C0C7
;                JMP label331
;branch496         JMP label332
;branch497         SEC
;                LDA $CDF4,X
;                SBC $CE0D,X
;                STA $02C7
;                LDA $CDF5,X
;                SBC $CE0E,X
;                STA $02C8
;                JMP label333
;branch494         LDA #$02
;                STA $CE0D,X
;                LDA $CD88
;                STA $CE0E,X
;                LDA $02C7
;                AND #$04
;                BNE branch493
;                LDA $CDF5,X
;                CMP $CD88
;                BCS $C100
;                LDA $CD89
;                STA $CDF5,X
;branch499         SEC
;                LDA $CDF4,X
;                SBC $CD90
;                STA $CDF4,X
;                STA $D400,X
;                LDA $CDF5,X
;                SBC $CD91
;                STA $CDF5,X
;                STA $D401,X
;branch498         RTS
;label333          LDA $02C8
;                CMP $CD91
;                BCC $C12C
;                BNE branch499
;                LDA $02C7
;                CMP $CD90
;                BCS $C100
;branch500         LDA $CE0D,X
;                STA $CDF4,X
;                STA $D400,X
;                LDA $CE0E,X
;                STA $CDF5,X
;                STA $D401,X
;label336          LDA #$00
;                STA $CD82,Y
;                RTS
;label332          SEC
;                LDA $CE0D,X
;                SBC $CDF4,X
;                STA $02C7
;                LDA $CE0E,X
;                SBC $CDF5,X
;                STA $02C8
;                JMP label334
;label330          LDA #$FE
;                STA $CE0D,X
;                LDA $CD88
;                STA $CE0E,X
;                LDA $02C7
;                AND #$04
;                BEQ branch501
;                JMP label335
;branch501         LDA $CDF5,X
;                CMP $CD88
;                BCC $C17D
;                LDA $CD89
;                STA $CDF5,X
;branch502         CLC
;                LDA $CDF4,X
;                ADC $CD90
;                STA $CDF4,X
;                STA $D400,X
;                LDA $CDF5,X
;                ADC $CD91
;                STA $CDF5,X
;                STA $D401,X
;                RTS
;label334          LDA $02C8
;                CMP $CD91
;                BCC $C1A9
;                BNE branch502
;                LDA $02C7
;                CMP $CD90
;                BCS $C17D
;branch503         LDA $CE0D,X
;                STA $CDF4,X
;                STA $D400,X
;                LDA $CE0E,X
;                STA $CDF5,X
;                STA $D401,X
;                JMP label336
;label349          LDA $CD95
;                BEQ branch504
;                LDY #$00
;                LDX #$00
;                JSR label337
;branch504         LDA $CD96
;                BEQ branch505
;                LDY #$07
;                LDX #$01
;                JSR label337
;branch505         LDA $CD97
;                BEQ branch506
;                LDY #$0E
;                LDX #$02
;                JSR label337
;branch506         RTS
;label337          LDA $CD92,X
;                CMP #$FF
;                BEQ branch507
;                DEC $CD92,X
;                LDA $CD92,X
;                CMP #$FF
;                BNE branch506
;                LDA $CD95,X
;                AND #$FE
;                STA $CD95,X
;                AND #$80
;                STA $02C7
;                LDA $CD95,X
;                AND #$7F
;                LSR
;                ORA $02C7
;                STA $CD9B,X
;                RTS
;branch507         LDA $CD9B,X
;                BPL branch508
;                CLC
;                LDA $CDF4,Y
;                ADC $CD98,X
;                STA $CDF4,Y
;                STA $D400,Y
;                LDA $CDF5,Y
;                ADC #$00
;                STA $CDF5,Y
;                STA $D401,Y
;                DEC $CD9B,X
;                BMI $C25E
;                LDA $CD95,X
;                AND #$7F
;                STA $CD9B,X
;                RTS
;branch508         SEC
;                LDA $CDF4,Y
;                SBC $CD98,X
;                STA $CDF4,Y
;                STA $D400,Y
;                LDA $CDF5,Y
;                SBC #$00
;                STA $CDF5,Y
;                STA $D401,Y
;                DEC $CD9B,X
;                BPL branch509
;                LDA $CD95,X
;                ORA #$80
;                STA $CD9B,X
;branch509         RTS
;label350          LDA $CD9E
;                BNE branch510
;                LDA $CD9F
;                BNE branch511
;                LDA $CDED
;                AND #$10
;                BEQ branch512
;                LDA $CC45
;                STA $CD9E
;                LDA $CC46
;                STA $CD9F
;                JMP label338
;branch512         LDA $CDED
;                AND #$20
;                BEQ branch509
;                JMP label339
;branch510         DEC $CD9E
;                LDA $CDA0
;                AND #$F0
;                STA $02C7
;                CLC
;                LDA $CE09
;                ADC $02C7
;                STA $CE09
;                LDA $CE0A
;                ADC $CDA1
;                STA $CE0A
;branch514         LDA $CE09
;                STA $D415
;                LDA $CE0A
;                STA $D416
;                RTS
;branch511         DEC $CD9F
;                LDA $CE0A
;                CMP $CDA1
;                BCC $C2E1
;                BEQ branch513
;label341          LDA $CDA0
;                ASL
;                ASL
;                ASL
;                ASL
;                STA $02C7
;                SEC
;                LDA $CE09
;                SBC $02C7
;                STA $CE09
;                LDA $CE0A
;                SBC $CDA1
;                STA $CE0A
;                JMP label340
;branch513         LDA $CDED
;                AND #$40
;                BEQ branch514
;                JMP label341
;label339          LDA $CC44
;                STA $CE0A
;                STA $D416
;                LDA $CC45
;                STA $CD9E
;                LDA $CC46
;                STA $CD9F
;                LDA $CC47
;                STA $CDA0
;                LDA $CC48
;                STA $CDA1
;                LDA $CC49
;                STA $CDED
;                LDA #$00
;                STA $CE09
;                STA $D415
;                RTS
;label351          LDA $CDA8
;                BEQ branch515
;                LDX #$00
;                LDY #$02
;                JSR label342
;branch515         LDA $CDA9
;                BEQ branch516
;                LDX #$01
;                LDY #$09
;                JSR label342
;branch516         LDA $CDAA
;                BEQ branch517
;                LDX #$02
;                LDY #$10
;                JSR label342
;branch517         LDA $CDA8
;                BNE branch518
;                LDX #$00
;                LDY #$02
;                JSR label343
;branch518         LDA $CDA9
;                BNE branch519
;                LDX #$01
;                LDY #$09
;                JSR label343
;branch519         LDA $CDAA
;                BNE branch520
;                LDX #$02
;                LDY #$10
;                JSR label343
;branch520         RTS
;label342          CLC
;                LDA $CDF4,Y
;                ADC $CDAE,X
;                STA $CDF4,Y
;                STA $D400,Y
;                LDA $CDF5,Y
;                ADC #$00
;                STA $CDF5,Y
;                STA $D401,Y
;                DEC $CDA8,X
;                RTS
;label343          LDA $CDAB,X
;                BNE branch521
;                LDA $CDB7,X
;                AND #$10
;                BEQ branch522
;                LDA $CDA2,X
;                STA $CDA8,X
;                LDA $CDA5,X
;                STA $CDAB,X
;                JMP label344
;branch521         SEC
;                LDA $CDF4,Y
;                SBC $CDAE,X
;                STA $CDF4,Y
;                STA $D400,Y
;                LDA $CDF5,Y
;                SBC #$00
;                STA $CDF5,Y
;                STA $D401,Y
;                DEC $CDAB,X
;branch522         RTS
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($01,X)
;                ORA ($02,X)
;                JAM
;                JAM
;                JAM
;                JAM
;                JAM
;                JAM
;                SLO ($03,X)
;                SLO ($03,X)
;                SLO ($04,X)
;                NOP $04
;                NOP $05
;                ORA $05
;                ASL $06
;                ASL $07
;                SLO $08
;                PHP
;                ORA #$09
;                ASL
;                ASL
;                ANC #$0C
;                ORA $0E0D
;                SLO $1110
;                JAM
;                SLO ($14),Y
;                ORA $17,X
;                CLC
;                NOP
;                SLO $1F1D,Y
;                JSR label345
;                RLA 29
;                ANC #$2E
;                AND ($34),Y
;                RLA $3A,X
;                ROL $4541,X
;                EOR #$4E
;                JAM
;                SRE $5C,X
;                JAM
;                PLA
;                ROR $7C75
;                SAX ($8B,X)
;                SHA ($9C),Y
;                LDA $AF
;                LDA $D0C4,Y
;                CMP $F8EA,X
;                ASL $27,X
;                AND $5F4B,Y
;                NOP $8A,X
;                LDA ($BA,X)
;                NOP $F0,X
;                ASL $4E2D
;                ADC ($96,Y)
;                LDX $14E7,Y
;                JAM
;                NOP $A9,X
;                CPX #$1B
;                NOP
;                SHY $2DE2,X
;                RRA $27CF,Y
;                STA $E8
;                EOR ($C1),Y
;                RLA $B4,X
;                SEC
;                CPY $59
;                ISB $9E,X
;                LSR $D00A
;                LDX #$81
;                ADC $7067
;                NOP #$B2
;                SBC $9D3B
;                NOP $A0,X
;                EOR $03
;                DCP $E1CF,Y
;                JAM
;                ADC $DB
;                ROR $3A,X
;                RLA 41
;                TXA
;                ORA $B5
;                STA $24C1,X
;                CMP #$B6
;                SBC $4E73
;                NOP #$14
;                ASL
;                ROR
;                RLA $4882,Y
;                SHA ($6B),Y
;                NOP
;                ISB $9C
;                NOP $28
;                NOP $20,X
;                SLO $CA,X
;                LDA $C00F
;                BEQ branch523
;                JSR label346
;branch523         LDX $02C3
;                BNE branch524
;                LDA $02C2
;                BEQ branch525
;                LDA #$00
;                STA $D404
;                STA $D40B
;                STA $D412
;                STA $D417
;                STA $02C2
;                LDA #$0F
;                STA $D418
;                LDA #$07
;                STA $CD80
;                JMP label347
;branch524         JSR label348
;                JSR label349
;                JSR label350
;                JSR label351
;                JSR label352
;                LDA #$01
;                STA $02C2
;                LDA $CD80
;                BEQ branch526
;                DEC $CD80
;                JMP label353
;branch526         LDA $CD81
;                STA $CD80
;                INC $02C0
;                LDA $02C0
;                CMP $CDB5
;                BCC $C4DF
;                JSR label354
;                CMP #$01
;                BEQ branch525
;branch527         JSR label355
;                JSR label356
;                JSR label357
;label353          JSR label358
;branch525         JSR label327
;                RTS
;label355          LDA $02C6
;                AND #$01
;                BEQ branch528
;                RTS
;branch528         LDA $02C0
;                ASL
;                TAY
;                LDA ($A5),Y
;                INY
;                JMP label359
;branch529         JMP label360
;label359          STA $02C7
;                LDA ($A5),Y
;                STA $02C8
;label324          LDA $02C7
;                BEQ branch529
;                CMP #$80
;                BNE branch530
;                JMP label361
;branch530         LDA #$00
;                LDY #$0F
;                LDX $02C8
;                JSR label362
;                LDA $CC09
;                STA $CDD2
;                LDA $02C7
;                AND #$7F
;                TAX
;                LDA $02C8
;                AND #$20
;                BNE branch531
;                TXA
;                CLC
;                ADC $02D2
;                TAX
;branch531         STX $CDC5
;                CLC
;                LDA $C416,X
;                ADC $CDD2
;                TAY
;                LDA $C3B7,X
;                ADC #$00
;                TAX
;                LDA $CC04
;                BEQ branch532
;                LDA $02C8
;                AND #$10
;                BNE branch533
;branch532         STY $CDF4
;                STX $CDF5
;branch533         STY $CE0D
;                STX $CE0E
;                STX $CD8D
;                LDA $02C7
;                AND #$80
;                BNE branch534
;                JMP label363
;branch534         LDA #$00
;                STA $CDCB
;                LDA $02C8
;                AND #$40
;                BEQ branch535
;                LDA $02CC
;                LDX #$00
;                JSR label364
;                JSR label352
;branch535         LDA $CC03
;                STA $CDB7
;                AND #$20
;                TAX
;                LDA $CBFE
;                ASL
;                ASL
;                ASL
;                ASL
;                STA $CDF6
;                STA $D402
;                LDA $CBFE
;                LSR
;                LSR
;                LSR
;                LSR
;                STA $CDF7
;                STA $D403
;                LDA $CBFF
;                STA $CDA2
;                CPX #$20
;                BNE branch536
;                LDA #$00
;branch536         STA $CDA8
;                LDA $CC00
;                STA $CDAB
;                STA $CDA5
;                LDA $CC04
;                STA $CD82
;                LDA $CC05
;                STA $CD8A
;                LDA $CBFD
;                STA $CD85
;                LDA $CC06
;                STA $CD98
;                LDA $CC07
;                STA $CD95
;                LDA $CC08
;                STA $CD92
;                LDA $CC01
;                STA $CDAE
;                LDA $CDD6
;                AND #$FE
;                STA $D404
;                LDA $CBFB
;                STA $D405
;                LDA $CBFC
;                STA $D406
;                LDA $CDF4
;                STA $D400
;                LDA $CDF5
;                STA $D401
;                LDA $CC49
;                AND #$01
;                BEQ branch537
;                JSR label339
;branch537         LDA $CBFA
;                STA $D404
;                STA $CDD6
;                JSR label365
;                JMP label361
;label363          LDA $CDF4
;                STA $D400
;                LDA $CDF5
;                STA $D401
;label360          LDA $CC02
;                STA $D404
;                STA $CDD6
;label361          LDA $02C7
;                STA $02C9
;                LDA $02C8
;                STA $02CC
;                RTS
;label356          LDA $02C6
;                AND #$02
;                BEQ branch538
;                RTS
;branch538         LDA $02C0
;                ASL
;                TAY
;                LDA ($A7),Y
;                INY
;                JMP label366
;branch539         JMP label367
;label366          STA $02C7
;                LDA ($A7),Y
;                STA $02C8
;label325          LDA $02C7
;                BEQ branch539
;                CMP #$80
;                BNE branch540
;                JMP label368
;branch540         LDA #$01
;                LDY #$27
;                LDX $02C8
;                JSR label362
;                LDA $CC21
;                STA $CDD3
;                LDA $02C7
;                AND #$7F
;                TAX
;                LDA $02C8
;                AND #$20
;                BNE branch541
;                TXA
;                CLC
;                ADC $02D3
;                TAX
;branch541         STX $CDC6
;                CLC
;                LDA $C416,X
;                ADC $CDD3
;                TAY
;                LDA $C3B7,X
;                ADC #$00
;                TAX
;                LDA $CC1C
;                BEQ branch542
;                LDA $02C8
;                AND #$10
;                BNE branch543
;branch542         STY $CDFB
;                STX $CDFC
;branch543         STY $CE14
;                STX $CE15
;                STX $CD8E
;                LDA $02C7
;                AND #$80
;                BNE branch544
;                JMP label369
;branch544         LDA #$00
;                STA $CDCC
;                LDA $02C8
;                AND #$40
;                BEQ branch545
;                LDA $02CD
;                LDX #$01
;                JSR label364
;                JSR label370
;branch545         LDA $CC1B
;                STA $CDB8
;                AND #$20
;                TAX
;                LDA $CC16
;                ASL
;                ASL
;                ASL
;                ASL
;                STA $CDFD
;                STA $D409
;                LDA $CC16
;                LSR
;                LSR
;                LSR
;                LSR
;                STA $CDFE
;                STA $D40A
;                LDA $CC17
;                STA $CDA3
;                CPX #$20
;                BNE branch546
;                LDA #$00
;branch546         STA $CDA9
;                LDA $CC18
;                STA $CDAC
;                STA $CDA6
;                LDA $CC1C
;                STA $CD83
;                LDA $CC1D
;                STA $CD8B
;                LDA $CC15
;                STA $CD86
;                LDA $CC1E
;                STA $CD99
;                LDA $CC1F
;                STA $CD96
;                LDA $CC20
;                STA $CD93
;                LDA $CC19
;                STA $CDAF
;                LDA $CDD7
;                AND #$FE
;                STA $D40B
;                LDA $CC13
;                STA $D40C
;                LDA $CC14
;                STA $D40D
;                LDA $CDFB
;                STA $D407
;                LDA $CDFC
;                STA $D408
;                LDA $CC49
;                AND #$02
;                BEQ branch547
;                JSR label339
;branch547         LDA $CC12
;                STA $D40B
;                STA $CDD6
;                JSR label365
;                JMP label368
;label369          LDA $CDFB
;                STA $D407
;                LDA $CDFC
;                STA $D408
;label367          LDA $CC1A
;                STA $D40B
;                STA $CDD7
;label368          LDA $02C7
;                STA $02CA
;                LDA $02C8
;                STA $02CD
;                RTS
;label357          LDA $02C6
;                AND #$04
;                BEQ branch548
;                RTS
;branch548         LDA $02C0
;                ASL
;                TAY
;                LDA ($A9),Y
;                INY
;                JMP label371
;branch549         JMP label372
;label371          STA $02C7
;                LDA ($A9),Y
;                STA $02C8
;label326          LDA $02C7
;                BEQ branch549
;                CMP #$80
;                BNE branch550
;                JMP label373
;branch550         LDA #$02
;                LDY #$3F
;                LDX $02C8
;                JSR label362
;                LDA $CC39
;                STA $CDD4
;                LDA $02C7
;                AND #$7F
;                TAX
;                LDA $02C8
;                AND #$20
;                BNE branch551
;                TXA
;                CLC
;                ADC $02D4
;                TAX
;branch551         STX $CDC7
;                CLC
;                LDA $C416,X
;                ADC $CDD4
;                TAY
;                LDA $C3B7,X
;                ADC #$00
;                TAX
;                LDA $CC34
;                BEQ branch552
;                LDA $02C8
;                AND #$10
;                BNE branch553
;branch552         STY $CE02
;                STX $CE03
;branch553         STY $CE1B
;                STX $CE1C
;                STX $CD8F
;                LDA $02C7
;                AND #$80
;                BNE branch554
;                JMP label374
;branch554         LDA #$00
;                STA $CDCD
;                LDA $02C8
;                AND #$40
;                BEQ branch555
;                LDA $02CE
;                LDX #$02
;                JSR label364
;                JSR label375
;branch555         LDA $CC33
;                STA $CDB9
;                AND #$20
;                TAX
;                LDA $CC2E
;                ASL
;                ASL
;                ASL
;                ASL
;                STA $CE04
;                STA $D410
;                LDA $CC2E
;                LSR
;                LSR
;                LSR
;                LSR
;                STA $CE05
;                STA $D411
;                LDA $CC2F
;                STA $CDA4
;                CPX #$20
;                BNE branch556
;                LDA #$00
;branch556         STA $CDAA
;                LDA $CC30
;                STA $CDAD
;                STA $CDA7
;                LDA $CC34
;                STA $CD84
;                LDA $CC35
;                STA $CD8C
;                LDA $CC2D
;                STA $CD87
;                LDA $CC36
;                STA $CD9A
;                LDA $CC37
;                STA $CD97
;                LDA $CC38
;                STA $CD94
;                LDA $CC31
;                STA $CDB0
;                LDA $CDD8
;                AND #$FE
;                STA $D412
;                LDA $CC2B
;                STA $D413
;                LDA $CC2C
;                STA $D414
;                LDA $CE02
;                STA $D40E
;                LDA $CE03
;                STA $D40F
;                LDA $CC49
;                AND #$04
;                BEQ branch557
;                JSR label339
;branch557         LDA $CC2A
;                STA $D412
;                STA $CDD8
;                JSR label365
;                JMP label373
;label374          LDA $CE02
;                STA $D40E
;                LDA $CE03
;                STA $D40F
;label372          LDA $CC32
;                STA $D412
;                STA $CDD8
;label373          LDA $02C7
;                STA $02CB
;                LDA $02C8
;                STA $02CE
;                RTS
;label365          LDA $CC43
;                STA $CE0B
;                STA $D417
;                LDA $CC42
;                STA $CE0C
;                RTS
;label346          LDX #$00
;                STX $02C4
;                CMP #$02
;                BNE branch558
;                LDA #$FF
;                STA $02C4
;branch558         JSR label376
;                LDX #$00
;                STX $CD81
;                STX $C00F
;                INX
;                STX $02C2
;                STX $02C3
;                LDX $C011
;                STX $02C1
;                JSR label377
;                DEX
;                STX $02C0
;                LDA #$07
;                STA $CD80
;                RTS
;label354          LDX $02C1
;                CPX $C010
;                BNE branch559
;                LDA $02C4
;                BEQ branch560
;                LDA #$00
;                STA $02C3
;                LDA #$01
;                RTS
;branch560         LDX $C011
;                STX $02C1
;                JMP label377
;branch559         INX
;                STX $02C1
;label377          LDA $A000,X
;                STA $A5
;                LDA $A100,X
;                STA $A6
;                LDA $A400,X
;                STA $A7
;                LDA $A500,X
;                STA $A8
;                LDA $A800,X
;                STA $A9
;                LDA $A900,X
;                STA $AA
;                LDA $AC00,X
;                STA $AB
;                LDA $AD00,X
;                STA $AC
;                LDY #$00
;                LDA ($AB),Y
;                STA $DC04
;                INY
;                LDA ($AB),Y
;                INY
;                CMP #$06
;                BCC $C99C
;                STA $DC05
;branch561         LDA ($AB),Y
;                STA $CD81
;                INY
;                LDA ($AB),Y
;                STA $CDB5
;                INY
;                LDA ($AB),Y
;                TAX
;                CMP #$FF
;                BNE branch562
;                LDA #$00
;                STA $CDBA
;                JMP label378
;branch562         LDA $CDBA
;                BNE branch563
;                TXA
;                STA $CDBA
;                STA $CDBB
;                LDA $CE0C
;                AND #$0F
;                STA $CDBC
;branch563         INY
;                LDA ($AB),Y
;                AND #$0F
;                STA $CDEF
;                LDA $CDB5
;                ASL
;                TAY
;                DEY
;                LDA ($A5),Y
;                STA $02CC
;                LDA ($A7),Y
;                STA $02CD
;                LDA ($A9),Y
;                STA $02CE
;                LDX $02C1
;                LDA $A200,X
;                STA $02D2
;                LDA $A300,X
;                STA $02CF
;                LDA $A600,X
;                STA $02D3
;                LDA $A700,X
;                STA $02D0
;                LDA $AA00,X
;                STA $02D4
;                LDA $AB00,X
;                STA $02D1
;                LDX #$00
;                STX $02C0
;                LDA #$00
;                RTS
;label327          LDY #$07
;branch564         LDA $00A5,Y
;                TAX
;                LDA $07E9,Y
;                STA $00A5,Y
;                TXA
;                STA $07E9,Y
;                DEY
;                BPL branch564
;                RTS
;label358          LDA $CDBA
;                BEQ branch565
;                DEC $CDBB
;                BNE branch566
;                LDA $CDBC
;                AND #$0F
;                CMP #$00
;                BEQ branch566
;                TAX
;                DEX
;                STX $02C7
;                STX $CDBC
;                LDA $CDBA
;                STA $CDBB
;                LDA $CE0C
;                AND #$F0
;                ORA $02C7
;                STA $CE0C
;                STA $D418
;branch566         RTS
;branch565         LDA $CE0C
;                AND #$F0
;                ORA $CDEF
;                STA $CE0C
;                STA $D418
;                RTS
;label376          LDY #$17
;                LDA #$00
;branch567         STA $D400,Y
;                STA $CDF4,Y
;                STA $CE0D,Y
;                DEY
;                BPL branch567
;                LDA #$0F
;                STA $CE0C
;                LDX #$00
;                LDA #$08
;                STA $D404
;                STX $D404
;                STA $D40B
;                STX $D40B
;                STA $D412
;                STX $D412
;                LDX #$A7
;branch568         STA $CD7F,X
;                DEX
;                BNE branch568
;                LDX #$5A
;branch569         STA $CBFA,X
;                DEX
;                BPL branch569
;                RTS
;label362          STX $CDC2
;                STY $CDC3
;                TAY
;                LDA $AB
;                STA $CDC0
;                LDA $AC
;                STA $CDC1
;                TXA
;                AND #$0F
;                TAX
;                LDA $02C8
;                AND #$80
;                BNE branch570
;                TXA
;                CLC
;                ADC $02CF,Y
;                TAX
;branch570         LDA #$00
;                STA $CDF1
;                STX $CDF0
;                STA $CDF3
;                STX $CDF2
;                LDY #$03
;branch571         LDA $CDF0
;                CLC
;                ASL
;                STA $CDF0
;                LDA $CDF1
;                ROL
;                STA $CDF1
;                DEY
;                BPL branch571
;                LDY #$02
;branch572         LDA $CDF2
;                CLC
;                ASL
;                STA $CDF2
;                LDA $CDF3
;                ROL
;                STA $CDF3
;                DEY
;                BPL branch572
;                LDA $CDF0
;                CLC
;                ADC $CDF2
;                STA $AB
;                LDA $CDF1
;                ADC $CDF3
;                STA $AC
;                LDA $AB
;                CLC
;                ADC #$00
;                STA $AB
;                LDA $AC
;                ADC #$AE
;                STA $AC
;                LDX $CDC3
;                LDY #$0F
;branch573         LDA ($AB),Y
;                STA $CBFA,X
;                DEX
;                DEY
;                BPL branch573
;                LDA $AB
;                CLC
;                ADC #$10
;                STA $AB
;                LDA $AC
;                ADC #$00
;                STA $AC
;                LDX #$4F
;                LDY #$00
;                LDA ($AB),Y
;                CMP #$FF
;                BEQ branch574
;                LDY #$07
;branch575         LDA ($AB),Y
;                STA $CBFA,X
;                DEX
;                DEY
;                BPL branch575
;branch574         LDA $CDC0
;                STA $AB
;                LDA $CDC1
;                STA $AC
;                RTS
;label364          STA $CDCE,X
;                LDA #$00
;                STA $CDC8,X
;                LDA #$01
;                STA $CDCB,X
;                RTS
;label352          LDA $CDCB
;                BEQ branch576
;                LDY #$00
;                LDX #$00
;                JSR label379
;branch576         LDA $CDCC
;                BEQ branch577
;                LDY #$07
;                LDX #$01
;                JSR label379
;branch577         LDA $CDCD
;                BEQ branch578
;                LDY #$0E
;                LDX #$02
;                JSR label379
;branch578         RTS
;label379          STY $CDC3
;                STX $CDC2
;                LDA $CDD2,X
;                STA $CDD5
;                LDA $CDCE,X
;                CLC
;                ADC $CDC8,X
;                TAY
;                LDA ($AB),Y
;                CLC
;                ADC $CDC5,X
;                TAX
;                LDY $CDC3
;                LDA $C416,X
;                ADC $CDD5
;                STA $CDF4,Y
;                STA $CE0D,Y
;                STA $D400,Y
;                LDA $C3B7,X
;                ADC #$00
;                STA $CDF5,Y
;                STA $CE0E,Y
;                STA $D401,Y
;                LDX $CDC2
;                INC $CDC8,X
;                LDA $CDC8,X
;                AND #$07
;                STA $CDC8,X
;                RTS
;                EOR $5355
;                EOR #$43
;                EOR $5341
;                NOP $45,X
;                JAM
;                JSR label65
;                EOR $41
;                NOP $45,X
;                NOP $20
;                JAM
;                EOR $20,Y
;                SRE ($48,X)
;                JAM
;                EOR #$53
;                JSR label380
;                EOR $4C
;                SRE ($42),Y
;                EOR $43
;                ASR #$41
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;label87          BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
label0 = $E06C

label5 = $C475
label7 = $E0B2

; Missing using tool
label12 = $2020
label13 = $4820
label14 = $204F
label15 = $5520
label16 = $4550
label17 = $4E4B

label21 = $4150
label27 = $4142
label35 = $4148
label67 = $4154
label81 = $0040
label88 = $D345
label93 = $4144
label98 = $D845
label103 = $FFCC
label105 = $AB45
label110 = $FF90
label112 = $0073
label121 = $E112
label125 = $FFE7
label127 = $0079
label130 = $E386
label132 = $A38A
label147 = $FFE1
label151 = $A909
label168 = $FFDB
label169 = $0080
label170 = $B248
label178 = $E118
label184 = $FFF0
label189 = $E10C
label191 = $E11E
label196 = $FFB7
label199 = $E124
label207 = $AEFD
label219 = $ADA9
label225 = $AEFA
label232 = $FFDE
label234 = $AD8F
label237 = $0054
label288 = $E043
label322 = $E000
label328 = $EA31



;               jmp start
;               !bin "../FONT.BIN"
;start           *=$1000
;                SEI
;                JSR label0
;                LDA #$18
;                STA $D016      ; horizontal scroll / multicolor mode
;                LDA #$1A
;                STA $D018      ; screen & character memory pointers
;                LDA #$13
;                STA $5C
;                LDA #$00
;                STA $5B
;                LDA #$0F
;                STA $D015      ; enable sprites 0–3
;                LDA #$00
;                STA $D01C      ; sprites NOT multicolor
;                LDA #$07
;                STA $D025      ; shared sprite multicolor 1
;                LDA #$02
;                STA $D026      ; shared sprite multicolor 2
;                LDX #$00
;branch0         LDA $1C00,X    ; copy to the screen
;                STA $0400,X
;                LDA $1D00,X
;                STA $0500,X
;                LDA $1E00,X
;                STA $0600,X
;                LDA $1F00,X
;                STA $0700,X
;                LDA $4000,X
;                STA $D800,X
;                LDA $4100,X
;                STA $D900,X
;                LDA $4200,X
;                STA $DA00,X
;                LDA $4300,X
;                STA $DB00,X
;                INX
;                BNE branch0
;                LDA #$FF
;branch1         STA $0340,X
;                INX
;                CPX #$3F
;                BNE branch1
;                LDX #$00
;                LDA #$3F
;branch2         STA $07F8,X    ; sprite pointers
;                INX
;                CPX #$08
;                BNE branch2
;                LDA #$07
;                STA $D027     ; sprite colours
;                LDA #$0A
;                STA $D028
;                LDA #$04
;                STA $D029
;                LDA #$02
;                STA $D02A
;                LDX #$00
;                LDA #$18
;branch3         STA $D000,X    ; sprite X
;                INX
;                INX
;                CLC
;                ADC #$19
;                STA $D000,X    ; sprite Y
;                CPX #$10
;                BNE branch3
;                LDX #$00
;branch4         LDA $11E5,X
;                STA $11C6,X
;                LDA $11EF,X
;                STA $11D0,X
;                LDA #$DF
;                STA $11DA,X
;                INX
;                CPX #$0A
;                BNE branch4
;                STA $11E4
;                SEI
;                LDA #$35
;                STA $01        ; RAM everywhere (no BASIC/KERNAL)
;                LDA #$00
;                LDX #$00
;                LDY #$0B
;                nop ; JSR label1
;                nop
;                LDA #$1D
;                STA $FFFE
;                LDA #$11
;                STA $FFFF
;                LDA #$BE
;                STA $FFFA
;                LDA #$11
;                STA $FFFB
;                LDA #$00
;                STA $DC0E
;                STA $D010
;                STA $11BF
;                STA $11C0
;                STA $11C1
;                STA $11C2
;                STA $D021
;                ;nop
;                ;nop
;                STA $D020
;                ;nop
;                ;nop
;                STA $11C3
;                STA $11C4
;                STA $11C5
;                STA $D010
;                STA $D01D
;                STA $D01C
;                STA $D017
;                LDA #$01
;                STA $D01A
;                STA $D019
;                LDA #$3B
;                STA $D011
;                LDA #$00
;                STA $D012
;                CLI
;label2          JMP label2
;                LDA #$01
;                STA $D019
;                LDX $11BF
;                LDA $11C6,X    ; Load raster position from table
;                STA $D012      ; next raster
;                LDA $11D0,X
;                nop
;                nop
;;                JSR label3
;                LDA $11DA,X
;                nop
;                nop
;;                JSR label4
;                INX
;                CPX #$0A
;                BNE branch5
;                nop ; JSR label5
;                nop
;                LDX #$00
;                STX $11BF
;                LDA $11C5
;                BEQ branch6
;                nop ; JSR label6
;                nop
;                JMP label7
;branch6         nop ; JSR label8
;                nop
;label7          LDA $DC01      ; Keyboard input (CIA #1)
;                CMP #$FE       ; key 1
;                BNE branch7
;                LDA $11C3
;                BEQ branch8
;                RTI
;branch8         LDA #$00
;                LDX #$00
;                LDY #$0B
;                nop ; JSR label1
;                nop
;                LDA #$01
;                STA $11C3
;                LDA #$00
;                STA $11C4
;                STA $11C5
;                RTI
;branch7         CMP #$F7       ; key 2
;                BNE branch9
;                LDA $11C4
;                BEQ branch10
;                RTI
;branch10        LDA #$00
;                LDX #$00
;                LDY #$05
;                nop ; JSR label1
;                nop
;                LDA #$01
;                STA $11C4
;                LDA #$00
;                STA $11C3
;                STA $11C5
;                RTI
;branch9         CMP #$FD       ; key 3
;                BNE branch11
;                LDA $11C5
;                BEQ branch12
;                RTI
;branch12        LDA #$01
;                STA $C00F
;                LDA #$01
;                STA $11C5
;                LDA #$00
;                STA $11C3
;                STA $11C4
;                RTI
;branch5         STX $11BF
;                CPX #$01
;                BNE branch11
;                nop; JSR label9
;                nop
;branch11        RTI
;                BRK
;                
;                !byte $04
;                !byte $5F
;                !byte $03
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $44
;                !byte $5B
;                !byte $72
;                !byte $89
;                !byte $A0
;                !byte $B7
;                !byte $CE
;                !byte $E5
;                !byte $FC
;                !byte $13
;                !byte $2F
;                !byte $46
;                !byte $5D
;                !byte $74
;                !byte $8B
;                !byte $A2
;                !byte $B9
;                !byte $D0
;                !byte $E7
;                !byte $FE
;                !byte $DF
;                !byte $DF
;                !byte $DF
;                !byte $DF
;                !byte $DF
;                !byte $DF
;                !byte $3F
;                !byte $3F
;                !byte $3F
;                !byte $3F
;                !byte $3F
;                !byte $47
;                !byte $5E
;                !byte $75
;                !byte $8C
;                !byte $A3
;                !byte $BA
;                !byte $D1
;                !byte $E8
;                !byte $FF
;                !byte $16
;                !byte $32
;                !byte $49
;                !byte $60
;                !byte $77
;                !byte $8E
;                !byte $A5
;                !byte $BC
;                !byte $D3
;                !byte $EA
;                !byte $FD
;                !byte $B8
;                !byte $B4
;                !byte $B0
;                !byte $AC
;                !byte $A8
;                !byte $A4
;                !byte $A4
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $8D
;                !byte $01
;                !byte $D0
;                !byte $8D
;                !byte $03
;                !byte $D0
;                !byte $8D
;                !byte $05
;                !byte $D0
;                !byte $8D
;                !byte $07
;                !byte $D0
;                !byte $60
;                !byte $8D
;                !byte $F8
;                !byte $07
;                !byte $8D
;                !byte $F9
;                !byte $07
;                !byte $8D
;                !byte $FA
;                !byte $07
;                !byte $8D
;                !byte $FB
;                !byte $07
;                !byte $60
;                !byte $CE
;                !byte $C6
;                !byte $11
;                !byte $CE
;                !byte $D0
;                !byte $11
;                !byte $A2
;                !byte $01
;                !byte $AD
;                !byte $C6
;                !byte $11
;                !byte $18
;                !byte $69
;                !byte $17
;                !byte $9D
;                !byte $C6
;                !byte $11
;                !byte $E8
;                !byte $E0
;                !byte $0A
;                !byte $D0
;                !byte $F5
;                !byte $A2
;                !byte $01
;                !byte $AD
;                !byte $D0
;                !byte $11
;                !byte $18
;                !byte $69
;                !byte $17
;                !byte $9D
;                !byte $D0
;                !byte $11
;                !byte $E8
;                !byte $E0
;                !byte $0A
;                !byte $D0
;                !byte $F5
;                !byte $EE
;                !byte $C2
;                !byte $11
;                !byte $AD
;                !byte $C2
;                !byte $11
;                !byte $C9
;                !byte $17
;                !byte $F0
;                !byte $18
;                !byte $60
;                !byte $A2
;                !byte $00
;                !byte $8E
;                !byte $C2
;                !byte $11
;                !byte $BD
;                !byte $E5
;                !byte $11
;                !byte $9D
;                !byte $C6
;                !byte $11
;                !byte $BD
;                !byte $EF
;                !byte $11
;                !byte $9D
;                !byte $D0
;                !byte $11
;                !byte $E8
;                !byte $E0
;                !byte $0A
;                !byte $D0
;                !byte $EF
;                !byte $60
;                !byte $20
;                !byte $4E
;                !byte $12
;                !byte $AC
;                !byte $C0
;                !byte $11
;                !byte $B1
;                !byte $5B
;                !byte $C9
;                !byte $40
;                !byte $F0
;                !byte $26
;                !byte $C9
;                !byte $2E
;                !byte $D0
;                !byte $05
;                !byte $A9
;                !byte $1B
;                !byte $4C
;                !byte $92
;                !byte $12
;                !byte $C9
;                !byte $3F
;                !byte $D0
;                !byte $05
;                !byte $A9
;                !byte $1C
;                !byte $4C
;                !byte $92
;                !byte $12
;                !byte $C9
;                !byte $21
;                !byte $D0
;                !byte $05
;                !byte $A9
;                !byte $1D
;                !byte $4C
;                !byte $92
;                !byte $12
;                !byte $C9
;                !byte $2F
;                !byte $D0
;                !byte $02
;                !byte $A9
;                !byte $1E
;                !byte $29
;                !byte $3F
;                !byte $4C
;                !byte $AB
;                !byte $12
;                !byte $A9
;                !byte $00
;                !byte $8D
;                !byte $C2
;                !byte $11
;                !byte $8D
;                !byte $C0
;                !byte $11
;                !byte $A9
;                !byte $00
;                !byte $85
;                !byte $5B
;                !byte $A9
;                !byte $13
;                !byte $85
;                !byte $5C
;                !byte $20
;                !byte $4E
;                !byte $12
;                !byte $60
;                !byte $18
;                !byte $69
;                !byte $1F
;                !byte $8D
;                !byte $E4
;                !byte $11
;                !byte $C8
;                !byte $D0
;                !byte $02
;                !byte $E6
;                !byte $5C
;                !byte $8C
;                !byte $C0
;                !byte $11
;                !byte $A2
;                !byte $00
;                !byte $BD
;                !byte $DB
;                !byte $11
;                !byte $9D
;                !byte $DA
;                !byte $11
;                !byte $E8
;                !byte $E0
;                !byte $0A
;                !byte $D0
;                !byte $F5
;                !byte $60
;                !byte $AE
;                !byte $C1
;                !byte $11
;                !byte $BD
;                !byte $40
;                !byte $3F
;                !byte $8D
;                !byte $FF
;                !byte $11
;                !byte $E8
;                !byte $E0
;                !byte $7C
;                !byte $D0
;                !byte $02
;                !byte $A2
;                !byte $00
;                !byte $8E
;                !byte $C1
;                !byte $11
;                !byte $AD
;                !byte $FF
;                !byte $11
;                !byte $8D
;                !byte $00
;                !byte $D0
;                !byte $AD
;                !byte $FD
;                !byte $11
;                !byte $8D
;                !byte $02
;                !byte $D0
;                !byte $AD
;                !byte $FB
;                !byte $11
;                !byte $8D
;                !byte $04
;                !byte $D0
;                !byte $AD
;                !byte $F9
;                !byte $11
;                !byte $8D
;                !byte $06
;                !byte $D0
;                !byte $A2
;                !byte $00
;                !byte $BD
;                !byte $FA
;                !byte $11
;                !byte $9D
;                !byte $F9
;                !byte $11
;                !byte $E8
;                !byte $E0
;                !byte $06
;                !byte $D0
;                !byte $F5
;                !byte $60
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $48
;                !byte $45
;                !byte $4C
;                !byte $4C
;                !byte $4F
;                !byte $20
;                !byte $41
;                !byte $4C
;                !byte $4C
;                !byte $20
;                !byte $55
;                !byte $20
;                !byte $50
;                !byte $45
;                !byte $45
;                !byte $50
;                !byte $53
;                !byte $20
;                !byte $21
;                !byte $21
;                !byte $21
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $4D
;                !byte $41
;                !byte $47
;                !byte $49
;                !byte $43
;                !byte $20
;                !byte $4B
;                !byte $4E
;                !byte $49
;                !byte $47
;                !byte $48
;                !byte $54
;                !byte $20
;                !byte $54
;                !byte $59
;                !byte $50
;                !byte $49
;                !byte $4E
;                !byte $47
;                !byte $20
;                !byte $57
;                !byte $49
;                !byte $54
;                !byte $48
;                !byte $20
;                !byte $58
;                !byte $4F
;                !byte $52
;                !byte $20
;                !byte $44
;                !byte $49
;                !byte $43
;                !byte $54
;                !byte $41
;                !byte $54
;                !byte $49
;                !byte $4E
;                !byte $47
;                !byte $2E
;                !byte $2E
;                !byte $20
;                !byte $43
;                !byte $4F
;                !byte $5A
;                !byte $20
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $57
;                !byte $52
;                !byte $4F
;                !byte $54
;                !byte $45
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $49
;                !byte $53
;                !byte $20
;                !byte $50
;                !byte $41
;                !byte $52
;                !byte $54
;                !byte $20
;                !byte $4F
;                !byte $46
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $44
;                !byte $45
;                !byte $4D
;                !byte $4F
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $44
;                !byte $45
;                !byte $53
;                !byte $49
;                !byte $47
;                !byte $4E
;                !byte $45
;                !byte $44
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $53
;                !byte $50
;                !byte $52
;                !byte $49
;                !byte $54
;                !byte $45
;                !byte $53
;                !byte $2E
;                !byte $20
;                !byte $41
;                !byte $4C
;                !byte $4C
;                !byte $20
;                !byte $49
;                !byte $20
;                !byte $44
;                !byte $49
;                !byte $44
;                !byte $20
;                !byte $57
;                !byte $4F
;                !byte $5A
;                !byte $20
;                !byte $54
;                !byte $4F
;                !byte $20
;                !byte $4B
;                !byte $4E
;                !byte $4F
;                !byte $43
;                !byte $4B
;                !byte $20
;                !byte $55
;                !byte $50
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $48
;                !byte $49
;                !byte $20
;                !byte $52
;                !byte $45
;                !byte $53
;                !byte $20
;                !byte $50
;                !byte $49
;                !byte $43
;                !byte $43
;                !byte $59
;                !byte $20
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $20
;                !byte $42
;                !byte $59
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $57
;                !byte $41
;                !byte $59
;                !byte $20
;                !byte $50
;                !byte $52
;                !byte $45
;                !byte $53
;                !byte $53
;                !byte $20
;                !byte $4B
;                !byte $45
;                !byte $59
;                !byte $53
;                !byte $20
;                !byte $4F
;                !byte $4E
;                !byte $45
;                !byte $20
;                !byte $4F
;                !byte $52
;                !byte $20
;                !byte $54
;                !byte $57
;                !byte $4F
;                !byte $20
;                !byte $4F
;                !byte $52
;                !byte $20
;                !byte $42
;                !byte $41
;                !byte $43
;                !byte $4B
;                !byte $41
;                !byte $52
;                !byte $52
;                !byte $4F
;                !byte $57
;                !byte $20
;                !byte $46
;                !byte $4F
;                !byte $52
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $54
;                !byte $55
;                !byte $4E
;                !byte $45
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $50
;                !byte $4C
;                !byte $45
;                !byte $41
;                !byte $53
;                !byte $45
;                !byte $20
;                !byte $44
;                !byte $4F
;                !byte $4E
;                !byte $54
;                !byte $20
;                !byte $47
;                !byte $52
;                !byte $45
;                !byte $45
;                !byte $54
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $57
;                !byte $49
;                !byte $4C
;                !byte $44
;                !byte $20
;                !byte $53
;                !byte $54
;                !byte $59
;                !byte $4C
;                !byte $45
;                !byte $53
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $59
;                !byte $4D
;                !byte $4F
;                !byte $52
;                !byte $45
;                !byte $20
;                !byte $21
;                !byte $21
;                !byte $20
;                !byte $43
;                !byte $4F
;                !byte $5A
;                !byte $20
;                !byte $57
;                !byte $45
;                !byte $20
;                !byte $48
;                !byte $41
;                !byte $56
;                !byte $45
;                !byte $20
;                !byte $4A
;                !byte $4F
;                !byte $49
;                !byte $4E
;                !byte $45
;                !byte $44
;                !byte $20
;                !byte $41
;                !byte $20
;                !byte $4D
;                !byte $45
;                !byte $47
;                !byte $41
;                !byte $20
;                !byte $47
;                !byte $52
;                !byte $4F
;                !byte $55
;                !byte $50
;                !byte $20
;                !byte $43
;                !byte $41
;                !byte $4C
;                !byte $4C
;                !byte $45
;                !byte $44
;                !byte $20
;                !byte $53
;                !byte $49
;                !byte $47
;                !byte $4D
;                !byte $41
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $4F
;                !byte $20
;                !byte $4E
;                !byte $4F
;                !byte $57
;                !byte $20
;                !byte $57
;                !byte $45
;                !byte $20
;                !byte $57
;                !byte $49
;                !byte $4C
;                !byte $4C
;                !byte $20
;                !byte $43
;                !byte $52
;                !byte $41
;                !byte $43
;                !byte $4B
;                !byte $20
;                !byte $55
;                !byte $4E
;                !byte $44
;                !byte $45
;                !byte $52
;                !byte $20
;                !byte $53
;                !byte $49
;                !byte $47
;                !byte $4D
;                !byte $41
;                !byte $20
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $20
;                !byte $59
;                !byte $45
;                !byte $41
;                !byte $48
;                !byte $48
;                !byte $48
;                !byte $20
;                !byte $21
;                !byte $21
;                !byte $21
;                !byte $21
;                !byte $21
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $4D
;                !byte $45
;                !byte $47
;                !byte $41
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $41
;                !byte $4E
;                !byte $4B
;                !byte $53
;                !byte $20
;                !byte $54
;                !byte $4F
;                !byte $20
;                !byte $50
;                !byte $41
;                !byte $55
;                !byte $4C
;                !byte $2E
;                !byte $20
;                !byte $4A
;                !byte $49
;                !byte $4D
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $50
;                !byte $48
;                !byte $49
;                !byte $4C
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $4F
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $52
;                !byte $20
;                !byte $4D
;                !byte $45
;                !byte $4D
;                !byte $42
;                !byte $45
;                !byte $52
;                !byte $53
;                !byte $20
;                !byte $4F
;                !byte $46
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $47
;                !byte $52
;                !byte $45
;                !byte $41
;                !byte $54
;                !byte $20
;                !byte $53
;                !byte $49
;                !byte $47
;                !byte $4D
;                !byte $41
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $59
;                !byte $57
;                !byte $41
;                !byte $59
;                !byte $20
;                !byte $4E
;                !byte $4F
;                !byte $57
;                !byte $20
;                !byte $49
;                !byte $4C
;                !byte $4C
;                !byte $20
;                !byte $44
;                !byte $4F
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $55
;                !byte $4E
;                !byte $52
;                !byte $41
;                !byte $4E
;                !byte $4B
;                !byte $45
;                !byte $44
;                !byte $20
;                !byte $47
;                !byte $52
;                !byte $45
;                !byte $45
;                !byte $54
;                !byte $49
;                !byte $4E
;                !byte $47
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $2E
;                !byte $20
;                !byte $20
;                !byte $4D
;                !byte $45
;                !byte $47
;                !byte $41
;                !byte $20
;                !byte $48
;                !byte $45
;                !byte $4C
;                !byte $4C
;                !byte $4F
;                !byte $53
;                !byte $20
;                !byte $47
;                !byte $4F
;                !byte $54
;                !byte $4F
;                !byte $20
;                !byte $20
;                !byte $49
;                !byte $2E
;                !byte $53
;                !byte $2E
;                !byte $44
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $48
;                !byte $54
;                !byte $4C
;                !byte $20
;                !byte $45
;                !byte $53
;                !byte $50
;                !byte $45
;                !byte $43
;                !byte $49
;                !byte $41
;                !byte $4C
;                !byte $4C
;                !byte $59
;                !byte $20
;                !byte $42
;                !byte $4F
;                !byte $44
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $43
;                !byte $2E
;                !byte $4A
;                !byte $2E
;                !byte $20
;                !byte $4F
;                !byte $46
;                !byte $20
;                !byte $49
;                !byte $2E
;                !byte $56
;                !byte $2E
;                !byte $43
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $54
;                !byte $41
;                !byte $52
;                !byte $46
;                !byte $49
;                !byte $52
;                !byte $45
;                !byte $20
;                !byte $49
;                !byte $4E
;                !byte $43
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $46
;                !byte $54
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $43
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4C
;                !byte $4C
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $4D
;                !byte $43
;                !byte $2F
;                !byte $53
;                !byte $43
;                !byte $4F
;                !byte $4F
;                !byte $50
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $52
;                !byte $49
;                !byte $41
;                !byte $44
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $42
;                !byte $45
;                !byte $41
;                !byte $53
;                !byte $54
;                !byte $49
;                !byte $45
;                !byte $20
;                !byte $42
;                !byte $4F
;                !byte $59
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $58
;                !byte $41
;                !byte $4B
;                !byte $4B
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $42
;                !byte $4C
;                !byte $55
;                !byte $45
;                !byte $53
;                !byte $20
;                !byte $42
;                !byte $52
;                !byte $4F
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $46
;                !byte $4C
;                !byte $41
;                !byte $54
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $52
;                !byte $45
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $43
;                !byte $48
;                !byte $49
;                !byte $47
;                !byte $4C
;                !byte $45
;                !byte $59
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4D
;                !byte $41
;                !byte $54
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $50
;                !byte $41
;                !byte $50
;                !byte $49
;                !byte $4C
;                !byte $4C
;                !byte $49
;                !byte $4F
;                !byte $4E
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $48
;                !byte $49
;                !byte $45
;                !byte $4C
;                !byte $44
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $57
;                !byte $49
;                !byte $5A
;                !byte $41
;                !byte $58
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $46
;                !byte $44
;                !byte $2F
;                !byte $54
;                !byte $57
;                !byte $47
;                !byte $49
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $54
;                !byte $41
;                !byte $43
;                !byte $4B
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $53
;                !byte $4E
;                !byte $41
;                !byte $4B
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $43
;                !byte $47
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $42
;                !byte $57
;                !byte $42
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $4C
;                !byte $4F
;                !byte $52
;                !byte $44
;                !byte $53
;                !byte $2F
;                !byte $54
;                !byte $4C
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $4F
;                !byte $46
;                !byte $54
;                !byte $45
;                !byte $41
;                !byte $54
;                !byte $45
;                !byte $52
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $52
;                !byte $49
;                !byte $41
;                !byte $4E
;                !byte $47
;                !byte $4C
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $52
;                !byte $49
;                !byte $4C
;                !byte $4F
;                !byte $47
;                !byte $59
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $47
;                !byte $53
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4A
;                !byte $55
;                !byte $44
;                !byte $47
;                !byte $45
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $46
;                !byte $41
;                !byte $43
;                !byte $2F
;                !byte $52
;                !byte $4F
;                !byte $43
;                !byte $4B
;                !byte $59
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4F
;                !byte $4E
;                !byte $45
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $4F
;                !byte $55
;                !byte $53
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $4F
;                !byte $4E
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $46
;                !byte $52
;                !byte $4F
;                !byte $4E
;                !byte $54
;                !byte $4C
;                !byte $49
;                !byte $4E
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $45
;                !byte $46
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4D
;                !byte $2E
;                !byte $57
;                !byte $49
;                !byte $4E
;                !byte $54
;                !byte $45
;                !byte $52
;                !byte $42
;                !byte $45
;                !byte $52
;                !byte $47
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $46
;                !byte $42
;                !byte $52
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $47
;                !byte $41
;                !byte $4D
;                !byte $45
;                !byte $20
;                !byte $42
;                !byte $55
;                !byte $53
;                !byte $54
;                !byte $45
;                !byte $52
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $47
;                !byte $49
;                !byte $20
;                !byte $4A
;                !byte $4F
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $55
;                !byte $53
;                !byte $41
;                !byte $20
;                !byte $54
;                !byte $45
;                !byte $41
;                !byte $4D
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4D
;                !byte $52
;                !byte $20
;                !byte $5A
;                !byte $45
;                !byte $52
;                !byte $4F
;                !byte $50
;                !byte $41
;                !byte $47
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $43
;                !byte $46
;                !byte $52
;                !byte $2F
;                !byte $48
;                !byte $55
;                !byte $4D
;                !byte $41
;                !byte $4E
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $48
;                !byte $41
;                !byte $52
;                !byte $4B
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $43
;                !byte $43
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $52
;                !byte $45
;                !byte $53
;                !byte $54
;                !byte $20
;                !byte $4F
;                !byte $46
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $47
;                !byte $55
;                !byte $59
;                !byte $53
;                !byte $4F
;                !byte $55
;                !byte $54
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $52
;                !byte $45
;                !byte $20
;                !byte $45
;                !byte $53
;                !byte $50
;                !byte $45
;                !byte $43
;                !byte $49
;                !byte $41
;                !byte $4C
;                !byte $4C
;                !byte $59
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $53
;                !byte $45
;                !byte $20
;                !byte $48
;                !byte $45
;                !byte $4C
;                !byte $4C
;                !byte $4F
;                !byte $53
;                !byte $20
;                !byte $54
;                !byte $4F
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $41
;                !byte $4D
;                !byte $49
;                !byte $47
;                !byte $41
;                !byte $20
;                !byte $46
;                !byte $52
;                !byte $45
;                !byte $41
;                !byte $4B
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $2E
;                !byte $20
;                !byte $20
;                !byte $48
;                !byte $55
;                !byte $4E
;                !byte $54
;                !byte $45
;                !byte $52
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $52
;                !byte $49
;                !byte $4C
;                !byte $4F
;                !byte $47
;                !byte $59
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $48
;                !byte $45
;                !byte $49
;                !byte $4C
;                !byte $44
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $52
;                !byte $2E
;                !byte $42
;                !byte $2E
;                !byte $42
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $46
;                !byte $41
;                !byte $4E
;                !byte $41
;                !byte $54
;                !byte $49
;                !byte $43
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $49
;                !byte $4E
;                !byte $54
;                !byte $52
;                !byte $55
;                !byte $44
;                !byte $45
;                !byte $52
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $57
;                !byte $49
;                !byte $5A
;                !byte $41
;                !byte $58
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4C
;                !byte $4F
;                !byte $52
;                !byte $44
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4D
;                !byte $41
;                !byte $53
;                !byte $54
;                !byte $45
;                !byte $52
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $50
;                !byte $41
;                !byte $50
;                !byte $49
;                !byte $4C
;                !byte $4C
;                !byte $49
;                !byte $4F
;                !byte $4E
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4B
;                !byte $45
;                !byte $4E
;                !byte $54
;                !byte $20
;                !byte $54
;                !byte $45
;                !byte $41
;                !byte $4D
;                !byte $2F
;                !byte $42
;                !byte $41
;                !byte $4D
;                !byte $49
;                !byte $47
;                !byte $41
;                !byte $20
;                !byte $53
;                !byte $45
;                !byte $43
;                !byte $54
;                !byte $4F
;                !byte $52
;                !byte $20
;                !byte $4F
;                !byte $4E
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $20
;                !byte $52
;                !byte $45
;                !byte $44
;                !byte $20
;                !byte $53
;                !byte $45
;                !byte $43
;                !byte $54
;                !byte $4F
;                !byte $52
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $46
;                !byte $54
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $50
;                !byte $48
;                !byte $52
;                !byte $20
;                !byte $43
;                !byte $52
;                !byte $45
;                !byte $57
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4E
;                !byte $4F
;                !byte $52
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $52
;                !byte $4E
;                !byte $20
;                !byte $4C
;                !byte $49
;                !byte $47
;                !byte $48
;                !byte $54
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $46
;                !byte $49
;                !byte $46
;                !byte $54
;                !byte $48
;                !byte $20
;                !byte $44
;                !byte $49
;                !byte $4D
;                !byte $45
;                !byte $4E
;                !byte $53
;                !byte $49
;                !byte $4F
;                !byte $4E
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $43
;                !byte $4F
;                !byte $4E
;                !byte $4E
;                !byte $45
;                !byte $43
;                !byte $54
;                !byte $49
;                !byte $4F
;                !byte $4E
;                !byte $2F
;                !byte $41
;                !byte $4D
;                !byte $49
;                !byte $47
;                !byte $4F
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $4C
;                !byte $43
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $53
;                !byte $46
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $52
;                !byte $49
;                !byte $41
;                !byte $44
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $53
;                !byte $4B
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $44
;                !byte $45
;                !byte $4C
;                !byte $54
;                !byte $41
;                !byte $20
;                !byte $46
;                !byte $4F
;                !byte $52
;                !byte $43
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $55
;                !byte $4E
;                !byte $44
;                !byte $45
;                !byte $52
;                !byte $47
;                !byte $52
;                !byte $4F
;                !byte $55
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $53
;                !byte $4F
;                !byte $46
;                !byte $54
;                !byte $57
;                !byte $41
;                !byte $52
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $48
;                !byte $54
;                !byte $4C
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $44
;                !byte $52
;                !byte $2E
;                !byte $20
;                !byte $4D
;                !byte $41
;                !byte $42
;                !byte $55
;                !byte $53
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $47
;                !byte $55
;                !byte $52
;                !byte $55
;                !byte $20
;                !byte $4D
;                !byte $41
;                !byte $53
;                !byte $54
;                !byte $45
;                !byte $52
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $45
;                !byte $20
;                !byte $4F
;                !byte $52
;                !byte $47
;                !byte $41
;                !byte $4E
;                !byte $49
;                !byte $53
;                !byte $45
;                !byte $44
;                !byte $20
;                !byte $43
;                !byte $52
;                !byte $49
;                !byte $4D
;                !byte $45
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4A
;                !byte $55
;                !byte $44
;                !byte $47
;                !byte $45
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4D
;                !byte $5A
;                !byte $50
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $44
;                !byte $2E
;                !byte $55
;                !byte $53
;                !byte $41
;                !byte $20
;                !byte $54
;                !byte $45
;                !byte $41
;                !byte $4D
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $43
;                !byte $46
;                !byte $52
;                !byte $2F
;                !byte $48
;                !byte $55
;                !byte $4D
;                !byte $41
;                !byte $4E
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $4F
;                !byte $4E
;                !byte $45
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $4F
;                !byte $55
;                !byte $53
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $4F
;                !byte $4E
;                !byte $45
;                !byte $20
;                !byte $43
;                !byte $52
;                !byte $45
;                !byte $57
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $53
;                !byte $4F
;                !byte $52
;                !byte $52
;                !byte $59
;                !byte $20
;                !byte $49
;                !byte $46
;                !byte $20
;                !byte $57
;                !byte $45
;                !byte $20
;                !byte $4D
;                !byte $49
;                !byte $53
;                !byte $53
;                !byte $45
;                !byte $44
;                !byte $20
;                !byte $59
;                !byte $41
;                !byte $20
;                !byte $4F
;                !byte $55
;                !byte $54
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $44
;                !byte $20
;                !byte $53
;                !byte $4F
;                !byte $5A
;                !byte $20
;                !byte $43
;                !byte $4F
;                !byte $5A
;                !byte $20
;                !byte $57
;                !byte $45
;                !byte $20
;                !byte $41
;                !byte $49
;                !byte $4E
;                !byte $54
;                !byte $20
;                !byte $47
;                !byte $4F
;                !byte $54
;                !byte $20
;                !byte $4E
;                !byte $55
;                !byte $4D
;                !byte $42
;                !byte $45
;                !byte $52
;                !byte $20
;                !byte $53
;                !byte $50
;                !byte $52
;                !byte $49
;                !byte $54
;                !byte $45
;                !byte $53
;                !byte $20
;                !byte $2E
;                !byte $20
;                !byte $41
;                !byte $4E
;                !byte $59
;                !byte $57
;                !byte $41
;                !byte $59
;                !byte $20
;                !byte $45
;                !byte $4E
;                !byte $4A
;                !byte $4F
;                !byte $59
;                !byte $20
;                !byte $54
;                !byte $48
;                !byte $49
;                !byte $53
;                !byte $20
;                !byte $50
;                !byte $52
;                !byte $45
;                !byte $48
;                !byte $49
;                !byte $53
;                !byte $54
;                !byte $4F
;                !byte $52
;                !byte $49
;                !byte $43
;                !byte $20
;                !byte $54
;                !byte $4F
;                !byte $4F
;                !byte $4E
;                !byte $45
;                !byte $2E
;                !byte $20
;                !byte $43
;                !byte $4F
;                !byte $5A
;                !byte $20
;                !byte $57
;                !byte $45
;                !byte $20
;                !byte $41
;                !byte $49
;                !byte $4E
;                !byte $54
;                !byte $20
;                !byte $47
;                !byte $4F
;                !byte $54
;                !byte $20
;                !byte $41
;                !byte $20
;                !byte $44
;                !byte $49
;                !byte $47
;                !byte $49
;                !byte $54
;                !byte $49
;                !byte $5A
;                !byte $45
;                !byte $52
;                !byte $20
;                !byte $57
;                !byte $45
;                !byte $20
;                !byte $43
;                !byte $4F
;                !byte $55
;                !byte $4C
;                !byte $44
;                !byte $4E
;                !byte $54
;                !byte $20
;                !byte $42
;                !byte $4C
;                !byte $4F
;                !byte $57
;                !byte $20
;                !byte $59
;                !byte $45
;                !byte $52
;                !byte $20
;                !byte $45
;                !byte $41
;                !byte $52
;                !byte $53
;                !byte $20
;                !byte $4F
;                !byte $55
;                !byte $54
;                !byte $20
;                !byte $21
;                !byte $21
;                !byte $21
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $42
;                !byte $59
;                !byte $45
;                !byte $20
;                !byte $46
;                !byte $4F
;                !byte $52
;                !byte $20
;                !byte $4E
;                !byte $4F
;                !byte $57
;                !byte $20
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $2E
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $20
;                !byte $40
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $00
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $E3
;                !byte $E6
;                !byte $36
;                !byte $33
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $36
;                !byte $E3
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $E3
;                !byte $E6
;                !byte $36
;                !byte $33
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $36
;                !byte $E3
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $E6
;                !byte $E6
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $33
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $33
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $36
;                !byte $33
;                !byte $33
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $33
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E6
;                !byte $E6
;                !byte $E6
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $E3
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $FF
;                !byte $61
;                !byte $60
;                !byte $FF
;                !byte $FF
;                !byte $FF
;;                ISB $00FF,X
;label0 = $E544
;;label1 = $E06C
;;label3 = $1203
;;label4 = $1210
;;label5 = $121D
;;label6 = $C475
;;label8 = $E0B2
;;label9 = $12C7
;    
;;    *=$E000
;;    !bin "../MUSIC.bin"                