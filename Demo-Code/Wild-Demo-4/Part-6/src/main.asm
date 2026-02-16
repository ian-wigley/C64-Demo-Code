; ************* Part-6 ************* ;
;                                    ;
;          SYS 2304 to start

                *=$0900
                LDA #$36
                STA $01
                LDA #$1B
                STA $D011
                LDA #$1F
                STA $D018
                LDA #$08
                JSR label0
                LDA #$7D
                STA $028A
                LDA #$E1
                STA $0328
                LDA #$01
                STA $5100
                JSR label1
                JSR label2
                LDA #$00
                STA $02A7
                STA $02A8
                STA $02A9
                STA $02
                STA $03
                STA $08
                STA $09
                STA $FB
                STA $FC
                JSR label3
                LDX #$00
branch0         LDA $0C86,X ; 0944
                AND #$3F
                STA $0400,X
                LDA #$00
                STA $2000,X
                STA $2100,X
                STA $2200,X
                STA $DB00,X
                INX
                BNE branch0
                JSR $0C63; JSR label4
                JSR $0B38 ;JSR label5
                LDA #$00
                STA $D020
                STA $D021
                LDA #$D0
                STA $0314
                LDA #$09
                STA $0315
                LDA #$00
                STA $DC0E
                LDA #$7F
                STA $DC0D
                LDA #$01
                STA $D019
                STA $D01A
                LDA #$30
                STA $D012
branch1         CLI
                LDA $DC01
                CMP #$EF ; Compare if space has been pressed
                BNE branch1
                LDA #$00
                STA $D015
                STA $D017
                STA $D01D
                STA $D021
                JSR label3
                LDA #$18
                STA $D018
                LDA $D01A
                AND #$F0
                STA $D01A
                LDA #$00
                STA $DC0D
                LDA #$31
                STA $0314
                LDA #$EA
                STA $0315
                CLI
                JMP $6B00 ;RTS ; JMP label6
branch2         LDA $D019
                AND #$01
                BEQ branch2
                STA $D019
                RTS
;09D0
                JSR $09C5 ;label7
                LDA #$0C
                STA $D020
                STA $D021
                LDY #$07
branch3         DEY
                BNE branch3
                NOP
                NOP
                NOP
                BIT $00
                LDA #$00
                STA $D020
                STA $D021
                LDA #$60
                STA $D012
                LDA $D800
                STA $0AD0
                STA $09D4
                LDA #$12
                STA $0314
                LDA #$0A
                STA $0315
                CLI
                JSR label8  ; OK
                JSR $0AEA ;label9  ; Wrong should be $0AEA & not $0B88
                JSR $0BBA ;label10 ; Wrong should be $0BBA & not $0C5A
                JMP label11 ; OK
                JSR $09C5 ;label7
                LDA #$70
                STA $D012
                LDA #$2B
                STA $0314
                LDA #$0A
                STA $0315
                CLI
                JSR $0B07 ;label12  ; Wrong should be $0B07 & not $0BA4
                JMP label13
                JSR $09C5 ;label7
                LDA #$A0
                STA $D012
                LDA #$D0
                STA $0314
                LDA #$09
                STA $0315
                CLI
                JSR label14 ; OK
                JSR label15 ; OK
                JMP label13
label8          LDX #$00
                LDA $D012
branch4         CMP $D012
                BEQ branch4
                LDA $D012
                AND #$07
                ORA #$18
                STA $D011
                LDA $0A8E,X
                STA $D021
                STA $D020
                INX
                CPX #$52
                BNE branch4
                RTS
label14         LDX #$15
                LDY #$09
branch5         DEY
                BPL branch5
branch6         BIT $00
                DEC $D016
                INC $D016
                LDA $D012
                TAY
                DEY
                TYA
                AND #$07
                ORA #$10
                STA $D011
                NOP
                NOP
                NOP
                NOP
                DEX
                BNE branch6
                RTS
                !byte $09, $08
                !byte $09, $08
                !byte $08
                !byte $07, $08
                !byte $07, $07
                !byte $01, $07
                !byte $01, $01
                !byte $07, $01
                !byte $07, $07
                !byte $08
                !byte $07, $08
                !byte $08
                !byte $09, $08
                !byte $09, $09
                !byte $00
                !byte $09, $00
                !byte $00
                !byte $06, $00
                !byte $06, $06
                !byte $0E, $06, $0E
                !byte $0E, $03, $0E
                !byte $03, $03
                !byte $01, $03
                !byte $01, $01
                !byte $03, $01
                !byte $03, $03
                !byte $0E, $03, $0E
                !byte $0E, $06, $0E
                !byte $06, $06
                !byte $00
                !byte $06, $00
                !byte $00
                !byte $09, $00
                !byte $09, $00
                !byte $00
                !byte $0C, $00, $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                !byte $00
                LDX #$00
                LDA $0A8E
                STA $FB
branch7         LDA $0A8F,X
                STA $0A8E,X
                INX
                CPX #$3F
                BNE branch7
                LDA $FB
                STA $0ACD
                LDA $0ADE
                STA $FB
                RTS
                LDA #$00
                STA $02A7
                LDX $02A8
                LDA $0B28,X
                CMP #$FF
                BNE branch8
                LDA #$00
                STA $02A8
                RTS
branch8         LDX #$00
branch9         STA $D800,X
                INX
                BNE branch9
                INC $02A8
                RTS
                !byte $0B, $0B
                !byte $0C, $0C, $0F
                !byte $0F, $01, $01
                !byte $0F, $0F, $0C
                !byte $0C, $0B, $00
                !byte $00
                !byte $FF

;                , $78, $A9
;                !byte $7F, $2D, $11
;                !byte $D0, $8D
;                !byte $11, $D0

label5          SEI ;$0B38
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
                STA $D01C
                STA $D017
                LDX #$00
                STX $0B5E
bbranch10       LDA #$80
                STA $D000,X
                LDA #$73
                STA $D001,X
                LDA $0B5E
                CLC
                ADC #$30
                STA $0B5E
                INX
                INX
                CPX #$10
                BNE bbranch10
                LDA #$C0
                STA $D010
                LDX #$80
                STX $07F8
                INX
                STX $07F9
                INX
                STX $07FA
label9          INX
                STX $07FB
                INX
                STX $07FC ; branch7 
                INX
                STX $07FD
                INX
                STX $07FE
                INX
                STX $07FF
                LDA #$01
                STA $D027
                STA $D028
label12          STA $D029
                STA $D02A
                STA $D02B
                STA $D02C
                STA $D02D
                STA $D02E
                STA $D02F
                RTS
                LDX #$00
                CLC
                ROL $2202,X
                ROL $2201,X
                ROL $2200,X
                ROL $21C2,X
                ROL $21C1,X
                ROL $21C0,X
                ROL $2182,X
                ROL $2181,X
                ROL $2180,X
                ROL $2142,X
                ROL $2141,X
                ROL $2140,X
                ROL $2102,X
                ROL $2101,X
                ROL $2100,X
                ROL $20C2,X
                ROL $20C1,X
                ROL $20C0,X
                ROL $2082,X
                ROL $2081,X
                ROL $2080,X
                ROL $2042,X
                ROL $2041,X
                ROL $2040,X
                ROL $2002,X
                ROL $2001,X
branch10        ROL $2000,X
                INX
                INX
                INX
                CPX #$3F
                BNE $0BBC; BNE branch11  ** BUG **
                INC $0C6F
                LDX $0C6F
                CPX #$08
                BNE branch12
                LDA #$00
                STA $0C6F
                JSR label16
branch12        RTS

label16         LDY #$00
                LDA ($08),Y
                AND #$3F
                BNE branch13
                JSR label4
                JMP label17
branch13        STA $02
                INC $08
                BNE branch14
                INC $09
branch14        LDA #$38
                STA $03
                LDA $02
                CLC
                ASL
                ROL
                ASL
                STA $02
                BCC $0C4E
                INC $03
                LDY #$00
                LDX #$00
branch16        LDA ($02),Y
                STA $220A,X
                INX
                INX
                INX
label10         INX
branch11        INX
                INX
                INY
                CPY #$08
                BNE branch16
label17         RTS
; $0C63
label4          LDA #$89
                STA $08
                LDA #$0D
                STA $09
                RTS
    *=$0c6c
    ; start address:0c6c-0c89
    !byte $00,$00,$00,$04,$00,$00,$00,$00
    !byte $00,$00,$00,$00,$00,$00,$00,$00
    !byte $00,$00,$00,$00,$00,$00,$00,$00
    !byte $00,$00;,$20,$20,$20,$54

    *=$0C86

    !TEXT "     THE WILD STYLES OF SIGMA PRESENTS    "
    !TEXT "         YET ANOTHER MUSICAL PART         "
    !TEXT "    ----------------------------------    "
    !TEXT "   WRITE TO 27 GARTH CRESCENT, ALVASTON,  "
    !TEXT "         DERBY. DE2 OGX. ENGLAND          "
    !TEXT "      THIS DEMO WAS WRITTEN 25:12:87      "
    !TEXT "                     WELCOME TO THE SECOND"



    ;!text "   THE WILD STYLES OF SIGMA PRESENTS       "
    ;!text "        YET ANOTHER MUSICAL PART           "
    ;!text "----------------------------------         "
    ;!text "        THIS DEMO WAS WRITTEN 25:12:87 "
    ;!text "                        WELCOME TO THE SECOND PART OF MY COLOURFUL MUSIC DEMO   "
    ;!text "               WELCOME TO THE SECOND PART OF MY COLOURFUL MUSIC DEMO   "
    ;*=$0CB3
    !text " PART OF MY COLOURFUL MUSIC DEMO   "
    !text "THIS DEMO IS MY FIRST MAJOR DEMO, IT WAS WRITTEN ON CHRISTMAS DAY 1987 !   PRESS "
    !text "THE LONG ONE TO CONTINUE  OR HANG AROUND TO SEE THE GREETINGS, WHICH WILL ONLY "
    !text "APPEAR IN THIS PART ...       NOW ONTO SOME GREETINGS ... HI TO LYNX AND THE REST "
    !text "OF THE COOL CONFERENCE GUYS WHO ME AND BUSTERS HAVE CHATTED WITH OVER THE PAST COUPLE "
    !text "OF NIGHTS ...  HELLOS MUST GOTO THE REST OF THE SIGMA CREW ... AND TO OUR COOL CONTACTS "
    !text "WHO ARE :- JENS HARTTMANN (THANKS AGAIN FOR THE PRESENT) , C.J. OF I.V.C (HOW U DOIN' DAN ?)"
    !text " , BOD OF HOTLINE (CDL) (KEEP UP THE DEMOS DARREN) , STARFIRE INC. (MAYBE I MIGHT GET A CHANCE"
    !text " TO SPEAK TO U EDGE NEXT TIME WE BASH THE BOX!) , MAX OF FLAT 3 (HIYA MAN - GOT URE AMIGA YET ?)"
    !text " , TFT OF THE TASK FORCE (WHEN WE GONNA SEE THE NEW DEMO ?) , JESTER OF A.C.E (NICE QUICK CHAT ON "
    !text "THE CONFERENCE EH? I'LL RING U SOME TIME FOR A GOOD CHAT) , 7UP/ACT (HOPE TO HEAR FROM U GUYS SOON)"
    !text " , JOE COOL OF G.S.S (HE JOE THANKS FOR THE SENDING AND FOR THE COPY OF ILLEGAL) , ACSC (SORRY FOR "
    !text "PASSING YOU ON MAN BUT MY FRIEND WANTED A CONTACT) , MARKER OF THE BLUES BROTHERS (THANKS FOR THE AMIGA "
    !text "SENDINGS ONN) , WOLFY (I'LL SEND SOON) AND HELLOS TO SIT & DAZ ... JEZ, ALL I GOTTA DO NOW IS THE GREETS,"
    !text "    BUT THEY CAN WAIT !!  HEY C.U.C WHY DID U USE OUR GOOD NAME FOR YOUR LAME DEMO ?     DON'T DO IT AGAIN !"
    !text "  CAN YOU SUPPLY ORIGINALS ? IF U CAN THEN WRITE TO THE ABOVE ADDRESS,   HEY SCOOP, ANY CHANCE OF USING ANY "
    !text "OF YOUR COOL MUSIC IN ONE OF OUR DEMOS ?,  WHOS GOT THE HUBBARD EDITOR AND WILL GIVE ME A COPY SO I CAN TRY "
    !text "AND MAKE MUSIC WITH IT ?, WHY AM I BORED STIFF ON X-MAS DAY AT 12:17 AM ?  ENOUGH OF THIS LOG U PEEPS OUT "
    !text "THERE WANNA SEE THE GREETS ... GOLDEN REGARDS GOTO ... AXENON , XAKK/KNATTER , ZETRIX , EXILE , PAPILLONS , "
    !text "SHIELD , THE SILENTS , FBR , XOR , BEASTIE BOYS , LLS , TT , TRIAD , FAIRLIGHT , SCOOP/TMC , D-USA TEAM , "
    !text "MOVERS , JUDGES , LIGHT CIRCLE , RADWAR , IKARI (AGGH I MENTIONED 'EM AGAIN) , STACK & SNAKE , TRIANGLE , "
    !text "FUSION , TCS , TWGI , FCS , ESI , C64CG , MECHANIX , TFD , FAC , SCG , BWB , THE LORDS , TRILOGY , 1001 , "
    !text "GAMEBUSTERS 1541 , CHIGLEY , MAT , GI-JO , TEF , CCS , CAP , MCM , HCA , 2000 A.D. , PAR , JEWELS , USC , "
    !text "ICT , TROOPERS , MOVERS , NEWMEN , ALL THEM PEOPLE ON THE NET , CFR , FCG , ECC , DOMINATORS , EXILE , TAU , "
    !text "JE-HA , TWG , THE SHARKS , SCA , ACS , TSK , TLS ... I KNOW THERES QUITE A FEW I MISSED BUT MY MEMORY CANT "
    !text "COME UP WITH ANYMORE NAMES .... PLEASE WRITE TO US FOR CONTACTS, I'M OFF NOW TO GET DRUNK SO GUTEN TAG U "
    !text "PEEPS ......                                              AHH STILL THERE ?  WELL FOR ALL THOSE THAT ARE "
    !text "INTERESTED IT'S NOW 11:32 PM AND I DIDN'T GET DRUNK !!   THE COOL MUSIC WAS RIPPED , RELOCATED ON THE 25:12:87 "
    !text "AND IS FROM INSIDE OUTING  BY THE EDGE    I'M OFF FOR SURE THIS TIME, JUST GONNA FIX THE KEY PRESS ROUTINE "
    !text "& WATCH AIRPLANE II                                                   @"

label0 = $FFD2
label3 = $E544
label11 = $EA31
label13 = $EA7E
label6 = $6B00
label15 = $5101
label1 = $57A5
label2 = $5BA6

    *=$2015
    !bin "../binaries/memory-2015-2200.bin"

    *=$3000
    !bin "../binaries/font-3000-3200.bin"

    *=$3800 
    !bin "../binaries/memory-3800-3a00.bin"

    *=$5000
    !bin "../binaries/music-5000-6000.bin"

    *=$6B00
    SEI
    LDA #$00
    STA $FA
    LDA #$70
    STA $FB        
    LDA #$01
    STA $FC
    LDA #$08
    STA $FD
    LDY #$00
    LDA ($FA),Y
    STA ($FC),Y
    INY
    BNE $6B13
    INC $FB
    INC $FD
    LDA $FB
    CMP #$9D
    BNE $6B11
    CLI
    LDA #$15
    STA $D018
    JMP $0818
