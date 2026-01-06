; Miami Vice Intro
; SYS4096 ($1000) to start

; --------------------------------------
; Info
; ---------------------------------------
; Font bytes from $0800-$0FC0
; Main code from $1000
; Variables from $11bf-$1202
; Scroll text from $1300-$19C6
; Screen data from $1C00–$1FFF
; Background image from $2800-$3F38 (ish) 8x8 Chars
; Color data from $4000–$43FF
; Sid from $E000

               *=$07fd
                jmp start
                *=$0800
                !bin "../FONT.BIN"

               *=$1000
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
branch10        STA $D000,X
                INX
                INX
                CLC
                ADC #$19
                STA $D000,X
                CPX #$10
                BNE branch10
                LDX #$00
branch11        LDA $11E5,X
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
branch13        JSR label7
label6          LDA $DC01
                CMP #$FE
                BNE branch14
                LDA $11C3
                BEQ branch15
                RTI
branch15        LDA #$00
                LDX #$00
                LDY #$0B
                JSR label0
                LDA #$01
                STA $11C3
                LDA #$00
                STA $11C4
                STA $11C5
                RTI
branch14        CMP #$F7
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
branch16        CMP #$FD
                BNE branch18
                LDA $11C5
                BEQ branch19
                RTI
branch19        LDA #$01
                STA $C00F
                LDA #$01
                STA $11C5
                LDA #$00
                STA $11C3
                STA $11C4
                RTI
branch12        STX $11BF
                CPX #$01
                BNE branch18
                JSR label8
branch18        RTI

				*=$11bf
				; start address:11bf-1202
				!byte $00,$00,$00,$00,$00,$00,$00,$47
				!byte $75,$8C,$A3,$BA,$D1,$E8,$FF,$16
				!byte $49,$60,$77,$8E,$A5,$BC,$D3,$EA
				!byte $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7
				!byte $C9,$CA,$47,$5E,$75,$8C,$A3,$BA
				!byte $E8,$FF,$16,$32,$49,$60,$77,$8E
				!byte $BC,$D3,$EA,$FD,$00,$00,$00,$00
				!byte $00,$00,$00,$00,$00

;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                SRE $5E
;                ADC $8C,X
;                LAX ($BA,X)
;                NOP ;CMP
;                INX
;                NOP ;ISB $3216,X#
;                NOP;
;
;                EOR #$60
;                RRA $8E,X
;                LDA $BC
;                DCP ($EA),Y
;                SBC $C1C0,X
;                NOP #$C3
;                CPY $C5
;                DEC $C7
;                INY
;                CMP #$CA
;                SRE $5E
;                ADC $8C,X
;                LAX ($BA,X)
;                nop; CMP
;                INX
;                
;                NOP;ISB $3217,x ;6,X
;                NOP
;
;                EOR #$60
;                RRA $8E,X
;                LDA $BC
;                DCP ($EA),Y
;                SBC $0000,X
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK
;                BRK

;*=$1203
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
branch20        CLC
                ADC #$17
                STA $11C6,X
                INX
                CPX #$0A
                BNE branch20
                LDX #$01
                LDA $11D0
branch21        CLC
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
branch23        LDA $11E5,X
                STA $11C6,X
                LDA $11EF,X
                STA $11D0,X
                INX
                CPX #$0A
                BNE branch23
                RTS
branch22        JSR label9
                LDY $11C0
                LDA ($5B),Y
                CMP #$40
                BEQ branch24
                CMP #$2E
                BNE branch25
                LDA #$1B
                JMP $1292;label10
branch25        CMP #$3F
                BNE branch26
                LDA #$1C
                JMP $1292;label10
branch26        CMP #$21
                BNE branch27
                LDA #$1D
                JMP $1292;label10
branch27        CMP #$2F
                BNE branch28
                LDA #$1E
branch28        AND #$3F
                JMP label11
branch24        LDA #$00
                STA $11C2
                STA $11C0
                LDA #$00
                STA $5B
                LDA #$13
                STA $5C
                JSR label9
                RTS
label11         CLC
                ADC #$1F
                STA $11E4
                INY
                BNE branch29
                INC $5C
branch29        STY $11C0
                LDX #$00
branch30        LDA $11DB,X
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
branch31        STX $11C1
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

				*=$1300 ;$1300-$19C6
                !bin "../SCROLL_TEXT.BIN"

				*=$1C00 ;$1C00–$1FFF
                !bin "../SCREEN_DATA.BIN"

				*=$2800 ;$2800-$3F38
                !bin "../BACKGROUND_DATA.BIN"

				*=$4000 ;$4000–$43FF
                !bin "../COLOUR_DATA.BIN"
				

label0 rts ;= $E06C
label5 rts ;= $C475
label7 rts ;= $E0B2
