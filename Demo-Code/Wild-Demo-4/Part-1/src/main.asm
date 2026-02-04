; SYS 4608 to start
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
                !text "THIS IS THE MAGIC KNIGHT AND XOR PRESENTING OUR LITTLE MUSIC DEMO !! IN TOTAL "
                !text "THIS DEMO ADDS UPTO OVER 700 BLOCKS OF CODE, TUNES, TEXT, & GRAPHICS UNCOMPACTED "
                !text "!! WE MANAGED TO SQEEZE, CRUNCH, COMPACT, STEP ON, JUMP ON, AND FINALLY ROLL IT "
                !text "DOWN INTO 7 PARTS !!! THIS BIT FEATURES THE MUZAK FROM A GAME BY CODE MASTERS "
                !text "WHICH WAS A BITCH TO RELOCATE !!!  IT WAS COMPOSED BY MATT GRAY .... BY THE WAY "
                !text "IGNORE THE TEXT, THAT TELLS YOU THE SCREEN NUMBER, COZ WE KEPT ADDING MORE AND "
                !text "MORE !!! LETS SEE U GUYS COME A DEMO WITH MORE PARTS AND TUNES !!!!  - PRESS YOUR "
                !text "LONG ONE TO CONTINUE - TEXT IN THIS BIT BY M.K.  CODE BY XOR          "
                !text "DATE 31:12:87  TIME 11:27 PM (NEARLY NEW YEAR!)      BYE U PEEPS !     @"

                *=$2000 ;$2000-3000
                !bin "../binaries/music-2000-3000.bin"

label0 = $E544
label1 = $2102
label3 = $2106
label5 rts ;= $CE00
label8 = $EA7E
