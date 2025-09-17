
//S(Start)

HS3=($89075,,se1)
;aktivira vertikalni meni za brušenje
PRESS(HS3)
  LS("brusenje","ceditor.COM",1)
END_PRESS

HS4=($89151,,se1)
;aktivira vertikalni meni za poravanavnje
PRESS(HS4)
  LS("abrihtovanje","ceditor.COM",1)
END_PRESS

HS5=($83534,,se1)
;aktivira vertikalni meni za merenje
PRESS(HS5)
  LS("merenje","ceditor.com",1)
END_PRESS

;HS6=($89463,,se1)
;aktivira vertikalni meni za navoje i profile
;PRESS(HS6)
;  LS("navoj","ceditor.com",1)
;END_PRESS

//END

//S(brusenje)
;definicije za brušenje

;rezimi obrade "feed and speeds"
VS1=($89171,,se1)
PRESS(VS1)
  LM("Rezimi2","crezimi2.com",1)
END_PRESS

;brusenje osnovne funkcije ->usecanje, oscilacije, kombinovano, čelo, konus
VS2=($89075,,se1)
PRESS(VS2)
  LM("Brusenje2","cbrusenje2.com",1)
END_PRESS

;brušenje specijalne funkcije - konus i radijus
VS3=($89076,,se1)
PRESS(VS3)
  LM("Brusenje3","cbrusenje3.com",1)
END_PRESS

;brušenje sa mernom glavom
VS4=($89783,,se1)
PRESS(VS4)
  LM("brusenjeMG","cbrusenje2.com")
END_PRESS

;zaokret i prilaz
VS5=($89616,,se1)
PRESS(VS5)
  LM("zaokretUQ","czaokret.com",1)
END_PRESS

;brusenje sa među abrihtovanjem
VS6=($89855,,se1)
PRESS(VS6)
  LM("brusenjeAbriht","cbrusenje2.com",1)
END_PRESS

VS8=("<<",,se1)

PRESS(VS8)
  EXIT
END_PRESS

//END

//S(abrihtovanje)

;jednostavno ravno poravnavanje kamena
VS1=($89086,,se1)
PRESS(VS1)
  LM("Poravnavanje1","cporavnavanje3.com",1)
END_PRESS

;porvanavanje čela, prečnika, konusa i međuradijusa
VS2=($89789,,se1)
PRESS(VS2)
  LM("Poravnavanje2","cporavnavanje3.com",1)
END_PRESS

;definicija profila kamena
VS3=($89790,,se1)
PRESS(VS3)
  LM("Profil2","cprofil3.COM",1)
END_PRESS

;radijusni profili za poravnavanje
VS4=($89306,,se1)
PRESS(VS4)
  LM("ProfilSfera","cporavnavanje2.com",1)
END_PRESS

;korekcija precnika kamena - usaglasavanje stavrog precnika sa alatom
VS5=($89791,,se1)
PRESS(VS5)
  LM("Korekcija","cporavnavanje2.com",1)
END_PRESS

;podesavanje poravnavanja za brusenje sa međuporavanavanjem
VS6=($89857,,se1)
PRESS(VS6)
  LM("poravnavanje_setup","cporavnavanje2.com",1)
END_PRESS

;radijusni profili za poravnavanje
VS7=($89306,,se1)
PRESS(VS7)
  LM("KorisnickiProfil","cporavnavanje3.com",1)
END_PRESS

;povratak
VS8=("<<",,se1)
PRESS(VS8)
  EXIT
END_PRESS

//END

//S(merenje)

;aksialno pozicioniranje
VS3=($89078,,se1)
Press(Vs3)
    LM("merenje120","csonda.com",1) 
End_Press

;kalibracija po X
VS4=($89544,,se1)
PRESS(VS4)
    LM("merenje100","csonda.com",1)
END_PRESS

;kalibracija po Z
VS5=($89543,,se1)
PRESS(VS5)
    LM("merenje110","csonda.com",1)
END_PRESS

VS8=("<<",,se1)

PRESS(VS8)
  EXIT
END_PRESS

//END


//S(navoj)

VS1=($89673,,se1)

PRESS(VS1)
  LM("ProfilNavoja2","cnavoj.com",1)
END_PRESS

VS2=("Profil%nTocila",,se1)

PRESS(VS2)
  LM("ProfilKamena","cnavoj.com",1)
END_PRESS

VS3=($89674,,se1)

PRESS(VS3)
  LM("AbrihtNavoja","cnavoj.com",1)
END_PRESS

;rezimi obrade "feed and speeds"
VS4=($89171,,se1)
PRESS(VS4)
  LM("Rezimi2","crezimi_za_navoj.com",1)
END_PRESS

VS5=($89667,,se1)

PRESS(VS5)
  LM("BrusenjeProfila","cnavoj.com",1)
END_PRESS

VS6=("Workpiece",,se1)

PRESS(VS6)
  LM("RadniPredmet","cnavoj.com",1)
END_PRESS

VS7=($89668 ,,se1)

PRESS(VS7)
  LM("Navoj","cnavoj.com",1)
END_PRESS

VS8=("<<",,se1)

PRESS(VS8)
  EXIT
END_PRESS

//END


