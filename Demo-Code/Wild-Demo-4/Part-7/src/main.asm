; ************* Part-7 ************* ;
;                                    ;
;         SYS 16384 to start         ;
;                                    ;
; ********************************** ;


; SYS 16384 to start
                *=$1000
                !bin "../binaries/memory-1000-1200.bin"

                *=$1700
                SEI
                LDX #$00
branch          LDA $1800,X
                STA $D800,X ; Colour ram
                LDA $1900,X
                STA $D900,X
                LDA $1A00,X
                STA $DA00,X
                LDA $1B00,X
                STA $DB00,X
                LDA $1C00,X
                STA $0400,X ; Screen ram
                LDA $1D00,X
                STA $0500,X
                LDA $1E00,X
                STA $0600,X
                LDA $1F00,X
                STA $0700,X
                INX
                BNE branch
                LDA #$97
                STA $DD00 ; VIC bank selection
                LDA #$1A
                STA $D018
                LDA #$3B
                STA $D011 ; Multi-colour bitmap control register
                LDA #$18
                STA $D016 ; Multi-colour bitmap control register
                LDA #$00
                STA $D020
                STA $D021
                RTS

                *=$1800
                !bin "../binaries/memory-1800-3fff.bin"

                *=$4000
                SEI
                LDA #$37
                STA $01
                LDA #$06
                STA $D020
                STA $D021
                LDA #$00
                JSR label0
                LDA #$1F
                STA $D418
                LDA #$08
                JSR label1
                LDA #$00
                STA $3FFF
                STA $02
                STA $03
                LDA #$7D
                STA $028A
                LDA #$E1
                STA $0328
                LDX #$00
branch0         LDA #$00
                STA $0900,X
                STA $0A00,X
                STA $0B00,X
                INX
                BNE branch0
                JSR label2
                JSR label3
                CLI
                CLC
                LDA #$7F
                STA $0314
                LDA #$40
                STA $0315
                LDA #$01
                STA $D019
                STA $D01A
                LDA #$31
                STA $D012
                LDA #$00
                STA $DC0E
                STA $D020
                STA $D021
                CLI
                JSR label4
                JSR label5
                CLI
label6          JMP label6
branch1         LDA $D019
                AND #$01
                BEQ branch1
                STA $D019
                RTS
                JSR branch1
                LDA #$07
                ORA #$70
                STA $D011
                LDA #$31
                STA $D012
                LDA #$00
                STA $D020
                LDA #$A4
                STA $0314
                LDA #$40
                STA $0315
                CLI
                JSR label8
                JMP label9
                JSR branch1
                LDA #$F9
                STA $D012
                LDA #$00
                STA $D020
                LDA #$7F
                STA $0314
                LDA #$40
                STA $0315
                CLI
                JSR label10
                JSR label11
                JMP label12
label5          SEI
                LDA #$FF
                STA $D015
                STA $D01D
                LDA #$00
                STA $D01C
                STA $D017
                LDX #$00
                STX $40DC
branch2         LDA #$80
                STA $D000,X
                LDA #$1E
                STA $D001,X
                LDA $40DC
                CLC
                ADC #$30
                STA $40DC
                INX
                INX
                CPX #$10
                BNE branch2
                LDA #$C0
                STA $D010
                LDX #$25
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
                LDA #$01
                STA $D027
                STA $D028
                STA $D029
                STA $D02A
                STA $D02B
                STA $D02C
                STA $D02D
                STA $D02E
                STA $D02F
                RTS
label11         LDX #$00
branch3         CLC
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
                INX
                INX
                INX
                CPX #$3F
                BNE branch3
                INC $41EF
                LDX $41EF
                CPX #$08
                BNE branch4
                LDA #$00
                STA $41EF
                JSR label13
branch4         RTS
label13          LDY #$00
                LDA ($08),Y
                AND #$3F
                BNE branch5
                JSR label4
                JMP label14
branch5         STA $02
                INC $08
                BNE branch6
                INC $09
branch6         LDA #$10
                STA $03
                LDA $02
                CLC
                ASL
                ROL
                ASL
                STA $02
                BCC $41CC
                INC $03
branch7         LDY #$00
                LDX #$00
branch8         LDA ($02),Y
                EOR #$FF
                STA $0B0A,X
                INX
                INX
                INX
                INX
                INX
                INX
                INY
                CPY #$08
                BNE branch8
label14         RTS
label4          LDA #$06
                STA $08
                LDA #$42
                STA $09
                RTS
                BRK
                BRK
                BRK
                ASL $00
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK
                BRK

                *=$4206
                !text "AT LAST THE 3RD AND FINAL SCREEN OF THIS DEMO !! .... YEAHH!   THE BOUNCING PICCY BELOW IS "
                !text "OF ME !! (THE MAGIC KNIGHT !), IT WAS RIPPED AND ALTERED BY THE MAGIC KNIGHT .....   THE MUZAK" 
                !text "IS FROM BANGKOK KNIGHTS AND ITS BY ROBB HUBBARD  MANY THANKS TO BUSTERS FOR HELPING ME TO GET "
                !text "THIS BLOODY SCREEN BOUNCING WITH THE SCROLLER GOING AT THE SAME RATE AS THE SCREEN !!!       "
                !text "TODAYS DATE 28/12/87 .. AND I'M TYPING AGAIN, THE TIME IS 10:26 PM AND IM FEELING PRETTY BLOODY "
                !text "KNACKERED SO THIS SCRIPT MAY DRAG ON A BIT SO TUFF TITIES !      I KNOW THIS DEMO IS PRETTY MUCH "
                !text "SIMILAR TO CRAIGS 'WILD DEMO 3' BUT WERE TRYING TO THINK UP SOME NEW CONCEPTS, BUT UNTIL WE DO, ALL "
                !text "U IZ GONNA GET IS COOL MUSIC, NON FLICKERY, BOUNCY DEMOS OF GRAPHICAL DELIGHT (OR SHOULD THAT BE DESPAIR ?)"
                !text "  I HAVE ONLY WRITTEN ONE DEMO BEFORE, SO WOT DO YA THINK TO THIS ONE THEN ?        O.K. SO IT'S NOT EXACTLY "
                !text "'BURNING HEARTS', 'BRAINBUG', 'METAL MUSIC', 'ODD HABITS' OR 'RHAA LOVELY II' BUT THIS IS MY FIRST REAL ATTEMPT, "
                !text "SO STAY TUNED FOR SOMETHING A LITTLE MORE SPECIAL NEXT TIME ....  I HAVE GIVEN UP THE CRACKING RACE, (UNLESS I "
                !text "CAN GET HOLD OF AN ORIGINAL SUPPLIER), SO THAT I CAN SAVE MY CASH TOWARDS GETTING A CAR !  AND SPEND MY TIME CODING "
                !text "... MY ADDRESS IS IN THE OTHER 2 PARTS OF THIS DEMO, SO IF YOU WANNA SWAP ON EITHER '64, AMIGA, 520ST THEN U KNOW "
                !text "WHERE TO WRITE ..  THE MAGIC KNIGHT IS NOW OFF AND CLEAR ........   SEE U ALL IN THE NEXT ONE, PEEPS               "
                !text "                          @"

                *=$47CC
label10         LDX #$00
bbranch1        LDA $D012
bbranch0        CMP $D012
                BEQ bbranch0
                TAY
                DEY
                TYA
                AND #$07
                ORA #$38
                STA $D011
                INX
                CPX #$33
                BNE bbranch1
                LDX $4832
                LDA $4900,X
                SEC
                SBC #$A8
                STA $47E2
                CLC
                ADC #$26
                STA $D001
                STA $D003
                STA $D005
                STA $D007
                STA $D009
                STA $D00B
                STA $D00D
                STA $D00F
                LDA $4833,X
                STA $D027
                STA $D028
                STA $D029
                STA $D02A
                STA $D02B
                STA $D02C
                STA $D02D
                STA $D02E
                INX
                CPX #$1A
                BNE bbranch2
                LDX #$00
bbranch2        STX $4832
                RTS

                *=$4832
                !bin "../binaries/memory-4832-4940.bin"

                *=$8000
                !bin "../binaries/music-8000-9d60.bin"

label0 = $8009
label1 = $FFD2
label2 = $E544
label3 = $1700
label8 = $800F
label9 = $EA31
label12 = $EA7E