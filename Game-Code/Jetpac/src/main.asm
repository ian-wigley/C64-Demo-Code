; ******************* C64 Jetpac ******************* ;
;                                                    ;
;               POKE 20480,0 : SYS2080               ;
;                                                    ;
;             Don't know who wrote this ...          ;
;                                                    ;
; ******************* C64 Jetpac ******************* ;

                *=$0800
;                !binary "./binaries/memory-0800-5002.bin"
                !byte $00
                !byte $14, $08
                !byte $05, $00
                !byte $97, $32
                !byte $30, $34
                !byte $38
                !byte $30, $2C
                !byte $30, $3A
                !byte $9E, $32, $30
                !byte $38
                !byte $30, $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00

                JMP label0
label202        LDA #$00
                STA $D020
                STA $D010
                STA $D021
                STA $D01D
                STA $D017
                STA $D40B
                STA $D404
                STA $D412
branch0         STA $D01B
                LDA #$1A
                STA $D018
                LDA #$0F
                STA $D418
                NOP
                NOP
                NOP
label122        LDA #$93
                JSR label1
                LDY #$00
branch4         LDA $0880,Y
                STA $0400,Y
                LDA $08A8,Y
                STA $0798,Y
                LDA #$0E
                STA $D800,Y
                LDA #$05
                STA $DB98,Y
                LDA $08D0,Y
                STA $07C0,Y
                LDA #$01
                STA $DBC0,Y
                INY
                CPY #$28
                BNE branch4
                JMP label2
        
                *=$087D
                !text "   "
                !byte $13, $03, $0F, $12, $05
                !text ":000000"
                !byte $80, $80, $80, $80
                !text ";;;;;"
                !byte $80 ,$80, $80, $80, $80, $80, $80, $80, $08
                !byte $09, $07, $08
                !text ":000375"
                !text "><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<="
                !byte $10, $01, $03
                !text ":wwwwwwwwwwwwwwwwv"
                !byte $12, $0F, $03, $0B, $05, $14, $20, $06, $15
                !byte $05, $0C, $3A, $20, $20, $20, $20, $20, $20
                !byte $20

                LDA #$3E
                STA $04E7
                STA $0543
                STA $05EF
                LDA #$3D
                STA $0548
                STA $05F4
                STA $04EC
                LDA #$05
                STA $D8E7
                STA $D943
                STA $D9EF
                STA $D8EC
                STA $D9F4
                STA $D948
                LDX #$04
branch10        LDA #$3C
                STA $04E7,X
                STA $0543,X
                STA $05EF,X
                LDA #$05
                STA $D943,X
                STA $D8E7,X
                STA $D9EF,X
                DEX
                BNE branch10
                RTS
                BRK
                BRK
label17         LDA $F8
                STA $D001
                STA $D003
                STA $0342
                LDA $FA
                CMP $0341
                BEQ branch11
                LDA $D010
                EOR #$03
                STA $D010
                LDA $FA
                STA $0341
branch11        LDA $F9
                STA $D000
                STA $D002
                STA $0340
                JSR label6
                RTS
                BRK
                BRK
label34         JSR label7
                EOR #$FF
label74         STA $FF
                AND #$04
                BEQ branch12
                JSR label8
branch12        LDA $FF
                AND #$08
                BEQ branch13
                JSR label9
branch13        LDA $FF
                AND #$01
                BEQ branch14
                JSR label10
branch14        LDA $FF
                AND #$02
                BEQ branch15
                JSR label11
branch15        LDA $0100
                BNE branch16
branch16        JSR label12
                LDA $FF
                AND #$10
                BEQ branch17
                JSR label13
branch17        JSR label14
                JMP label15
label16         LDA $F9
                SEC
                SBC #$02
                STA $F9
                BCS $09BD
                LDA #$00
                STA $FA
branch18        RTS
                BRK
                BRK
label18         LDA $F9
                CLC
                ADC #$02
                STA $F9
                BCC $09CD
                LDA #$01
                STA $FA
branch19        RTS
                BRK
                BRK
label39         LDA $FA
                CMP #$00
                BEQ branch20
branch21        JSR label16
                JMP label17
branch20        LDA $F9
                CMP #$16
                BNE branch21
                RTS
                BRK
label42         LDA $FA
                CMP #$01
                BEQ branch22
branch23        JSR label18
                JMP label17
branch22        LDA $F9
                CMP #$40
                BNE branch23
                RTS
                BRK
label21         LDA $F8
                SEC
                SBC #$02
                STA $F8
                STA $F8
                RTS
label25         LDA $F8
                CLC
                ADC #$02
                STA $F8
                RTS
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
label10         LDA $0343
                BEQ branch24
branch26        LSR $0343
                ROR $0344
                BCC $0A20
                JMP label19
branch25        RTS
branch24        LDA $0344
                BNE branch26
                LDA #$00
                STA $0343
                STA $0344
                LDA #$B7
                STA $0346
                LDA #$24
                STA $0345
label23         JSR label20
                LDA $F8
                CMP #$3C
                BEQ branch27
                JSR label21
                JMP label22
branch27        LDA #$00
                STA $0346
                STA $0345
                RTS
label27         LDA $0345
                BEQ branch28
branch30        LSR $0345
                ROR $0346
                BCC $0A60
                JMP label23
branch29        RTS
branch28        LDA $0346
                BNE branch30
                LDA #$00
                STA $0345
                STA $0346
                LDA #$B7
                STA $0344
                LDA #$24
                STA $0343
label19         JSR label24
                LDA $F8
                CMP #$D4
                BEQ branch31
                JSR label25
                JMP label22
branch31        LDA #$00
                STA $0343
                JMP label26
                RTS
label12         LDA $FF
                AND #$01
                BEQ branch32
branch33        RTS
branch32        LDA $FF
                AND #$02
                BNE branch33
                JMP label27
label35         LDA #$00
                STA $0343
                STA $0344
                STA $0345
                STA $0346
                JSR label17
                RTS
                BRK
                BRK
label20         LDA $F8
                CMP #$7C
                BNE branch34
                LDA $F9
                CMP #$18
                BCS $0AC1
branch36        RTS
branch35        CMP #$60
                BCS $0AC0
                NOP
                NOP
                JMP label28
branch34        CMP #$9C
                BNE branch37
                LDA $F9
                CMP #$78
                BCS $0AD5
branch39        RTS
branch38        CMP #$C2
                BCS $0AD4
branch40        PLA
                PLA
                JMP label29
label28         LDA $FA
                BEQ branch40
branch41        RTS
branch37        LDA $F8
                CMP #$64
                BNE branch41
                LDA $FA
                BEQ branch42
                LDA $F9
                CMP #$40
                BCC $0AF4
                RTS
branch43        PLA
                PLA
                JMP label29
branch42        LDA $F9
                CMP #$F8
                BCS $0AF4
                RTS
label36         LDA $F8
                CMP #$5C
                BNE branch44
                LDA $F9
                CMP #$18
                BCS $0B0D
branch46        RTS
branch45        CMP #$60
                BCS $0B0C
                NOP
                NOP
                JMP label30
branch44         CMP #$7C
                BNE branch47
                LDA $F9
                CMP #$78
                BCS $0B21
branch49        RTS
branch48        CMP #$C2
                BCS $0B20
branch50        PLA
                PLA
                JMP label31
label30         LDA $FA
                BEQ branch50
branch51        RTS
branch47        LDA $F8
                CMP #$44
                BNE branch51
                JMP label32
label26         STA $0344
                JMP label31
label45         JSR label33
                JSR label34
                RTS
label31         LDA #$01
                STA $0349
                JMP label35
label29         LDA $0347
                BEQ branch52
                JMP label35
branch52        LDA #$01
                STA $0347
                JSR label25
                JSR label25
                JMP label35
label24         LDA #$00
                STA $0347
                JMP label36
label22         LDA #$00
                STA $0349
                JMP label17
branch54        RTS
label38         LDA $FA
                BEQ branch53
                LDA $F9
                CMP #$40
                BNE branch54
                LDA $F8
                CMP #$45
                BCS $0B85
branch56        RTS
branch55        CMP #$64
                BCS $0B84
                PLA
                PLA
                JMP $0BA1 ; check label37
branch53        LDA $F9
                CMP #$C2
                BNE branch57
                LDA $F8
                CMP #$7D
                BCS $0B9B
branch59        RTS
branch58        CMP #$9C
                BCS $0B9A
                PLA
                PLA
branch60        RTS
branch57        LDA $F9
                CMP #$60
                BNE branch60
                LDA $F8
                CMP #$5D
                BCS $0BAF
branch62        RTS
branch61        CMP #$7C
                BCS $0BAE
                PLA
                PLA
                RTS
label8          JSR label38
                JMP label39
                BRK
                BRK
                BRK
                RTS
label41         LDA $FA
                BEQ branch63
branch63        LDA $F9
                CMP #$F8
                BNE branch64
                LDA $F8
                CMP #$45
                BCS $0BD1
branch66        RTS
branch65        CMP #$64
                BCS $0BD0
                PLA
                PLA
                JMP $0BA1 ; check label37
branch64        LDA $F9
                CMP #$76
                BNE branch67
                LDA $F8
                CMP #$7D
                BCS $0BE7
branch69        RTS
branch68        CMP #$9C
                BCS $0BE6
                PLA
                PLA
branch70        RTS
branch67        LDA $F9
                CMP #$16
                BNE branch70
                LDA $F8
                CMP #$5D
                BCS $0BFB
branch72        RTS
branch71        CMP #$7C
                BCS $0BFA
                JMP label40
label9          JSR label41
                JMP label42
label32         LDA $FA
                BEQ branch73
                LDA $F9
                CMP #$40
                BCC $0C13
                RTS
branch74        PLA
                PLA
                JMP label31
branch73         LDA $F9
                CMP #$F8
                BCS $0C13
                RTS
                BRK
label6          LDA $FF
                AND #$02
                BEQ branch75
branch79         LDA $FF
                AND #$04
                BEQ branch76
                LDX #$C2
                LDA #$C1
                BNE branch77
branch76         LDA $FF
                AND #$08
                BEQ branch78
                LDX #$DB
                LDA #$DA
branch77         STA $07F9
                JMP label43
                RTS
branch75         LDA $FF
                AND #$01
                BNE branch79
                LDA $0349
                BEQ branch79
                LDA $FF
                AND #$04
                BEQ branch80
                LDX #$C2
                LDA #$C3
                BNE branch81
branch80         LDA $FF
                AND #$08
                BEQ branch82
                LDX #$DB
                LDA #$DC
branch81         STX $07F8
                CLC
                ADC $0348
                JSR label44
                LDA $0348
                CMP #$02
                BNE branch83
                LDA #$FF
                STA $0348
branch83         INC $0348
branch82         LDA #$01
                STA $034A
                LDA $07F9
                CMP #$C1
                BNE branch84
                LDA $0348
                CLC
                ADC #$C3
                JSR label44
branch85         RTS
branch84         CMP #$DA
                BNE branch85
                LDA $0348
                CLC
                ADC #$DC
                JSR label44
                RTS
label43          STX $07F8
branch78         LDA $07F9
                AND #$10
                BEQ $0CAE ; check branch86
                LDA #$DA
                BIT $C1A9
                STA $07F9
                LDA $D010
                AND #$FB
                STA $D010
                LDA $D015
                AND #$FB
                STA $D015
                LDA $0341
                BEQ branch87
                LDA $D010
                CLC
                ADC #$04
                STA $D010
branch87         LDA $D015
                CLC
                ADC #$04
                STA $D015
                LDA $D000
                STA $D004
                LDA $D001
                STA $D005
                CLC
                LDA $07F8
                ADC #$04
                STA $07FA
                RTS
label44          STA $07F9
                LDA $D015
                AND #$FB
                STA $D015
                RTS
                BRK
                BRK
                BRK
                BRK
label117          LDA $0349
                BNE branch88
                JMP label45
branch88         LSR $034B
                BCS $0D10
                JMP label46
branch89         LDA #$04
                STA $034B
                JMP label45
label40          LDA $FA
                BEQ branch90
                RTS
branch90         PLA
                PLA
                RTS
label11          LDA #$00
                STA $0349
                JMP label35
label75          LDA $07F9
                CMP #$DA
                BNE branch91
branch92         RTS
branch91         CMP #$C1
                BEQ branch92
                LDA $F8
                CMP #$5C
                BNE branch93
                LDA $F9
                CMP #$18
                BCS $0D43
branch95         JMP label47
branch94         CMP #$2C
                BCS $0D40
branch96         JMP label48
label47          CMP #$52
                BCS $0D47
                NOP
                CMP #$5E
                BCS $0D47
                RTS
branch93         LDA $F8
                CMP #$7C
                BNE branch97
                LDA $F9
                CMP #$78
                BCS $0D63
branch99         JMP label49
branch98         CMP #$8C
                BCS $0D60
branch100         JMP label48
label49          CMP #$B2
                BCS $0D67
                NOP
                CMP #$C0
                BCS $0D67
                RTS
branch97        LDA $FA
                BEQ branch101
                LDA $F8
                CMP #$44
                BEQ branch102
                RTS
branch102       LDA $F9
                CMP #$32
                BCS $0D88
branch104       JMP label50
branch103       CMP #$40
                BCS $0D85
branch105       JMP label48
label50         CMP #$0A
                BCC $0D8C
branch106       RTS
branch101       LDA $F8
                CMP #$44
                BNE branch106
                LDA $F9
                CMP #$F8
                BCC $0D93
label48         LDA $07F8
                CMP #$C2
                BEQ $0DAA ; Check branch107
                LDX #$08
                BIT $04A2
                STX $FF
                JSR label51
                RTS
                BRK
                BRK
label145        LDA $0342
                STA $23
                STA $24
                LSR $23
                LSR $24
                LSR $23
                LSR $23
                LSR $24
                LSR $24
                ASL $24
                ASL $24
                ASL $24
                SEC
                SBC $24
                STA $26
                LDA #$00
                STA $24
                ASL $23
                ASL $23
                ASL $23
                LDA $23
                STA $27
                LDA $24
                STA $28
                ASL $23
                ROL $24
                ASL $23
                ROL $24
                CLC
                LDA $23
                ADC $27
                STA $23
                LDA $24
                ADC $28
                STA $24
                CLC
                LDA $24
                ADC #$04
                STA $24
                SEC
                LDA $23
                SBC #$C8
                STA $23
                BCS $0E0B
                DEC $24
branch108         LDA $0340
label245          STA $27
                LDA $0341
                STA $28
                LSR $28
                ROR $27
                LSR $27
                LSR $27
                SEC
                LDA $27
                SBC #$04
                STA $25
                CLC
                LDA $23
                ADC #$00
                STA $23
                BCC $0E2F
                INC $24
branch109       RTS
                BRK
                BRK
label146        CMP #$C2
                BNE branch110
                LDA $25
                CLC
                ADC #$02
                STA $25
                JMP label52
branch110       CLC
                LDA $25
                ADC #$03
                STA $25
label52         LDA $25
                BNE branch111
                RTS
branch111       CMP #$27
                BCC $0E51
                RTS
branch112       LDX #$00
branch114       LDY $0E89,X
                LDA $0353,Y
                BEQ branch113
                INX
                CPX #$07
                BNE branch114
                RTS
branch113       LDA #$01
                STA $0353,Y
                LDX #$01
                LDA $07F8
                CMP #$C2
                BEQ branch115
                INX
branch115       TXA
                STA $0352,Y
                LDA $25
                STA $0354,Y
                LDA $23
                CLC
                ADC $25
                STA $0350,Y
                LDA $24
                ADC #$00
                JMP label53
                RTS
                BRK
                PHP
                BPL $0EA5   ; Check branch116
                JSR label54
label73         LDA #$01
                NOP
                NOP
                NOP
                SEI
                LDX #$00
branch119       STX $02
                LDY $0E89,X
                LDA $0353,Y
                BEQ branch117
                LDX #$00
branch118       LDA $0350,Y
                STA $F8,X
                INX
                INY
                CPX #$08
                BNE branch118
                LDX $02
                LDY $0E89,X
                JSR label55
branch117         LDX $02
                INX
                CPX #$06
                BNE branch119
                NOP
                RTS
label53         STA $0351,Y
                LDA #$00
                STA $0355,Y
                STA $0356,Y
                JSR label56
                RTS
                BRK
label65          LDA $FA
                CMP #$02
                BEQ branch120
                JMP label57
branch120         LDA $FD
                CMP #$18
                BNE branch121
branch122         JMP label58
branch121         LDA $FC
                CMP #$27
                BCS $0EDF
                BCS $0EDF
                LDA $F8
                CLC
                ADC #$01
                STA $23
                LDA $F9
                ADC #$00
                STA $24
                JMP label59
label57          LDA $FD
                CMP #$18
                BEQ branch122
                LDA $FC
                CMP #$00
                BEQ branch122
                LDA $F8
                SEC
                SBC #$01
                STA $23
                LDA $F9
                SBC #$00
                STA $24
label59          LDA $FE
                BEQ branch123
                JMP label60
branch123         LDY #$00
                LDA ($23),Y
                CMP #$20
                BEQ branch124
                CMP #$C8
                BCS $0F4E
                CMP #$3E
                BEQ branch122
                CMP #$3D
                BEQ branch122
                CMP #$3C
                BEQ branch122
                JMP label61
branch124       LDX $FF
                LDA $2F80,X
label63         STA ($23),Y
                LDA $23
                CLC
                STA $F8
                LDA $24
                STA $F9
                ADC #$D4
                STA $24
                LDA #$02
                JMP label62
branch125       LDX #$00
branch127       CMP $2FC8,X
                BEQ branch126
                INX
                CPX #$0F
                BNE branch127
                JMP label58
branch126         TXA
                ASL
                ASL
                CLC
                ADC $FF
                TAX
                LDA $2F88,X
                JMP label63
label60          LDY #$00
                LDA ($23),Y
                LDX #$00
branch129         CMP $2FC8,X
                BEQ branch128
                INX
                CPX #$0F
                BNE branch129
                JMP label64
branch128         TXA
                ASL
                ASL
                CLC
                ADC $FF
                TAX
                LDA $27C0,X
                JMP label63
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
label55         JSR label65
label171        LDX $02
                LDY $0E89,X
                LDX #$00
branch130       LDA $F8,X
                STA $0350,Y
                INX
                INY
                CPX #$08
                BNE branch130
                RTS
                BRK
                BRK
label58         LDA $FE
                BNE branch131
label170        LDA $FC
                SEC
                SBC $FD
                STA $FC
                LDA #$01
                STA $FE
                LDA $FA
                CMP #$01
                BEQ branch132
                SEC
                LDA $F8
                SBC $FD
                STA $F8
                BCS $0FC8
                DEC $F9
branch133         LDA #$00
                STA $FD
                RTS
branch132         CLC
                LDA $F8
                ADC $FD
                STA $F8
                BCC $0FD8
                INC $F9
branch134         CLC
                LDA $FC
                ADC $FD
                CLC
                ADC $FD
                STA $FC
                JMP label66
branch131       LDA #$00
                STA $FE
                STA $FB
                RTS
label7          LDA $0340
                STA $F9
                LDA $0341
                STA $FA
                LDA $0342
                STA $F8
                JSR label67
                RTS
                BRK
label98         JSR label68
                JSR label69
                JSR label68
                RTS
label64         CMP #$3C
                BNE branch135
branch136       JMP label70
branch135       CMP #$3E
                BEQ branch136
                CMP #$3D
                BEQ branch136
                LDA #$0F
                JMP label71
                LDA $AD56,Y
                RLA $F003,X
                ORA ($60,X)
                LDA #$06
                STA $033F
                JMP label72
label68         LDA $033F
                BEQ branch137
                DEC $033F
branch137       JMP label73
label51         LDA $0340
                STA $F9
                LDA $0341
                STA $FA
                LDA $0342
                STA $F8
                TXA
                JMP label74
label33         LDA $0340
                STA $F9
                LDA $0341
                STA $FA
                LDA $0342
                STA $F8
                JMP label75
                BRK
                BRK
label14         JSR label76
branch139       BEQ branch138
branch140       JSR label77
                JMP label78
branch138       LDA $0363
                BNE branch139
                LDA $035B
                BNE branch140
label78         LDA $033E
                BEQ branch141
                RTS
branch141       LDX #$E0
branch143       LDY #$80
branch142       INY
                BNE branch142
                INX
                BNE branch143
                RTS
label77         LDX #$00
branch144       INX
                BNE branch144
                RTS
label46         JSR label79
                JMP label33
                BRK
                BRK
label99         LDA $0390
                BEQ branch145
branch146       RTS
branch145       LDA $D000
                CMP $D008
                BNE branch146
                LDA $D001
                CMP $D009
                BNE branch146
                LDA $0398
                CMP #$02
                BEQ branch147
branch147         LDA #$01
                STA $0390
label87          LDA #$00
                STA $D40B
                LDA #$09
                STA $D40C
                LDA #$09
                STA $D40D
                LDA #$11
                STA $D40B
                STA $D408
                STA $D407
                RTS
label91          LDX #$04
                JMP label80
                BRK
                BRK
                BRK
label15         LDA $0390
                CMP #$01
                BNE branch148
                LDX #$00
                JSR label81
                LDA $033D
                BEQ branch149
                LDA #$02
                STA $0390
branch149       RTS
branch148       CMP #$02
                BNE branch150
                JSR label82
branch150       LDA $0398
                CMP #$01
                BNE branch151
                LDX #$01
                JSR label81
                LDA $033D
                BEQ branch152
                LDA #$02
                STA $0398
branch152       RTS
branch151       CMP #$02
                BNE branch153
                JSR label83
branch153       LDA $03A0
                CMP #$01
                BNE branch154
                LDX #$02
                JSR label81
                LDA $033D
                BEQ branch155
                LDA #$03
                STA $03A0
branch155       RTS
branch154       JMP label84
                BRK
                SLO ($79,X)
                ORA ($60),Y
                BPL branch156
                RTI
                NOP #$A9
                BRK
                STA $033D
                TXA
                ASL
                TAY
                LDA $D000
                STA $D008,Y
                LDA $D001
                STA $D009,Y
                LDA $D010
                AND #$01
                BNE branch157
                LDA $D008,Y
branch156       JMP label85
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
branch157       LDA $D010
                AND $1134,X
                BNE branch158
                CLC
                LDA $D010
                ADC $1134,X
                STA $D010
branch158       RTS
label82         LDX #$00
                BIT $02A2
                BIT $04A2
                CPX #$04
                BEQ branch159
                INC $D009,X
                NOP
                NOP
                NOP
                CPX #$00
                BNE branch160
                LDA $D009,X
                CMP #$BF
                BCC $119A
                LDA #$03
                STA $0390
                LDA #$BF
                STA $D009,X
branch161       RTS
branch160       CPX #$02
                BNE $11AC ; Check ... branch162
                LDA $D009,X
                CMP #$AA
                BCC $11B0
                LDA #$03
                STA $0398
                LDA #$AA
                STA $D009,X
branch163       RTS
branch159       JMP label86
                CMP #$D5
                BNE branch164
                RTS
branch164         CMP #$45
                BNE branch165
                LDA $D010
                AND $12B5,X
                BEQ branch166
                LDA $D008,X
                CMP #$04
                BCS $11D0
branch166         INC $D009,X
                RTS
branch167         CMP #$38
                BCS $11CC
                RTS
branch165         CMP #$5D
                BNE branch168
                LDA $D008,X
                CMP #$22
                BCC $11CC
                CMP #$58
                BCS $11CC
                RTS
branch168         CMP #$7D
                BNE branch166
                LDA $D008,X
                CMP #$7E
                BCC $11CC
                CMP #$BC
                BCS $11CC
                RTS
                BRK
                BRK
                BRK
label191          LDA $0398
                BEQ branch169
branch170         RTS
branch169         LDA $D000
                CMP $D00A
                BNE branch170
                LDA $D001
                CMP $D00B
                BNE branch170
                LDA $0390
                CMP #$03
                BNE branch170
                LDA #$01
                STA $0398
                JMP label87
                STA $6D,X
                SAX $1C
label115          LDA $D41B
                STA $121F
                LDA $121E
                STA $1220
                LDY #$07
branch171         ASL $121D
                ROL $121E
                DEY
                BNE branch171
                JSR label88
                ASL $121D
                ROL $121E
                JSR label88
                LDA $121D
                STA $8E
                LDA $121E
                STA $8D
                RTS
label88          CLC
                LDA $121D
                ADC $121F
                STA $121D
                LDA $121E
                ADC $1220
                STA $121E
                RTS
                BRK
label80          LDA $03A0
                BEQ branch172
branch173         RTS
branch172         LDA $03FF
                CMP #$06
                BEQ branch173
                JSR label89
                LDA $8D
                CMP #$10
                BCS $1269
                LDA $8D
                AND #$03
                STA $8D
                LDA $A2
                AND #$1F
                CLC
                ADC $8D
                JSR label90
                CLC
                ADC #$00
                STA $D00C
                LDA #$00
                STA $D00D
                LDA #$02
                STA $03A0
                LDA $D015
                ADC #$40
                STA $D015
                RTS
label101        LDA $0390
                CMP #$03
                BEQ branch174
branch175       RTS
branch174       LDA $0398
                CMP #$03
                BNE branch175
                JMP label91
                BPL $12C7 ; Check branch176
                JSR label92
                RTI
                NOP #$A9
                BRK
                STA $033D
                SEC
                LDA $0342
                SBC $D009,X
                BCS $12CC
                EOR #$FF
branch177       CMP #$0C
                BCC $12D1
branch180       RTS
branch178       LDA $0341
                BEQ branch179
                LDA $D010
                AND $12B5,X
                BEQ branch180
                BNE branch181
branch179         LDA $D010
                AND $12B5,X
                BNE branch180
branch181         LDA $0340
                SBC $D008,X
                BCS $12F2
                EOR #$FF
branch182         CMP #$0C
                BCS $12D0
                LDA #$01
                JSR label93
                RTS
label102          LDA $03A0
                BNE branch183
branch184         RTS
branch183         CMP #$03
                BEQ branch184
                LDX #$04
                JSR label94
                LDA $033D
                BEQ branch184
                LDA #$01
                STA $03A0
label231        RTS
label84         CMP #$02
                BNE branch185
branch186       JMP label95
branch185       CMP #$03
                BEQ branch186
                RTS
label86         LDA $D009,X
                CMP #$D6
                BEQ branch187
                JMP label96
branch187         LDA $D008,X
                CMP #$E0
                BEQ branch188
branch189         RTS
branch188         CPX #$04
                BNE branch189
                LDA #$00
                STA $03A0
                LDA $D015
                SEC
                SBC #$40
                STA $D015
                LDX $03FF
                LDA #$00
                STA $07E1,X
                LDA #$02
                STA $DBE1,X
                INC $03FF
                RTS
label90         STA $8B
                LDA #$00
                STA $8C
                ASL $8B
                ASL $8B
                ASL $8B
                ROL $8C
                CLC
                LDA $8B
                ADC #$16
                STA $8B
                BCC $1370
                INC $8C
branch190       LDA $8C
                BEQ branch191
                CLC
                LDA $D010
                JSR label97
                STA $D010
branch191       LDA $8B
                RTS
label112        JSR label98
                JSR label99
                JSR label100
                JSR label101
                JSR label102
                LDA $03FF
                CMP #$06
                BNE branch192
                JSR label103
branch192       LDA #$00
                STA $033E
                JSR label104
                JSR label105
                JSR label106
                JSR label107
                JSR label108
                JSR label109
                JSR label110
                LDA #$81
                STA $D412
                JSR label111
                JMP label112
                BRK
label116        LDA $03FE
                BEQ branch193
                DEC $03FE
                RTS
branch193       LDY #$00
branch194       LDA $07E1,Y
                EOR #$80
                STA $07E1,Y
                INY
                CPY #$06
                BNE branch194
                LDA #$08
                JMP label113
                RTS
label93         LDA $03FD
                BNE branch195
                LDA #$01
                STA $03FD
label130        LDA #$00
                JSR label114
                LDA #$08
                STA $D40C
                LDA #$0A
                STA $D40D
                LDA #$21
                STA $D40B
                LDA #$20
                STA $D407
                STA $D408
branch195       LDA #$01
                STA $033D
                RTS
label89         LDA #$00
                STA $03FD
                JMP label115
label113        STA $03FE
                LDY #$00
branch196       LDA $D02A,Y
                EOR #$03
                STA $D02A,Y
                INY
                CPY #$03
                BNE branch196
                RTS
label103        LDA $03FC
                BNE branch197
                JMP label116
branch197       LDA #$01
                STA $D02A
                STA $D02B
                STA $D02C
                LDA #$20
                LDY #$00
branch198       STA $07E1,Y
                INY
                CPY #$07
                BNE branch198
                RTS
label69         LDA $03FF
                CMP #$06
                BEQ branch199
branch200       JMP label117
branch199       LDA $0342
                CMP #$C8
                BCC $144C
                LDA $0340
                CMP #$D8
                BCC $144C
                CMP #$E8
                BCS $144C
                LDA $03FC
                BNE branch201
                LDA $D007
                CMP #$D4
                BNE branch202
                LDA #$E0
                STA $D00C
                LDA #$E0
                STA $D00D
                LDA #$08
                STA $D02D
branch202       LDA $D015
                EOR #$40
                STA $D015
                LDA #$E0
                STA $07FE
                LDY #$03
branch203       TYA
                ASL
                TAX
                DEC $D007,X
                DEY
                CPY #$FF
                BNE branch203
                LDA $D007
                CMP #$1F
                BEQ branch204
                LDA $D015
                AND #$F8
                STA $D015
                JMP label14
branch204       LDA #$01
                STA $03FC
                LDA $D015
                AND #$3F
                JSR label118
                INC $033B
                LDA $033B
                LSR
                BCS $14C4
                LSR
                BCS $14C4
                JMP label119
branch205       RTS
branch201       LDY #$00
branch206       JSR label120
                INY
                CPY #$04
                BNE branch206
                NOP
                JSR label121
                CMP #$D4
                BEQ branch207
                JMP label14
branch207       LDA #$00
                STA $03FC
                STA $03FF
                LDY #$00
branch208       LDA $0400,Y
                STA $0880,Y
                INY
                CPY #$28
                BNE branch208
                JSR label122
                LDA #$A0
                STA $0340
                LDA #$00
                STA $0341
                STA $0348
                STA $0349
                LDA #$D4
                STA $0342
                STA $D001
                STA $D003
                LDA #$A0
                STA $D000
                STA $D002
                LDA #$00
                STA $D010
                LDA $D015
                EOR #$03
                STA $D015
                LDA #$C0
                STA $07FE
                LDA #$04
                STA $D02D
                RTS
label119        JSR label123
                LDA $033B
                CMP #$08
                BNE branch209
                LDA #$00
                STA $033B
branch209       LDA $033A
                CMP #$06
                BEQ branch210
                INC $033A
branch210       LDX #$00
branch212       LDA $0410,X
                CMP #$80
                BEQ branch211
                INX
                CPX #$07
                BNE branch212
                JMP label124
branch211       LDA #$3B
                STA $0410,X
label124        JMP label125
                BRK
label104        LDA $03A8
                BNE branch213
                JMP label126
branch213       LDX #$06
                JSR label127
branch214       RTS
label126        JSR label128
                LDA $8E
                CMP #$01
                BCS $156D
                LDA $A2
                AND #$03
                TAX
                CLC
                ADC #$C7
                STA $07FF
                LDA $15DF,X
                STA $D02E
                LDA $8D
                AND #$03
                STA $8D
                LDA $A2
                AND #$1F
                CLC
                ADC $8E
                STA $8D
                LDA #$00
                STA $8E
                ASL $8D
                ASL $8D
                ASL $8D
                ROL $8E
                CLC
                LDA $8D
                ADC #$16
                STA $8D
                BCC $15AE
                INC $8E
branch215       LDA $8D
                STA $D00E
                LDA #$00
                STA $D00F
                LDA #$01
                STA $03A8
                LDA $8E
                BEQ branch216
                LDA $D010
                AND #$7F
                EOR #$80
                STA $D010
label129        LDA $D015
                EOR #$80
                STA $D015
                RTS
branch216       LDA $D010
                AND #$7F
                STA $D010
                JMP label129
                SLO $0507
                ASL $A2
                ASL $20
                BRK
                ASL $AD,X
                AND $D003,X
                ORA ($60,X)
                LDA #$00
                STA $03A8
                LDA $D015
                AND #$7F
                STA $D015
                JMP label130

                *=$15FE
                !byte $FF, $00, $AD
                !byte $FD, $03, $8D
                !byte $FE, $15, $A9
                !byte $01, $8D
                !byte $FD, $03, $20
                !byte $BC, $12, $AD
                !byte $FE, $15, $8D
                !byte $FD, $03, $60

label105        LDA $D015
                AND #$80
                BEQ $1614; check branch217
                JMP label131
                BRK
label134        PHA
                LSR
                LSR
                LSR
                LSR
                JSR label132
                TAX
                PLA
                AND #$0F
                JSR label132
                PHA
                TXA
                JSR label1
                PLA
                JMP label1
label132        CLC
                ADC #$F6
                BCC $163F
                ADC #$06
branch218       ADC #$3A
                RTS
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
label136        SED
                CLC
                LDA $1642
                ADC $23
                STA $1642
                LDA $1643
                ADC $24
                STA $1643
                BCC $165F
                JSR label133
branch219       CLD
                LDA #$13
                JSR label1
                LDY #$06
                LDA #$1D
branch220       JSR label1
                DEY
                BNE branch220
                LDA $1644
                JSR label134
                LDA $1643
                JSR label134
                LDA $1642
                JMP label135
label133        LDA $1644
                ADC #$00
                STA $1644
                RTS
label114        LDA #$25
                STA $23
                LDA #$01
                STA $24
                JSR label136
                LDA #$00
                STA $D40B
                RTS
label97         AND #$BF
                EOR #$40
                RTS
branch227       TYA
                ASL
                TAX
                INC $D007,X
                RTS
                BRK
label107        LDX #$00
branch222       LDY $16D0,X
                LDA $7000,Y
                STA $F8
                LDA $7001,Y
                STA $F9
                LDA $7002,Y
                STA $FA
                LDA $7003,Y
                BEQ branch221
                STX $B1
                JSR label137
                LDX $B1
branch221       INX
                CPX #$14
                BNE branch222
                RTS

                *=$16CE
                !byte $00
                !byte $00
                !byte $00
                !byte $08
                !byte $10, $18
                !byte $20, $28, $30
                !byte $38
                !byte $40
                !byte $48
                !byte $50, $58
                !byte $60
                !byte $58
                !byte $70, $78
                !byte $80, $88
                !byte $90, $98
                !byte $A0, $A8
                !byte $B0, $B8
                !byte $66, $67
                !byte $68
                !byte $69, $6A
                !byte $6B, $00
                !byte $00
                !byte $6C, $6D, $6D
                !byte $6F, $70, $71
                !byte $00
                !byte $00
                !byte $BC, $BD, $BE
                !byte $BF, $00, $C1
                !byte $00
                !byte $00
                !byte $C2, $C3
                !byte $C4, $C5
                !byte $C6, $C7
                !byte $00
                !byte $00
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $00
                !byte $00

label139        LDA $F8
                STA $FC
                LDA $F9
                CLC
                ADC #$D4
                STA $FD
                LDA $FB
                ASL
                ASL
                ASL
                CLC
                ADC #$E0
                STA $23
                JSR label138
                NOP
                LDY #$00
branch228       LDA ($23),Y
                PHA
                LDX $177E,Y
                STY $B2
                TXA
branch224       TAY
                PLA
                STA ($F8),Y
                LDX $FB
                LDA $1765,X
                PHA
                TXA
                TAX
                PLA
                STA ($FC),Y
                LDY $B2
                INY
                CPY #$06
                BNE branch228
                INC $FB
                LDA $FB
                CMP #$06
                BNE branch229
                LDA #$00
                STA $FB
branch229       LDX $B1
branch225       LDY $16D0,X
                LDA $FA
                STA $7002,Y
                LDA $FB
                STA $7003,Y
                RTS
                PHP
                SLO $02
                NOP $00
                BRK
label137        STA $FB
                LDA $FA
                BNE branch230
                LDA #$01
                STA $FA
                JMP label139
branch230       DEC $FA
                JMP label140
                BRK
                ORA ($02,X)
                PLP
                AND #$2A
label138        LDA #$00
                ADC #$16
                STA $24
                RTS
label148        LDA $8E
                AND #$0F
                STA $8E
                LDA $D41B
                AND #$03
                CLC
                ADC $8E
                RTS
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
label149        LDA $23
                STA $7800,Y
                RTS
label151        STA $7802,Y
                JMP label141
label162        LDA $D4AB
                CMP #$80
                BCS $17B6
                JSR label142
branch231       LDA $D41B
                RTS
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
label106        LDA $D015
                AND #$04
                BNE branch232
branch233       STA $0339
                RTS
branch232       TAX
                LDA $0339
                BNE branch233
                NOP
                STX $0339
                JSR label143
                LDA $23
                STA $F8
                LDA $24
                STA $F9
                JMP label144
label72         JSR label145
                LDA $07F8
                JMP label146
label144        LDX #$00
branch235       LDY $16D0,X
                LDA $7003,Y
                BEQ branch234
                INX
                CPX #$14
                BNE branch235
                BRK
                BRK
                BRK
branch234         LDA $F8
                JSR label147
                LDA $F9
                STA $7001,Y
                LDA #$01
                STA $7003,Y
                LDA #$00
                STA $7002,Y
                RTS
label143          JSR label145
                LDA $07F8
                CMP #$C2
                BNE branch236
                INC $25
branch236         INC $25
                LDA $23
                CLC
                ADC $25
                STA $23
                BCC $182C
                INC $24
branch237         RTS
                BRK
                BRK
                BRK
label181          JSR label115
                LDA $8D
                CMP #$40
                BCC $183C
                JMP label141
branch238         JSR label148
                STA $23
                LDA #$00
                STA $24
                ASL $23
                ASL $23
                ASL $23
                LDA $23
                STA $25
                LDA $24
                STA $26
                ASL $23
                ROL $24
                ASL $23
                ROL $24
                LDA $23
                ADC $25
                STA $23
                LDA $24
                ADC $26
                STA $24
                CLC
                LDA $23
                ADC #$76
                STA $23
                LDA $24
                ADC #$04
                STA $24
                LDX #$00
branch240       LDY $16D0,X
                LDA $7802,Y
                BEQ branch239
                INX
                CPX #$0C
                BNE branch240
                JMP label141
branch239       JSR label149
                LDA $24
                STA $7801,Y
                LDA #$26
                STA $7803,Y
                LDA $8E
                AND #$0F
                JSR label150
                LDA #$01
                JMP label151
                RTS
label141        LDX #$00
branch242       LDY $16D0,X
                LDA $7802,Y
                BEQ branch241
                LDA $7800,Y
                STA $F8
                LDA $7801,Y
                STA $F9
                LDA $7802,Y
                STA $FA
                LDA $7803,Y
                STA $FB
                STX $B1
label252        JSR label152
                LDX $B1
branch241       INX
                CPX #$0C
                BNE branch242
                RTS
label152        LDA $033B
                ASL
                TAX
                LDA $18DD,X
                PHA
                LDA $18DC,X
                PHA
                RTS

                *=$18D9
                !byte $00
                !byte $00
                !byte $00
                !byte $D3, $19
                !byte $0A
                !byte $1C, $0A, $1C
                !byte $FF, $1C, $F2
                !byte $1C, $0A, $1C
                !byte $D3, $19
                !byte $F2
                !byte $1C, $AD, $3B
                !byte $03, $0A
                !byte $0A
                !byte $AA

                LDY #$00
branch243       LDA $1904,X
                STA $03E8,Y
                INY
                INX
                CPY #$04
                BNE branch243
                JMP label153

                *=$1903
                !byte $00
                !byte $43, $44
                !byte $45, $46
                !byte $3F, $40, $41
                !byte $42
                !byte $47, $48
                !byte $49, $4A
                !byte $4F, $50, $51
                !byte $52
                !byte $53, $54
                !byte $55, $56
                !byte $57, $58
                !byte $59, $5A
                !byte $5B, $5C, $5D
                !byte $5E, $5F, $60
                !byte $61, $62

;                BRK
;                SRE ($44,X)
;                EOR $46
;                RLA $4140,X
;                JAM
;                SRE $48
;                EOR #$4A
;                SRE $5150
;                JAM
;                SRE ($54),Y
;                EOR $56,X
;                SRE $58,X
;                EOR $5A,Y
;                SRE $5D5C,Y
;                LSR $605F,X
;                ADC ($62,X)

label161        LDX $B1
                JSR label154
                LDA $7804,Y
                STA $02
                LDX #$00
                CLC
                LDA $FC
                STA $F8
                LDA $FD
                ADC #$D4
                STA $F9
branch244         LDY $2F60,X
                LDA $03E8,X
                STA ($FC),Y
                LDA $02
                STA ($F8),Y
                INX
                CPX #$04
                BNE branch244
                LDX $B1
                LDY $16D0,X
                LDA $F8
                STA $7800,Y
                LDA $FD
                STA $7801,Y
                LDA $FA
                STA $7802,Y
                LDA $FB
                STA $7803,Y
                RTS
label164          CLC
                LDA $F8
                ADC #$28
                STA $FC
                LDA $F9
                ADC #$00
                STA $FD
                RTS
                SEC
                LDA $F8
                SBC #$28
                STA $FC
                LDA $F9
                SBC #$00
                STA $FD
                RTS
                LDA $F8
                CLC
                ADC #$01
                STA $FC
                LDA $F9
                ADC #$00
                STA $FA
                RTS
label247          SEC
                SBC #$01
                STA $FC
                LDA $F9
                SBC #$00
                STA $FD
                RTS
label159          LDY #$00
                LDA #$00
                STA $033D
                LDX #$00
branch248         LDY $2F60,X
                LDA ($FC),Y
                LDA ($FC),Y
                CMP #$20
                BNE branch245
                JMP label155
branch245         CMP $08CF
                BEQ branch246
                CMP $08A9
                BEQ branch246
                CMP $08A8
                BEQ branch246
                JSR label156
                BCC $19CD
branch246         LDA #$01
                STA $033D
                RTS
branch247         INX
                CPX #$04
                BNE branch248
                RTS
                BRK
                JSR label157
                DEC $FB
                LDA $FB
                BPL branch249
                JMP label158
branch249       JSR label159
                LDA $033D
                BEQ branch250
label165          INC $FB
                JMP label160
branch250         JMP label161
label158          JSR label157
                JSR label157
                LDA #$28
                STA $FB
                JSR label162
                NOP
                NOP
                CMP #$80
                BCC $1A03
branch251         JSR label163
                JMP label161
label160          LDX $B1
                LDY $16D0,X
                LDA #$00
                STA $7802,Y
                JMP label144
label154          LDX #$00
branch252         LDY $2F60,X
                LDA #$20
                STA ($F8),Y
                INX
                CPX #$04
                BNE branch252
                LDX $B1
                LDY $16D0,X
                RTS
label147          STA $7000,Y
                LDA #$00
                STA $D412
                LDA #$38
                STA $D413
                LDA #$0A
                STA $D414
                LDA #$81
                STA $D412
                LDA #$10
                STA $D40E
                STA $D40F
                RTS
label150          LDA $D41B
                AND #$07
                TAX
                LDA $1A57,X
                STA $7804,Y
                RTS
                ASL $0906
                PHP
                ORA $02
                JAM
                ORA $00
label142        JSR label163
                JSR label154
                LDA $FC
                STA $F8
                LDA $FD
                STA $F9
                RTS
                BRK
label163        JSR label164
                JSR label159
                LDA $033D
                BNE branch253
                RTS
branch253       PLA
                PLA
                JMP label165
label61         LDX $23
                STX $27
                LDX $24
                STX $28
                CMP $03E8
                BNE branch254
branch256       JMP label166
branch254       CMP $03EA
                BNE branch255
                SEC
                LDA $27
                SBC #$28
                STA $27
                BCS $1A8E
                DEC $28
branch258       JMP label166
branch255       CMP $03E9
                BNE branch257
                SEC
                LDA $27
                SBC #$01
                STA $27
                BCS $1AA1
                DEC $28
branch260       JMP label166
branch257       CMP $03EB
                BEQ branch259
                JMP label167
branch259       SEC
                LDA $27
                SBC #$29
                STA $27
                BCS $1AB4
                DEC $28
label166        JSR label168
                LDA $27
                STA $F8
                LDA $28
                STA $F9
                LDX #$00
branch262       LDY $16D0,X
                LDA $F8
                CMP $7800,Y
                BNE branch261
                LDA $F9
                CMP $7801,Y
                BNE branch261
                JMP label169
branch261       INX
                CPX #$0C
                BNE branch262
                BRK
                BRK
                BRK
label169        LDA #$00
                STA $7802,Y
                PLA
                PLA
                JMP label144
label168        LDA #$25
                STA $23
                LDA #$00
                STA $24
                JSR label136
label167        JSR label170
                JMP label171
label192        INC $0334
                LDA $0334
                ROR
                BCC $1B18
                RTS
branch263       JMP label172
                JSR label107
                BRK
                BRK
label108        LDA $0334
                CMP #$03
                BEQ branch264
                INC $0334
                RTS
branch264       LDA #$00
                STA $0334
                JMP label173
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
label172        ROR
                BCC $1B41
                RTS
branch265       JMP label173
label178        CLC
                LDA $F8
                ADC #$29
                STA $FC
                LDA $F9
                ADC #$00
                STA $FD
                RTS
label174        SEC
                LDA $F8
                SBC #$29
                STA $FC
                LDA $F9
                SBC #$00
                STA $FD
                RTS
label179        CLC
                LDA $F8
                ADC #$27
                STA $FC
                LDA $F9
                ADC #$00
                STA $FD
                RTS
label176        SEC
                LDA $F8
                SBC #$27
                STA $FC
                LDA $F9
                SBC #$00
                STA $FD
                RTS
label180        LDX $B1
                LDY $16D0,X
                LDA $7805,Y
                BNE branch266
                LDA $D41B
                AND #$03
                CLC
                ADC #$01
                STA $7805,Y
branch266       CMP #$01
                BNE branch267
                LDA $FB
                BEQ branch268
                LDA $033D
                DEC $FB
                JSR label174
                JSR label159
                LDA $033D
                BNE branch269
branch271         JMP label161
branch269         INC $FB
branch268         JMP label175
branch267         CMP #$02
                BNE branch270
                LDA $FB
                CMP #$26
                BEQ branch268
                INC $FB
                JSR label176
                JSR label159
                LDA $033D
                BEQ branch271
                DEC $FB
                JMP label177
branch270         CMP #$03
                BNE branch272
                LDA $FB
                CMP #$26
                BEQ branch268
                INC $FB
                JSR label178
                JSR label159
                LDA $033D
                BEQ branch271
                DEC $FB
branch273         JMP label177
branch272         CMP #$04
                BNE branch273
                LDA $FB
                BEQ branch268
                JSR label179
                DEC $FB
                JSR label159
                LDA $033D
                BEQ branch271
                INC $FB
label175          LDX $B1
                LDY $16D0,X
                LDA #$00
                STA $7805,Y
                RTS
                LDA $D41B
                CMP #$08
                BCC $1C12
branch274         JMP label180
label153          LDA $03E8
                CMP #$47
                BEQ branch275
                JMP label181
branch275         LDX #$00
branch276         LDA $2A38,X
                PHA
                LDA $2A58,X
                STA $2A38,X
                PLA
                STA $2A58,X
                INX
                CPX #$20
                BNE branch276
                JMP label181
                BRK
label182          SEC
                LDA $0342
                SBC #$2C
                LSR
                LSR
                LSR
                STA $23
                LDA $0341
                STA $25
                LDA $0340
                SEC
                SBC #$10
                STA $24
                LSR $25
                ROR $24
                LSR $24
                LSR $24
                LDA $F8
                STA $50
                LDA $F9
                STA $51
                LDA #$00
                STA $52
branch279         SEC
                LDA $50
                SBC #$28
                STA $50
                BCS $1C6F
                DEC $51
branch277         LDA $51
                CMP #$03
                BEQ branch278
                INC $52
                BNE branch279
branch278         LDA $52
                STA $53
                LDA #$00
                STA $54
                ASL $53
                ASL $53
                ASL $53
                LDA $53
                STA $55
                ASL $53
                ROL $54
                ASL $53
                ROL $54
                CLC
                LDA $53
                ADC $55
                STA $53
                LDA $54
                ADC #$04
                STA $54
                SEC
                LDA $F8
                SBC $53
                STA $51
                RTS
label185          JSR label182
                LDA $23
                CMP $52
                BCS $1CCE
                LDA $24
                CMP $51
                BCS $1CBD
                JSR label174
                JMP label183
branch281         JSR label176
label183          JSR label159
                LDA $033D
                BNE branch282
                JMP label161
branch282         JMP label184
branch280         LDA $24
                CMP $51
                BCS $1CDA
                JSR label179
                JMP label183
branch283         JSR label178
                JMP label183
label184          LDX $B1
                LDY $16D0,X
                LDA $D41B
                AND #$03
                CLC
                ADC #$01
                STA $7805,Y
                JMP label180
                LDA $D41B
                CMP #$E0
                BCC $1CFD
                JMP label180
branch284         JMP label185
                JSR label182
                LDA $23
                CMP $52
                BCS $1D0F
                JSR label174
                JMP label186
branch285         JSR label179
label186          JSR label159
                LDA $033D
                BNE branch286
                JMP label161
branch286         JMP label160
label110          LDA $D01F
                STA $D01F
                AND #$02
                BNE branch287
                RTS
branch287         JSR label187
                CLC
                LDA $23
                ADC $25
                STA $23
                BCC $1D39
                INC $24
branch288         LDA $23
                SEC
                SBC #$25
                STA $23
                BCS $1D44
                DEC $24
branch289         LDY #$00
                LDA ($23),Y
                JSR label188
                LDY #$28
                LDA ($23),Y
                JSR label188
                LDA $D01F
                RTS
label188          CMP $03E8
                BNE branch290
branch291         JMP label189
branch290         CMP $03E9
                BEQ branch291
                CMP $03EA
                BEQ branch291
                CMP $03EB
                BEQ branch291
                RTS
label189          PLA
                PLA
label207          LDA $23
                STA $F8
                LDA $24
                STA $F9
                JSR label144
                LDA $D015
                AND #$F8
                STA $D015
                JSR label190
branch293         JSR label99
                JSR label191
                JSR label101
                JSR label102
                LDA $03FF
                CMP #$06
                BNE branch292
                JSR label103
branch292         LDA #$00
                STA $033E
                JSR label104
                JSR label105
                JSR label106
                JSR label107
                JSR label192
                JSR label193
                JSR label110
                LDA #$81
                STA $D412
                JSR label194
                DEC $0336
                BNE branch293
                JSR label195
                JMP label196
label199        LDA #$40
                STA $0336
label193        RTS
                BRK
label196        LDX #$00
branch295       LDY $16D0,X
                LDA $7802,Y
                BEQ branch294
                LDA #$00
                STA $7802,Y
                LDA $7800,Y
                STA $F8
                LDA $7801,Y
                STA $F9
                STX $B1
                JSR label154
                LDX $B1
branch294       INX
                CPX #$0C
                BNE branch295
                NOP
                LDA #$A0
                STA $0340
                LDA #$00
                JMP label197
label197          LDA #$D4
                STA $0342
                STA $D001
                STA $D003
                LDA #$A0
                STA $0340
                STA $D002
                STA $D000
                LDA #$00
                STA $0341
                LDA $D010
                AND #$F8
                STA $D010
                LDA $D01F
                LDA $D015
                EOR #$03
                STA $D015
                LDX #$F8
                TXS
                JMP label198
label194          JSR label68
                JSR label79
                JMP label68
label200          LDX #$00
branch297         LDY $16D0,X
                LDA $03A0,Y
                CMP #$00
                BEQ branch296
                LDA #$02
                STA $03A0,Y
branch296         INX
                CPX #$04
                BNE branch297
                LDA $0390
                CMP #$01
                BNE branch298
                LDA #$00
                STA $0390
                LDA #$98
                STA $D008
                LDA #$7C
                STA $D009
branch298         LDA $0398
                CMP #$01
                BNE branch299
                LDA #$00
                STA $0398
                LDA #$40
                STA $D00A
                LDA #$5C
                STA $D00B
branch299         JMP label199
label190          LDA #$00
                STA $0340
                STA $0342
                JMP label200
                BRK
                BRK
                BRK
label262          LDA #$00
                STA $033B
                STA $033C
                LDA #$00
                STA $D015
                JSR label201
                STA $1642
                STA $1643
                STA $1644
                STA $0334
                LDA #$30
                LDX #$00
branch300         STA $0887,X
                INX
                CPX #$06
                BNE branch300
                LDA #$80
                LDX #$00
branch301         STA $088C,X
                INX
                CPX #$0C
                BNE branch301
                LDX #$00
                LDA #$3B
branch302         STA $0890,X
                INX
                CPX #$05
                BNE branch302
                JSR label202
                LDA #$00
                LDX #$00
branch303         STA $7000,X
                STA $7800,X
                INX
                BNE branch303
                LDA #$00
                LDX #$00
branch304         STA $0350,X
                INX
                CPX #$70
                BNE branch304
                JSR label203
                JMP label197
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
label195          LDX #$00
branch306         LDA $0410,X
                CMP #$80
                BEQ branch305
                INX
                CPX #$06
                BNE branch306
branch305         CPX #$00
                BNE branch307
                JMP label204
branch307         DEX
                LDA #$80
                STA $0410,X
                RTS
                CPX $0017
                BRK
label2          LDA #$02
                LDX #$00
branch308         STA $DBC4,X
                INX
                CPX #$06
                BNE branch308
                LDX #$00
branch309         LDA #$05
                STA $DBCA,X
                INX
                CPX #$0A
                BNE branch309
                LDX #$00
branch310       LDA $1F40,X
                STA $D027,X
                INX
                CPX #$08
                BNE branch310
                JMP label205
*=$1F40
!byte $07, $0E
!byte $02
!byte $01, $01
!byte $01, $04
!byte $07, $AD
!byte $F0, $03
!byte $F0, $06
!byte $CE, $F0, $03
!byte $60
                NOP
                NOP
branch312       LDA #$40
                STA $03F0
                LDX $03F1
                LDA $07C4,X
                CLC
                ADC #$01
                STA $07C4,X
                CMP #$7F
                BNE branch313
                DEC $03F1
branch313         RTS
label198          LDA #$60
                STA $03F0
                LDA #$0F
                STA $03F1
                LDX #$00
branch314         LDA $08D0,X
                STA $07C0,X
                INX
                CPX #$20
                BNE branch314
                JMP label112
branch316         JSR label206
                LDA $03F1
                BPL branch315
                JMP label207
branch315         RTS
label125          JSR label208
                JMP label209
label111          LDA $D015
                AND #$04
                BNE branch316
                RTS
                STA $D015
label212          LDX #$00
branch318         LDY $16D0,X
                LDA $7802,Y
                BEQ branch317
                LDA #$00
                STA $7802,Y
                LDA $7800,Y
                STA $F8
                LDA $7801,Y
                STA $F9
                STX $B1
                JSR label154
                LDX $B1
branch317         INX
                CPX #$0C
                BNE branch318
                RTS
label109          LDA #$3E
                STA $04E7
                STA $0543
                STA $05EF
                LDA #$3D
                STA $0548
                STA $05F4
                STA $04EC
                LDA #$05
                STA $D8E7
                STA $D943
                STA $D9EF
                STA $D8EC
                STA $D9F4
                STA $D948
                LDX #$04
branch319         LDA #$3C
                STA $04E7,X
                STA $0543,X
                STA $05EF,X
                LDA #$05
label241          STA $D943,X
                STA $D8E7,X
                STA $D9EF,X
                DEX
                BNE branch319
                RTS
                BRK
label100          LDA $D010
                AND #$01
                BEQ branch320
                RTS
branch320         JMP label191
                BRK
label121          JSR label210
                LDA $D007
                RTS
label118          STA $D015
                LDA #$60
                STA $03F0
                LDA #$0F
label236          STA $03F1
                LDX #$00
branch321         LDA $08D0,X
                STA $07C0,X
                INX
                CPX #$20
                BNE branch321
                RTS
                BRK
                BRK
label204          LDX #$00
branch322         LDA $0400,X
                STA $0880,X
                INX
                CPX #$28
                BNE branch322
                JMP label211
branch325         LDX #$00
branch323         LDA $0406,X
                STA $0422,X
                INX
                CPX #$06
                BNE branch323
                LDA $1642
                STA $8000
                LDA $1643
                STA $8001
                LDA $1644
                STA $8002
                RTS
label135          JSR label134
                LDA $8002
                CMP $1644
                BEQ branch324
                BCC $2050
branch326         RTS
branch324         LDA $8001
                CMP $1643
                BCC $2050
                BNE branch326
                LDA $8000
                CMP $1642
                BCC $2050
                RTS
label208        JSR label212
                LDA $D015
                EOR #$03
                STA $D015
                LDA #$00
                STA $03FC
                LDX #$00
                LDA #$20
branch327       STA $07E1,X
                INX
                CPX #$06
                BNE branch327
                JMP label198
label267        LDA #$01
                STA $034B
                LDA #$00
                STA $0348
                STA $D010
                RTS
                BRK
                BRK
label156        LDY #$00
branch329       CMP $20D8,Y
                BNE branch328
                PLA
                PLA
                LDA #$01
                STA $033D
                RTS
branch328       INY
                CPY #$18
                BNE branch329
                CLC
                LDY #$00
                RTS
                BRK
                BMI $20EE
                SLO ($0F,X)
                JAM
                ORA $07
                PHP
                ORA #$3B
                NOP
                AND ($32),Y
                RLA ($34),Y
                AND $36,X
                RLA $38,X
                AND $0080,Y
                BRK
label0          LDA #$00
                STA $8000
                STA $8001
branch335       STA $8002
                SEI
                LDA #$31
                STA $0314
                STA $0314
                LDA #$EA
                STA $0315
                CLI
                JMP label213
                BRK
                BRK
                BRK
label211        LDA #$00
                JSR label214
                LDA #$93
                JSR label1
                LDX #$00
branch331       LDA $0880,X
                STA $0400,X
                LDA #$01
                STA $D800,X
                INX
                CPX #$28
                BNE branch331
                LDA #$00
                LDX #$00
branch332       STA $D000,X
                INX
                CPX #$10
                BNE branch332
                LDA #$00
                LDX #$00
branch333       STA $D029,X
                INX
                CPX #$06
                BNE branch333
                LDX #$00
branch334       LDA $2154,X
                STA $D000,X
                INX
                CPX #$11
                BNE branch334
                JMP label215
                BRK
                BRK
                BRK
                BRK
                CLC
                RTS
                JMP label216
                RTS

                *=$215E
                !byte $C0, $60
                !byte $F4, $60
                !byte $28
                !byte $60
                !byte $80, $A9
                !byte $FF, $8D, $1D
                !byte $D0, $8D
                !byte $17, $D0

                LDA #$DA
                STA $07F9
                LDA #$DB
                JSR label217
                LDA #$0E
                STA $D028
                LDA #$07
                STA $D027
                LDA #$FF
                STA $D015
                LDA #$60
                STA $D001
                STA $D003
branch339       INC $D000
                INC $D002
                BNE branch336
                LDA $D010
                EOR #$03
                STA $D010
branch336       JSR label218
                LDX #$00
branch338       TXA
                ASL
                TAY
                LDA $D000
                CMP $21E0,X
                BNE branch337
                JSR $21E8 ; check label219
                JSR label220
branch337       INX
                CPX #$06
                BNE branch338
                LDA $D010
                AND #$03
                BEQ branch339
                LDA $D000
                CMP #$60
                BNE branch339
                JMP label221
label224        LDX #$F0
branch341       LDY #$B0
branch340       JSR label222
                INY
                BNE branch340
                INX
                BNE branch341
                RTS
                
                *=$21D8
                !byte $02
                !byte $02
                !byte $02
                !byte $06, $06
                !byte $06, $06
                !byte $00
                !byte $18
                !byte $4C, $80, $C0
                !byte $F4, $28
                !byte $00
                !byte $00
                !byte $C9, $28
                !byte $D0, $0D

                LDA $D010
                AND #$03
                BNE  $21F6; check branch343
                LDA #$00
                BIT $06A9
                RTS
branch342       LDA $D010
                AND #$03
                BNE branch344
                LDA $21D8,X
                RTS
branch344       LDA $D029,X
                RTS
label217        STA $07F8
                LDA #$E1
                STA $07FA
                LDA #$E2
                STA $07FB
                STA $07FE
                LDA #$E3
                STA $07FC
                STA $07FF
                LDA #$E4
                STA $07FD
                RTS
label220        CMP #$02
                BEQ branch345
                CMP #$06
                BEQ branch345
                RTS
                BRK
branch345       STA $D029,X
                LDA #$00
                STA $D40B
                LDA #$08
                STA $D40C
                LDA #$0A
                STA $D40D
                LDA #$11
                STA $D40B
                LDA #$10
                STA $D407
                STA $D408
                RTS
label218        LDA $07F9
                CMP #$DE
                BNE branch346
                LDA #$DC
                STA $07F9
                JMP label224
branch346       INC $07F9
                JMP label224
label221        LDA #$08
                STA $F8
branch348       LDX #$00
branch347       LDA $D029,X
                EOR #$04
                STA $D029,X
                INX
                CPX #$06
                BNE branch347
                JSR label224
                JSR label224
                DEC $F8
                BNE branch348
                LDA #$08
                STA $F8
branch350       LDX #$00
                LDA $D015
branch349       LDA $22AB,X
                LDA $22AF,X
                STA $D015
                STX $B1
                JSR label224
                NOP
                NOP
                NOP
                LDX $B1
                INX
                CPX #$06
                BNE branch349
                DEC $F8
                BNE branch350
                LDA #$FF
                STA $D015
                JMP label225

                *=$22AF
                !byte $04, $08
                !byte $10, $20
                !byte $40
                !byte $80, $A0
                !byte $00
                !byte $98
                !byte $0A
                !byte $AA
                !byte $DE, $05, $D0

                INY
                CPY #$06
                BNE $22B7 ; check branch352
                JSR label224
                LDA $D005
                CMP #$40
                BNE $22B5 ; check branch353
                LDX #$00
branch354       LDA $22E1,X
                STA $0555,X
                LDA #$01
                STA $D955,X
                INX
                CPX #$07
                BNE branch354
                JMP label226

                *=$22E1
                !byte $01, $15
                !byte $14, $08
                !byte $0F, $12, $3A

label226        LDA #$00
                STA $FF
branch357       LDA #$07
                STA $F9
                LDA #$CC
                STA $F8
                JSR label227
                LDX #$00
branch356       LDY #$00
                LDA #$20
                STA ($F8),Y
                STX $B1
                LDX $FF
                SEC
                LDA $F8
                SBC #$27
                STA $F8
                BCS $230E
                DEC $F9
branch355       LDA $235B,X
                STA ($F8),Y
                LDA $F8
                STA $FB
                LDA $F9
                CLC
                ADC #$D4
                STA $FC
                LDA #$01
                STA ($FB),Y
                JSR label228
                LDX $B1
                INX
                CPX #$10
                BNE branch356
                INC $FF
                LDA $FF
                CMP #$09
                BNE branch357
                JMP label229
label227        CLC
                LDA $F8
                ADC $FF
                STA $F8
                LDA #$00
                STA $D40B
                LDA #$88
                STA $D40C
                LDA #$09
                STA $D40D
                LDA #$81
                STA $D40B
                LDA #$08
                STA $D407
                STA $D408
                RTS

                *=$235B
                !byte $09, $2E
                !byte $0D, $2E, $13
                !byte $03, $15
                !byte $0C, $0C, $A2
                !byte $FE, $A0, $A0
                !byte $20, $40, $39
                !byte $C8
                !byte $D0, $FA
                !byte $E8
                !byte $D0, $F5
                !byte $60

label229        LDA #$81
                STA $D412
                LDA #$60
                STA $D001
                STA $D003
                LDA $D01D
                AND #$FC
                STA $D01D
                STA $D017
                LDA $D010
                AND #$FC
                STA $D010
                LDA #$00
                STA $D000
                STA $D002
                LDA #$B8
                STA $F8
                LDA #$E0
                STA $FA
                LDA #$23
                STA $FB
                LDX #$05
branch361       STX $F9
                LDY #$00
branch360       LDA ($FA),Y
                STA ($F8),Y
                LDA $F8
                STA $FC
                LDA $F9
                CLC
                ADC #$D4
                STA $FD
                LDA $FA
                STA $FE
                LDA $FB
                CLC
                ADC #$02
                STA $FF
                LDA ($FE),Y
                STA ($FC),Y
                INY
                BNE branch360
                INC $FB
                INX
                CPX #$07
                BNE branch361
                JMP label230

                *=$23D7
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
;23e0
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $15, $13
                !byte $05, $20
                !byte $0A
                !byte $0F, $19, $13
                !byte $14, $09
                !byte $03, $0B
                !byte $20, $0F, $12
                !byte $20, $0B, $05
                !byte $19, $13, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $CE, $CE
                !byte $CE, $CE, $CE
                !byte $CE, $CE, $CE
                !byte $CE, $CE, $CE
                !byte $CE, $CE, $CE
                !byte $CE, $CE, $CE
                !byte $CE, $CE, $CE
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $06, $33
                !byte $20, $2D, $20
                !byte $14, $08
                !byte $12
                !byte $15, $13
                !byte $14, $20
                !byte $20, $20, $20
                !byte $01, $20
                !byte $2D, $20, $0C
                !byte $05, $06
                !byte $14, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $06, $37
                !byte $20, $2D, $20
                !byte $08
                !byte $0F, $16, $05
                !byte $12
                !byte $20, $20, $20
                !byte $20, $20, $04
                !byte $20, $2D, $20
                !byte $12
                !byte $09, $07
                !byte $08
                !byte $14, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $13, $10
                !byte $01, $03
                !byte $05, $20
                !byte $2D, $20, $06
                !byte $09, $12
                !byte $05, $20
                !byte $28
                !byte $13, $14
                !byte $01, $12
                !byte $14, $29
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $06, $31
                !byte $20, $2D, $20
                !byte $0A
                !byte $0F, $19, $13
                !byte $14, $09
                !byte $03, $0B
                !byte $AF, $8B, $85
                !byte $99, $93, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $02, $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $02
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $01, $01
                !byte $20, $02, $20
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $20, $20, $20
                !byte $20, $01, $20
                !byte $02
                !byte $20, $05, $05
                !byte $05, $05
                !byte $05, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $01, $01
                !byte $20, $02, $20
                !byte $05, $05
                !byte $05, $05
                !byte $05, $20
                !byte $20, $20, $20
                !byte $20, $01, $00
                !byte $02
                !byte $20, $05, $05
                !byte $05, $05
                !byte $05, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $01, $01
                !byte $01, $01
                !byte $01, $20
                !byte $02
                !byte $20, $05, $05
                !byte $05, $05
                !byte $20, $0E, $0E
                !byte $0E, $0E, $0E
                !byte $0E, $0E, $20
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $01, $01
                !byte $20, $02, $20
                !byte $08
                !byte $08
                !byte $08
                !byte $08
                !byte $08
                !byte $08
                !byte $08
                !byte $08
                !byte $01, $08
                !byte $08
                !byte $08
                !byte $08
                !byte $20, $20, $20
                !byte $20, $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05
                !byte $05, $05

label203        LDA #$D4
                STA $D007
                LDA #$E0
                STA $D006
                LDA #$98
                STA $D008
                LDA #$7C
                STA $D009
                LDA #$5C
                STA $D00B
                LDA #$40
                STA $D00A
                LDA #$01
                STA $D02A
                STA $D02B
                STA $D02C
                LDA #$04
                STA $D02C
                LDA #$00
                STA $0190
                STA $0398
                STA $03A0
                STA $03A8
                LDA $033C
                ASL
                ASL
                TAX
                LDY #$00
branch362       LDA $276F,X
                STA $07FB,Y
                INY
                INX
                CPY #$04
                BNE branch362
                INC $033C
                LDA $033C
                CMP #$05
                BNE branch363
                LDA #$00
                STA $033C
branch363       CLC
                LDA $D015
                ADC #$38
                STA $D015
                NOP
                LDA #$00
                STA $03FF
                RTS

                *=$276F
                !byte $CB, $CC
                !byte $CD, $C0, $CE
                !byte $CF, $D0, $C0
                !byte $D1
                !byte $D2
                !byte $D3, $C0
                !byte $D4, $D5
                !byte $D6, $C0
                !byte $D7, $D8
                !byte $D9, $C0, $FF
                !byte $FF, $FF, $FF
                !byte $FF, $FF, $FF
                !byte $FF, $FF, $FF
                !byte $FF, $FF, $FF
                !byte $FF, $FF, $FF
                !byte $FF, $FF, $FF
                !byte $FF, $A9, $00

                STA $D015
                JMP $2700; check label203
                BRK
label157        LDA $F8
                JMP $1990 ; check label247

;                *=$27a5
;                !binary "./binaries/memory-27a5-5002.bin"

*=$27A5
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $91, $23
!byte $E6, $FD
!byte $A5, $FA
!byte $C9, $02
!byte $D0, $03
!byte $E6, $FC
!byte $60
!byte $C6, $FC
!byte $60
!byte $CC, $CB, $CA
!byte $C9, $D4
!byte $D2
!byte $D1
!byte $C9, $D5
!byte $D3, $CA
!byte $D1
!byte $D6, $05
!byte $D3, $D2
!byte $CC, $D6, $D5
!byte $D4, $20
!byte $CD, $CD, $CD
!byte $CE, $20, $CE
!byte $CE, $CF, $CF
!byte $20, $CF, $D0
!byte $D0, $D0
!byte $20, $CE, $CD
!byte $D1
!byte $D1
!byte $CF, $D2, $CD
!byte $D2
!byte $D0, $D3
!byte $D3, $CD
!byte $D4, $CF
!byte $CE, $D4, $D5
!byte $D0, $D5
!byte $CE, $D6, $D6
!byte $D0, $CF
!byte $20, $20, $20
!byte $20, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $30, $48
!byte $48
!byte $FC, $C4, $C4
!byte $C4, $00
!byte $F8
!byte $84, $84
!byte $F8
!byte $C4, $C4
!byte $F8
!byte $00
!byte $3C, $46, $40
!byte $C0, $C0
!byte $C6, $7C
!byte $00
!byte $F8
!byte $44, $44
!byte $46, $46
!byte $46, $F8
!byte $00
!byte $FE, $80, $80
!byte $FC, $C0, $C0
!byte $FE, $00, $FE
!byte $80, $80
!byte $FC, $C0, $C0
!byte $80, $00
!byte $7C, $86, $80
!byte $C0, $C6
!byte $C2, $7C
!byte $00
!byte $84, $84
!byte $84, $FC
!byte $86, $86
!byte $86, $00
!byte $08
!byte $08
!byte $08
!byte $08
!byte $18
!byte $18
!byte $18
!byte $00
!byte $08
!byte $08
!byte $08
!byte $0C, $0C, $4C
!byte $78
!byte $00
!byte $44, $44
!byte $48
!byte $70, $48
!byte $4C, $4C, $00
!byte $40
!byte $40
!byte $40
!byte $60
!byte $60
!byte $60
!byte $7C, $00, $76
!byte $8B, $8B
!byte $C9, $C9
!byte $C9, $C9
!byte $00
!byte $3C, $46, $46
!byte $C2, $C2
!byte $C2, $C2
!byte $00
!byte $78
!byte $C4, $84
!byte $86, $86
!byte $C6, $78
!byte $00
!byte $F8
!byte $8C, $8C, $F8
!byte $C0, $C0
!byte $C0, $00
!byte $3C, $66, $66
!byte $66, $E6
!byte $3C, $0E, $00
!byte $F0, $88
!byte $88
!byte $F8
!byte $C4, $C4
!byte $C4, $00
!byte $7C, $80, $80
!byte $7C, $06, $06
!byte $FC, $00, $FE
!byte $10, $10
!byte $18
!byte $18
!byte $18
!byte $18
!byte $00
!byte $84, $84
!byte $86, $06
!byte $86, $A6
!byte $FC, $00, $C4
!byte $C4, $C4
!byte $C4, $C4
!byte $68
!byte $10, $00
!byte $81, $81
!byte $81, $C9
!byte $C9, $C9
!byte $F7, $00
!byte $44, $44
!byte $44, $38
!byte $44, $46
!byte $46, $00
!byte $C2, $C2
!byte $C2, $7C
!byte $10, $18
!byte $18
!byte $00
!byte $7E, $02, $02
!byte $7E, $C0, $C0
!byte $FE, $00, $3C
!byte $30, $30
!byte $30, $30
!byte $30, $3C
!byte $00
!byte $0C, $12, $30
!byte $7C, $30, $62
!byte $FC, $00, $3C
!byte $0C, $0C, $0C
!byte $0C, $0C, $3C
!byte $00
!byte $00
!byte $04, $06
!byte $7F, $7F, $06
!byte $04, $00
!byte $00
!byte $10, $30
!byte $7F, $7F, $30
!byte $10, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $18
!byte $18
!byte $18
!byte $18
!byte $00
!byte $00
!byte $18
!byte $00
!byte $66, $66
!byte $66, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $66, $66
!byte $FF, $66, $FF
!byte $66, $66
!byte $00
!byte $18
!byte $3E, $60, $3C
!byte $06, $7C
!byte $18
!byte $00
!byte $62
!byte $66, $0C
!byte $18
!byte $30, $66
!byte $46, $00
!byte $3C, $66, $3C
!byte $38
!byte $67, $66
!byte $3F, $00, $06
!byte $0C, $18, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $0C, $18, $30
!byte $30, $30
!byte $18
!byte $0C, $00, $30
!byte $18
!byte $0C, $0C, $0C
!byte $18
!byte $30, $00
!byte $00
!byte $66, $3C
!byte $FF, $3C, $66
!byte $00
!byte $00
!byte $00
!byte $18
!byte $18
!byte $7E, $18, $18
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $18
!byte $18
!byte $30, $00
!byte $00
!byte $00
!byte $7E, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $18
!byte $18
!byte $00
!byte $00
!byte $03, $06
!byte $0C, $18, $30
!byte $60
!byte $00
!byte $38
!byte $C6, $C6
!byte $00
!byte $C6, $C6
!byte $38
!byte $00
!byte $00
!byte $06, $06
!byte $00
!byte $06, $06
!byte $00
!byte $00
!byte $38
!byte $06, $06
!byte $38
!byte $C0, $C0
!byte $38
!byte $00
!byte $38
!byte $06, $06
!byte $38
!byte $06, $06
!byte $38
!byte $00
!byte $00
!byte $C6, $C6
!byte $38
!byte $06, $06
!byte $00
!byte $00
!byte $38
!byte $C0, $C0
!byte $38
!byte $06, $06
!byte $38
!byte $00
!byte $38
!byte $C0, $C0
!byte $38
!byte $C6, $BC
!byte $FF, $FF, $FF
!byte $FF, $FC, $00
!byte $06, $06
!byte $00
!byte $00
!byte $38
!byte $C6, $C6
!byte $38
!byte $C6, $C6
!byte $38
!byte $00
!byte $38
!byte $C6, $C6
!byte $38
!byte $06, $06
!byte $38
!byte $00
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $3C, $3C, $18
!byte $3C, $7E, $DB
!byte $3C, $66, $DB
!byte $FF, $F7, $EB
!byte $DD, $B5, $0C
!byte $04, $6C
!byte $FE, $8F, $FF
!byte $EE, $D7, $06
!byte $00
!byte $36, $7F
!byte $E3, $7D
!byte $77, $EB
!byte $60
!byte $00
!byte $00
!byte $4D, $6D, $1D
!byte $FF, $1F, $FF
!byte $99, $01, $5A
!byte $9C, $B4, $FE
!byte $FB, $FE, $99
!byte $B9, $19, $7F
!byte $DF, $36, $66
!byte $06, $00
!byte $9F, $98, $FF
!byte $F8
!byte $EC, $67, $30
!byte $00
!byte $00
!byte $00
!byte $00
!byte $0F, $19, $66
!byte $DF, $E7, $20
!byte $20, $C0, $18
!byte $B3, $CC
!byte $AE, $EB, $F9
!byte $FD, $73, $1D
!byte $0F, $00, $00
!byte $00
!byte $E8
!byte $EB, $D8
!byte $A3, $5C
!byte $C6, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $1F, $3E, $61
!byte $CF, $CF, $00
!byte $00
!byte $00
!byte $C0, $E0
!byte $F8
!byte $FC, $FC, $DF
!byte $FF, $7F, $1F
!byte $07, $00
!byte $00
!byte $00
!byte $FC, $FC, $F8
!byte $E0, $80
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $0F, $3F, $71
!byte $67, $CF
!byte $CF, $00, $00
!byte $C0, $F0
!byte $F8
!byte $F8
!byte $FC, $FC, $CF
!byte $DF, $7F, $7F
!byte $1F, $07, $00
!byte $00
!byte $FC, $FC, $F8
!byte $F8
!byte $F0, $C0
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01, $1F
!byte $00
!byte $00
!byte $00
!byte $FE, $70, $E3
!byte $E7, $FF
!byte $7B, $FD, $00
!byte $0F, $00, $00
!byte $00
!byte $00
!byte $9F, $C7, $E3
!byte $F8
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $03, $0F
!byte $3B, $7F, $FF
!byte $00
!byte $00
!byte $00
!byte $C0, $F0
!byte $6C, $FE, $FF
!byte $CC, $7F, $3F
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $CF, $FE, $FC
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $03, $07
!byte $06, $06
!byte $07, $7B
!byte $ED, $DF, $C0
!byte $60
!byte $E0, $E0
!byte $E0, $DE
!byte $BB, $F7, $DF
!byte $FD, $7B, $07
!byte $06, $06
!byte $07, $03
!byte $F7, $BF
!byte $DE, $60, $E0
!byte $E0, $E0
!byte $C0, $00
!byte $00
!byte $03, $0E
!byte $38
!byte $E0, $FF
!byte $1B, $00, $C0
!byte $E0, $30
!byte $18
!byte $0C, $FC, $6C
!byte $1B, $FF, $E0
!byte $38
!byte $0E, $03, $00
!byte $00
!byte $6C, $FC, $0C
!byte $18
!byte $30, $E0
!byte $C0, $00
!byte $00
!byte $00
!byte $00
!byte $0E, $1B, $39
!byte $6E, $71, $00
!byte $00
!byte $00
!byte $70, $D8
!byte $9C, $76, $8E
!byte $E7, $CF
!byte $CF, $CF, $67
!byte $3F, $13, $0E
!byte $FF, $FF, $FF
!byte $FF, $FE, $FC
!byte $C8
!byte $70, $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $DB, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $03, $07
!byte $06, $0F
!byte $0F, $00, $18
!byte $DC, $EE, $F2
!byte $1D, $DF, $FF
!byte $00
!byte $00
!byte $00
!byte $30, $78
!byte $EC, $D8, $BC
!byte $3F, $7B, $67
!byte $3F, $1E, $05
!byte $03, $00
!byte $FF, $FF, $DD
!byte $BD, $B9, $70
!byte $E0, $00
!byte $FC, $3C, $FE
!byte $FE, $FC, $38
!byte $00
!byte $00
!byte $00
!byte $00
!byte $03, $07
!byte $0F, $3F, $3F
!byte $7F, $00, $87
!byte $CF, $FC, $EF
!byte $D7, $BF
!byte $FF, $00, $78
!byte $FC, $FC, $E6
!byte $FE, $FE, $F8
!byte $7F, $3D, $3B
!byte $1F, $3F, $37
!byte $19, $00, $FD
!byte $F3, $FF
!byte $FF, $E3, $BE
!byte $18
!byte $00
!byte $FE, $FC, $BC
!byte $76, $B6
!byte $FC, $78, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $80, $80
!byte $80, $80
!byte $80, $80
!byte $80, $80
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FE, $FE, $FE
!byte $FE, $FE, $FE
!byte $FF, $FF, $FC
!byte $FC, $FC, $FC
!byte $FC, $FC, $FF
!byte $FF, $F8, $F8
!byte $F8
!byte $F8
!byte $F8
!byte $F8
!byte $FF, $FF, $F0
!byte $F0, $F0
!byte $F0, $F0
!byte $F0, $FF
!byte $FF, $E0, $E0
!byte $E0, $E0
!byte $E0, $E0
!byte $FF, $FF, $C0
!byte $C0, $C0
!byte $C0, $C0
!byte $C0, $FF
!byte $FF, $80, $80
!byte $80, $80
!byte $80, $80
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $E7, $C3
!byte $99, $81, $99
!byte $99, $99, $FF
!byte $83, $99
!byte $99, $83, $99
!byte $99, $83, $FF
!byte $C3, $99
!byte $9F, $9F, $9F
!byte $99, $C3, $FF
!byte $87, $93
!byte $99, $99, $99
!byte $93, $87
!byte $FF, $81, $9F
!byte $9F, $87, $9F
!byte $9F, $81, $FF
!byte $81, $9F
!byte $9F, $87, $9F
!byte $9F, $9F, $FF
!byte $C3, $99
!byte $9F, $91, $99
!byte $99, $C3, $FF
!byte $99, $99, $99
!byte $81, $99
!byte $99, $99, $FF
!byte $C3, $E7
!byte $E7, $E7
!byte $E7, $E7
!byte $C3, $FF
!byte $E1, $F3
!byte $F3, $F3
!byte $F3, $93
!byte $C7, $FF
!byte $99, $93, $87
!byte $8F, $87, $93
!byte $99, $FF, $9F
!byte $9F, $9F, $9F
!byte $9F, $9F, $81
!byte $FF, $9C, $88
!byte $80, $94
!byte $9C, $9C, $9C
!byte $FF, $99, $89
!byte $81, $81
!byte $91, $99
!byte $99, $FF, $C3
!byte $99, $99, $99
!byte $99, $99, $C3
!byte $FF, $83, $99
!byte $99, $83, $9F
!byte $9F, $9F, $FF
!byte $C3, $99
!byte $99, $99, $99
!byte $C3, $F1
!byte $FF, $83, $99
!byte $99, $83, $87
!byte $93, $99
!byte $FF, $C3, $99
!byte $9F, $C3, $F9
!byte $99, $C3, $FF
!byte $81, $E7
!byte $E7, $E7
!byte $E7, $E7
!byte $E7, $FF
!byte $99, $99, $99
!byte $99, $99, $99
!byte $C3, $FF
!byte $99, $99, $99
!byte $99, $99, $FF
!byte $D5, $11
!byte $2B, $2B
!byte $2B, $FF
!byte $FF, $23, $2B
!byte $11, $33
!byte $32
!byte $FF, $D4, $B5
!byte $FF, $FF, $67
!byte $44, $44
!byte $41, $FF
!byte $FF, $FF, $FD
!byte $C0, $0D
!byte $4C, $FF, $FB
!byte $C4, $C0
!byte $0D, $C1, $C6
!byte $A6, $A6
!byte $A6, $A6
!byte $A6, $BF
!byte $FF, $7D, $AB
!byte $03, $FF
!byte $13, $AF
!byte $FF, $0B, $FF
!byte $FF, $FF, $FF
!byte $FF, $C6, $46
!byte $66, $7A
!byte $D6, $FF
!byte $5A
!byte $FF, $FF, $FF
!byte $E6, $7A
!byte $F6, $FF
!byte $FF, $86, $7A
!byte $66, $66
!byte $66, $66
!byte $66, $66
!byte $66, $66
!byte $66, $7A
!byte $FF, $FF, $FF
!byte $E6, $66
!byte $7A
!byte $E6, $FF
!byte $FF, $FF, $FF
!byte $66, $66
!byte $66, $66
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $7A
!byte $DF, $FF, $F6
!byte $47, $FF
!byte $5A
!byte $E6, $FF
!byte $FF, $FF, $5A
!byte $D6, $FF
!byte $FF, $FF, $F6
!byte $FF, $FF, $C6
!byte $FF, $FF, $FF
!byte $06, $67
!byte $FF, $5A, $E6
!byte $66, $66
!byte $66, $66
!byte $66, $5A
!byte $D6, $F6
!byte $F6, $7A
!byte $E6, $46
!byte $F6, $7A
!byte $E6, $46
!byte $46, $5A
!byte $D6, $66
!byte $66, $FF
!byte $FF, $C8, $86
!byte $FF, $FF, $66
!byte $66, $7A
!byte $FF, $FF, $5A
!byte $FF, $E6, $66
!byte $66, $66
!byte $66, $66
!byte $66, $7A
!byte $FF, $D6, $66
!byte $66, $66
!byte $FF, $46, $66
!byte $66, $66
!byte $66, $66
!byte $66, $66
!byte $66, $7A
!byte $FF, $E6, $F8
!byte $80, $C0
!byte $98
!byte $FC, $FF, $09
!byte $88
!byte $86, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $46
!byte $7A
!byte $FF, $D6, $FF
!byte $FF, $FF, $FF
!byte $46, $F6
!byte $FF, $FF, $FF
!byte $C6, $FF
!byte $FF, $46, $F6
!byte $FF, $FF, $FF
!byte $47, $FF
!byte $FF, $46, $67
!byte $FF, $59, $FF
!byte $FF, $07, $FF
!byte $FF, $FF, $FF
!byte $FF, $47, $FF
!byte $FF, $FF, $46
!byte $F6, $FF
!byte $FF, $FD, $83
!byte $99, $99, $C3
!byte $FF, $81, $99
!byte $F3, $E7
!byte $E7, $E7
!byte $E7, $FF
!byte $C3, $99
!byte $99, $C3, $99
!byte $99, $C3, $FF
!byte $C3, $99
!byte $99, $C1, $F9
!byte $99, $C3, $FF
!byte $FF, $FF, $E7
!byte $FF, $FF, $E7
!byte $FF, $FF, $C3
!byte $C3, $E7
!byte $C3, $81
!byte $24, $C3
!byte $99, $00, $00
!byte $03, $07
!byte $0F, $3F, $3C
!byte $78
!byte $00
!byte $C3, $EF
!byte $FC, $EF, $C4
!byte $00
!byte $00
!byte $00
!byte $38
!byte $FC, $FC, $E6
!byte $9E, $3E, $30
!byte $F8
!byte $7C, $79, $3F
!byte $3F, $37, $06
!byte $00
!byte $00
!byte $00
!byte $81, $D7
!byte $FF, $FF, $6C
!byte $00
!byte $3C, $7E, $B6
!byte $7E, $B4, $F8
!byte $00
!byte $00
!byte $00
!byte $09, $3B
!byte $24, $3B
!byte $7C, $30, $30
!byte $00
!byte $83, $EF
!byte $FC, $0E, $06
!byte $80, $61
!byte $00
!byte $78
!byte $FC, $FE, $06
!byte $8C, $9C, $38
!byte $F0, $60
!byte $70, $3C
!byte $7C, $37, $07
!byte $00
!byte $E0, $C0
!byte $00
!byte $01, $C3
!byte $F7, $7C
!byte $00
!byte $3E, $1C, $06
!byte $1F, $37, $EE
!byte $38
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $A5, $26
!byte $4A
!byte $99, $57, $03
!byte $A9, $09
!byte $8D, $05, $D4
!byte $A9, $F0
!byte $8D, $06, $D4
!byte $A9, $11
!byte $8D, $04, $D4
!byte $A9, $10
!byte $8D, $01, $D4
!byte $85, $20
!byte $A5, $20
!byte $8D, $00, $D4
!byte $8D, $01, $D4
!byte $A2, $80
!byte $E8
!byte $D0, $FD
!byte $A5, $20
!byte $18
!byte $69, $0C
!byte $85, $20
!byte $90, $EA
!byte $A9, $00
!byte $8D, $00, $D4
!byte $8D, $01, $D4
!byte $A9, $01
!byte $8D, $3E, $03
!byte $60
!byte $85, $21
!byte $AD, $10, $D0
!byte $3D, $34, $11
!byte $F0, $0A
!byte $38
!byte $AD, $10, $D0
!byte $FD, $34, $11
!byte $8D, $10, $D0
!byte $A5, $21
!byte $C9, $E0
!byte $D0, $05
!byte $A9, $01
!byte $8D, $3D, $03
!byte $60
!byte $00
!byte $01, $28
!byte $29, $00
!byte $00
!byte $00
!byte $00
!byte $20, $EA, $FF
!byte $4C, $21, $12
!byte $EA
!byte $FF, $A9, $00
!byte $8D, $A8, $03
!byte $4C, $A3, $1F
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $CD, $CE, $CF
!byte $D0, $00
!byte $00
!byte $00
!byte $00
!byte $C8
!byte $C8
!byte $C8
!byte $C8
!byte $C9, $C9
!byte $C9, $C8
!byte $CA
!byte $CA
!byte $C8
!byte $CA
!byte $CB, $C8
!byte $CB, $CB
!byte $C8
!byte $CC, $CC, $CC
!byte $CD, $D1, $D2
!byte $D3, $D1
!byte $CE, $D4, $D5
!byte $D2
!byte $D4, $CF
!byte $D6, $D3
!byte $D5, $D6
!byte $D0, $D1
!byte $D1
!byte $C9, $CA
!byte $10, $10
!byte $10, $10
!byte $10, $10
!byte $10, $10
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $F0, $10
!byte $10, $10
!byte $10, $00
!byte $00
!byte $00
!byte $1F, $10, $10
!byte $10, $10
!byte $10, $10
!byte $10, $F0
!byte $00
!byte $00
!byte $00
!byte $00
!byte $10, $10
!byte $10, $1F
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $66, $3C
!byte $FF, $3C, $66
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $81, $81
!byte $81, $81
!byte $81, $81
!byte $FF, $FF, $C3
!byte $A5, $99
!byte $99, $A5, $C3
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $07, $03
!byte $80, $3F
!byte $FF, $F0, $7F
!byte $FF, $F8, $62
!byte $D1
!byte $78
!byte $6E, $D7, $78
!byte $66, $D3
!byte $78
!byte $6E, $D7, $78
!byte $6E, $11, $18
!byte $7F, $FF, $F8
!byte $3F, $FF, $F0
!byte $07, $03
!byte $80, $00
!byte $00
!byte $00
!byte $FF, $03, $F0
!byte $00
!byte $00
!byte $18
!byte $00
!byte $0F, $9C, $00
!byte $0F, $3C, $00
!byte $0F, $3C, $00
!byte $03, $F8
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01, $F8
!byte $00
!byte $1B, $8C, $00
!byte $1B, $8C, $00
!byte $7C, $1C, $00
!byte $03, $FC
!byte $00
!byte $03, $F8
!byte $00
!byte $0F, $F0, $00
!byte $1F, $E0, $00
!byte $1E, $00, $00
!byte $1C, $00, $00
!byte $3C, $00, $00
!byte $7C, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $80, $00
!byte $00
!byte $80, $00
!byte $00
!byte $80, $00
!byte $01, $80
!byte $00
!byte $03, $C0
!byte $00
!byte $03, $60
!byte $18
!byte $03, $E0
!byte $7C, $03, $60
!byte $0F, $FF, $E0
!byte $00
!byte $3F, $E0, $00
!byte $0D, $60, $00
!byte $07, $C0
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $03, $F0
!byte $00
!byte $00
!byte $18
!byte $00
!byte $0F, $9C, $00
!byte $0F, $3C, $00
!byte $0F, $3C, $00
!byte $03, $F8
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01, $F8
!byte $00
!byte $1B, $8C, $00
!byte $1B, $8C, $00
!byte $7C, $1C, $00
!byte $03, $FC
!byte $00
!byte $03, $F8
!byte $00
!byte $03, $F0
!byte $00
!byte $03, $E0
!byte $00
!byte $01, $E0
!byte $00
!byte $00
!byte $E0, $00
!byte $00
!byte $E0, $00
!byte $00
!byte $E0, $00
!byte $01, $E0
!byte $00
!byte $03, $E0
!byte $00
!byte $00
!byte $03, $F0
!byte $00
!byte $00
!byte $18
!byte $00
!byte $0F, $9C, $00
!byte $0F, $3C, $00
!byte $0F, $3C, $00
!byte $03, $F8
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01, $F8
!byte $00
!byte $1B, $8C, $00
!byte $1B, $8C, $00
!byte $7C, $1C, $00
!byte $03, $FC
!byte $00
!byte $03, $F8
!byte $00
!byte $03, $F0
!byte $00
!byte $01, $E0
!byte $00
!byte $01, $E0
!byte $00
!byte $03, $70
!byte $00
!byte $03, $38
!byte $00
!byte $03, $9C
!byte $00
!byte $07, $BC
!byte $00
!byte $0F, $FC, $00
!byte $00
!byte $03, $F0
!byte $00
!byte $00
!byte $18
!byte $00
!byte $0F, $9C, $00
!byte $0F, $3C, $00
!byte $0F, $3C, $00
!byte $03, $F8
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01, $F8
!byte $00
!byte $1B, $8C, $00
!byte $1B, $8C, $00
!byte $7C, $1C, $00
!byte $03, $FC
!byte $00
!byte $03, $F8
!byte $00
!byte $03, $F0
!byte $00
!byte $03, $E0
!byte $00
!byte $01, $F0
!byte $00
!byte $07, $3F
!byte $00
!byte $0E, $1F, $00
!byte $1C, $07, $00
!byte $3C, $03, $00
!byte $7C, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $0D, $E0, $00
!byte $02
!byte $A0, $00
!byte $06, $C0
!byte $00
!byte $03, $70
!byte $00
!byte $01, $E0
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $03, $80
!byte $00
!byte $06, $C0
!byte $00
!byte $05, $C0
!byte $00
!byte $07, $C0
!byte $00
!byte $0D, $60, $00
!byte $18
!byte $30, $00
!byte $30, $18
!byte $00
!byte $70, $1C
!byte $00
!byte $D8
!byte $36, $00
!byte $BF, $EE, $00
!byte $F8
!byte $3E, $00, $70
!byte $1C, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FE, $00, $01
!byte $FD, $80, $03
!byte $FB, $C0, $07
!byte $F7, $E0
!byte $0C, $0F, $E0
!byte $18
!byte $07, $C0
!byte $30, $03
!byte $80, $7F
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $7C, $00, $01
!byte $C7, $00
!byte $07, $0F
!byte $C0, $0C
!byte $3F, $E0, $0C
!byte $FF, $E0, $0D
!byte $FF, $E0, $07
!byte $FF, $C0, $03
!byte $FF, $80, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $F8
!byte $00
!byte $03, $FE
!byte $00
!byte $06, $73
!byte $00
!byte $0C, $D9, $80
!byte $0D, $8D, $80
!byte $07, $FF
!byte $00
!byte $03, $FE
!byte $00
!byte $01, $FC
!byte $00
!byte $00
!byte $F8
!byte $00
!byte $00
!byte $70, $00
!byte $00
!byte $36, $7F
!byte $DC, $36, $7F
!byte $DC, $36, $7F
!byte $DC, $36, $7F
!byte $DC, $3E, $7F
!byte $DC, $3E, $7F
!byte $FC, $3E, $7F
!byte $FC, $3E, $7F
!byte $FC, $36, $7F
!byte $EC, $36, $7F
!byte $EC, $3F, $7F
!byte $FC, $3D, $FF
!byte $BC, $3D, $FF
!byte $BC, $1E, $C3
!byte $78
!byte $0C, $DF, $30
!byte $1C, $DF, $38
!byte $32
!byte $6E, $64, $36
!byte $76, $6C
!byte $36, $3C
!byte $6C, $36, $18
!byte $6C, $7F, $00
!byte $FE, $FF, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $03
!byte $90, $C0
!byte $07, $17
!byte $E0, $0E
!byte $30, $F0
!byte $1A
!byte $7E, $D8, $36
!byte $70, $DC
!byte $3E, $7F, $FC
!byte $32
!byte $7D, $CC, $36
!byte $79, $DC, $36
!byte $7D, $DC, $36
!byte $7D, $DC, $36
!byte $78
!byte $DC, $36, $7F
!byte $DC, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $3C, $00, $00
!byte $66, $00
!byte $00
!byte $CF, $00, $01
!byte $9F, $80, $01
!byte $81, $80
!byte $01, $9F
!byte $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $00
!byte $01, $B7
!byte $B8
!byte $01, $B7
!byte $B8
!byte $03, $B7
!byte $B8
!byte $03, $B7
!byte $B8
!byte $07, $77
!byte $B8
!byte $07, $7F
!byte $F8
!byte $0E, $FF, $F8
!byte $0E, $FF, $F8
!byte $1E, $FF, $F8
!byte $1E, $FF, $F8
!byte $3E, $FF, $F8
!byte $36, $FE
!byte $70, $36
!byte $FE, $E0, $36
!byte $FC, $FC, $36
!byte $FC, $F8, $36
!byte $FC, $EC, $36
!byte $FD, $CC, $37
!byte $F9, $9C, $38
!byte $01, $9C
!byte $30, $01
!byte $9C, $20, $01
!byte $9C, $FF, $01
!byte $BF, $D8, $01
!byte $BF, $D8, $01
!byte $DF, $D8, $01
!byte $BF, $D8, $01
!byte $BF, $D8, $01
!byte $B1, $D8
!byte $01, $D7
!byte $D8
!byte $01, $B1
!byte $B8
!byte $01, $BD
!byte $B8
!byte $01, $B1
!byte $B8
!byte $01, $DF
!byte $B8
!byte $01, $B1
!byte $B8
!byte $01, $BD
!byte $B8
!byte $01, $B1
!byte $B8
!byte $01, $B7
!byte $B8
!byte $01, $D1
!byte $B8
!byte $01, $BF
!byte $B8
!byte $01, $BD
!byte $F8
!byte $01, $BB
!byte $F8
!byte $01, $B7
!byte $B8
!byte $01, $B7
!byte $B8
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $07, $80
!byte $00
!byte $0F, $C0, $00
!byte $1F, $E0, $00
!byte $1F, $F0, $00
!byte $3F, $B8, $00
!byte $3F, $98, $00
!byte $7F, $98, $00
!byte $67, $98
!byte $00
!byte $67, $98
!byte $00
!byte $FF, $98, $00
!byte $FF, $98, $00
!byte $E7, $98
!byte $00
!byte $E7, $D8
!byte $01, $FF
!byte $D8
!byte $01, $FF
!byte $D8
!byte $01, $DF
!byte $D8
!byte $01, $BF
!byte $D8
!byte $00
!byte $0F, $3F, $F0
!byte $07, $3F
!byte $E0, $03
!byte $9F, $C0, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $01
!byte $9F, $80, $03
!byte $9F, $C0, $07
!byte $3F, $E0, $0E
!byte $7F, $F0, $1C
!byte $FF, $F8, $19
!byte $FF, $F8, $08
!byte $3F, $90, $0D
!byte $C3, $B0
!byte $0D, $81, $B0
!byte $1B, $81, $78
!byte $1B, $81, $78
!byte $77, $C3
!byte $7E, $77, $C3
!byte $7E, $FF, $01
!byte $1F, $80, $03
!byte $7F, $C0, $03
!byte $7F, $C0, $03
!byte $61, $C0
!byte $03, $6F
!byte $C0, $03
!byte $61, $C0
!byte $03, $7D
!byte $C0, $03
!byte $61, $C0
!byte $03, $7F
!byte $C0, $03
!byte $61, $C0
!byte $06, $FD
!byte $E0, $06
!byte $F1, $E0
!byte $06, $FD
!byte $E0, $06
!byte $E1, $E0
!byte $0C, $FF, $F0
!byte $0C, $FF, $F0
!byte $0C, $FF, $F0
!byte $0C, $FF, $F0
!byte $0C, $FF, $F0
!byte $0C, $FF, $F0
!byte $0C, $FF, $F0
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $34, $00
!byte $00
!byte $2C, $00, $00
!byte $6E, $00, $00
!byte $6E, $00, $00
!byte $6E, $00, $00
!byte $6E, $00, $00
!byte $DF, $00, $00
!byte $DF, $00, $01
!byte $BF, $80, $00
!byte $3F, $6E, $FC
!byte $3F, $6E, $FC
!byte $3F, $6E, $FC
!byte $3F, $6E, $FC
!byte $31, $6E
!byte $FC, $37, $6E
!byte $BC, $31, $6E
!byte $AC, $3D, $6E
!byte $8C, $31, $6E
!byte $EC, $3F, $6E
!byte $FC, $3F, $6E
!byte $FC, $3F, $6E
!byte $FC, $3F, $6E
!byte $FC, $3F, $6E
!byte $FC, $3F, $6E
!byte $FC, $3F, $4E
!byte $FC, $3E, $4E
!byte $7C, $3C, $DF
!byte $3C, $3D, $BF
!byte $BC, $39, $FF
!byte $9C, $30, $00
!byte $0C, $FF, $39
!byte $BC, $1C, $3F
!byte $7E, $3C, $3E
!byte $7E, $7C, $3F
!byte $7E, $FC, $3F
!byte $FF, $FC, $3F
!byte $FF, $FC, $3F
!byte $FF, $FC, $3F
!byte $FF, $FC, $3F
!byte $FF, $FC, $3F
!byte $FF, $FC, $1F
!byte $FF, $F8, $1F
!byte $FF, $F8, $0F
!byte $FF, $F0, $07
!byte $FF, $E0, $07
!byte $FF, $E0, $33
!byte $FF, $CC, $33
!byte $FF, $CC, $31
!byte $FF, $8C, $32
!byte $FF, $4C, $33
!byte $7E, $CC, $37
!byte $BD, $EC, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $3C, $00, $00
!byte $3C, $00, $00
!byte $7E, $00, $00
!byte $7E, $00, $00
!byte $DB, $00, $00
!byte $DB, $00, $03
!byte $99, $C0, $03
!byte $99, $C0, $06
!byte $18
!byte $60
!byte $06, $38
!byte $60
!byte $06, $78
!byte $60
!byte $0C, $D8, $30
!byte $0D, $98, $30
!byte $1F, $38, $18
!byte $1E, $78, $18
!byte $18
!byte $D8
!byte $18
!byte $19, $BC, $18
!byte $00
!byte $33, $33
!byte $3C, $3C, $CC
!byte $CC, $3C, $CC
!byte $CC, $3F, $FF
!byte $FC, $3F, $FF
!byte $FC, $19, $78
!byte $78
!byte $19, $7B, $F8
!byte $19, $78, $F8
!byte $19, $7F, $78
!byte $19, $78, $F8
!byte $19, $7F, $F8
!byte $1F, $FF, $F8
!byte $0F, $FF, $F0
!byte $0D, $00, $D0
!byte $1B, $81, $B8
!byte $30, $C3
!byte $0C, $33, $C3
!byte $3C, $33, $C3
!byte $3C, $33, $C3
!byte $3C, $33, $C3
!byte $3C, $3F, $C3
!byte $FC, $FF, $1F
!byte $FF, $F8, $33
!byte $33, $3C
!byte $33, $33
!byte $3C, $3C, $CC
!byte $CC, $3C, $CC
!byte $CC, $3F, $FF
!byte $FC, $32, $FF
!byte $FC, $32, $FF
!byte $FC, $32, $FF
!byte $FC, $32, $FF
!byte $FC, $32, $FF
!byte $FC, $32, $FF
!byte $FC, $32, $FF
!byte $FC, $32, $F0
!byte $FC, $32, $F7
!byte $FC, $32, $F0
!byte $FC, $32, $FE
!byte $FC, $32, $F0
!byte $FC, $3F, $FF
!byte $FC, $3F, $FF
!byte $FC, $33, $33
!byte $3C, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $18
!byte $00
!byte $00
!byte $24, $00
!byte $00
!byte $6E, $00, $00
!byte $DF, $00, $01
!byte $81, $80
!byte $01, $BF
!byte $80, $01
!byte $BF, $80, $01
!byte $BF, $80, $03
!byte $C1, $C0
!byte $06, $7F
!byte $E0, $0C
!byte $FF, $F0, $19
!byte $FF, $F8, $00
!byte $00
!byte $0F, $C0, $00
!byte $18
!byte $00
!byte $00
!byte $39, $F0, $00
!byte $3C, $F0, $00
!byte $3C, $F0, $00
!byte $1F, $C0, $00
!byte $00
!byte $00
!byte $00
!byte $1F, $80, $00
!byte $31, $D8
!byte $00
!byte $31, $D8
!byte $00
!byte $38
!byte $3E, $00, $3F
!byte $C0, $00
!byte $1F, $C0, $00
!byte $0F, $F0, $00
!byte $07, $F8
!byte $00
!byte $00
!byte $78
!byte $00
!byte $00
!byte $38
!byte $00
!byte $00
!byte $3C, $00, $00
!byte $3E, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01, $00
!byte $00
!byte $01, $00
!byte $00
!byte $01, $00
!byte $00
!byte $01, $80
!byte $00
!byte $03, $C0
!byte $00
!byte $06, $C0
!byte $00
!byte $07, $C0
!byte $18
!byte $06, $C0
!byte $3E, $07, $FF
!byte $F0, $07
!byte $FC, $00, $06
!byte $B0, $00
!byte $03, $E0
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $0F, $00, $0F
!byte $C0, $00
!byte $18
!byte $00
!byte $00
!byte $39, $F0, $00
!byte $3C, $F0, $00
!byte $3C, $F0, $00
!byte $1F, $C0, $00
!byte $00
!byte $00
!byte $00
!byte $1F, $80, $00
!byte $31, $D8
!byte $00
!byte $31, $D8
!byte $00
!byte $38
!byte $3E, $00, $3F
!byte $C0, $00
!byte $1F, $C0, $00
!byte $0F, $C0, $00
!byte $07, $C0
!byte $00
!byte $07, $80
!byte $00
!byte $07, $00
!byte $00
!byte $07, $00
!byte $00
!byte $07, $00
!byte $00
!byte $07, $80
!byte $00
!byte $07, $C0
!byte $0F, $00, $0F
!byte $C0, $00
!byte $18
!byte $00
!byte $00
!byte $39, $F0, $00
!byte $3C, $F0, $00
!byte $3C, $F0, $00
!byte $1F, $C0, $00
!byte $00
!byte $00
!byte $00
!byte $1F, $80, $00
!byte $31, $D8
!byte $00
!byte $31, $D8
!byte $00
!byte $38
!byte $3E, $00, $3F
!byte $C0, $00
!byte $1F, $C0, $00
!byte $0F, $C0, $00
!byte $07, $80
!byte $00
!byte $07, $80
!byte $00
!byte $0E, $C0, $00
!byte $1C, $C0, $00
!byte $39, $C0, $00
!byte $3D, $E0, $00
!byte $3F, $F0, $0F
!byte $00
!byte $0F, $C0, $00
!byte $18
!byte $00
!byte $00
!byte $39, $F0, $00
!byte $3C, $F0, $00
!byte $3C, $F0, $00
!byte $1F, $C0, $00
!byte $00
!byte $00
!byte $00
!byte $1F, $80, $00
!byte $31, $D8
!byte $00
!byte $31, $D8
!byte $00
!byte $38
!byte $3E, $00, $3F
!byte $C0, $00
!byte $1F, $C0, $00
!byte $0F, $C0, $00
!byte $07, $C0
!byte $00
!byte $0F, $80, $00
!byte $FC, $E0, $00
!byte $F8
!byte $70, $00
!byte $E0, $38
!byte $00
!byte $C0, $3C
!byte $00
!byte $00
!byte $3E, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $07, $B0
!byte $00
!byte $05, $40
!byte $00
!byte $03, $60
!byte $00
!byte $0E, $C0, $00
!byte $07, $80
!byte $00
!byte $BF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $C6, $19
!byte $9B, $11, $30
!byte $60
!byte $63, $03
!byte $46, $32
!byte $D9, $00, $08
!byte $00
!byte $66, $26
!byte $C3, $1A
!byte $1A
!byte $18
!byte $4C, $01, $65
!byte $B0, $06
!byte $00
!byte $C0, $01
!byte $B6, $00
!byte $00
!byte $6C, $00, $00
!byte $00
!byte $00
!byte $00
!byte $0F, $FF, $F0
!byte $10, $00
!byte $1C, $20, $00
!byte $22
!byte $40
!byte $00
!byte $42
!byte $FF, $FF, $81
!byte $FF, $FF, $E1
!byte $FF, $FF, $E1
!byte $1C, $80, $F1
!byte $1C, $FF, $F2
!byte $1D, $00, $74
!byte $1E, $01, $E4
!byte $1F, $FF, $8A
!byte $1F, $FF, $91
!byte $1C, $41, $E1
!byte $1C, $7F, $F1
!byte $3C, $80, $71
!byte $5D, $00
!byte $72
!byte $9E, $00, $F4
!byte $FF, $FF, $E4
!byte $FF, $FF, $E8
!byte $FF, $FF, $F0
!byte $FF, $00, $7F
!byte $C0, $01
!byte $80, $70
!byte $02
!byte $00
!byte $88
!byte $04, $01
!byte $04, $0F
!byte $FE, $02, $1F
!byte $FF, $82, $3F
!byte $FF, $C1, $72
!byte $00
!byte $E1, $72
!byte $00
!byte $E1, $F3
!byte $FF, $F1, $F4
!byte $00
!byte $F1, $F8
!byte $00
!byte $F1, $FF
!byte $FF, $F1, $FF
!byte $FF, $F1, $FF
!byte $FF, $F1, $F2
!byte $00
!byte $F1, $F2
!byte $00
!byte $F1, $F2
!byte $00
!byte $F1, $F4
!byte $00
!byte $F2
!byte $F8
!byte $00
!byte $F4, $F0
!byte $00
!byte $F8
!byte $00
!byte $01, $FF
!byte $80, $06
!byte $00
!byte $60
!byte $08
!byte $00
!byte $10, $10
!byte $00
!byte $08
!byte $27, $FE
!byte $04, $5F
!byte $FF, $82, $7F
!byte $FF, $C4, $7C
!byte $43, $E8
!byte $78
!byte $81, $F0
!byte $F1, $00
!byte $00
!byte $F2
!byte $00
!byte $00
!byte $E2, $00
!byte $3C, $E1, $00
!byte $46, $E0
!byte $80, $8A
!byte $F0, $7F
!byte $F2
!byte $F0, $81
!byte $E2, $79
!byte $01, $E4
!byte $7E, $03, $E8
!byte $3F, $FF, $D0
!byte $1F, $FF, $E0
!byte $0F, $FF, $80
!byte $00
!byte $0F, $FF, $F0
!byte $10, $00
!byte $1C, $20, $00
!byte $22
!byte $40
!byte $00
!byte $42
!byte $FF, $FF, $81
!byte $FF, $FF, $E1
!byte $FF, $FF, $E1
!byte $1E, $20, $F1
!byte $1E, $3F, $F2
!byte $1E, $40, $72
!byte $1E, $80, $F4
!byte $1F, $01, $E8
!byte $1F, $FF, $D0
!byte $1F, $FF, $E0
!byte $1F, $FE, $00
!byte $1E, $20, $00
!byte $1E, $20, $00
!byte $1E, $20, $00
!byte $1E, $40, $00
!byte $1E, $80, $00
!byte $1F, $00, $00
!byte $00
!byte $8E, $FF, $3F
!byte $8C, $FE, $3F
!byte $20, $00, $40
!byte $D0, $07
!byte $AE, $FF, $3F
!byte $AC, $FE, $3F
!byte $60
!byte $C9, $20
!byte $F0, $11
!byte $C9, $85
!byte $D0, $08
!byte $A2, $00
!byte $20, $A4, $39
!byte $4C, $4B, $39
!byte $4C, $DC, $39
!byte $00
!byte $00
!byte $AD, $DF, $24
!byte $29, $80
!byte $F0, $03
!byte $4C, $B5, $39
!byte $4C, $C7, $39
!byte $3F, $8D, $24
!byte $1B, $A9, $00
!byte $8D, $15, $D0
!byte $4C, $90, $1E
!byte $A9, $00
!byte $85, $F8
!byte $20, $CA, $21
!byte $C6, $F8
!byte $D0, $F9
!byte $4C, $10, $21
!byte $A9, $00
!byte $8D, $20, $D0
!byte $8D, $21, $D0
!byte $A9, $1A
!byte $8D, $18, $D0
!byte $A9, $0F
!byte $8D, $18, $D4
!byte $4C, $57, $3A
!byte $74, $BD
!byte $DF, $24, $49
!byte $80, $9D
!byte $DF, $24, $9D
!byte $B7, $06
!byte $E8
!byte $E0, $0D
!byte $D0, $F0
!byte $60
!byte $A9, $AD
!byte $8D, $FB, $0F
!byte $A9, $DC
!byte $8D, $FD, $0F
!byte $A9, $01
!byte $8D, $FC, $0F
!byte $4C, $90, $1E
!byte $A9, $20
!byte $8D, $FB, $0F
!byte $A9, $39
!byte $8D, $FD, $0F
!byte $A9, $E8
!byte $8D, $FC, $0F
!byte $4C, $90, $1E
!byte $00
!byte $00
!byte $00
!byte $C9, $A0
!byte $D0, $03
!byte $4C, $67, $39
!byte $4C, $4B, $39
!byte $00
!byte $00
!byte $A2, $00
!byte $AD, $00, $DC
!byte $29, $F0
!byte $8D, $00, $DC
!byte $AD, $01, $DC
!byte $49, $FF
!byte $9D, $00, $61
!byte $EE, $00, $DC
!byte $E8
!byte $E0, $0A
!byte $D0, $F0
!byte $A9, $00
!byte $85, $FF
!byte $AD, $08, $61
!byte $29, $20
!byte $F0, $07
!byte $A9, $01
!byte $85, $FF
!byte $4C, $1F, $3A
!byte $AD, $08, $61
!byte $29, $08
!byte $F0, $04
!byte $A9, $02
!byte $85, $FF
!byte $AD, $03, $61
!byte $29, $04
!byte $F0, $0A
!byte $18
!byte $A5, $FF
!byte $69, $08
!byte $85, $FF
!byte $4C, $3E, $3A
!byte $AD, $04, $61
!byte $29, $04
!byte $F0, $07
!byte $18
!byte $A5, $FF
!byte $69, $04
!byte $85, $FF
!byte $AD, $00, $61
!byte $29, $10
!byte $F0, $07
!byte $18
!byte $A5, $FF
!byte $69, $10
!byte $85, $FF
!byte $A5, $FF
!byte $49, $FF
!byte $60
!byte $85, $C6
!byte $8D, $15, $D0
!byte $60
!byte $A9, $08
!byte $20, $D2, $FF
!byte $A9, $9A
!byte $20, $D2, $FF
!byte $4C, $10, $21
!byte $AD, $F8, $07
!byte $18
!byte $69, $03
!byte $8D, $F9, $07
!byte $A9, $0E
!byte $8D, $28, $D0
!byte $4C, $B0, $20
!byte $00
!byte $FF, $00, $A2
!byte $00
!byte $BC, $D0, $16
!byte $B9, $00, $78
!byte $85, $FC
!byte $B9, $01, $78
!byte $85, $FD
!byte $B9, $02, $78
!byte $F0, $07
!byte $86, $B0
!byte $20, $9C, $3A
!byte $A6, $B0
!byte $E8
!byte $E0, $0C
!byte $D0, $E2
!byte $AD, $53, $03
!byte $60
!byte $B9, $04, $78
!byte $85, $02
!byte $A2, $00
!byte $18
!byte $A5, $FC
!byte $85, $F8
!byte $A5, $FD
!byte $69, $D4
!byte $85, $F9
!byte $BC, $60, $2F
!byte $BD, $E8, $03
!byte $91, $FC
!byte $A5, $02
!byte $91, $F8
!byte $E8
!byte $E0, $04
!byte $D0, $EF
!byte $60
!byte $20, $B4, $0D
!byte $A5, $25
!byte $10, $05
!byte $18
!byte $69, $02
!byte $85, $25
!byte $60
!byte $FF, $22, $8B
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FD, $FF
!byte $FF, $FF, $FF
!byte $04, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $60
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $60
!byte $00
!byte $00
!byte $00
!byte $44, $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $DC, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $41, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $85, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $7B, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $7B, $00, $00
!byte $00
!byte $5F, $7F, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $98
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FB, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $BF, $F9
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $80, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $28
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $28
!byte $00
!byte $00
!byte $00
!byte $01, $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $DC, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $55, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $94, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $50, $00
!byte $00
!byte $00
!byte $7F, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $7F, $00, $00
!byte $00
!byte $7F, $7E, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $98
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $DD, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $00, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $61, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $71, $00
!byte $00
!byte $00
!byte $01, $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $D8, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $40
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $DF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $80, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $40
!byte $00
!byte $00
!byte $00
!byte $4F, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $5B, $00, $00
!byte $00
!byte $4F, $7E, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $98
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $DD, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $00, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $60
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $60
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $DC, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $45, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $C5, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $45, $00
!byte $00
!byte $00
!byte $4D, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $7F, $00, $00
!byte $00
!byte $4D, $7F, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $98
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $80, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $28
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $68
!byte $00
!byte $00
!byte $00
!byte $28
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $D8, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $61, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $01, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $07, $80
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $11, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $08
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $22
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $10, $00
!byte $00
!byte $00
!byte $00
!byte $08
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $10, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $04, $00
!byte $00
!byte $20, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $B1, $F0
!byte $AD, $00, $50
!byte $C9, $85
!byte $F0, $06
!byte $A9, $85
!byte $8D, $00, $50
!byte $60
!byte $A9, $20
!byte $60
!byte $03, $60
!byte $EA
!byte $EA
!byte $8D, $01, $50
!byte $60
!byte $8D, $00, $50
!byte $60
!byte $60
!byte $60
!byte $2A
!byte $2A
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $DF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FD
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $40, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FE
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $EF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $04, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $BF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FE, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $BF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $02
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $F7, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FD
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FE, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $80, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $40, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FE
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $80, $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $01
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $40
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FD, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $EF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $04, $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $BF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $20, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $08
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $BF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $80
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $85
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $80, $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $40, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $02
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $20, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $10, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FD, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $EF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $BF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $80, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FB
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $08
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FD, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $20, $00, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FB
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $EF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $EF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $20, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FE, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $80, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $02
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $01, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $01, $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $80, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $DF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $DF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $01, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FB, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $01, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $7F, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $01, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $08
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FD, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $40, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $DF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $40
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $F7, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $20, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FD, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $08
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $04, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $EF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $BF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $7F
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $F7
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FD, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $04, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $7F, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $BF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $04
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $20, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $01
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $02
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $01, $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $59
!byte $07, $01
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $40, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $EF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $08
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $08, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $EF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FD, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $BF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FE, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $02
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $F7, $00
!byte $80, $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $0B
!byte $05, $01
!byte $1B, $06, $00
!byte $00
!byte $00
!byte $9D, $06, $01
!byte $1D, $05, $00
!byte $00
!byte $00
!byte $3B, $05, $01
!byte $23, $02
!byte $00
!byte $00
!byte $00
!byte $04, $06
!byte $01, $24
!byte $0E, $00, $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $7F, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FE, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FB, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FD, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $20, $00, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $02
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $20
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $04, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $7F
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $EF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $F7, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $10, $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $08
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FB, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $DF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $08, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $02
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FB, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $BF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $EF, $FF
!byte $FF, $08, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $BF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $10
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FD, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $04, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $01
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $DF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $08
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $08
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $BF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $7F, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $10
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $7F
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $10
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $40
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $BF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FB, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $20
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $BF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $20, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $EF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $80, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FB, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $10
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FD
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FD, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $F7, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $7F
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $20, $20, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $02, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $01, $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $04, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $20, $FF, $FF
!byte $FF, $FF, $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FB, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FE
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $20, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $80, $FF
!byte $FF, $FF, $FF
!byte $00
!byte $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $08
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FE, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FB
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $EF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FE
!byte $FF, $01, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $7F, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $02
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $80
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $01
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $04, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $F7, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $08
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FE, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $80
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $04, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $BF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $04, $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FB, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $00, $00
!byte $00
!byte $00
!byte $FF, $FF, $FF
!byte $FF, $CA, $45
!byte $54, $50
!byte $41, $43
!byte $2E, $C4, $36
!byte $34, $94


label1 = $FFD2
label3 = $1506
label4 = $2020
label13 = $1020
label54 = $3028
label76 = $3A78
label81 = $1138
label83 = $1176
label94 = $12BC
label95 = $1179
label123 = $2797
label131 = $15E3
label173 = $18EC
label205 = $08F8
label206 = $1F48
label210 = $2F70
label215 = $2165
label223 = $C080
label225 = $22B5
label228 = $2364
label232 = $120F
label233 = $050B
label234 = $CECE
label235 = $3306
label238 = $0420
label240 = $0202
label242 = $2001
label243 = $0505
label244 = $0001
label246 = $0101
label248 = $D0CF
label249 = $CDCE
label250 = $FFFF
label251 = $004C
label253 = $FBFF
label254 = $FFEA
label257 = $39A4
label270 = $FF00
label271 = $FF20

label37 = $0BA1
label56 = $2F00
label62 = $27B0
label66 = $0FC8
label67 = $39E8
label70 = $27B4
label71 = $0F7D
label79 = $09AA
label85 = $2F40
label92 = $4020
label96 = $11B9
label120 = $16A0
label127 = $11B1
label128 = $2F68
label140 = $1756
label155 = $19CD
label177 = $1BAE
label187 = $3AC0
label201 = $3A64
label209 = $14DA
label213 = $398E
label214 = $3A51
label216 = $8060 ; check
label222 = $3940
label230 = $3980
