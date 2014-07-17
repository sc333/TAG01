10 REM WEREWOLVES AND WANDERER
11 DIM A(19,7)
20 GOSUB 2600:REM INITIALISE
30 GOSUB 160
40 IF RO <> 11 THEN 30
50 PRINT:PRINT "YOU'VE DONE IT!!":GOSUB 3520:PRINT "THAT WAS THE EXIT FROM THE CASTLE"
60 GOSUB 3520
70 PRINT:PRINT "YOU HAVE SUCCEEDED, ";N$;"!"
80 PRINT:PRINT "YOU MANAGED TO GET OUT OF THE CASTLE"
90 GOSUB 3520
100 PRINT:PRINT "WELL DONE!"
110 GOSUB 3520
120 PRINT:PRINT "YOUR SCORE IS";
130 PRINT 3*TALLY + 5*STRENGTH + 2*WEALTH + FOOD + 30*MK
140 END
150 REM **********************
160 REM MAJOR HANDLING ROUTINE
170 STRENGTH = STRENGTH - 5
180 IF STRENGTH<10 THEN PRINT "WARNING, ";N$;", YOUR STRENGTH":PRINT "IS RUNNING LOW":PRINT
190 IF STRENGTH < 1 THEN 2300:REM DEATH
200 TALLY = TALLY + 1
210 PRINT N$;", YOUR STRENGTH IS";STRENGTH
220 IF WEALTH > 0 THEN PRINT "YOU HAVE $ ";WEALTH
230 IF FOOD > 0 THEN PRINT "YOUR PROVISIONS SACK HOLDS";FOOD;"UNITS OF FOOD"
240 IF SUIT = 1 THEN PRINT "YOU ARE WEARING ARMOR"
250 IF AXE=0 AND SWORD=0 AND AMULET=0 THEN 320
260 PRINT "YOU ARE CARRYING ";
270 IF AXE=1 THEN PRINT "AN AXE ";
280 IF SWORD=1 THEN PRINT "A SWORD ";
290 IF SWORD + AXE > 0 AND AMULET=1 THEN PRINT "AND ";
300 IF AMULET=1 THEN PRINT "THE MAGIC AMULET"
310 PRINT
320 IF LIGHT=0 THEN PRINT "IT IS TOO DARK TO SEE ANYTHING"
330 IF LIGHT=1 THEN GOSUB 990:REM ROOM DESCRIPTION
340 K = A(RO,7):REM K IS SET TO CONTENTS OF ROOM
350 IF K=0 THEN 440:REM ROOM IS EMPTY
360 IF K>9 THEN PRINT "THERE IS TREASURE HERE WORTH $";K:GOTO 440
370 PRINT:PRINT:PRINT "DANGER...THERE IS A MONSTER HERE....":GOSUB 3520
380 IF K=-1 THEN M$="FEROCIOUS WEREWOLF":FF=5
390 IF K=-2 THEN M$="FANATICAL FLESHGORGER":FF=10
400 IF K=-3 THEN M$="MALOVENTY MALDEMER":FF=15
410 IF K=-4 THEN M$="DEVASTATING ICE-DRAGON":FF=20
420 PRINT:PRINT "IT IS A ";M$
430 PRINT:PRINT "THE DANGER LEVEL IS";FF;"!!"
440 GOSUB 3520
450 PRINT:PRINT:PRINT "WHAT DO YOU WANT TO DO";
460 INPUT A$:A$=LEFT$(A$,1)
470 IF K<0 AND A$<>"F" AND A$<>"R" THEN 460
480 PRINT:PRINT:PRINT "------------------------------------":PRINT
490 IF A$="Q" THEN 120
500 IF A$="N" AND A(RO,1)=0 THEN PRINT "NO EXIT THAT WAY":GOTO 440
510 IF A$="S" AND A(RO,2)=0 THEN PRINT "THERE IS NO EXIT SOUTH":GOTO 440
520 IF A$="E" AN> A(RO,3)=0 THEN PRINT "YOU CANNOT GO IN THAT DIRECTION":GOTO 440
530 IF A$="W" AND A(RO,4)=0 THEN PRINT "YOU CANNOT MOVE THROUGH SOLID STONE":GOTO 440
540 IF A$="U" AND A(RO,5)=0 THEN PRINT "THERE IS NO WAY UP FROM HERE":GOTO 440
550 IF A$="D" AND A(RO,6)=0 THEN PRINT "YOU CANNOT DESCEND FROM HERE":GOTO 440
560 IF A$="R" AND RND(1)>.7 THEN 2420
570 IF A$="R" THEN PRINT "WHICH WAY DO YOU WANT TO FLEE";:GOTO 1160
580 IF A$="F" AND A(RO,7)>-1 THEN PRINT "THERE IS NOTHING TO FIGHT HERE":GOTO 440
590 IF A$="I" THEN GOSUB 3010:RETURN
600 IF A$="C" AND FOOD=0 THEN PRINT "YOU HAVE NO FOOD":GOTO 440
610 IF A$="P" THEN GOSUB 2350:RETURN
620 IF A$="F" THEN 730
630 IF A$="M" THEN RO=INT(RND(1)*19)+1:IF RO=6 OR RO=11 THEN 630 ELSE 710
640 IF A$="C" THEN GOSUB 2480:RETURN
650 IF A$="N" THEN RO=A(RO,1)
660 IF A$="S" THEN RO=A(RO,2)
670 IF A$="E" THEN RO=A(RO,3)
680 IF A$="W" THEN RO=A(RO,4)
690 IF A$="U" THEN RO=A(RO,5)
700 IF A$="D" THEN RO=A(RO,6)
710 RETURN
720 REM ******************************
730 REM FIGHT
740 IF INKEY$<>"" THEN 740
750 PRINT "PRESS ANY KEY TO FIGHT"
760 IF INKEY$="" THEN 760
770 IF SUIT=1 THEN PRINT "YOUR ARMOR INCREASES YOUR CHANCE OF SUCCESS":FF=3*(INT(FF/4)):GOSUB 3520
780 CLS:FOR J=1 TO 6:PRINT "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*":NEXT J
790 IF AXE=0 AND SWORD=0 THEN PRINT "YOU HAVE NO WEAPONS":PRINT "YOU MUST FIGHT WITH BARE HANDS":FF=INT(FF + FF/5):GOTO 870
800 IF AXE=1 AND SWORD=0 THEN PRINT "YOU HAVE ONLY AN AXE TO FIGHT WITH":FF=4*INT(FF/5):GOTO 870
810 IF AXE=0 AND SWORD=1 THEN PRINT "YOU MUST FIGHT WITH YOUR SWORD":FF=3*INT(FF/4):GOTO 870
820 INPUT "WHICH WEAPON? 1 - AXE, 2 - SWORD";Z
830 IF Z<1 OR Z>2 THEN 820
840 IF Z=1 THEN FF=4*INT(FF/5)
850 IF Z=2 THEN FF=3*INT(FF/4)
860 REM *************************
870 REM THE BATTLE
880 PRINT:PRINT
890 IF RND(1)>.5 THEN PRINT M$;" ATTACKS" ELSE PRINT "YOU ATTACK"
900 GOSUB 3520
910 IF RND(1)>.5 THEN PRINT:PRINT "YOU MANAGE TO WOUND IT":FF=INT(5*FF/6)
920 GOSUB 3520
930 IF RND(1)>.5 THEN PRINT:PRINT "THE MONSTER WOUNDS YOU!":STRENGTH=STRENGTH-5
940 IF RND(1)>.35 THEN 890
950 IF RND(1)*16>FF THEN PRINT:PRINT "AND YOU MANAGED TO KILL THE ";M$:MK=MK+1:GOTO 970
960 PRINT:PRINT "THE ";M$;" DEFEATED YOU":STRENGTH=INT(STRENGTH/2)
970 A(RO,7)=0:GOSUB 3410:PRINT:PRINT:GOSUB 3520:RETURN
980 REM ******************
990 REM ROOM DESCRIPTIONS
1000 PRINT:PRINT "**************************":PRINT:PRINT
1010 ON RO GOSUB 1040,1100,1170,1230,1280,1360,1410,1470,1540,1620,1700,1730,1790,1860,1960,2030,2100,2160,2230
1020 RETURN
1030 REM ************
1040 REM ROOM1
1050 PRINT "YOU ARE IN THE HALLWAY"
1060 PRINT "THERE IS A DOOR TO TEE SOUTH"
1070 PRINT "THROUGH WINDOWS TO THE NORTH YOU CAN SEE A SECRET HERB GARDEN"
1080 RETURN
1090 REM ************
1100 REM ROOM 2
1110 PRINT "THIS IS THE AUDIENCE CHAMBER"
1120 PRINT "THERE IS A WINDOW TO THE WEST. BY LOOKING TO THE RIGHT"
1130 PRINT "THROUGH IT YOU CAN SEE THE ENTRANCE TO THE CASTLE."
1140 PRINT "DOORS LEAVE THIS ROOM TO THE NORTH, EAST AND SOUTH"
1150 RETURN
1160 REM ************
1170 REM ROOM 3
1180 PRINT "YOU ARE IN THE GREAT HALL, AN L-SHAPED ROOM"
1190 PRINT "THERE ARE DOORS TO THE EAST AND TO THE NORTH"
1200 PRINT "IN THE ALCOVE IS A DOOR TO THE WEST'
1210 RETURN
1220 REM ************
1230 REM ROOM 4
1240 PRINT "THIS IS THE MONARCH'S PRIVATE MEETING ROOM"
1250 PRINT "THERE IS A SINGLE EXIT TO THE SOUTH"
1260 RETURN
1270 REM ************
1280 REM ROOM 5
1290 PRINT "THIS INNER HALLWAY CONTAINS A DOOR TO THE NORTH,"
1300 PRINT "AND ONE TO THE WEST, AND A CIRCULAR STAIRWELL"
1310 PRINT "PASSES THROUGH THE ROOM"
1320 PRINT "YOU CAN SEE AN ORNAMENTAL LAKE THROUGH THE"
1330 PRINT "WINDOWS TO THE SOUTH"
1340 RETURN
1350 REM ************
1360 REM ROOM 6
1370 PRINT "YOU ARE AT THE ENTRANCE TO A FORBIDDING-LOOKING"
1380 PRINT "STONE CASTLE. YOU ARE FACING EAST"
1390 RETURN
1400 REM ************
1410 REM ROOM 7
1420 PRINT "THIS IS THE CASTLE'S KITCHEN THROUGH WINDOWS IN"
1430 PRINT "THE NORTH WALL YOU CAN SEE A SECRET HERB GARDEN."
1440 PRINT "A DOOR LEAVES THE KITCHEN TO THE SOUTH"
1450 RETURN
1460 REM **************
1470 REM ROOM 8
1480 PRINT "YOU ARE IN THE STORE ROOM, AMIDST SPICES,"
1490 PRINT "VEGETABLES, AND VAST SACKS OF FLOUR AND"
1500 PRINT "OTHER PROVISIONS. THERE IS A DOOR TO THE NORTH"
1510 PRINT "AND ONE TO THE SOUTH"
1520 RETURN
1530 REM **************
1540 REM ROOM 9
1550 PRINT "YOU HAVE ENTERED THE LIFT..."
1560 GOSUB 3520
1570 PRINT "IT SLOWLY DESCENDS..."
1580 GOSUB 3520
1590 RO=10
1600 GOTO 1000
1610 REM ************************
1620 REM ROOM 10
1630 PRINT "YOU ARE IN THE REAR VESTIBULE"
1640 PRINT "THERE ARE WINDOWS TO THE SOUTH FROM WHICH YOU"
1650 PRINT "YOU CAN SEE THE ORNAMENTAL LAKE"
1660 PRINT "THERE IS AN EXIT TO THE EAST AND"
1670 PRINT "ONE TO THE NORTH"
1680 RETURN
1690 REM *****************
1700 REM ROOM 11
1710 RETURN
1720 REM ****************
1730 REM ROOM 12
1740 PRINT "YOU ARE IN THE DANK, DARK DUNGEON"
1750 PRINT "THERE IS A SINGLE EXIT, A SMALL HOLE IN"
1760 PRINT "WALL TOWARDS THE WEST"
1770 RETURN
1780 REM ****************
1790 REM ROOM 13
1800 PRINT "YOU ARE IN THE PRISON GUARDROOM, IN THE"
1810 PRINT "BASEMENT OF THE CASTLE. THE STAIRWELL"
1820 PRINT "ENDS IN THIS ROOM. THERE IS ONE OTHER"
1830 PRINT "EXIT, A SMALL HOLE IN THE EAST WALL"
1840 RETURN
1850 REM ****************
1860 REM ROOM 14
1870 PRINT "YOU ARE IN THE MASTER BEDROOM ON THE UPPER"
1880 PRINT "LEVEL OF THE CASTLE...."
1890 PRINT "LOOKING DOWN FROM THE WINDOW TO THE WEST YOU"
1900 PRINT "CAN SEE THE ENTRANCE TO THE CASTLE, WHILE THE"
1910 PRINT "SECRET HERB GARDEN IS VISIBLE BELOW THE NORTH"
1920 PRINT "WINDOW. THERE ARE DOORS TO THE EAST AND"
1930 PRINT "TO THE SOUTH...."
1940 RETURN
1950 REM ***************
1960 REM ROOM 15
1970 PRINT "THIS IS THE L-SHAPPED UPPER HALLWAY."
1980 PRINT "TO THE NORTH IS A DOOR, AND THERE IS A"
1990 PRINT "STAIRWELL IN THE HALL AS WELL. YOU CAN SEE"
2000 PRINT "THE LAKE THROUGH THE SOUTH WINDOWS"
2010 RETURN
2020 REM ****************
2030 REM ROOM 16
2040 PRINT "THIS ROOM WAS USED AS THE CASTLE TREASURY IN"
2050 PRINT "BY-GONE YEARS...."
2060 PRINT "THERE ARE NO WINDOWS, JUST EXITS TO THE"
2070 PRINT "NORTH AND TO THE EAST"
2080 RETURN
2090 REM **************
2100 REM ROOM 17
2110 PRINT "OOOOH...YOU ARE IN THE CHAMBERMAIDS' BEDROOM"
2120 PRINT "THERE IS AN EXIT TO THE WEST AND A DOOR"
2130 PRINT "TO THE SOUTH...."
2140 RETURN
2150 REM ***************
2160 REM ROOM 18
2170 PRINT "THIS TINY ROOM ON THE UPPER LEVEL IS THE"
2180 PRINT "DRESSING CHAMBER. THERE IS A WINDOW TO THE"
2190 PRINT "NORTH, WITH A VIEW OF THE HERB GARDEN DOWN"
2200 PRINT "BELOW. A DOOR LEAVES TO THE SOUTH"
2210 RETURN
2220 REM ************
2230 REM ROOM 19
2240 PRINT "THIS IS THE SMALL ROOM OUTSIDE THE CASTLE"
2250 PRINT "LIFT WHICH CAN BE ENTERED BY A DOOR TO THE NORTH"
2260 PRINT "ANOTHER DOOR LEADS TO THE WEST. YOU CAN SEE"
2270 PRINT "THE LAKE THROUGH THE SOUTHERN WINDOWS"
2280 RETURN
2290 REM **************
2300 REM DEAD END
2310 PRINT "YOU HAVE DIED........."
2320 GOSUB 3520
2330 GOTO 120
2340 REM **************
2350 REM PICK UP TREASURE
2360 IF A(RO,7)<10 THEN PRINT "THERE IS NO TREASURE TO PICK UP":GOSUB 3520:RETURN
2370 IF LIGHT=0 THEN PRINT "YOU CANNOT SEE WHERE IT IS":GOSUB 3520:RETURN
2380 WEALTH=WEALTH + A(RO,7)
2390 A(RO,7)=0
2400 RETURN
2410 REM **************
2420 REM UNSUCCESSFUL ATTEMPT TO RUN
2430 PRINT "NO YOU MUST STAND AND FIGHT"
2440 A$="F"
2450 GOSUB 3520
2460 GOTO 590
2470 REM **************
2480 REM EAT FOOD
2490 CLS
2500 IF FOOD<1 THEN RETURN
2510 PRINT "YOU HAVE";FOOD;"UNITS OF FOOD" 
2520 PRINT "HOW MANY DO YOU WANT TO EAT";
2530 INPUT Z
2540 IF Z>FOOD THEN 2530
2550 FOOD=INT(FOOD-Z)
2560 STRENGTH=INT(STRENGTH+5*Z)
2570 GOSUB 3410:CLS
2580 RETURN
2590 REM ***********
2600 REM INITIALISE
2610 CLS
2620 STRENGTH=100
2630 WEALTH=75
2640 FOOD=0
2650 TALLY=0
2660 MK=0:REM NO. OF MONSTERS KILLED
2670 REM **************
2680 REM SET UP CASTLE
2690 REM DIM A(19,7)
2700 FOR B=1 TO 19
2710 FOR C=1 TO 7
2720 READ A(B,C)
2730 NEXT C
2740 NEXT B
2750 INPUT "WHAT IS YOUR NAME, EXPLORER";N$
2760 CLS
2770 RO=6:REM STARTING POSITION (RO=ROOM NUMBER)
2780 SWORD=0
2790 AMULET=0
2800 AXE=0
2810 SUIT=0
2820 LIGHT=0
2830 REM **************
2840 REM ALLOT TREASURE
2850 FOR J = 1 TO 4
2860 M=INT(RND(1)*19)+1
2870 IF M=6 OR M=11 OR A(M,7)<>0 THEN 2860
2880 A(M,7)=INT(RND(1)*100)+10
2890 NEXT J
2900 REM **************
2910 REM ALLOT MONSTERS
2920 FOR J = 1 TO 4
2930 M=INT(RND(1)*18)+1
2940 IF M=6 OR M=11 OR A(M,7)<>0 THEN 2930
2950 A(M,7)= -J
2960 NEXT J
2970 A(4,7)=100+INT(RND(1)*100)
2980 A(16,7)=100+INT(RND(1)*100)
2990 RETURN
3000 REM ****************************
3010 REM INVENTORY/PROVISIONS
3020 PRINT "PROVISIONS & INVENTORY"
3030 GOSUB 3260
3040 IF WEALTH<.1 THEN Z=0:GOTO 3130
3050 PRINT "YOU CAN BUY 1 - FLAMING TORCH ($15)"
3060 PRINT "            2 - AXE ($10)"
3070 PRINT "            3 - SWORD ($20)"
3080 PRINT "            4 - FOOD ($2 PER UNIT)"
3090 PRINT "            5 - MAGIC AMULET ($30)"
3100 PRINT "            6 - SUIT OF ARMOR ($50)"
3110 PRINT "            0 - TO CONTINUE ADVENTURE"
3120 INPUT "ENTER NO. OF ITEM REQUIRED";Z
3130 IF Z=0 THEN CLS:RETURN
3140 IF Z=1 THEN LIGHT=1:WEALTH=WEALTH-15
3150 IF Z=2 THEN AXE=1:WEALTH=WEALTH-10
3160 IF Z=3 THEN SWORD=1:WEALTH=WEALTH-20
3170 IF Z=5 THEN AMULET=1:WEALTH=WEALTH-30
3180 IF Z=6 THEN SUIT=1:WEALTH=WEALTH-50
3190 IF WEALTH<0 THEN PRINT "YOU HAVE TRIED TO CHEAT ME!":WEALTH=0:SUIT=0:LIGHT=0:AXE=0:SWORD=0:AMULET=0:FOOD=INT(FOOD/4):GOSUB 3520
3200 IF Z<>4 THEN 3030
3210 INPUT "HOW MANY UNITS OF FOOD";Q:Q=INT(Q)
3220 IF 2*Q>WEALTH THEN PRINT "YOU HAVEN'T GOT ENOUGH MONEY":GOTO 3210
3230 FOOD=FOOD+Q
3240 WEALTH=WEALTH-2*Q
3250 GOTO 3030
3260 IF WEALTH>0 THEN PRINT:PRINT:PRINT "YOU HAVE $";WEALTH
3270 IF WEALTH=0 THEN PRINT "YOU HAVE NO MONEY":GOSUB 3520:RETURN
3280 FOR J=1 TO 4:PRINT:NEXT J
3290 RETURN
3300 REM ******************
3310 DATA 0,2,0,0,0,0,0:REM ROOM 1
3320 DATA 1,3,3,0,0,0,0:REM ROOM 2
3330 DATA 2,0,5,2,0,0,0:REM ROOM 3
3340 DATA 0,5,0,0,0,0,0:REM ROOM 4
3350 DATA 4,0,0,3,15,13,0:REM ROOM 5
3360 DATA 0,0,1,0,0,0,0: REM ROOM 6
3370 DATA 0,8,0,0,0,0,0: REM ROOM 7
3380 DATA 7,10,0,0,0,0,0: REM ROOM 8
3390 DATA 0,19,0,8,0,8,0:REM ROOM 9
3400 DATA 8,0,11,0,0,0,0:REM ROOM 10
3410 DATA 0,0,10,0,0,0,0:REM ROOM 11
3420 DATA 0,0,0,13,0,0,0:REM ROOM 12
3430 DATA 0,0,12,0,5,0,0:REM ROOM 13
3440 DATA 0,15,17,0,0,0,0:REM ROOM 14
3450 DATA 14,0,0,0,0,5,0:REM ROOM 15
3460 DATA 17,0,19,0,0,0,0:REM ROOM 16
3470 DATA 18,16,0,14,0,0,0:REM ROOM 17
3480 DATA 0,17,0,0,0,0,0:REM ROOM 18
3490 DATA 9,0,16,0,0,0,0:REM ROOM 19
3500 REM ******************
3510 REM ADJUST LOOP BELOW TO YOUR SYSTEM
3520 FOR T=1 TO 900:NEXT T
3530 RETURN
