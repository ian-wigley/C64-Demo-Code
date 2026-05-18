; ************* Part-3 ************* ;
;                                    ;
;          SYS 16384 to start        ;
;                                    ;
; ********************************** ;

                *=$0800
                !binary "./binaries/memory-0800-4342.bin"
                ;!binary "./binaries/memory-0800-5600.bin"

                *=$4000
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
                NOP
                NOP
                NOP
                NOP
                NOP
                NOP
                CLI
                LDA #$37
                STA $01
                JSR llabel0
                JSR llabel1
                JSR llabel2
                JSR llabel3
                JSR llabel4
                CLI
                CLC
llabel5         JMP llabel5
llabel3         SEI
                LDA #$08
                ORA #$C0
                STA $D016
                LDA #$7F
                AND $D011
                STA $D011
                LDX #$00
bbranch0        LDA $1800,X
                STA $D800,X
                LDA $1900,X
                STA $D900,X
                LDA $1A00,X
                STA $DA00,X
                LDA $1B00,X
                STA $DB00,X
                LDA $1C00,X
                STA $0400,X
                LDA $1D00,X
                STA $0500,X
                LDA $1E00,X
                STA $0600,X
                LDA $1F00,X
                STA $0700,X
                INX
                BNE bbranch0
                LDA #$00
                STA $D020
                STA $D021
                STA $3FFF
                LDA #$08
                ORA #$D0
                STA $D016
                LDA #$1D
                STA $D018
                LDA #$06
                STA $D025
                LDA #$01
                STA $D026
                LDA #$FF
                STA $D015
                STA $D01D
                LDA #$00
                STA $D017
                STA $D01C
                LDA #$C0
                STA $D010
                LDX #$00
bbranch1        LDA #$00
                STA $0800,X
                STA $0900,X
                STA $0A00,X
                INX
                BNE bbranch1
                CLI
                RTS
llabel4         SEI
                LDA $DC0D
                LDA #$7F
                STA $DC0D
                LDA #$01
                STA $D019
                STA $D01A
                LDX #$16
                LDY #$41
                STX $FFFE
                STY $FFFF
                LDX #$15
                LDY #$41
                STX $FFFA
                STY $FFFB
                LDA #$35
                STA $01
                CLI
                LDA #$00
                TAX
                TAY
                RTS
llabel6         STA $42D4
                STY $42D5
                STX $42D6
                CLC
bbranch2        LDA $D019
                AND #$01
                BEQ bbranch2
                STA $D019
                RTS
llabel9         LDA $42D4
                LDY $42D5
                LDX $42D6
                RTI
                JSR llabel6
                LDA #$71
                STA $D011
                LDA #$1A
                STA $D012
                LDX #$7E
                LDY #$41
                STX $FFFE
                STY $FFFF
                CLI
                JSR llabel7
                LDX #$00
                LDY #$00
bbranch3        LDA #$1B
                STA $D001,X
                LDA #$0E
                STA $D027,Y
                INY
                INX
                INX
                CPX #$10
                BNE bbranch3
                LDA #$FF
                STA $D01C
                LDX #$30
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
                LDX #$00
                JSR llabel8
                LDX #$07
                JSR llabel8
                LDX #$0E
                JSR llabel8
                JMP llabel9
                JSR llabel6
                LDA #$3A
                STA $D011
                LDA #$00
                STA $D020
                STA $D021
                LDA #$FA
                STA $D012
                LDX #$16
                LDY #$41
                STX $FFFE
                STY $FFFF
                CLI
                JSR llabel7
                LDA #$20
                STA $41B8
                LDX #$00
                LDY #$00
                STX $41AE
bbranch4        LDA #$80
                STA $D000,X
                LDA #$FD
                STA $D001,X
                LDA #$28
                STA $07F8,Y
                LDA #$01
                STA $D027,Y
                LDA $41AE
                CLC
                ADC #$30
                STA $41AE
                INC $41B8
                INY
                INX
                INX
                CPX #$10
                BNE bbranch4
                LDA #$00
                STA $D01C
                LDA #$C0
                STA $D010
                CLI
                JSR llabel10
                JMP llabel9
llabel7         LDX #$16
                LDY #$0B
bbranch5        DEY
                BPL bbranch5
                BIT $00
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
                NOP
                DEX
                BNE $41EB ;bbranch6
                RTS
                RTS
llabel10        LDX #$00
bbranch7        CLC
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
                BNE bbranch7
                INC $42D7
                LDX $42D7
                CPX #$08
                BNE bbranch8
                LDA #$00
                STA $42D7
                JSR llabel11
bbranch8        RTS
llabel11        LDY #$00
                LDA ($02),Y
                AND #$3F
                BNE bbranch9
                JSR llabel2
                JMP llabel12
bbranch9        STA $08
                INC $02
                BNE bbranch10
                INC $03
bbranch10       LDA #$50
                STA $09
                LDA $08
                CLC
                ASL
                ROL
                ASL
                STA $08
                BCC $4299
                INC $09
bbranch11       LDY #$00
                LDX #$00
bbranch12       LDA ($08),Y
                STA $0A04,X
                INX
                INX
                INX
                INX
                INX
                INX
                INY
                CPY #$08
                BNE bbranch12
llabel12        RTS
llabel2         LDA #$43
                STA $02
                LDA #$43
                STA $03
                RTS
                LDY $42D8
                LDA $42FA,Y
                CMP #$0A
                BNE bbranch13
                LDY #$00
                STY $42D8
bbranch13       LDA $42EA
                CLC
                ADC $42FA,Y
                STA $42EA
                INC $42D8
                RTS
llabel0 = $9110
llabel1 = $E544
llabel8 = $9100

                *=$4340
                !text "   WELCOME TO THE OTHER PART OF WILD DEMO III  ... WELL WHAT CAN I SAY THAT I HAVEN'T ALREADY "
                !text "SAID IN THE OTHER PARTS !!! , I CAN'T  THINK OF ANYTHING AT THE MO BUT SOMETHING MIGHT COME TO" 
                !text " ME , (I HOPE) .... I'VE JUST BEEN AROUND THE MAGIC KNIGHTS HOUSE , AND I'VE SEEN WILD DEMO IV" 
                !text ", AND IT'S PRETY COOL FOR SAYING I DID'NT DO ANYTHING FOR IT (HEHEHEHE) ... RIGHT WHAT NOW !! ,"
                !text " AARRHH LETS TALK ABOUT SPITTING IMAGE .. THE SPITTING IMAGE CHRISTMAS SPECIAL WAS ON TV LAST NIGHT"
                !text" AND IT WAS SO FUNNY !! , EPECIAL THE PART ABOUT THE TEMPORY POSTMAN WORKERS  , IF YOU DID'NT SEE IT "
                !text "THEN I WILL GIVE YOU A KWIK EXAMPLE ! , THEY WAS SINGING A SONG CALLED 'POSTMAN  PRAT AND HIS BLOODY "
                !text "BLACK & WHITE CAT !! , THE POSTMAN WAS GOING AROUND THE TOWN POSTING ALL THE LETTERS BACK THROUGH THE "
                !text "POSTBOX'S , AND TIPING HIS SACK OF DISK - (HEHE) AND LETTERS DOWN THE LOCAL DRAINS ... IT WAS REALY "
                !text "FUNNY FOR SAYING I WORKED FOR THE POST OFFICE OVER CHRISTMAS !, BY THE WAY - I WAS NOT DELIVERING THEM"
                !text " !!.... THE SCREEN WAS DOCTORD BY ME - B U S T E R S ! - , AND IT'S FROM THE GAME -HUNTER'S MOONY !!!!- "
                !text ", THATS IF YOU DID'NT SEE THE BIG LETTERS AT THE BOTTOM OF THE SCREEN ??.. RIGHT WHAT NOW !!! ... HAY YOU"
                !text " ?? , YES YOU WITH THE ORIGANALS , SEND THEM TO USE - SO WE CAN CRACK'EM , AND THEN WE WILL SEND YOU THEM"
                !text " BACK WITH LOTS OF GOODIES!. .. DO YOU LIKE THE WILD STYLES LATEST  MEMBERS GAME CALLED , (MASTER OF THE "
                !text "UNIVERSE),YES YOU HAVE PROBABLY SEEN  ALREADY THAT THE PROGRAMERS NAME IS  - CHRIS SHRIGLEY  AND GUESS WHAT "
                !text "? , HE ASKED TO JOIN US ,  NOT THE OTHER WAY AROUND !!.     WELL I CAN'T  THINK OF ANYTHING ELSE TO SAY SO"
                !text " I'LL END IT HERE ! , SEE YAA ! -----====----- .END OF TEXT.                                     ALL CODEING"
                !text " BY -BUSTERS- ....               @     @ "
                
                *=$5000
                !binary "./binaries/memory-5000-5400.bin"
                *=$9100
                !binary "./binaries/memory-9100-a000.bin"                