; SYS 4608
                *=$1200
                JSR label0
                LDA #$01
                STA $2101
                JSR label1
                LDA #$E1
                STA $0328
                LDA #$13
                STA $D018
                LDA #$3C
                STA $D015
                STA $D01D
                LDA #$C0
                STA $D010
                LDX #$00
                LDA #$8B
branch0         STA $D001,X
                INX
                INX
                CPX #$10
                BNE branch0
                LDA #$00
                STA $D017
                STA $D01C
                STA $04
                STA $05
                STA $1438
                STA $143B
                LDX #$00
branch1         STA $D000,X
                CLC
                ADC #$30
                INX
                INX
                CPX #$10
                BNE branch1
                LDX #$00
branch2         LDA #$00
                STA $0FF8,X
                STA $0900,X
                TXA
                CLC
                ADC #$28
                STA $07F8,X
                LDA #$01
                STA $D027,X
                INX
                CPX #$08
                BNE branch2
                JSR label2 ;14c3
                SEI
                LDA #$33
                STA $01
                LDX #$00
branch3         LDA #$00
                STA $D800,X
                STA $D900,X
                STA $DA00,X
                STA $DB00,X
                STA $0A00,X
                STA $0B00,X
                STA $0C00,X
                LDA $D000,X
                STA $1000,X
                LDA $D100,X
                STA $1100,X
                LDA #$FF
                STA $0400,X
                STA $0500,X
                STA $0600,X
                STA $06FA,X
                INX
                BNE branch3
                LDA #$37
                STA $01
                LDA #$0E
                STA $0314
                LDA #$13
                STA $0315
                LDA #$00
                STA $DC0E
                LDA #$01
                STA $D01A
                STA $D019
                LDA #$1B
                STA $D011
                CLI
label4          LDA #$FE
                STA $143C
branch4         LDA $143C
                CMP #$00
                BNE branch4
                JSR label3
                LDA $DC01
                CMP #$EF
                BEQ branch5
                JMP label4
branch5         NOP
                LDA #$00
                STA $D418
                STA $D015
                JSR label0
                LDA #$15
                STA $D018
                LDA $D01A
                AND #$F0
                STA $D01A
                LDA #$01
                STA $DC0E
                LDA #$31
                STA $0314
                LDA #$EA
                STA $0315
                CLI
                JMP label5
                LDA #$01
                STA $D019
                LDA #$32
                STA $D012
                JSR label6
                JSR label7
                LDA #$0E
                STA $0314
                LDA #$13
                STA $0315
                JMP label8
label6          LDX #$00
branch6         LDA $D012
                CMP $D012
                BNE branch6
                AND #$07
                ORA #$10
                STA $D011
                LDA $1371,X
                STA $D021
                STA $D020
                INX
                CPX #$C3
                BNE branch6
                LDY $142C
                LDX #$BC
branch7         LDA $1371,X
                STA $1372,X
                DEX
                CPX #$6B
                BNE branch7
                STY $13DD
                LDY $1372
                LDX #$01
branch8         LDA $1372,X
                STA $1371,X
                INX
                CPX #$50
                BNE branch8
                STY $13C1
                RTS

                *=$1371
                !byte $01, $00
                !byte $00
                !byte $00
                !byte $05, $03
                !byte $0D, $01, $0D
                !byte $03, $05
                !byte $00
                !byte $00
                !byte $00
                !byte $09, $08
                !byte $07, $01
                !byte $07, $08
                !byte $09, $00
                !byte $00
                !byte $00
                !byte $08
                !byte $04, $0A
                !byte $01, $0A
                !byte $04, $08
                !byte $00
                !byte $00
                !byte $00
                !byte $06, $0E
                !byte $03, $01
                !byte $03, $0E
                !byte $06, $00
                !byte $00
                !byte $00
                !byte $02
                !byte $08
                !byte $0A
                !byte $01, $0A
                !byte $08
                !byte $02
                !byte $00
                !byte $00
                !byte $00
                !byte $06, $0E
                !byte $03, $01
                !byte $03, $0E
                !byte $06, $00
                !byte $00
                !byte $00
                !byte $02
                !byte $08
                !byte $0A
                !byte $01, $0A
                !byte $08
                !byte $02
                !byte $00
                !byte $00
                !byte $00
                !byte $0B, $0C
                !byte $0F, $01, $0F
                !byte $0C, $0B, $01
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $09, $09
                !byte $02
                !byte $08
                !byte $0A
                !byte $07, $0A
                !byte $08
                !byte $02
                !byte $09, $09
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $01, $0A
                !byte $01, $0A
                !byte $08
                !byte $02
                !byte $00
                !byte $00
                !byte $00
                !byte $0B, $0C
                !byte $0F, $01, $0F
                !byte $0C, $0B, $00
                !byte $00
                !byte $00
                !byte $05, $03
                !byte $0D, $01, $0D
                !byte $03, $05
                !byte $00
                !byte $00
                !byte $00
                !byte $0B, $0C
                !byte $0F, $01, $0F
                !byte $0C, $0B, $00
                !byte $00
                !byte $00
                !byte $05, $03
                !byte $0D, $01, $0D
                !byte $03, $05
                !byte $00
                !byte $00
                !byte $00
                !byte $09, $08
                !byte $07, $01
                !byte $07, $08
                !byte $09, $00
                !byte $00
                !byte $00
                !byte $08
                !byte $04, $0A
                !byte $01, $0A
                !byte $04, $08
                !byte $00
                !byte $00
                !byte $00
                !byte $06, $0E
                !byte $03, $01
                !byte $03, $0E
                !byte $06, $00
                !byte $00
                !byte $00
                !byte $02
                !byte $08
                !byte $0A
                !byte $01, $01
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                LDY #$03
                !byte $00

                *=$143D
label7          LDX #$00
                CLC
                ROL $0C42,X
                ROL $0C41,X
                ROL $0C40,X
                ROL $0C02,X
                ROL $0C01,X
                ROL $0C00,X
                ROL $0BC2,X
                ROL $0BC1,X
                ROL $0BC0,X
                ROL $0B82,X
                ROL $0B81,X
                ROL $0B80,X
                ROL $0B42,X
                ROL $0B41,X
                ROL $0B40,X
                ROL $0B02,X
                ROL $0B01,X
                ROL $0B00,X
                ROL $0AC2,X
                ROL $0AC1,X
                ROL $0AC0,X
                ROL $0A82,X
                ROL $0A81,X
                ROL $0A80,X
                ROL $0A42,X
                ROL $0A41,X
                ROL $0A40,X
                ROL $0A02,X
                ROL $0A01,X
                ROL $0A00,X
                INX
                INX
                INX
                INX
                INX
                INX
                CPX #$30
                BNE $143F
                INC $143A
                INC $143C
                INC $143C
                LDA $143A
                CMP #$08
                BEQ $14B5
                RTS
                LDA #$00
                STA $143A
                LDY $1439
                LDA ($02),Y
                AND #$3F
                BNE $14D1
label2          LDA #$00
                STA $1439
                LDA #$07
                STA $02
                LDA #$15
                STA $03
                RTS
                INY
                BNE $14D6
                INC $03
                STY $1439
                STA $FB
                LDA #$10
                STA $05
                LDX #$00
                STX $04
                TXA
                CLC
                ADC #$08
                BNE $14EB
                INC $05
                INX
                CPX $FB
                BNE $14E4
                STA $04
                LDX #$00
                LDY #$00
                LDA ($04),Y
                STA $0C42,X
                INX
                INX
                INX
                INX
                INX
                INX
                INY
                CPY #$08
                BNE $14F6
                RTS

                *=$1507
                !byte $54, $48
                !byte $49, $53
                !byte $20, $49, $53
                !byte $20, $54, $48
                !byte $45, $20
                !byte $4D, $41, $47
                !byte $49, $43
                !byte $20, $4B, $4E
                !byte $49, $47
                !byte $48
                !byte $54, $20
                !byte $41, $4E
                !byte $44, $20
                !byte $58
                !byte $4F, $52, $20
                !byte $50, $52
                !byte $45, $53
                !byte $45, $4E
                !byte $54, $49
                !byte $4E, $47, $20
                !byte $4F, $55, $52
                !byte $20, $4C, $49
                !byte $54, $54
                !byte $4C, $45, $20
                !byte $4D, $55, $53
                !byte $49, $43
                !byte $20, $44, $45
                !byte $4D, $4F, $20
                !byte $21, $21
                !byte $20, $49, $4E
                !byte $20, $54, $4F
                !byte $54, $41
                !byte $4C, $20, $54
                !byte $48
                !byte $49, $53
                !byte $20, $44, $45
                !byte $4D, $4F, $20
                !byte $41, $44
                !byte $44, $53
                !byte $20, $55, $50
                !byte $54, $4F
                !byte $20, $4F, $56
                !byte $45, $52
                !byte $20, $37, $30
                !byte $30, $20
                !byte $42
                !byte $4C, $4F, $43
                !byte $4B, $53
                !byte $20, $4F, $46
                !byte $20, $43, $4F
                !byte $44, $45
                !byte $2C, $20, $54
                !byte $55, $4E
                !byte $45, $53
                !byte $2C, $20, $54
                !byte $45, $58
                !byte $54, $2C
                !byte $20, $26, $20
                !byte $47, $52
                !byte $41, $50
                !byte $48
                !byte $49, $43
                !byte $53, $20
                !byte $55, $4E
                !byte $43, $4F
                !byte $4D, $50, $41
                !byte $43, $54
                !byte $45, $44
                !byte $20, $21, $21
                !byte $20, $57, $45
                !byte $20, $4D, $41
                !byte $4E, $41, $47
                !byte $45, $44
                !byte $20, $54, $4F
                !byte $20, $53, $51
                !byte $45, $45
                !byte $5A
                !byte $45, $2C
                !byte $20, $43, $52
                !byte $55, $4E
                !byte $43, $48
                !byte $2C, $20, $43
                !byte $4F, $4D, $50
                !byte $41, $43
                !byte $54, $2C
                !byte $20, $53, $54
                !byte $45, $50
                !byte $20, $4F, $4E
                !byte $2C, $20, $4A
                !byte $55, $4D
                !byte $50, $20
                !byte $4F, $4E, $2C
                !byte $20, $41, $4E
                !byte $44, $20
                !byte $46, $49
                !byte $4E, $41, $4C
                !byte $4C, $59, $20
                !byte $52
                !byte $4F, $4C, $4C
                !byte $20, $49, $54
                !byte $20, $44, $4F
                !byte $57, $4E
                !byte $20, $49, $4E
                !byte $54, $4F
                !byte $20, $37, $20
                !byte $50, $41
                !byte $52
                !byte $54, $53
                !byte $20, $21, $21
                !byte $21, $20
                !byte $54, $48
                !byte $49, $53
                !byte $20, $42, $49
                !byte $54, $20
                !byte $46, $45
                !byte $41, $54
                !byte $55, $52
                !byte $45, $53
                !byte $20, $54, $48
                !byte $45, $20
                !byte $4D, $55, $5A
                !byte $41, $4B
                !byte $20, $46, $52
                !byte $4F, $4D, $20
                !byte $41, $20
                !byte $47, $41
                !byte $4D, $45, $20
                !byte $42
                !byte $59, $20
                !byte $43, $4F
                !byte $44, $45
                !byte $20, $4D, $41
                !byte $53, $54
                !byte $45, $52
                !byte $53, $20
                !byte $57, $48
                !byte $49, $43
                !byte $48
                !byte $20, $57, $41
                !byte $53, $20
                !byte $41, $20
                !byte $42
                !byte $49, $54
                !byte $43, $48
                !byte $20, $54, $4F
                !byte $20, $52, $45
                !byte $4C, $4F, $43
                !byte $41, $54
                !byte $45, $20
                !byte $21, $21
                !byte $21, $20
                !byte $20, $49, $54
                !byte $20, $57, $41
                !byte $53, $20
                !byte $43, $4F
                !byte $4D, $50, $4F
                !byte $53, $45
                !byte $44, $20
                !byte $42
                !byte $59, $20
                !byte $4D, $41, $54
                !byte $54, $20
                !byte $47, $52
                !byte $41, $59
                !byte $20, $2E, $2E
                !byte $2E, $2E, $20
                !byte $42
                !byte $59, $20
                !byte $54, $48
                !byte $45, $20
                !byte $57, $41
                !byte $59, $20
                !byte $49, $47
                !byte $4E, $4F, $52
                !byte $45, $20
                !byte $54, $48
                !byte $45, $20
                !byte $54, $45
                !byte $58
                !byte $54, $2C
                !byte $20, $54, $48
                !byte $41, $54
                !byte $20, $54, $45
                !byte $4C, $4C, $53
                !byte $20, $59, $4F
                !byte $55, $20
                !byte $54, $48
                !byte $45, $20
                !byte $53, $43
                !byte $52
                !byte $45, $45
                !byte $4E, $20, $4E
                !byte $55, $4D
                !byte $42
                !byte $45, $52
                !byte $2C, $20, $43
                !byte $4F, $5A, $20
                !byte $57, $45
                !byte $20, $4B, $45
                !byte $50, $54
                !byte $20, $41, $44
                !byte $44, $49
                !byte $4E, $47, $20
                !byte $4D, $4F, $52
                !byte $45, $20
                !byte $41, $4E
                !byte $44, $20
                !byte $4D, $4F, $52
                !byte $45, $20
                !byte $21, $21
                !byte $21, $20
                !byte $4C, $45, $54
                !byte $53, $20
                !byte $53, $45
                !byte $45, $20
                !byte $55, $20
                !byte $47, $55
                !byte $59, $53
                !byte $20, $43, $4F
                !byte $4D, $45, $20
                !byte $41, $20
                !byte $44, $45
                !byte $4D, $4F, $20
                !byte $57, $49
                !byte $54, $48
                !byte $20, $4D, $4F
                !byte $52
                !byte $45, $20
                !byte $50, $41
                !byte $52
                !byte $54, $53
                !byte $20, $41, $4E
                !byte $44, $20
                !byte $54, $55
                !byte $4E, $45, $53
                !byte $20, $21, $21
                !byte $21, $21
                !byte $20, $20, $2D
                !byte $20, $50, $52
                !byte $45, $53
                !byte $53, $20
                !byte $59, $4F
                !byte $55, $52
                !byte $20, $4C, $4F
                !byte $4E, $47, $20
                !byte $4F, $4E, $45
                !byte $20, $54, $4F
                !byte $20, $43, $4F
                !byte $4E, $54, $49
                !byte $4E, $55, $45
                !byte $20, $2D, $20
                !byte $20, $41, $20
                !byte $53, $4D
                !byte $41, $4C
                !byte $4C, $20, $48
                !byte $45, $4C
                !byte $4C, $4F, $20
                !byte $54, $4F
                !byte $20, $54, $48
                !byte $45, $20
                !byte $53, $45
                !byte $58
                !byte $59, $20
                !byte $42
                !byte $49, $54
                !byte $20, $4F, $46
                !byte $20, $50, $55
                !byte $53, $53
                !byte $59, $20
                !byte $49, $20
                !byte $4D, $45, $54
                !byte $20, $41, $47
                !byte $41, $49
                !byte $4E, $20, $41
                !byte $46, $54
                !byte $45, $52
                !byte $20, $31, $20
                !byte $41, $4E
                !byte $44, $20
                !byte $41, $20
                !byte $48
                !byte $41, $4C
                !byte $46, $20
                !byte $59, $45
                !byte $41, $52
                !byte $53, $20
                !byte $41, $46
                !byte $54, $45
                !byte $52
                !byte $20, $4C, $45
                !byte $41, $56
                !byte $49, $4E
                !byte $47, $20
                !byte $53, $43
                !byte $48
                !byte $4F, $4F, $4C
                !byte $20, $21, $21
                !byte $21, $21
                !byte $21, $21
                !byte $21, $21
                !byte $21, $20
                !byte $2E, $2E, $2E
                !byte $2E, $2E, $2E
                !byte $2E, $2E, $2E
                !byte $2E, $20, $20
                !byte $20, $54, $45
                !byte $58
                !byte $54, $20
                !byte $49, $4E
                !byte $20, $54, $48
                !byte $49, $53
                !byte $20, $42, $49
                !byte $54, $20
                !byte $42
                !byte $59, $20
                !byte $4D, $2E, $4B
                !byte $2E, $20, $20
                !byte $43, $4F
                !byte $44, $45
                !byte $20, $42, $59
                !byte $20, $58, $4F
                !byte $52
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $20, $44, $41
                !byte $54, $45
                !byte $20, $33, $31
                !byte $3A
                !byte $31, $32
                !byte $3A
                !byte $38
                !byte $37, $20
                !byte $20, $54, $49
                !byte $4D, $45, $20
                !byte $31, $31
                !byte $3A
                !byte $32
                !byte $37, $20
                !byte $50, $4D
                !byte $20, $28, $4E
                !byte $45, $41
                !byte $52
                !byte $4C, $59, $20
                !byte $4E, $45, $57
                !byte $20, $59, $45
                !byte $41, $52
                !byte $21, $29
                !byte $20, $20, $20
                !byte $20, $20, $20
                !byte $42
                !byte $59, $45
                !byte $20, $55, $20
                !byte $50, $45
                !byte $45, $50
                !byte $53, $20
                !byte $21, $20
                !byte $20, $20, $20
                !byte $20, $40, $00


label0 = $E544
label1 rts ;= $2102
label3 rts ;= $2106
label5 rts ;= $CE00
label8 = $EA7E
