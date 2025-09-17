//M(zaokret/$89616//50,50,390,290///CB1)
;FB290

DEF BRTOC = (S//"krug1"/,$89095////235,25,190/375,25,95//"pomoc.html","9007"),
DBROJTOC = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G516",18="G517",19="G518",20="G519"/2/,$89454,"","."/WR2///235,,165/375,,180)

DEF UGAOZ = (R3/-31,271/0/,$89453,"B",$89072/LI3,///235,,165/375,,180//"pomoc.html","9044")

DEF PRILAZ = (I/*-1=$89607,0=$89601,1=$89602,2=$89603,3=$89604/0/,$89605,,"."/WR2///235,,165/375,,180//"pomoc.html","9015")

DEF XSAFE = (R1//0/,$89606,"X",////235,,165/375,,60),
ZSAFE = (R1//0/,,"Z",$89068/WR2///465,,25/465,,110)

DEF PRILAZKOMADUX = (I/*-1=$89607,0=$89526,1=$89609,2=$89610,3=$89611/0/,$89612,,"."/WR2///235,,165/375,,210//"pomoc.html","9015")

DEF PRECPRILAZ = (R1/-1000,1000/0/,$89613,"",$89068/LI3,WR2///235,,165/375,,180//"pomoc.html","9016")

DEF PRILAZKOMADUZ = (I/*0=$89155, 1=$89154/0/,$89297,,"."/WR2///235,,195/405,,150//"pomoc.html","9015")

DEF PozPrilaza = (R1/-1000,1000/0/,$89181,"",$89068/LI3,WR2///235,,165/375,,180//"pomoc.html","9016")

VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE2)
  "_APPROACH(""" BRTOC """," DBROJTOC "," UGAOZ "," KORDSYS "," PRILAZ "," XSAFE "," ZSAFE "," PRILAZKOMADUX "," PRECPRILAZ "," PRILAZKOMADUZ "," POZPRILAZA ")"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE2",,1)
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,225,127,133,1)
END_LOAD

CHANGE(PRILAZ)

If ( (Prilaz==-1) OR (Prilaz==1) )
   XSAFE.WR=1
Else 
   XSAFE.WR=2
endif

If ( (Prilaz==-1) OR (Prilaz==0) )
   Zsafe.wr=1
Else
   ZSafe.wr=2
Endif

END_CHANGE

CHANGE(PRILAZKOMADUX)

   IF( (PRILAZKOMADUX==2) OR (PRILAZKOMADUX==3) )
     PRECPRILAZ.WR=2
   ELSE
     PRECPRILAZ.wr=4
   ENDIF

END_CHANGE

CHANGE (PRILAZKOMADUZ)

   IF(PRILAZKOMADUZ==0)
     POZPRILAZA.WR=4
   ELSE
     POZPRILAZA.WR=2
   ENDIF

//END


//M(zaokretUQ/$89616/"approach_default.png"//50,50,390,290///CB1)
;FB290

DEF BRTOC = (S//"krug1"/,$89095////235,25,190/375,25,95//"pomoc.html","9007"),
DBROJTOC = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G516",18="G517",19="G518",20="G519"/2/,$89454,"","."/WR2///235,,165/375,,160)

DEF KAMEN = (I/* 0="90.000", 1="42.000", 2="60.000", 3="120.000"//,$89913,"K","."////235,,165/375,,160)


DEF PRILAZ = (I/*-1=$89607,0=$89601,1=$89602,2=$89603,3=$89604/-1/,$89605,,"."/WR2///235,,165/375,,160//"pomoc.html","9015")

DEF XSAFE = (R1//0/,$89606,"X",////235,,165/375,,60),
ZSAFE = (R1//0/,,"Z",$89068/WR2///465,,25/465,,110)

DEF POZU = (R3/-300,120/0/,$89911,"U",$89068/LI3,///235,,165/375,,160//"pomoc.html","9044")
DEF UGAOZ = (R3/-210,120/0/,$89453,"B",$89072/LI3,///235,,165/375,,160//"pomoc.html","9044")
DEF UGAOQ = (R3/-30,30/0/,$89912,"Q",$89072/LI3,///235,,165/375,,160//"pomoc.html","9044")

DEF PRILAZKOMADUX = (I/*-1=$89607,0=$89526,1=$89609,2=$89610,3=$89611/0/,$89612,,"."/WR2///235,,165/375,,160//"pomoc.html","9015")
DEF PRECPRILAZ = (R1/-1000,1000/0/,$89613,"",$89068/LI3,WR2///235,,165/375,,160//"pomoc.html","9016")

DEF PRILAZKOMADUZ = (I/*0=$89155, 1=$89154/0/,$89297,,"."/WR2///235,,165/375,,160//"pomoc.html","9015")

DEF PozPrilaza = (R1/-1000,1000/0/,$89181,"",$89068/LI3,WR2///235,,165/375,,160//"pomoc.html","9016")

DEF kocenje = (I/* 0=$89840,1=$89841/1/,$89971,""," ."/WR2///235,,165/375,,160)

DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 


VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE3)
  "_APPROACH_QU(""" BRTOC """," DBROJTOC "," UGAOZ "," KORDSYS "," PRILAZ "," XSAFE "," ZSAFE "," PRILAZKOMADUX "," PRECPRILAZ "," PRILAZKOMADUZ "," POZPRILAZA "," POZU "," UGAOQ "," KAMEN "," kocenje ")"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

FOCUS
	SWITCH(FOC)
		CASE "POZU"
			SLIKA.ST = "\\poz_u.png"
        CASE "UGAOZ"
			SLIKA.ST = "\\poz_b.png"
        CASE "UGAOQ"
			SLIKA.ST = "\\poz_q.png"
        CASE "PRILAZ"
            SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png"
        CASE "PRILAZKOMADUX"
            SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png"
        CASE "XSAFE"
            SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png"
        CASE "ZSAFE"
            SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png"
        CASE "PRILAZKOMADUZ"
            SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png"
        CASE "PRECPRILAZ"
            SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png"
        CASE "PozPrilaza"
            SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png"
	END_SWITCH
END_FOCUS

CHANGE(PRILAZ)
    SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png" 
END_CHANGE

CHANGE(PRILAZKOMADUX)
    SLIKA.ST = "\\sw" << 10*PRILAZKOMADUX+PRILAZ << ".png" 
END_CHANGE



CHANGE(PRILAZ)

If ( (Prilaz==-1) OR (Prilaz==1) )
   XSAFE.WR=1
Else 
   XSAFE.WR=2
endif

If ( (Prilaz==-1) OR (Prilaz==0) )
   Zsafe.wr=1
Else
   ZSafe.wr=2
Endif

END_CHANGE

CHANGE(PRILAZKOMADUX)

   IF( (PRILAZKOMADUX==2) OR (PRILAZKOMADUX==3) )
     PRECPRILAZ.WR=2
   ELSE
     PRECPRILAZ.wr=4
   ENDIF

END_CHANGE

CHANGE (PRILAZKOMADUZ)

   IF(PRILAZKOMADUZ==0)
     POZPRILAZA.WR=4
   ELSE
     POZPRILAZA.WR=2
   ENDIF
END_CHANGE

LOAD
  LS("MENU","CMENI.COM",1)
  SLIKA.ST = "\\default_approach.png"
  Rect(215,5,375,275,127,13)
END_LOAD

//END


