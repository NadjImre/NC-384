//M(merenje100/$89544//50,50,390,290///CB1)
;FB290

DEF Sonda = (S//"zond"/,$89464////235,25,165/375,25,95//"pomoc.html","9007"),
DBROJSonde = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF DuzMer = (R1/-100,100/10/,$89486,"B",$89068/LI3,///235,,185/395,,160//"pomoc.html","9044")

DEF BrzMer = (I/1,1500/60/,$89484,"V",$89070/WR2///235,,185/395,,160//"pomoc.html","9015")

DEF XNOM = (R3/0,270/0/,$89545,"X",$89068////235,,185/395,,160)
DEF BrojSonde = (I/1,2/1/$89772,$89489," ","."/WR2///235,,185/425,,130//"pomoc.html","9708")
DEF BRZMER_KOD=(I)
VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE1)
  "MS100(""" SONDA """," DBROJSONDE "," DUZMER "," BRZMER_KOD "," XNOM ")"
END_OUTPUT

PRESS(VS8)
  IF(BROJSONDE==2) 
     BRZMER_KOD=-BRZMER
  ELSE
     BRZMER_KOD=BRZMER
  ENDIF
  GC("NCCODE1")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,225,127,133,1)
  IF(BRZMER_KOD<0)
    BRZMER=-BRZMER_KOD
    BrojSonde=2
  ELSE
    BRZMER=BRZMER_KOD
    BrojSonde=1
ENDIF

END_LOAD

//END

//M(merenje110/$89543//50,50,390,290///CB1)
;FB290

DEF Sonda = (S//"zond"/,$89464////235,25,190/375,25,95//"pomoc.html","9007"),
DBROJSonde = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF DuzMer = (R1/-100,100/10/,$89486,"B",$89068/LI3,///235,,185/395,,160//"pomoc.html","9044")

DEF BrzMer = (I/1,1500/60/,$89484,"V",$89070/WR2///235,,185/395,,160//"pomoc.html","9015")

DEF ZNOM = (R3/-1000,1000/0/,$89546,"Z",$89068////235,,185/395,,160)

DEF BrojSonde = (I/1,2/1/$89772,$89489," ","."/WR2///235,,185/425,,130//"pomoc.html","9708")
DEF BRZMER_KOD=(I)

VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE2)
  "MS110(""" SONDA """," DBROJSONDE "," DUZMER "," BRZMER_KOD "," ZNOM ")"
END_OUTPUT

PRESS(VS8)
  IF(BROJSONDE==2) 
     BRZMER_KOD=-BRZMER
  ELSE
     BRZMER_KOD=BRZMER
  ENDIF
  GC("NCCODE2")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,225,127,133,1)
  IF(BRZMER_KOD<0)
    BRZMER=-BRZMER_KOD
    BrojSonde=2
  ELSE
    BRZMER=BRZMER_KOD
    BrojSonde=1
ENDIF
END_LOAD

//END


//M(merenje120/""//50,50,390,290///CB1)
;FB290

DEF Sonda = (S//"zonda"/$89759,$89464////235,25,210/395,25,75//"pomoc.html","9701"),
DBROJSonde = (I/1,9/1/$89760,,"D"////500,25,20/500,25,40//"pomoc.html","9702")

DEF xNOM = (R3/-1000,1000/0/$89766,$89545,"X",$89068////235,,185/395,,160//"pomoc.html","9705")

DEF ZNOM = (R3/-1000,1000/0/$89768,$89546,"Z",$89068////235,,185/395,,160//"pomoc.html","9706")

DEF DuzMer = (R1/-100,100/10/$89762,$89486,"B",$89068/LI3,///235,,185/395,,160//"pomoc.html","9703")

DEF BrzMer = (I/1,1500/60/$89764,$89484,"V",$89070/WR2///235,,185/395,,160//"pomoc.html","9704")

DEF MSonde = (I/21,35/23/$89770,$89769,"M","."/WR2///235,,185/395,,160//"pomoc.html","9707")

DEF BrojSonde = (I/1,2/1/$89772,$89489," ","."/WR2///235,,185/395,,160//"pomoc.html","9708")

def korekcija = (I/*0="Measure only", 1="Part coord.sys correction", 2="Rekalibration"/0/,"Measuring method",,"."/WR2///235,,185/395,,160//"pomoc.html","9709")

DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/$89777,$89454,"","."/WR2///235,,185/395,,160//"pomoc.html","9710")

DEF DOZRAZ = (R3/-1,1/0/$89776,$89775,"D",$89068////235,,185/395,,160//"pomoc.html","9711")


def TREBAC = (I/*0=$89155, 1=$89154/0/,$89551,"","."/WR2///235,,185/395,,160//"pomoc.html","9709")
DEF CNOM = (R3/0,359.999/0/$89768,$89552,"",$89072////235,,185/395,,160//"pomoc.html","9706")
VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE3)
  "MS120(""" SONDA """," DBROJSONDE "," xnom "," znom "," DUZMER "," BRZMER "," Msonde "," BRojsonde "," korekcija "," kordsys "," DOZRAZ " , " TREBAC " , " CNOM ")"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,275,127,133,1)
END_LOAD

//END

