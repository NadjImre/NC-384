
//M(poravnavanje2/$89088)
;FB290
;april 2020

DEF BRTOC = (S//"krug1"/,$89095////235,5,190/375,5,95//"pomoc.html","9007")
DEF DBROJTOC = (I/1,9/1/,,"D1"////500,5,20/505,5,35)
DEF DBROJTOC2 = (I/1,9/2/,,"D2"////500,25,20/505,25,35)

DEF BRAbriht = (S///,$89813////235,45,190/375,45,95//"pomoc.html","9007")
DEF DBROJAbriht = (I/1,9/1/,,"D1"////500,45,20/505,45,35)
DEF DBROJAbriht2 = (I/1,9/2/,,"D2"////500,65,20/505,65,35)

DEF NACABRIHT = (I/* 0=$89135, 300=$89814, 310=$89815, 320=$89816/0/,$89165,,/WR2///235/375,,165//"POMOC.HTML","9302")

DEF BROJABRIHT = (IDD/1,1000/1/$89048,$89232,"N",$89067////235,,190/430,,110//"POMOC.HTML","9303")
DEF BRZABRIHT = (R1/1,3000/300/$89233,$89234,"VA",$89070////235,,190/430,,110//"POMOC.HTML","9304")
DEF VAR3 = (R3/0.0,0.25/0.0/$89230,$89231,"Sa",$89068////235,,190/430,,110//"POMOC.HTML","9305")
DEF VAR4 = (R3/0.0,0.25/0/$89230,,"Saz",$89068////235,,190/430,,110//"POMOC.HTML","9306")
DEF BRZINA_A = (R3/5,50/10/,$89063,"Va",$89074/LI3,///235,,190/430,,110//"pomoc.html","9044")
DEF Ugao = (R2/0,45/0/,$89453,"G",$89072/WR2///235,,190/430,,110//"POMOC.HTML","9307")
DEF OBLIK = (IDD/* 0=$89401, 1=$89402/0/,$89400,,/wr2///235,,195/430,,110//"pomoc.html","9005")
Def TIP2=(IDD/* 0=$89902,1=$89903/0/,$89901,""/WR2///235,,180/430,,110)
DEF KOMADA = (IDD/0,100/0/$89055,$89199,"",$89073////235,,180/430,,110//"POMOC.HTML","9307")
DEF PREOSTALO = (IDD/0,100/0/,$89167,"",$89073////235,,180/430,,110//"POMOC.HTML","9308")
DEF HLAD_A = (IDD/10,15/12/,$89568,,$89067/WR2,ac2///235,,195/430,,110//"pomoc.html","9011")

DEF KOMENT = (S///,$89569,////235,,90/320,,220//"POMOC.HTML","9017")
DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 
DEF SMER = (I////Wr4)

VS8=("OK",,SE1)
VS7=($89842,,SE1)


OUTPUT(NCCODE3)
  "_PROFIL_DRESSING(""" BRTOC """," DBROJTOC "," DBROJTOC2 ",""" BrAbriht"""," DbrojAbriht ","  DbrojAbriht2 "," NacAbriht "," BrojAbriht "," BrzAbriht "," VAR3 "," VAR4 "," Brzina_A "," Tip2 "," Komada "," Preostalo "," HLAD_A "," OBLIK ",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS


CHANGE(NACABRIHT)
   IF( (NACABRIHT==310) OR (NACABRIHT==320) )
     OBLIK=0
     OBLIK.WR=1
   ELSE
     SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
     OBLIK.WR=2
   ENDIF
END_CHANGE

CHANGE(SMER)
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_CHANGE

CHANGE(OBLIK)
     SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_CHANGE

CHANGE(UGAO)
   If ( ABS(Ugao) < 0.001 ) 
      var4.wr = 2
      SMER = 0
   Else
      var4.wr = 1
      var4.val = var3.val*tan(srad(ugao))
      SMER=1
   Endif
END_CHANGE

CHANGE(VAR3)
   If ( Abs(ugao) >= 0.001)
      var4.val = var3.val*tan(srad(ugao))
   endif
END_CHANGE

LOAD
   If ( ABS(Ugao) < 0.001 ) 
      var4.wr = 2
      SMER = 0
   Else
      var4.wr = 1
      var4.val = var3.val*tan(srad(ugao))
      SMER=1
   Endif
   IF( (NACABRIHT==310) OR (NACABRIHT==320) )
     OBLIK=0
     OBLIK.WR=1
   ELSE 
     OBLIK.WR=2
   ENDIF
   SLIKA.ST = "\\am" << NACABRIHT+2*OBLIK+SMER << ".png" 
END_LOAD

//END

//M(poravnavanje1/$89086)
;FB290
;april 2020

DEF BRTOC = (S//"krug1"/,$89095////235,25,190/375,25,95//"pomoc.html","9007"),
DEF DBROJTOC = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF BRAbriht = (S//"almaz"/,$89813////235,,190/375,,95//"pomoc.html","9007"),
DEF DBROJAbriht = (I/1,9/1/,,"D"////500,45,20/500,45,40)

DEF NACABRIHT = (I/* 0=$89135, 100=$89821, 110=$89822, 120=$89823/0/,$89165,,/WR2///235/375,,165//"POMOC.HTML","9302")

DEF BROJABRIHT = (IDD/1,1000/1/$89048,$89232,"N",$89067////235,,190/430,,110//"POMOC.HTML","9303")
DEF BRZABRIHT = (R1/1,3000/300/$89233,$89234,"Va",$89070////235,,190/430,,110//"POMOC.HTML","9304")
DEF VAR3 = (R3/0.0,0.25/0.0/$89230,$89231,"Sa",$89068////235,,190/430,,110//"POMOC.HTML","9305")

DEF BRZINA_A = (R3/5,50/10/,$89063,"V",$89074/LI3,///235,,190/430,,110//"pomoc.html","9044")
DEF SMER = (I/* 0=$89191,1=$89192/0/,"Zero point",,/WR2///235,,180/430,,110//"POMOC.HTML","9307")
DEF OBLIK = (IDD/* 0=$89401, 1=$89402/0/,$89400,,/wr2///235,,180/400,,140//"pomoc.html","9005")

Def TIP2=(IDD/* 0=$89902,1=$89903/0/,$89901,""/WR2///235,,180/430,,110)
DEF KOMADA = (IDD/0,100/0/$89055,$89199,"",$89073////235,,180/430,,110//"POMOC.HTML","9307")
DEF PREOSTALO = (IDD/0,100/0/,$89167,"",$89073////235,,180/430,,110//"POMOC.HTML","9308")
DEF HLAD_A = (IDD/10,15/12/,$89568,,$89067/WR2,ac2///235,,195/430,,110//"pomoc.html","9011")

DEF KOMENT = (S///,$89569,////235,,90/320,,220//"POMOC.HTML","9017")


DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 

VS8=("OK",,SE1)
VS7=($89842,,SE1)


OUTPUT(NCCODE3)
  "_PLANE_DRESSING(""" BRTOC """," DBROJTOC ",""" BrAbriht """," DbrojAbriht "," NacAbriht "," BrojAbriht "," BrzAbriht "," VAR3 "," Brzina_A "," Smer "," Tip2 "," Komada "," Preostalo "," HLAD_A "," OBLIK ",""" KOMENT  """)"
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

;izmena 16.jan.2025 8:15
DEF NACABRIHT4 = (I/* 0=$89135, 1=$89134/0/,$89850,,//////"POMOC.HTML","9302")

DEF BROJABRIHT1 = (S/1,1000/1/$89048,$89847,"Ng"////)
DEF KORAK1 = (R3/0.0,0.25/0.0/$89230,$89845,"Kg",$89068////)
DEF ODSKOK1 = (R3/0.0,0.25/0.0/$89230,$89846,"Xg",$89068////)

VS8=("OK",,SE1)
VS7=($89842,,SE1)

;izmena 16.jan.2025 8:15
OUTPUT(NCCODE3)
  "_DRESSING_SETUP(""" BROJABRIHT1 ""","NACABRIHT1"," KORAK1 "," ODSKOK1","NACABRIHT2","NACABRIHT3","NACABRIHT4")"
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


