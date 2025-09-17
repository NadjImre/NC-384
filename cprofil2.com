//M(PROFIL2/////10,20,210,210)
;FB290
;april 2020

DEF PROFIL = (I/* 0=$89191,1=$89192/0/,$89832,,/WR2///255,,200/435,,120)
DEF BOK1 = (R2/-10,210/0/,$89127,"H",$89068////255,,200/435,,120//"POMOC.HTML","9409")
DEF UGAO1 = (R2/-20,20/0/,$89126,"A",$89072////255,,200/435,,120//"POMOC.HTML","9410")
DEF FAZETA1 = (R1/0,10/0/,$89128,"F",$89068////255,,200/435,,120//"POMOC.HTML","9411")
DEF RADIUS1 = (R2/-150,150/0/,$89129,"R",$89068////255,,200/435,,120//"POMOC.HTML","9412")

DEF DUZKON1 = (R1/0,100/0/,$89195,"L",$89068////255,,200/435,,120//"POMOC.HTML","9413")
DEF UGAOKON1 = (R4/-45,45/0/,$89196,"B",$89072////255,,200/435,,120//"POMOC.HTML","9414")

DEF PODHODX = (R1/0,50/3/,$89058,"AX",$89068////255,,200/435,,120)
DEF PODHODZ = (R1/0,50/5/,,"AZ",$89068////255,,200/435,,120)

DEF Slika = (I///,,,/wr1///0,0,250,360/0,320,25,2) 
DEF BrojSlike=(I////wr4)

VS8=("OK",,SE1)
VS7=($89842,,SE1)
HS1=($89385,,SE1)

OUTPUT(NCCODE4)
  "_WHEEL_PROFIL_LEFT(" BOK1 "," UGAO1 "," FAZETA1 "," RADIUS1 "," DUZKON1 "," UGAOKON1 "," PODHODX "," PODHODZ ")"
END_OUTPUT

OUTPUT(NCCODE5)
  "_WHEEL_PROFIL_RIGHT(" BOK1 "," UGAO1 "," FAZETA1 "," RADIUS1 "," DUZKON1 "," UGAOKON1 "," PODHODX "," PODHODZ ")"
END_OUTPUT

PRESS(VS8)
  IF (PROFIL==0)
     GC("NCCODE4")
  ELSE
     GC("NCCODE5")
  ENDIF
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

change (Bok1)
  BrojSlike=300
  if(Profil>0)
    BrojSlike=BrojSlike+4
  endif
  if ( (DuzKon1>0) AND (UgaoKON1>0) )
     BrojSlike=BrojSlike+2
  endif
  if (Bok1>0)
     BrojSlike=BrojSlike+1
  endif
  slika.st = "\\al" << BrojSlike << ".png"
end_change

change (DuzKon1)
  BrojSlike=300
  if(Profil>0)
    BrojSlike=BrojSlike+4
  endif
  if ( (DuzKon1>0) AND (UgaoKON1>0) )
     BrojSlike=BrojSlike+2
  endif
  if (Bok1>0)
     BrojSlike=BrojSlike+1
  endif
  slika.st = "\\al" << BrojSlike << ".png"
end_change

change (UgaoKon1)
  BrojSlike=300
  if(Profil>0)
    BrojSlike=BrojSlike+4
  endif
  if ( (DuzKon1>0) AND (UgaoKON1>0) )
     BrojSlike=BrojSlike+2
  endif
  if (Bok1>0)
     BrojSlike=BrojSlike+1
  endif
  slika.st = "\\al" << BrojSlike << ".png"
end_change

change (Profil)
  BrojSlike=300
  if(Profil>0)
    BrojSlike=BrojSlike+4
  endif
  if ( (DuzKon1>0) AND (UgaoKON1>0) )
     BrojSlike=BrojSlike+2
  endif
  if (Bok1>0)
     BrojSlike=BrojSlike+1
  endif
  slika.st = "\\al" << BrojSlike << ".png"
end_change

LOAD
  BrojSlike=300
  if(Profil>0)
    BrojSlike=BrojSlike+4
  endif
  if ( (DuzKon1>0) AND (UgaoKON1>0) )
     BrojSlike=BrojSlike+2
  endif
  if (Bok1>0)
     BrojSlike=BrojSlike+1
  endif
  slika.st = "\\al" << BrojSlike << ".png"
END_LOAD

//END

