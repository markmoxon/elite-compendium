\ ******************************************************************************
\
\ BBC MASTER ELITE COMPENDIUM DISC IMAGE SCRIPT
\
\ BBC Master Elite was written by Ian Bell and David Braben and is copyright
\ Acornsoft 1986
\
\ The code on this site has been reconstructed from a disassembly of the version
\ released on Ian Bell's personal website at http://www.elitehomepage.org/
\
\ The commentary is copyright Mark Moxon, and any misunderstandings or mistakes
\ in the documentation are entirely my fault
\
\ The terminology and notations used in this commentary are explained at
\ https://www.bbcelite.com/about_site/terminology_used_in_this_commentary.html
\
\ The deep dive articles referred to in this commentary can be found at
\ https://www.bbcelite.com/deep_dives
\
\ ------------------------------------------------------------------------------
\
\ This source file produces side 1 of the following DSD disc image:
\
\   * elite-compendium.dsd
\
\ This can be loaded into an emulator or a real BBC Master.
\
\ ******************************************************************************

\ Disc Elite (Master, flicker-free) = *RUN ELITED

 PUTFILE "disc-elite-beebasm/3-assembled-output/ELITE2.bin", "ELITED", &FF2F00, &FF2F23
 PUTFILE "disc-elite-beebasm/3-assembled-output/ELITE3.bin", "ELITE3", &FF5700, &FF5700
 PUTFILE "disc-elite-beebasm/3-assembled-output/ELITE4.bin", "ELITE4", &FF1900, &FF197B

 PUTFILE "disc-elite-beebasm/3-assembled-output/D.CODE.bin", "D.CODE", &0011E3, &0011E3
 PUTFILE "disc-elite-beebasm/3-assembled-output/T.CODE.bin", "T.CODE", &0011E3, &0011E3

 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOA.bin", "D.MOA", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOB.bin", "D.MOB", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOC.bin", "D.MOC", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOD.bin", "D.MOD", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOE.bin", "D.MOE", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOF.bin", "D.MOF", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOG.bin", "D.MOG", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOH.bin", "D.MOH", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOI.bin", "D.MOI", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOJ.bin", "D.MOJ", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOK.bin", "D.MOK", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOL.bin", "D.MOL", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOM.bin", "D.MOM", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MON.bin", "D.MON", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOO.bin", "D.MOO", &005600, &005600
 PUTFILE "disc-elite-beebasm/3-assembled-output/D.MOP.bin", "D.MOP", &005600, &005600

\ Teletext Elite = *RUN ELITET

 PUTFILE "teletext-elite/3-assembled-output/ELITE2.bin", "ELITET", &FF2F00, &FF2F23
 PUTFILE "teletext-elite/3-assembled-output/ELITE3.bin", "TELIT3", &FF5700, &FF5700
 PUTFILE "teletext-elite/3-assembled-output/ELITE4.bin", "TELIT4", &FF1900, &FF197B

 PUTFILE "teletext-elite/3-assembled-output/D.CODE.bin", "D.TELE", &0011E3, &0011E3
 PUTFILE "teletext-elite/3-assembled-output/T.CODE.bin", "T.TELE", &0011E3, &0011E3

\ BBC Master Compact Elite (Compendium version) = CHAIN "ELITEMC"

 PUTFILE "master-elite-beebasm/4-reference-binaries/compact/M128Elt.bin", "M128Elt", &000E00, &000E43
 PUTFILE "master-elite-beebasm/4-reference-binaries/compact/BDATA.bin", "BDATA", &001300, &001300
 PUTFILE "master-elite-beebasm/4-reference-binaries/compact/BCODE.bin", "ELITE", &001300, &002C6C
 PUTBASIC "master-elite-beebasm/1-source-files/music/load-music-compact.bas", "ELITEMC"

\PUTFILE "3-assembled-output/README.txt", "README", &FFFFFF, &FFFFFF

 PUTFILE "1-source-files/boot-files/$.!BOOT.bin", "!BOOT", &FFFFFF, &FFFFFF
