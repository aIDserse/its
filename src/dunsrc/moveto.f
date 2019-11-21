C MOVETO- MOVE PLAYER TO NEW ROOM
C
C COPYRIGHT 1980, INFOCOM COMPUTERS AND COMMUNICATIONS, CAMBRIDGE MA. 02142
C ALL RIGHTS RESERVED, COMMERCIAL USAGE STRICTLY PROHIBITED
C WRITTEN BY R. M. SUPNIK
C
C DECLARATIONS
C
	LOGICAL FUNCTION MOVETO(NR,WHO)
	IMPLICIT INTEGER (A-Z)
	LOGICAL NLV,LHR,LNR
C
C GAME STATE
C
	LOGICAL TELFLG
	COMMON /PLAY/ WINNER,HERE,TELFLG
C
C ROOMS
C
	COMMON /ROOMS/ RLNT,RDESC2,RDESC1(200),REXIT(200),
	1	RACTIO(200),RVAL(200),RFLAG(200)
	INTEGER RRAND(200)
	EQUIVALENCE (RVAL,RRAND)
C
	COMMON /RFLAG/ RSEEN,RLIGHT,RLAND,RWATER,RAIR,
	1	RSACRD,RFILL,RMUNG,RBUCK,RHOUSE,RNWALL,REND
C
C OBJECTS
C
	COMMON /OBJCTS/ OLNT,ODESC1(220),ODESC2(220),ODESCO(220),
	1	OACTIO(220),OFLAG1(220),OFLAG2(220),OFVAL(220),
	2	OTVAL(220),OSIZE(220),OCAPAC(220),OROOM(220),
	3	OADV(220),OCAN(220),OREAD(220)
C
	COMMON /OINDEX/ GARLI,FOOD,GUNK,COAL,MACHI,DIAMO,TCASE,BOTTL
	COMMON /OINDEX/ WATER,ROPE,KNIFE,SWORD,LAMP,BLAMP,RUG
	COMMON /OINDEX/	LEAVE,TROLL,AXE
	COMMON /OINDEX/ RKNIF,KEYS,ICE,BAR
	COMMON /OINDEX/ COFFI,TORCH,TBASK,FBASK,IRBOX
	COMMON /OINDEX/ GHOST,TRUNK,BELL,BOOK,CANDL
	COMMON /OINDEX/ MATCH,TUBE,PUTTY,WRENC,SCREW,CYCLO,CHALI
	COMMON /OINDEX/ THIEF,STILL,WINDO,GRATE,DOOR
	COMMON /OINDEX/ HPOLE,LEAK,RBUTT,RAILI
	COMMON /OINDEX/ POT,STATU,IBOAT,DBOAT,PUMP,RBOAT
	COMMON /OINDEX/ STICK,BUOY,SHOVE,BALLO,RECEP,GUANO
	COMMON /OINDEX/ BROPE,HOOK1,HOOK2,SAFE,SSLOT,BRICK,FUSE
	COMMON /OINDEX/ GNOME,BLABE,DBALL,TOMB
	COMMON /OINDEX/ LCASE,CAGE,RCAGE,SPHER,SQBUT
	COMMON /OINDEX/ FLASK,POOL,SAFFR,BUCKE,ECAKE,ORICE,RDICE,BLICE
	COMMON /OINDEX/ ROBOT,FTREE,BILLS,PORTR,SCOL,ZGNOM
	COMMON /OINDEX/ EGG,BEGG,BAUBL,CANAR,BCANA
	COMMON /OINDEX/ YLWAL,RDWAL,PINDR,RBEAM
	COMMON /OINDEX/ ODOOR,QDOOR,CDOOR,NUM1,NUM8
	COMMON /OINDEX/ WARNI,CSLIT,GCARD,STLDR
	COMMON /OINDEX/ HANDS,WALL,LUNGS,SAILO,AVIAT,TEETH
	COMMON /OINDEX/ ITOBJ,EVERY,VALUA,OPLAY,WNORT,GWATE,MASTER
C
C ADVENTURERS
C
	COMMON /ADVS/ ALNT,AROOM(4),ASCORE(4),AVEHIC(4),
	1	AOBJ(4),AACTIO(4),ASTREN(4),AFLAG(4)
C
	COMMON /AINDEX/ PLAYER,AROBOT,AMASTR
C MOVETO, PAGE 2
C
	MOVETO=.FALSE.				!ASSUME FAILS.
	LHR=(RFLAG(HERE).AND.RLAND).NE.0	!LAND  HERE FLAG.
	LNR=(RFLAG(NR).AND.RLAND).NE.0		!LAND THERE FLAG.
	J=AVEHIC(WHO)			!HIS VEHICLE
C
	IF(J.NE.0) GO TO 100			!IN VEHICLE?
	IF(LNR) GO TO 500			!NO, GOING TO LAND?
	CALL RSPEAK(427)			!CAN'T GO WITHOUT VEHICLE.
	RETURN
C
100	BITS=0					!ASSUME NOWHERE.
	IF(J.EQ.RBOAT) BITS=RWATER		!IN BOAT?
	IF(J.EQ.BALLO) BITS=RAIR		!IN BALLOON?
	IF(J.EQ.BUCKE) BITS=RBUCK		!IN BUCKET?
	NLV=(RFLAG(NR).AND.BITS).EQ.0	!GOT WRONG VEHICLE FLAG.
	IF((.NOT.LNR .AND.NLV) .OR.
	1	(LNR.AND.LHR.AND.NLV.AND.(BITS.NE.RLAND)))
	2	GO TO 800			!GOT WRONG VEHICLE?
C
500	MOVETO=.TRUE.				!MOVE SHOULD SUCCEED.
	IF((RFLAG(NR).AND.RMUNG).EQ.0) GO TO 600 !ROOM MUNGED?
	CALL RSPEAK(RRAND(NR))			!YES, TELL HOW.
	RETURN
C
600	IF(WHO.NE.PLAYER) CALL NEWSTA(AOBJ(WHO),0,NR,0,0)
	IF(J.NE.0) CALL NEWSTA(J,0,NR,0,0)
	HERE=NR
	AROOM(WHO)=HERE
	CALL SCRUPD(RVAL(NR))			!SCORE ROOM
	RVAL(NR)=0
	RETURN
C
800	CALL RSPSUB(428,ODESC2(J))		!WRONG VEHICLE.
	RETURN
	END
C SCORE-- PRINT OUT CURRENT SCORE
C
C DECLARATIONS
C
	SUBROUTINE SCORE(FLG)
	IMPLICIT INTEGER (A-Z)
	LOGICAL FLG
	INTEGER RANK(10),ERANK(5)
C
C GAME STATE
C
	LOGICAL TELFLG
	COMMON /PLAY/ WINNER,HERE,TELFLG
	COMMON /STATE/ MOVES,DEATHS,RWSCOR,MXSCOR,MXLOAD,
	1	LTSHFT,BLOC,MUNGRM,HS,EGSCOR,EGMXSC
C
	COMMON /CHAN/ INPCH,OUTCH,DBCH
C
C ADVENTURERS
C
	COMMON /ADVS/ ALNT,AROOM(4),ASCORE(4),AVEHIC(4),
	1	AOBJ(4),AACTIO(4),ASTREN(4),AFLAG(4)
C
C FLAGS
C
	LOGICAL*1 TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF
	LOGICAL*1 DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF
	LOGICAL*1 MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF
	LOGICAL*1 EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF
	LOGICAL*1 GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF
	LOGICAL*1 GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF
	LOGICAL*1 MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF
	LOGICAL*1 FOLLWF,SPELLF,CPOUTF,CPUSHF
	COMMON /FINDEX/ TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF,
	1	DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF,
	2	MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF,
	3	EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF,
	4	GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF,
	5	GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF,
	6	MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF,
	7	FOLLWF,SPELLF,CPOUTF,CPUSHF
	COMMON /FINDEX/ BTIEF,BINFF
	COMMON /FINDEX/ RVMNT,RVCLR,RVCYC,RVSND,RVGUA
	COMMON /FINDEX/ ORRUG,ORCAND,ORMTCH,ORLAMP
	COMMON /FINDEX/ MDIR,MLOC,POLEUF
	COMMON /FINDEX/ QUESNO,NQATT,CORRCT
	COMMON /FINDEX/ LCELL,PNUMB,ACELL,DCELL,CPHERE
C
C FUNCTIONS AND DATA
C
	DATA RANK/20,19,18,16,12,8,4,2,1,0/
	DATA ERANK/20,15,10,5,0/
C SCORE, PAGE 2
C
	AS=ASCORE(WINNER)
	IF(ENDGMF) GO TO 60			!ENDGAME?
	IF(FLG) WRITE(OUTCH,100)
	IF(.NOT.FLG) WRITE(OUTCH,110)
	IF(MOVES.NE.1) WRITE(OUTCH,120) AS,MXSCOR,MOVES
	IF(MOVES.EQ.1) WRITE(OUTCH,130) AS,MXSCOR,MOVES
	DO 10 I=1,10
	  IF((AS*20/MXSCOR).GE.RANK(I)) GO TO 50
10	CONTINUE
50	CALL RSPEAK(484+I)
	RETURN
C
60	IF(FLG) WRITE(OUTCH,140)
	IF(.NOT.FLG) WRITE(OUTCH,150)
	WRITE(OUTCH,120) EGSCOR,EGMXSC,MOVES
	DO 70 I=1,5
	  IF((EGSCOR*20/EGMXSC).GE.ERANK(I)) GO TO 80
70	CONTINUE
80	CALL RSPEAK(786+I)
	RETURN
C
100	FORMAT(' Your score would be',$)
110	FORMAT(' Your score is',$)
120	FORMAT('+',I4,' [total of',I4,' points], in',I5,' moves.')
130	FORMAT('+',I4,' [total of',I4,' points], in',I5,' move.')
140	FORMAT(' Your score in the endgame would be',$)
150	FORMAT(' Your score in the endgame is',$)
C
	END
C SCRUPD- UPDATE WINNER'S SCORE
C
C DECLARATIONS
C
	SUBROUTINE SCRUPD(N)
	IMPLICIT INTEGER (A-Z)
C
C GAME STATE
C
	LOGICAL TELFLG
	COMMON /PLAY/ WINNER,HERE,TELFLG
	COMMON /STATE/ MOVES,DEATHS,RWSCOR,MXSCOR,MXLOAD,
	1	LTSHFT,BLOC,MUNGRM,HS,EGSCOR,EGMXSC
C
C CLOCK INTERRUPTS
C
	LOGICAL*1 CFLAG
	COMMON /CEVENT/ CLNT,CTICK(25),CACTIO(25),CFLAG(25)
C
	COMMON /CINDEX/ CEVCUR,CEVMNT,CEVLNT,CEVMAT,CEVCND,
	1	CEVBAL,CEVBRN,CEVFUS,CEVLED,CEVSAF,CEVVLG,
	2	CEVGNO,CEVBUC,CEVSPH,CEVEGH,
	3	CEVFOR,CEVSCL,CEVZGI,CEVZGO,CEVSTE,
	5	CEVMRS,CEVPIN,CEVINQ,CEVFOL
C
C ADVENTURERS
C
	COMMON /ADVS/ ALNT,AROOM(4),ASCORE(4),AVEHIC(4),
	1	AOBJ(4),AACTIO(4),ASTREN(4),AFLAG(4)
C
C FLAGS
C
	LOGICAL*1 TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF
	LOGICAL*1 DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF
	LOGICAL*1 MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF
	LOGICAL*1 EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF
	LOGICAL*1 GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF
	LOGICAL*1 GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF
	LOGICAL*1 MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF
	LOGICAL*1 FOLLWF,SPELLF,CPOUTF,CPUSHF
	COMMON /FINDEX/ TROLLF,CAGESF,BUCKTF,CAROFF,CAROZF,LWTIDF,
	1	DOMEF,GLACRF,ECHOF,RIDDLF,LLDF,CYCLOF,
	2	MAGICF,LITLDF,SAFEF,GNOMEF,GNODRF,MIRRMF,
	3	EGYPTF,ONPOLF,BLABF,BRIEFF,SUPERF,BUOYF,
	4	GRUNLF,GATEF,RAINBF,CAGETF,EMPTHF,DEFLAF,
	5	GLACMF,FROBZF,ENDGMF,BADLKF,THFENF,SINGSF,
	6	MRPSHF,MROPNF,WDOPNF,MR1F,MR2F,INQSTF,
	7	FOLLWF,SPELLF,CPOUTF,CPUSHF
	COMMON /FINDEX/ BTIEF,BINFF
	COMMON /FINDEX/ RVMNT,RVCLR,RVCYC,RVSND,RVGUA
	COMMON /FINDEX/ ORRUG,ORCAND,ORMTCH,ORLAMP
	COMMON /FINDEX/ MDIR,MLOC,POLEUF
	COMMON /FINDEX/ QUESNO,NQATT,CORRCT
	COMMON /FINDEX/ LCELL,PNUMB,ACELL,DCELL,CPHERE
C
	IF(ENDGMF) GO TO 100			!ENDGAME?
	ASCORE(WINNER)=ASCORE(WINNER)+N		!UPDATE SCORE
	RWSCOR=RWSCOR+N				!UPDATE RAW SCORE
	IF(ASCORE(WINNER).LT.(MXSCOR-(10*DEATHS))) RETURN
	CFLAG(CEVEGH)=.TRUE.			!TURN ON END GAME
	CTICK(CEVEGH)=15
	RETURN
C
100	EGSCOR=EGSCOR+N				!UPDATE EG SCORE.
	RETURN
	END
