CONN INT:
RENAME MDLXXX.EXE MDL106.EXE

RENAME MDLXXX.SYMBOLS MDL106.SYMBOLS

NDDT
;YMDL106.EXE
;O
MUDSTR+2/0"106^?^?
P;UMDL106.EXE
;H
RES .
CONN MDL:
NDDT
;YINT:MDL106.EXE
;OINT:MDL106.SYMBOLS
G<SAVE "PS:<MDL>M106UNI.SAVE"><FLOAD "MDL:NEWMUD">
<FOO>;HCONN INT:
CONT
;UMDL106.EXE
;H
LOGOUT
