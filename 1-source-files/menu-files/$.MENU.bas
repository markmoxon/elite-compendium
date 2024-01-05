MODE 7
*FX 4,1
*FX 200,1
VDU 23;8202;0;0;0;
secpro%=FALSE
A%=&00:X%=&01
master%=(USR(&FFF4) AND &FF00)=&300
IF NOT master% THEN PROCnotmaster
A%=&EA:X%=&00:Y%=&FF
IF (USR(&FFF4) AND &FF00) THEN secpro%=TRUE
*RUN SCREEN
U%=INKEY(200)
UH$="  "+CHR$(130)
UL$="  "+CHR$(134)
HH$=CHR$(132)+CHR$(157)+CHR$(135)
HL$=CHR$(132)+CHR$(157)+CHR$(135)
TH$=CHR$(131)+CHR$(157)+CHR$(132)
TL$=CHR$(131)+CHR$(157)+CHR$(132)
START%=2
ROWS%=3
PROCtitle
PROCoptions
PROCselect
PROCgettitle
PROCrun
END

DEF PROCrun
IF O%=0 PROCmaster
IF O%=1 PROCcompact
IF O%=2 PROCsecpro
IF O%=3 PROCbbcdisc
IF O%=4 PROCteletext
ENDPROC

DEF PROCtitle
PRINTTAB(13,2);CHR$(151);CHR$(153);"<$h h l$h,";CHR$(145);CHR$(154)
PRINTTAB(13,3);CHR$(151);CHR$(153);"w0j0j j jq";CHR$(145);CHR$(154)
PRINTTAB(13,4);CHR$(135);" COMPENDIUM";CHR$(145);CHR$(154)
VDU28,0,24,39,5
CLS
PRINT'CHR$(130);"   Elite by Ian Bell and David Braben"
PRINTCHR$(130);"       Enhancements by Mark Moxon"
PRINT'CHR$(131);"^ to select, ] for info, RETURN to play";
VDU28,0,24,39,9
ENDPROC

DEF PROCoptions
RESTORE
READ T$,V$
Y%=START%
C%=0
REPEAT
PROChl(Y%,UH$,UL$)
PROCsh(Y%,T$)
PROCsh(Y%+1,V$)
Y%=Y%+ROWS%
C%=C%+1
READ T$, V$
UNTIL T$=""
ENDPROC

DEF PROCgettitle
RESTORE
FOR L%=0 TO O%
READ T$,V$
NEXT
CLS
PROCsh(2,T$)
PROCsh(3,V$)
PROChl(2,TH$,TL$)
PRINT'
ENDPROC

DEF PROCselect
L%=(O%+1)MOD C%
REPEAT
IF O%<>L% THEN PROChl(START%+L%*ROWS%,UH$,UL$):PROChl(START%+O%*ROWS%,HH$,HL$)
L%=O%
K%=GET
IF K%=138 THEN O%=(O%+1)MOD C%
IF K%=139 THEN O%=(O%+C%-1)MOD C%
IF K%=136 OR K%=137 THEN PROCinfo
UNTIL K%=13
ENDPROC

DEF PROCmaster
*DRIVE 2
CHAIN "ELITEM"
ENDPROC

DEF PROCcompact
*DRIVE 2
CHAIN "ELITEMC"
ENDPROC

DEF PROCsecpro
IF NOT secpro% THEN PROCnotsecpro
*DRIVE 2
*RUN ELITESP
ENDPROC

DEF PROCbbcdisc
*DRIVE 0
*RUN ELITED
ENDPROC

DEF PROCteletext
*DRIVE 0
*RUN ELITET
ENDPROC

DEF PROCsh(Y%,T$)
LOCAL X%
X%=21-LEN(T$)/2
PRINTTAB(X%,Y%);T$;
ENDPROC

DEF PROChl(Y%,T$,U$)
PRINTTAB(0,Y%);T$;
PRINTTAB(0,Y%+1);U$;
ENDPROC

DEF PROCinfo
PROCgettitle
PRINTTAB(0,0);CHR$(131);"       ] for menu, RETURN to play";
FOR I%=5TO13:PRINTTAB(0,I%);CHR$(134);:NEXT
PRINTTAB(0,14);CHR$(130);
PRINTTAB(0,15);CHR$(130);
IF O%<2 PROCsh(5,"Elite with all the bells and whistles"):PROCsh(7,"Flicker-free ships and planets"):PROCsh(8,"Music with volume control")
IF O%<2 PROCsh(9,"Docking computer improvements"):PROCsh(10,"The epic Trumbles mission"):PROCsh(11,"Bug fixes and more")
IF O%=2 PROCsh(5,"The fastest and most colourful version"):PROCsh(7,"With flicker-free ships and planets")
IF O%=3 PROCsh(5,"The classic 1984 BBC Micro release"):PROCsh(7,"Updated to run on the BBC Master"):PROCsh(9,"With flicker-free ships and planets")
IF O%=4 PROCsh(5,"The classic 1984 BBC Micro release"):PROCsh(7,"Converted to run entirely in teletext")
IF O%=0 PROCsh(14,"For the BBC Master 128")
IF O%<>0 AND O%<>2 PROCsh(14,"For the BBC Master 128 or Compact")
IF O%=2 PROCsh(14,"For the BBC Master with Second Proc")
PROCsh(15,"See www.bbcelite.com for more details")
REPEAT
K%=GET
UNTIL K%=136 OR K%=137 OR K%=13
IF K%=13 PROCgettitle:PROCrun
CLS
PROCtitle
PROCoptions
PROChl(START%+O%*ROWS%,HH$,HL$)
L%=O%
ENDPROC

DEF PROCnotmaster
PRINT"Sorry, the Elite Compendium only works"
PRINT"on a BBC Master."
END
ENDPROC

DEF PROCnotsecpro
VDU26
CLS
PRINT"Sorry, this version of Elite needs a"
PRINT"6502 Second Processor."
PRINT
PRINT"Please enable the Tube with this"
PRINT"command:"
PRINT
PRINT"  *CONFIGURE TUBE"
PRINT
PRINT"and try booting the disc again."
END
ENDPROC

REM  "----------------------------------"
DATA "BBC Master 128 Elite"
DATA "The best version of Acornsoft Elite"
DATA "BBC Master Compact Elite"
DATA "The best way to play on a Compact"
DATA "6502 Second Processor Elite"
DATA "The fastest version of co-pro Elite"
DATA "BBC Micro disc Elite"
DATA "The best version of original Elite"
DATA "Teletext Elite"
DATA "Classic Elite with added Ceefax"
DATA "",""
