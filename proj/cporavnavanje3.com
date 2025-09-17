
//M(poravnavanje2/$89088)
;FB290 - porvanavanje tocila po profilu, prečnik i čelo sa konusom i radijusom
;april 2020

DEF BRTOC = (S//"krug1"/,$89095////235,5,190/375,5,95//"pomoc.html","9007")
DEF DBROJTOC = (I/1,9/1/,,"D1"////500,5,20/505,5,35)
DEF DBROJTOC2 = (I/1,9/2/,,"D2"////500,25,20/505,25,35)

DEF BRAbriht = (S///,$89813////235,45,190/375,45,95//"pomoc.html","9007")
DEF DBROJAbriht = (I/1,9/1/,,"D1"////500,45,20/505,45,35)
DEF DBROJAbriht2 = (I/1,9/2/,,"D2"////500,65,20/505,65,35)

DEF NACABRIHT1 = (I/* 0=$89135,1=$89086,2=$89087, 3=$89088/0/,$89163,,/WR2///235/375,,165//"POMOC.HTML","9302")
DEF NACABRIHT2 = (I/* 0=$89135,8=$89086, 16=$89087, 24=$89088/0/,$89164,,/WR2///235/375,,165//"POMOC.HTML","9302")

DEF BROJABRIHT = (IDD/1,1000/1/$89048,$89232,"N",$89067////235,,190/430,,110//"POMOC.HTML","9303")
DEF BRZABRIHT = (R1/1,3000/300/$89233,$89234,"VA",$89070////235,,190/430,,110//"POMOC.HTML","9304")
DEF VAR3 = (R4/0.0,0.25/0.0/$89230,$89231,"Sa",$89068////235,,190/430,,110//"POMOC.HTML","9305")
DEF VAR4 = (R4/0.0,0.25/0/$89230,,"Saz",$89068////235,,190/430,,110//"POMOC.HTML","9306")
DEF BRZINA_A = (R3/5,50/10/,$89063,"Va",$89074/LI3,///235,,190/430,,110//"pomoc.html","9044")
DEF Ugao = (R2/0,45/0/,$89453,"G",$89072/WR2///235,,190/430,,110//"POMOC.HTML","9307")
DEF OBLIK = (IDD/* 0=$89401, 1=$89402/0/,$89400,,/wr2///235,,195/430,,110//"pomoc.html","9005")
Def TIP2=(IDD/* 0=$89902,1=$89903/0/,$89901,""/WR2///235,,180/430,,110)
DEF KOMADA = (IDD/0,100/0/$89055,$89199,"",$89073////235,,180/430,,110//"POMOC.HTML","9307")
DEF PREOSTALO = (IDD/0,100/0/,$89167,"",$89073////235,,180/430,,110//"POMOC.HTML","9308")
DEF HLAD_A = (IDD/10,16/12/,$89568,,$89067/WR2,ac2///235,,195/430,,110//"pomoc.html","9011")

DEF KOMENT = (S///,$89569,////235,,90/320,,220//"POMOC.HTML","9017")
DEF NACABRIHT = (I)
DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 
DEF SMER = (I////Wr4)

VS8=("OK",,SE1)
VS7=($89842,,SE1)


OUTPUT(NCCODE3)
  "_PROFIL_DRESSING2(""" BRTOC """," DBROJTOC "," DBROJTOC2 ",""" BrAbriht"""," DbrojAbriht ","  DbrojAbriht2 "," NacAbriht "," BrojAbriht "," BrzAbriht "," VAR3 "," VAR4 "," Brzina_A "," Tip2 "," Komada "," Preostalo "," HLAD_A "," OBLIK ",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  NACABRIHT=NACABRIHT1+NACABRIHT2
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS


CHANGE(OBLIK)
   IF( OBLIK <> 0 )
     NACABRIHT2.WR=1
     NACABRIHT=NACABRIHT1
   ELSE
     NACABRIHT = NACABRIHT1+NACABRIHT2
     NACABRIHT2.WR=2
   ENDIF
   SLIKA.ST = "\\am" << (300+NACABRIHT+64*OBLIK) << ".png" 
END_CHANGE

CHANGE(NACABRIHT1)
    IF( OBLIK <> 0 )
     NACABRIHT2.WR=1
     NACABRIHT=NACABRIHT1
   ELSE
     NACABRIHT = NACABRIHT1+NACABRIHT2
     NACABRIHT2.WR=2
   ENDIF
   SLIKA.ST = "\\am" <<(300+ NACABRIHT+64*OBLIK) << ".png" 
END_CHANGE

CHANGE(NACABRIHT2)
    IF( OBLIK <> 0 )
     NACABRIHT2.WR=1
     NACABRIHT=NACABRIHT1
   ELSE
     NACABRIHT = NACABRIHT1+NACABRIHT2
     NACABRIHT2.WR=2
   ENDIF
   SLIKA.ST = "\\am" << (300+NACABRIHT+64*OBLIK )<< ".png" 
END_CHANGE

CHANGE(UGAO)
   If ( ABS(Ugao) < 0.001 ) 
      var4.wr = 2
   Else
      var4.wr = 1
      var4.val = var3.val*tan(srad(ugao))
   Endif
END_CHANGE

CHANGE(VAR3)
   If ( Abs(ugao) >= 0.001)
      var4.val = var3.val*tan(srad(ugao))
   endif
END_CHANGE

LOAD
   NACABRIHT1 = NACABRIHT BAND 7
   NACABRIHT2 = NACABRIHT BAND 56
   If ( ABS(Ugao) < 0.001 ) 
      var4.wr = 2
      SMER = 0
   Else
      var4.wr = 1
      var4.val = var3.val*tan(srad(ugao))
      SMER=1
   Endif
   IF( OBLIK <> 0 )
     NACABRIHT2.WR=1
     NACABRIHT=NACABRIHT1
   ELSE
     NACABRIHT = NACABRIHT1+NACABRIHT2
     NACABRIHT2.WR=2
   ENDIF
   SLIKA.ST = "\\am" <<(300+ NACABRIHT+64*OBLIK) << ".png" 
END_LOAD

//END

//M(poravnavanje1/$89086)
;FB290 - ravno, cilindrično poravnavanje tocila
;april 2020

DEF BRTOC = (S//"krug1"/,$89095////235,15,190/375,15,95//"pomoc.html","9007"),
DEF DBROJTOC = (I/1,9/1/,,"D"////500,15,20/500,15,40)

DEF BRAbriht = (S//"almaz"/,$89813////235,,190/375,,95//"pomoc.html","9007"),
DEF DBROJAbriht = (I/1,9/1/,,"D"////500,35,20/500,35,40)

DEF NACABRIHT = (I/* 0=$89135, 100=$89821, 110=$89822, 120=$89823/0/,$89165,,/WR2///235/375,,165//"POMOC.HTML","9302")

DEF BROJABRIHT = (IDD/1,1000/1/$89048,$89232,"N",$89067////235,,190/430,,110//"POMOC.HTML","9303")
DEF BRZABRIHT = (R1/1,3000/300/$89233,$89234,"Va",$89070////235,,190/430,,110//"POMOC.HTML","9304")
DEF VAR3 = (R3/0.0,0.25/0.0/$89230,$89231,"Sa",$89068////235,,190/430,,110//"POMOC.HTML","9305")

DEF BRZINA_A = (R3/5,50/10/,$89063,"V",$89074/LI3,///235,,190/430,,110//"pomoc.html","9044")
DEF SMER = (I/* 0=$89191,1=$89192/0/,"Zero point",,/WR2///235,,180/430,,110//"POMOC.HTML","9307")
DEF OBLIK = (IDD/* 0=$89401, 1=$89402/0/,$89400,,/wr2///235,,180/430,,110//"pomoc.html","9005")

DEF KONUS = (R3/0,1/0/,$89460,"k",$89068/LI3,///235,,190/430,,110//"pomoc.html","9044")

DEF PODHODX = (R1/0,50/3/,$89058,"AX",$89068////235,,190/430,,110)
DEF PODHODZ = (R1/0,50/5/,,"AZ",$89068////235,,190/430,,110)
Def TIP2=(IDD/* 0=$89902,1=$89903/0/,$89901,""/WR2///235,,180/430,,110)
DEF KOMADA = (IDD/0,100/0/$89055,$89199,"",$89073////235,,180/430,,110//"POMOC.HTML","9307")
DEF PREOSTALO = (IDD/0,100/0/,$89167,"",$89073////235,,180/430,,110//"POMOC.HTML","9308")
DEF HLAD_A = (IDD/10,16/12/,$89568,,$89067/WR2,ac2///235,,195/430,,110//"pomoc.html","9011")
DEF KOMENT = (S///,$89569,////235,,90/320,,220//"POMOC.HTML","9017")
DEF SKRACENJE = (R1/0,100/0/,$89858,"z",$89068/LI3,WR4///235,,190/430,,110//"pomoc.html","9044")

DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 

VS8=("OK",,SE1)
VS7=($89842,,SE1)


OUTPUT(NCCODE3)
  "_PLANE_DRESSING2(""" BRTOC """," DBROJTOC ",""" BrAbriht """," DbrojAbriht "," NacAbriht "," BrojAbriht "," BrzAbriht "," VAR3 "," Brzina_A "," Smer "," Tip2 "," Konus "," Skracenje "," PodhodX "," PodhodZ "," Komada "," Preostalo "," HLAD_A "," OBLIK ",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

CHANGE(NACABRIHT)
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_CHANGE

CHANGE(SMER)
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_CHANGE

CHANGE(OBLIK)
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_CHANGE

LOAD
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_LOAD

//END

//M(poravnavanje_setup/$89151)
;FB290
;april 2020
DEF Naslov1 = (IDD///,$89151/WR1///)
DEF NACABRIHT1 = (I/* 0=$89135, 1=$89134/0/,$89843,,//////"POMOC.HTML","9302")
DEF NACABRIHT2 = (I/* 0=$89135, 1=$89134/0/,$89844,,//////"POMOC.HTML","9302")
DEF NACABRIHT3 = (I/* 0=$89135, 1=$89134/0/,$89849,,//////"POMOC.HTML","9302")

DEF BROJABRIHT1 = (S/1,1000/1/$89048,$89847,"Ng"////)
DEF KORAK1 = (R3/0.0,0.25/0.0/$89230,$89845,"Kg",$89068////)
DEF ODSKOK1 = (R3/0.0,0.25/0.0/$89230,$89846,"Xg",$89068////)

VS8=("OK",,SE1)
VS7=($89842,,SE1)


OUTPUT(NCCODE3)
  "_DRESSING_SETUP(""" BROJABRIHT1 ""","NACABRIHT1"," KORAK1 "," ODSKOK1","NACABRIHT2","NACABRIHT3")"
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

//M(Korekcija/$89151)
;FB290
;april 2020

DEF BRTOC = (S//"krug1"/,$89095////235,5,190/375,5,95//"pomoc.html","9007")
DEF DBROJTOC = (I/1,9/1/,,"D1"////500,5,20/505,5,35)

DEF BRAbriht = (S//"almaz1"/,$89813////235,45,190/375,45,95//"pomoc.html","9007")
DEF DBROJAbriht = (I/1,9/1/,,"D1"////500,45,20/505,45,35)

DEF VAR3 = (R3/-150,500/0.0/,$89831,"SX",$89068////235,,190/430,,110//"POMOC.HTML","9305")

VS8=("OK",,SE1)
VS7=($89842,,SE1)

OUTPUT(NCCODE3)
  "_Korekcija_Kamena(""" BRTOC """," DBROJTOC ",""" BrAbriht"""," DbrojAbriht "," VAR3 ")"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

//END

//M(ProfilSfera/$89151)
;FB290
;april 2020

DEF BRTOC = (S//"krug1"/,$89095////235,25,190/375,25,95//"pomoc.html","9007"),
DEF DBROJTOC = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF BRAbriht = (S//"almaz"/,$89813////235,,190/375,,95//"pomoc.html","9007"),
DEF DBROJAbriht = (I/1,9/1/,,"D"////500,45,20/500,45,40)

DEF NACABRIHT = (I/* 0=$89135, 500=$89134/0/,$89165,,/WR2///235/375,,165//"POMOC.HTML","9302")

DEF BROJABRIHT = (IDD/1,1000/1/$89048,$89232,"n",$89067////235,,190/430,,110//"POMOC.HTML","9303")
DEF BRZABRIHT = (R1/1,3000/300/$89233,$89234,"Va",$89070////235,,190/430,,110//"POMOC.HTML","9304")
DEF VAR3 = (R3/0.0,0.25/0.0/$89230,$89231,"Sa",$89068////235,,190/430,,110//"POMOC.HTML","9305")

DEF BRZINA_A = (R3/5,50/10/,$89063,"V",$89074/LI3,///235,,190/430,,110//"pomoc.html","9044")
DEF OBLIK = (IDD/* 0=$89401, 1=$89402/0/,$89400,,/wr2///235,,180/400,,140//"pomoc.html","9005")
DEF SMER = (I//0//WR4)
DEF Radijus = (R3/-50,50/0/,$89306,"R",$89068/LI3,///235,,190/430,,110//"pomoc.html","9044")
DEF DuzinaX = (R3/0,50/0/,$89130,"X",$89068/LI3,///235,,190/430,,110//"pomoc.html","9044")
DEF DuzinaZ = (R3/0,50/0/,,"Z",$89068/LI3,///235,,190/430,,110//"pomoc.html","9044")
Def TIP2=(IDD/* 0=$89902,1=$89903/0/,$89901,""/WR2///235,,180/430,,110)
DEF KOMADA = (IDD/0,100/0/$89055,$89199,"",$89073////235,,180/430,,110//"POMOC.HTML","9307")
DEF PREOSTALO = (IDD/0,100/0/,$89167,"",$89073////235,,180/430,,110//"POMOC.HTML","9308")
DEF HLAD_A = (IDD/10,15/12/,$89568,,$89067/WR2,ac2///235,,195/430,,110//"pomoc.html","9011")

DEF KOMENT = (S///,$89569,////235,,90/320,,220//"POMOC.HTML","9017")


DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 

VS8=("OK",,SE1)
VS7=($89842,,SE1)


OUTPUT(NCCODE4)
  "_RADIJUS_DRESSING(""" BRTOC """," DBROJTOC ",""" BrAbriht """," DbrojAbriht "," NacAbriht "," BrojAbriht "," BrzAbriht "," VAR3 "," Brzina_A "," Smer "," Tip2 "," Radijus "," DuzinaX "," DuzinaZ "," Komada "," Preostalo "," HLAD_A "," OBLIK ",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE4")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

CHANGE(NACABRIHT)
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_CHANGE

CHANGE(SMER)
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_CHANGE

CHANGE(OBLIK)
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_CHANGE

LOAD
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_LOAD

//END

//M(KorisnickiProfil/$89151)
;FB357
;avgust 2023

DEF BRTOC = (S//"krug1"/$89642,$89190////235,5,190/375,5,95//"pomoc.html","9007")
DEF DBROJTOC = (I/1,9/1/$89643,,"D1"////500,5,20/505,5,35//"pomoc.html","9008")

DEF BRAbriht = (S//"almaz1"/$89684,$89683////235,45,190/375,45,95//"pomoc.html","9301")
DEF DBROJAbriht = (I/1,9/1/$89685,,"D1"/wr1///500,45,20/505,45,35//"pomoc.html","9302")
DEF DBROJAbriht2 = (I/1,9/2/$89685,,"D2"/wr1///500,65,20/505,65,35//"pomoc.html","9302")

DEF NACABRIHT = (S//""/$89689,$89165,,/WR2///235/375,,165//"pomoc.html","9314")
DEF NACABRIHT2 = (I/* 0=$89821, 4=$89822/0/,$89165,,/WR2///235/375,,165//"POMOC.HTML","9302")
DEF SMER = (I/* 0=$89191,1=$89192/0/,$89193,,/wr2///235,,190/430,,110)
DEF BROJABRIHT = (IDD/1,1000/1/$89690,$89232,"N",$89067////235,,190/430,,110//"pomoc.html","9304")
DEF BRZABRIHT = (R1/1,3000/300/$89233,$89234,"VA",$89070////235,,190/430,,110//"pomoc.html","9305")
DEF VAR3 = (R3/0.0,0.25/0.0/$89230,$89231,"Sx",$89068////235,,190/430,,110//"pomoc.html","9306")
DEF KORPOZ = (R3/0.0,0.25/0/$89230,,"Saz",$89068////235,,190/430,,110//"POMOC.HTML","9306")
DEF BRZINA_A = (R3/5,50/10/$89691,$89567,"Va",$89074/LI3,///235,,190/430,,110//"pomoc.html","9308")
DEF OBLIK = (IDD/* 0=$89692, 1=$89693/0/$89695,$89694,,/wr2///235,,195/430,,110//"pomoc.html","9022")
;DEF KORPOZ = (R4/,/0/$89065,$89066,,$89068/LI3,///235,,190/430,,110)
Def TIP2=(IDD/* 0=$89902,2=$89903/0/,$89901,""/WR2///235,,180/430,,110)
DEF KOMADA = (IDD/0,100/0/$89055,$89199,"",$89073////235,,180/430,,110//"pomoc.html","9310")
DEF PREOSTALO = (IDD/0,100/0/$89696,$89167,"",$89073////235,,180/430,,110//"pomoc.html","9311")
DEF HLAD_A = (IDD/10,15/12/$89697,$89568,,$89067/WR2,ac2///235,,195/430,,110//"pomoc.html","9011")
DEF PODHODX = (R1/0,50/3/,$89058,"AX",$89068////235,,190/430,,110)
DEF PODHODZ = (R1/0,50/5/,,"AZ",$89068////235,,190/430,,110)
DEF KOMENT = (S///$89660,$89569,////235,,80/310,,230//"pomoc.html","9024")
DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 

VS8=("OK",,SE1)
VS7=("Cancel",,SE1)


OUTPUT(NCCODE3)
  "_USER_DRESSING(""" BRTOC """," DBROJTOC ",""" BrAbriht"""," DbrojAbriht ","  DbrojAbriht2 ",""" NacAbriht """," BrojAbriht "," BrzAbriht "," VAR3 "," Brzina_A "," Komada "," Preostalo "," HLAD_A "," OBLIK "," SMER "+" TIP2 "+" NACABRIHT2 "," KORPOZ "," PODHODX "," PODHODZ ",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

CHANGE(NACABRIHT2)
   SLIKA.ST = "\\am" << (10+NACABRIHT2+2*OBLIK+SMER)<< ".png" 
END_CHANGE

CHANGE(SMER)
   SLIKA.ST = "\\am" << (10+NACABRIHT2+2*OBLIK+SMER)<< ".png" 
END_CHANGE

CHANGE(OBLIK)
   SLIKA.ST = "\\am" << (10+NACABRIHT2+2*OBLIK+SMER)<< ".png" 
END_CHANGE

LOAD
   SLIKA.ST = "\\am" << (10+NACABRIHT2+2*OBLIK+SMER)<< ".png" 
END_LOAD

//END
