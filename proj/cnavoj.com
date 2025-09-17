//M(ProfilNavoja2/$89440/"\\sh031.png"///10,20)
;definicija profila navoja
;za masinu 357 preuzeto sa FB355

DEF NACBRUS = (IDD/* 0=$89401,1=$89402/0/,$89400,,"."////250,15,170/405,15,170//"pom.html","M001")
DEF NAZIV = (S//"<no name>"/,"Naziv profila",,"."////250,,170/405,,170)
DEF PROFIL = (IDD/* 0=$89579, 1=$89580,2=$89581,3=$89405, 4=$89408, 5=$89582, 6=$89583//,$89403,"-","."////250,,170/405,,170//"pom.html","M003")
DEF PRECD = (R3/-450,450/10/,$89409,"D",$89068/LI3,///250,,170/405//"pom.html","M004")
DEF PRECD1 = (R3/-450,450/8.1/,,"D1",$89068////250,,170/405//"pom.html","M005")
DEF PRECD2 = (R3/-450,450/9.026/,,"D2",$89068////250,,170/405//"pom.html","M006")
DEF KORAK = (R3/0.25,80/1.5/,$89410,"P",$89068/LI3///250,,170/405//"pom.html","M007")
DEF SMER = (IDD/* 0=$89413,1=$89412/0/,$89411,"L","."//"\\sh037.png"//250,,170/405//"pom.html","M008")
DEF BROJPOCET = (IDD/1,100/1/,$89414,"n","."//"\\sh018.png"//250,,170/405//"pom.html","M009")
DEF KONUS = (R3/-10,10/0/,$89415,"K",$89068/LI3/"\\sh014.png"//250,,170/405//"pom.html","M010")
DEF UGAO1 = (R1/0,50/30/,$89416,"A1",$89072/LI3,///250,,170/405//"pom.html","M011")
DEF UGAO2 = (R1/0,50/30/,$89417,"A2",$89072/LI3,///250,,170/405//"pom.html","M012")
DEF RADIJUS1 = (R3/0,10/0/,$89418,"R1",$89068////250,,170/405//"pom.html","M013")
DEF RADIJUS2 = (R3/0,10/0/,,"R2",$89068////250,,170/405//"pom.html","M014")
DEF VISINA = (R0/0.2,10/1/,$89419,"H1",$89068/LI3,/"\\sh032.png"/"VIS1[0]"/250,,170/405//"pom.html","M015")

VS8=("OK",,SE1)
VS7=("Cancel",,SE1)

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS


;promene profila
CHANGE(PROFIL) 
   call("Vidljivost")
END_CHANGE

;promena levi-desni navoj
CHANGE(SMER)

END_CHANGE

OUTPUT(NCCODE3)
  "_THREAD_PROFIL(" NACBRUS "," PROFIL "," PRECD "," PRECD1 ","  PRECD2 "," KORAK "," SMER "," BROJPOCET "," KONUS "," UGAO1 "," UGAO2 "," RADIJUS1 "," RADIJUS2 "," VISINA ",""" NAZIV  """)"
END_OUTPUT


;promena spoljno-unutrasnje
CHANGE (NACBRUS) 
   call("Vidljivost")
END_CHANGE

LOAD
  lb("Funkcije","cnavoj.com")
  hlp="sh032.png"
  RECT(230,10,316,320,128,127,1)
  RECT(0,10,230,320,128,4,1)
   call("Vidljivost")
END_LOAD

//END

//M(AbrihtNavoja/$89151)
;FB221
;maj 2022

DEF BRTOC = (S//"krug1"/$89642,$89190////235,5,190/375,5,95//"pomoc.html","9007")
DEF DBROJTOC = (I/1,9/1/$89643,,"D1"////500,5,20/505,5,35//"pomoc.html","9008")

DEF BRAbriht = (S//"almaz1"/$89684,$89683////235,45,190/375,45,95//"pomoc.html","9301")
DEF DBROJAbriht = (I/1,9/1/$89685,,"D1"////500,45,20/505,45,35//"pomoc.html","9302")
DEF DBROJAbriht2 = (I/1,9/2/$89685,,"D2"////500,65,20/505,65,35//"pomoc.html","9302")

DEF NACABRIHT = (I/* 0=$89135, 300=$89586, 310=$89585 , 320=$89587 /0/$89689,$89165,,/WR2///235/375,,165//"pomoc.html","9314")

DEF BROJABRIHT = (IDD/1,1000/1/$89690,$89232,"N",$89067////235,,190/430,,110//"pomoc.html","9304")
DEF BRZABRIHT = (R1/1,3000/300/$89233,$89234,"VA",$89070////235,,190/430,,110//"pomoc.html","9305")
DEF VAR3 = (R3/0.0,0.25/0.0/$89230,$89231,"SX",$89068////235,,190/430,,110//"pomoc.html","9306")
DEF BRZINA_A = (R3/5,50/10/$89691,$89567,"Va",$89074/LI3,///235,,190/430,,110//"pomoc.html","9308")
DEF OBLIK = (IDD/* 0=$89692, 1=$89693/0/$89695,$89694,,/wr2///235,,195/430,,110//"pomoc.html","9022")
DEF KOMADA = (IDD/0,100/0/$89055,$89199,"",$89073////235,,180/430,,110//"pomoc.html","9310")
DEF PREOSTALO = (IDD/0,100/0/$89696,$89167,"",$89073////235,,180/430,,110//"pomoc.html","9311")
DEF HLAD_A = (IDD/10,15/12/$89697,$89568,,$89067/WR2,ac2///235,,195/430,,110//"pomoc.html","9011")

DEF KOMENT = (S///$89660,$89569,////235,,80/310,,230//"pomoc.html","9024")
DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 

VS8=("OK",,SE1)
VS7=("Cancel",,SE1)


OUTPUT(NCCODE3)
  "_THREAD_DRESSING(""" BRTOC """," DBROJTOC ",""" BrAbriht"""," DbrojAbriht ","  DbrojAbriht2 "," NacAbriht "," BrojAbriht "," BrzAbriht "," VAR3 "," Brzina_A "," Komada "," Preostalo "," HLAD_A "," OBLIK ",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
   
END_LOAD

//END

//M(ProfilKamena/$89151)
;FB357
;avgust 2023
DEF NASLOV2 = (R3///,$89631,,/WR1///230,28,280/415,28,125/)
DEF VARX1 = (r3/-1,5/0/,$89438,"x1",$89068/LI3,///235,,195/425,,110//"pom.html","A001")
DEF VARX2 = (R3/-1,1/0/,,"x2",$89068/LI3,///235,,195/425,,110//"pom.html","A002")
DEF PODHOD = (R3/0,10/3/,$89058,"xS",$89068/LI3,WR2///235,,195/425,,110//"pom.html","A003")
DEF RAST = (R3/0,10/3/,$89422,"x3",$89068/LI3,///235,,195/425,,110//"pom.html","A004")
DEF korxb = (R3/-10,10/0/,$89439,"xB",$89068/LI3,///235,,195/425,,110//"pom.html","A004")
DEF NZ = (I/1,30/1/,$89423,"NZ","-"/LI3///235,,195/425,,95//"pom.html","A005")
DEF PPX = (I/1,3/1/"",$89555,"PPX","x"/LI3///235,,195/425,,95//"pom.html","A006")
DEF DeltaX = (R3/0,0.30/0/"",$89556,"DX",$89068/LI3///235,,195/425,,95//"pom.html","A007")

DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 

VS8=("OK",,SE1)
VS7=("Cancel",,SE1)


OUTPUT(NCCODE3)
  "_THREAD_WHEEL(" VARX1 "," VARX2 "," PODHOD "," RAST ","  KORXB "," NZ "," PPX "," DELTAX ")"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
   hlp="//kamviseprofilni.png"
END_LOAD

//END

//M(BrusenjeProfila/$89272)
;FB221 maj 2022


DEF LEDJNO = (IDD/*1=$89154,0=$89155,-1=$89577/0/,$89572,"-","."////25,150,240/245,150,130//"pom.html","L001")
DEF LEDDUB = (R3/0,100/0/,$89573,"K",$89068////25,,240/245,,130//"pom.html","L002");
DEF LEDZUB = (I/2,100/2/,$89574, "Z", "-"////25,,240/245,,130//"pom.html","L003")
DEF LEDUGAO = (I/10,90/45/, $89575,"Fi","%"////25,,240/245,,130//"pom.html","L004")
DEF LEDKORAK = (R4/0,2000/0/,$89576,"H",$89068////25,,240/245,,130//"pom.html","L005")
DEF TABELA = (S///,$89578/WR2///25,,240/245,,220)
DEF Slika = (I///,,,/wr1///0,0,250,330/0,320,25,2) 


VS8=("OK",,se1)
VS7=("Cancel",,se1)

OUTPUT(NCCODE2)
  "_THREAD_RELIEF(""" TABELA """," LEDJNO "," LEDDUB "," LEDZUB "," LEDUGAO "," LEDKORAK ")"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE2")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
   slika.st = "\\ledbrus.png"
   if (Ledjno==-1)
      Tabela.wr=2
   else
      Tabela.wr=1
   endif
END_LOAD


CHANGE(Ledjno)
   if (Ledjno==-1)
      Tabela.wr=2
   else
      Tabela.wr=1
   endif
END_CHANGE


//END

//M(RadniPredmet/$89075)
;FB357 avgust 2023


DEF NACBRUS = (I/* 0=$89152, 810=$89522, 820=$89523 /0/,$89000,,////235,,120/375,,150//"pomoc.html","9008")

DEF POZZ1 = (R4/,/0/$89102,$89103,"Z1",/LI3,///235,,160/375,,60//"pomoc.html","9012"),
POZZ2 = (R4/,/0/$89104,,"Z2",$89068/LI3,///465,,20/465,,110//"pomoc.html","9013")

DEF VAR15 = (R4/,/0/$89065,$89065,,/LI3,///235,,165/375,,60),
VAR25 = (R4/,//,,,$89068/LI3,///465,,18/465,,110)

DEF VAR16 = (R4/,/0/$89066,$89066,,/LI3,///235,,165/375,,60),
VAR26 = (R4/,//,,,$89068/LI3,///465,,25/465,,110)

DEF OBLIK = (IDD/* 0=$89401, 1=$89402/0/,$89400,,/wr2///235,,145/375,,100//"pomoc.html","9005")

DEF BRZINA = (R3/5,100/10/,$89063,"V",$89074/LI3,///235,,165/375,,110//"pomoc.html","9044")

DEF HLADJENJE = (IDD/10,15/12/,$89452,,$89067/WR2,ac2///235,,145/375,,110//"pomoc.html","9009")

DEF Naslov1 = (IDD///,$89151/WR1///235,,145/375,,110)
DEF NACABRIHT1 = (I/* 0=$89135, 1=$89134/0/,$89843,,////235,,145/375,,110//"POMOC.HTML","9302")
DEF NACABRIHT2 = (I/* 0=$89135, 1=$89134/0/,$89844,,////235,,145/375,,110//"POMOC.HTML","9302")
DEF NACABRIHT3 = (I/* 0=$89135, 1=$89134/0/,$89849,,////235,,145/375,,110//"POMOC.HTML","9302")

DEF ABRIHTPROGRAM = (S/1,1000/1/$89048,$89847,"Ng"////235,,145/375,,110)
DEF KORAK1 = (R3/0.0,0.25/0.0/$89230,$89845,"Kg",$89068////235,,145/375,,110)
DEF ODSKOK1 = (R3/0.0,0.25/0.0/$89230,$89846,"Xg",$89068////235,,145/375,,110)

DEF KOMENT = (S///,$89569,////235,320,100/235,340,305//"pomoc.html","9017")

DEF Slika = (I///,,,/wr1///0,0,250,360/0,320,25,2) 


VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE2)
  "_THREAD_WORKPART(" NACBRUS "," POZZ1 "," POZZ2 "," VAR15 "," VAR16 "," OBLIK "," BRZINA "," HLADJENJE "," NACABRIHT1 "," NACABRIHT2 "," NACABRIHT3 ",""" ABRIHTPROGRAM """," KORAK1 "," Odskok1 ",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE2")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
   if (((NACBRUS==214) OR (NACBRUS==300) OR (NACBRUS==304) OR (NACBRUS==320)) AND (OBLIK==0))
      SMER.WR=2
   else
      SMER=0
      SMER.WR=1
   endif
   slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
  RECT(230,0,316,150,128,127,1)
  RECT(230,150,316,160,128,129,1)
  RECT(230,310,316,60,128,127,1)
  RECT(0,0,230,370,128,4,1)
END_LOAD

CHANGE(SMER)
   slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
END_CHANGE

CHANGE(NACBRUS)
   if (((NACBRUS==300) OR (NACBRUS==304) OR (NACBRUS==320)) AND (OBLIK==0))
      SMER.WR=2
      slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
   else
      SMER=0
      SMER.WR=1
   endif

END_CHANGE

CHANGE(OBLIK)
   if (((NACBRUS==300) OR (NACBRUS==304) OR (NACBRUS==320)) AND (OBLIK==0))
      slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
      SMER.WR=2
   else
      SMER=0
      SMER.WR=1
   endif
END_CHANGE

//END


//M(Navoj/$89272)
;FB357 avgust 2023

DEF BRTOC = (S//"krug1"/,$89095////235,25,190/375,25,95//"pomoc.html","9007"),
DBROJTOC = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/,$89454,"","."/WR2///235,,165/375,,180)

DEF UGAOZ = (R3/-180,180/0/,$89453,"B",$89072/LI3,///235,,165/375,,180//"pomoc.html","9044")
DEF CALCA = (IDD/*0=$89155, 1=$89154/1/,"Calculate angle A ?",,"."////235,,165/375,,180)
DEF UGAOA = (R3/-30,30/0/,,"A",$89072/LI3,///235,,165/375,,180//"pomoc.html","9044")
DEF PRILAZ = (I/*-1=$89607,0=$89601,1=$89602,2=$89603,3=$89604/0/,$89605,,"."/WR2///235,,165/375,,180//"pomoc.html","9015")

DEF XSAFE = (R1//0/,$89606,"X",////235,,165/375,,60),
ZSAFE = (R1//0/,,"Z",$89068/WR2///465,,25/465,,110)

DEF PRILAZKOMADUX = (I/*-1=$89607,0=$89526,1=$89609,2=$89610,3=$89611/0/,$89612,,"."/WR2///235,,165/375,,210//"pomoc.html","9015")

DEF PRECPRILAZ = (R1/-1000,1000/0/,$89613,"",$89068/LI3,WR2///235,,165/375,,180//"pomoc.html","9016")
DEF UGAOC = (R3/0,359.999/0/,,"C",$89072/LI3,///235,,165/375,,180//"pomoc.html","9044")
DEF PRILAZKOMADUZ = (I/*0=$89155, 1=$89154/0/,$89297,,"."/WR2///235,,195/405,,150//"pomoc.html","9015")

DEF PozPrilaza = (R1/-1000,1000/0/,$89181,"",$89068/LI3,WR2///235,,165/375,,180//"pomoc.html","9016")

DEF ODSKOK = (I/*0=$89526,1=$89527,2=$89528,-1=$89320,-2=$89321, -3=$89322/0/,$89529,,/WR2///235,,145/375,,110//"pomoc.html","9015")

DEF PRECODSKOK = (R1/0,1000/0/,$89530,"",$89068/LI3,WR2///235,,145/375,,110//"pomoc.html","9016")

VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE2)
  "_THREAD_GRINDING(""" BRTOC """," DBROJTOC "," UGAOZ "," UGAOA "," CALCA "," UGAOC "," KORDSYS "," PRILAZ "," XSAFE "," ZSAFE "," PRILAZKOMADUX "," PRECPRILAZ "," PRILAZKOMADUZ "," POZPRILAZA "," ODSKOK ","PRECODSKOK ")"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE2")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

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

LOAD

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

   IF( (PRILAZKOMADUX==2) OR (PRILAZKOMADUX==3) )
     PRECPRILAZ.WR=2
   ELSE
     PRECPRILAZ.wr=4
   ENDIF

   IF(PRILAZKOMADUZ==0)
     POZPRILAZA.WR=4
   ELSE
     POZPRILAZA.WR=2
   ENDIF

END_LOAD


//END

//B(Funkcije)

SUB(VIDLJIVOST)

        PREC.WR=2
        PRECD1.wr=2
        PRECD2.WR=2
        KORAK.WR=2
        SMER.WR=2
        BROJPOCET.WR=2
        KONUS.WR=2
        PROFIL.WR=2

        IF(PROFIL==0) ; trougao
          UGAO1.wr=2
          UGAO2.wr=2
          RADIJUS1.wr=2
          VISINA.wr=1
          RADIJUS2.wr=1
          hlp="navtro.png"
        Endif

        if (profil==1) ;trapez
           UGAO1.wr=2
           UGAO2.wr=2
           RADIJUS1.wr=2
           VISINA.wr=1
           RADIJUS2.wr=2
           hlp="navtrap.png"
        Endif

        if (profil==2) ; zaobljeni
           UGAO1.wr=2
           UGAO2.wr=2
           VISINA.wr=1
           RADIJUS1.wr=2
           RADIJUS2.wr=2
           hlp="navobl.png"
        Endif

        if (profil==3) ; testerasti
          UGAO1.wr=2
          UGAO2.wr=2
          VISINA.wr=1
          RADIJUS1.wr=2
          RADIJUS2.wr=2
          hlp="navtest.png"
        Endif
   
        if (profil==4) ; NE IDE
           UGAO1.wr=2
           UGAO2.wr=2
           VISINA.wr=2
           RADIJUS1.wr=1
           RADIJUS2.wr=1
           hlp="naviz.png"
        Endif

        if (profil==5) ;testerasti NE IDE
           UGAO1.wr=2
           UGAO2.wr=2
           VISINA.wr=2
           RADIJUS1.wr=1
           RADIJUS2.wr=1
           hlp="navtestiz.png"
        Endif

        if (profil==6) ;KVZ
           UGAO1.wr=1
           UGAO2.wr=1
           VISINA.wr=1
           RADIJUS1.wr=2
           RADIJUS2.wr=1
           hlp="navrad.png"
       Endif

END_SUB


//END

