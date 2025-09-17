
//M(brusenje3/$89076)
;FB290 februar 2020

DEF BRTOC = (S//"krug1"/,$89190/wr4///235,5,190/375,25,95//"pomoc.html","9007"),
DEF DBROJTOC = (I/1,9/1/,,"D"/wr4///500,25,20/500,25,40)

DEF NACBRUS = (I/* 0=$89152, 314=$89084, 330=$89083, 400=$89475, 410=$89476, 420=$89477 ,500=$89307,510=$89308,520=$89309/0/,$89000,,////235,,120/375,,150//"pomoc.html","9008");,900=$89631

DEF SMER = (I/* 0=$89191,1=$89192/0/,$89198,,/wr2///235,,120/375,,150)

DEF PREC0 = (R4/-1000,/50/$89100,$89101,"D1",/LI3,///235,,160/375,,60//"pomoc.html","9010"),
PREC1 = (R4/-1000,/50/$89100,,"D2",$89068/LI3,///465,,20/465,,110//"pomoc.html","9011")

DEF POZZ1 = (R4/,/0/$89102,$89103,"Z1",/LI3,///235,,160/375,,60//"pomoc.html","9012"),
POZZ2 = (R4/,/0/$89104,,"Z2",$89068/LI3,///465,,20/465,,110//"pomoc.html","9013")

DEF BROJMER = (I/*0="+",1="-"/0/,$89306,"",/wr2///235,,165/375,,60),
BROJMERZ = (R2/0,900/0/,,"R",$89068/wr2///465,,25/465,,110)

DEF VAR15 = (R4/,/0/$89065,$89065,,/LI3,///235,,165/375,,60),
VAR25 = (R4/,//,,,$89068/LI3,///465,,18/465,,110)

DEF VAR16 = (R4/,/0/$89066,$89066,,/LI3,///235,,165/375,,60),
VAR26 = (R4/,//,,,$89068/LI3,///465,,25/465,,110)

DEF KORDSYS = (IDD/* 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G516",18="G517"/2/,$89454,""/WR4///235,,145/375,,60)
DEF OBLIK = (IDD/* 0=$89401, 1=$89402/0/,$89400,,/wr2///235,,145/375,,100//"pomoc.html","9005")

DEF BRZINA = (R3/10,100/10/,$89063,"V",$89074/LI3,///235,,165/375,,110//"pomoc.html","9044")

DEF HLADJENJE = (IDD/10,/12/,$89452,,$89067/WR2,ac2///235,,145/375,,110//"pomoc.html","9009")

DEF ODSKOK = (I/*0=$89526,1=$89527,2=$89528,-1=$89320,-2=$89321, -3=$89322/0/,$89529,,/WR2///235,,145/375,,110//"pomoc.html","9015")

DEF PRECODSKOK = (R1/0,1000/0/,$89530,"",$89068/LI3,WR2///235,,145/375,,110//"pomoc.html","9016")

DEF KOMENT = (S///,$89569,////235,320,100/235,340,305//"pomoc.html","9017")

DEF Slika = (I///,,,/wr1///0,0,250,360/0,320,25,2) 


VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE2)
  "_GRINDING_2(""" BRTOC """," DBROJTOC "," NACBRUS "," SMER "," PREC0 "," PREC1 "," POZZ1 "," POZZ2 "," BROJMER "," BROJMERZ "," VAR15 "," VAR16 "," KORDSYS "," OBLIK "," BRZINA "," HLADJENJE ", "ODSKOK", "PRECODSKOK",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE2")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
   if ( (NACBRUS==314) AND (OBLIK==0))
      SMER.WR=2
   else
      SMER=0
      SMER.WR=1
   endif
   if ( NACBRUS==500  )
      BROJMER.WR=2
      BROJMERZ.WR=2
      slika.st = "\\sm" << NACBRUS+2*OBLIK+BROJMER<< ".png"
   else
      BrojMer.wr=1
      BrojMerz.wr=1
      slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"  
   endif
END_LOAD

CHANGE(SMER)
   slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
END_CHANGE

CHANGE(NACBRUS)
   if ( (NACBRUS==314) AND (OBLIK==0))
      SMER.WR=2
      slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
   else
      SMER=0
      SMER.WR=1
   endif
   if ( NACBRUS==500  )
      BROJMER.WR=2
      BROJMERZ.WR=2
      slika.st = "\\sm" << NACBRUS+2*OBLIK+BROJMER<< ".png"
   else
      BrojMer.wr=1
      BrojMerz.wr=1
      slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
   endif
END_CHANGE

CHANGE(OBLIK)
   if ( (NACBRUS==314) AND (OBLIK==0))
      slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
      SMER.WR=2
   else
      SMER=0
      SMER.WR=1
   endif
   if ( NACBRUS==500  )
      BROJMER.WR=2
      BROJMERZ.WR=2
      slika.st = "\\sm" << NACBRUS+2*OBLIK+BROJMER<< ".png"
   else
      BrojMer.wr=1
      BrojMerz.wr=1
   endif
END_CHANGE

CHANGE(BrojMer)
      slika.st = "\\sm" << NACBRUS+2*OBLIK+BROJMER<< ".png"
END_CHANGE

//END
