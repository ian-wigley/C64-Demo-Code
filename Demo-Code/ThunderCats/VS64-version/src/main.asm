;
; ThunderCats Music rip
; SYS2304 ($0900) to start
;

*=$0801
!byte $0c,$08,$b5,$07,$9e,$20,$32,$33,$30,$34,$00,$00,$00
jmp start

start
                *=$0900
                SEI
                JSR label0
                JSR label1
                JSR label2
label3          JMP label3
label4          LDX #$00
branch0         LDA screen_text,X ; Screen Text
                STA screen,X
                LDA #$01
                STA $D800,X ;Shape of characters in lowercase/uppercase character set (2048 bytes, 256 entries).
                LDA #$00
                STA $D900,X
                INX
                BNE branch0
                LDX #$00
branch1         LDA #$9F
                STA $0590,X
                INX
                CPX #$28
                BNE branch1
                RTS
label1          SEI
                LDA #$1E
                STA $D018 ;Memory setup register relative to VIC bank ($3800)
                NOP
                NOP
                LDA #$7F
                AND $D011 ;Screen control register
                STA $D011 ;Screen control register
                LDA #$00
                STA $D020 ;Border colour
                STA $D021 ;Background colour
                JSR label4
                CLI
                RTS

label2          SEI
                LDA $DC0D ;Interrupt control and status register
                LDA #$7F
                STA $DC0D ;Interrupt control and status register
                LDA #$01
                STA $D019 ;Interrupt status register
                STA $D01A ;Interrupt control register
                LDX #$9F
                LDY #$09
                STX $FFFE
                STY $FFFF
                LDX #$9E
                LDY #$09
                STX $FFFA
                STY $FFFB
                CLI
                LDA #$35
                STA $01
                JSR label5
                NOP
                NOP
                LDA #$00
                TAX
                TAY
                RTS

label6          STA $0AD5
                STY $0AD6
                STX $0AD7
                CLC
branch2         LDA $D019 ;Interrupt status register
                AND #$01
                BEQ branch2
                STA $D019 ;Interrupt status register
                RTS

label8          LDA $0AD5
                LDY $0AD6
                LDX $0AD7
                RTI
                JSR label6
                LDA #$08
                ORA #$C0
                STA $D016 ;Horizontal scroll
                LDA $0AD8
                STA $D020 ;Border colour
                STA $D021 ;Background colour
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
                LDA #$00
                STA $D020 ;Border colour
                STA $D021 ;Background colour
                LDA #$30
                STA $D012 ;Current raster line
                LDX #$DA
                LDY #$09
                STX $FFFE
                STY $FFFF
                CLI
                JSR label7
                JMP label8
                JSR label6
                LDA #$08
                ORA #$C0
                STA $D016
                LDA #$00
                STA $D020 ;Border colour
                STA $D021 ;Background colour
                LDA #$80
                STA $D012 ;Current raster line
                LDX #$02
                LDY #$0A
                STX $FFFE
                STY $FFFF
                CLI
                JSR label9
                JMP label8
                JSR label6
                LDA $0AD4
                ORA #$C0
                STA $D016 ;Horizontal scroll
                LDA $0AD8
                STA $D020 ;Border colour
                STA $D021 ;Background colour
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
                LDA #$00
                STA $D020 ;Border colour
                STA $D021 ;Background colour
                LDA #$8A
                STA $D012 ;Current raster line
                LDX #$9F
                LDY #$09
                STX $FFFE
                STY $FFFF
                CLI
                JSR label10
                JSR label11
                JMP label8
label11         LDA $0AD4
                SEC
                SBC #$02
                STA $0AD4
                BPL branch3
                AND #$07
                STA $0AD4
                JSR label12
branch3         RTS

label12         LDX #$00
branch4         LDA $0591,X
                STA $0590,X
                INX
                CPX #$27
                BNE branch4
                LDY $0AD3
                LDA scroll_text,Y
                CLC
                ADC #$7F
                STA $05B7
                INC $0AD3
                RTS

; Scroll text backgound colour
label10         LDX #$00
branch6         LDA $D012
branch5         CMP $D012
                BEQ branch5
                LDA $0AE1,X
;                lda #$06
                STA $D021
                INX
                CPX #$06
                BNE branch6
                RTS

label7          INC $0AD1
                LDX $0AD1
                CPX #$03
                BNE branch7
                LDA #$00
                STA $0AD1
                LDA $0AE1
                PHA
                LDX #$00
branch8         LDA $0AE2,X
                STA $0AE1,X
                INX
                CPX #$07
                BNE branch8
                PLA
                STA $0AE8
                LDY $0AD2
                CPY #$08
                BNE branch9
                LDY #$00
                STY $0AD2
branch9         LDA $0AEA,Y
                STA $0AD8
                INC $0AD2
branch7         RTS

label0 = $E544
label5 = $FB1D
label9 = $ED12
screen = $0400
    
    *=$0AD1
    !byte $00,$00,$00
    
    *=$0AD4
    !byte $00
	
	*=$0AD5
	!byte $00,$00,$00

    ; $0AD8
    !byte $00

    !byte $00,$00,$00,$00,$00,$00,$00,$00
    !byte $0C,$0F,$01,$0F,$0C,$0B,$00,$0B
    !byte $00,$00,$06,$0E,$03,$01,$03,$0E
    !byte $06
    
screen_text ;$0AF2
    !byte $2D,$20,$14,$08,$05,$20,$17
    !byte $09,$0C,$04,$20,$13,$14,$19,$0C
    !byte $05,$13,$20,$10,$12,$05,$13,$05
    !byte $0E,$14,$20,$01,$20,$11,$15,$09
    !byte $03,$0B,$20,$04,$05,$0D,$0F,$20
    !byte $2D,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$17,$09,$14,$08,$20,$14,$08
    !byte $05,$20,$0D,$15,$13,$09,$03,$20
    !byte $06,$12,$0F,$0D,$20,$05,$0C,$09
    !byte $14,$05,$13,$20,$14,$08,$15,$0E
    !byte $04,$05,$12,$20,$03,$01,$14,$13
    !byte $2E,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$03,$0F,$04,$05,$20
    !byte $02,$19,$20,$03,$12,$01,$09,$07
    !byte $20,$14,$15,$0E,$05,$20,$05,$18
    !byte $14,$12,$01,$03,$14,$09,$0F,$0E
    !byte $20,$02,$19,$20,$09,$01,$0E,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20

!byte $20,$20,$20,$20,$20,$20,$20,$00   
    
scroll_text ;$0BFD
    !byte $08,$05,$0C,$0C
    !byte $0F,$20,$14,$0F,$20,$2D,$20,$0A
    !byte $05,$0E,$13,$20,$0F,$06,$20,$09
    !byte $13,$04,$20,$2C,$20,$03,$0A,$20
    !byte $0F,$06,$20,$14,$08,$05,$20,$09
    !byte $16,$03,$20,$2C,$20,$02,$0F,$04
    !byte $20,$0F,$06,$20,$08,$0F,$14,$0C
    !byte $09,$0E,$05,$20,$2C,$20,$05,$0C
    !byte $05,$03,$14,$12,$0F,$20,$2C,$20
    !byte $13,$14,$01,$12,$06,$09,$12,$05
    !byte $20,$2C,$20,$03,$08,$09,$07,$0C
    !byte $05,$19,$20,$2C,$20,$13,$15,$10
    !byte $05,$12,$20,$13,$01,$0D,$20,$2C
    !byte $20,$14,$08,$05,$20,$08,$05,$12
    !byte $0F,$20,$2C,$20,$14,$0D,$03,$20
    !byte $2C,$20,$14,$03,$13,$20,$2C,$20
    !byte $13,$09,$0C,$05,$0E,$14,$13,$20
    !byte $2C,$20,$02,$05,$01,$13,$14,$09
    !byte $05,$20,$02,$0F,$19,$13,$20,$2C
    !byte $20,$13,$03,$07,$20,$2C,$20,$02
    !byte $17,$02,$20,$2C,$20,$31,$30,$30
    !byte $31,$20,$2C,$20,$0D,$01,$14,$20
    !byte $2C,$20,$01,$0C,$0C,$20,$14,$08
    !byte $05,$20,$0E,$05,$14,$14,$05,$12
    !byte $13,$20,$2C,$20,$01,$0E,$04,$20
    !byte $01,$0C,$0C,$20,$14,$08,$05,$20
    !byte $01,$0D,$09,$07,$01,$20,$06,$12
    !byte $05,$01,$0B,$13,$20,$2C,$20,$01
    !byte $0E,$04,$20,$01,$0C,$0C,$20,$17
    !byte $05,$20,$06,$0F,$12,$07,$0F,$14
    !byte $20,$20,$20,$20,$20,$20,$20,$20
    !byte $20,$20,$20,$20,$20,$20,$20,$00

    *=$3800
    !bin "../src/FONT.bin"
    
    *=$E000
    !bin "../src/MUSIC.bin"                
