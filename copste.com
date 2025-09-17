7
//M(OPSTE/$89150////)
;FB271 i FB272
;jun 2019

DEF VAR8 = (R3/1,2500//,$89057,"VS",$89070///"RABHOD")
DEF VAR9 = (R4/0,10//$89727,$89725,"AS",$89068/WR2//"razlika")
DEF VAR7 = (IDD/1,300//,$89269,"N",$89069///"MW16")
DEF VAR77 = (IDD/1,20000//,$89904,"S2",$89069///"MD28")
;DEF VAR78 = (IDD/1,1210//,,"S3",$89069///"MW22")
;DEF VAR79 = (IDD/1,15010//,,"S4",$89069///"MW24")
DEF MAGNET = (IDB/0,15//,"JACINA MAGNETA","G",""///"MB18")
;&&&&&&&&&&&&
DEF ROLNA5 = (I/* 0="Нет",1="Да"//,"Ролик"/WR2//"MW18")
DEF ROLNA = (IDD/1,3010//,$89905,"N",$89069///"MW6")

DEF PADAJUCI = (I/* 0=$89902,1=$89903//,$89901/WR2//"MW20")
DEF VAR80 = (IDD/-300,300//,,"Z poz >","mm"///"MD12")

DEF VAR81 = (I/* 0="Nulti impuls",2="Merena vrednost"//,"Merna Glava"/WR2//"MW94")
DEF VAR82 = (IDD/-1000,1000//,,"Vrednost"," mikron/10"///"MD96")

;&&&&&&&&&&&&

DEF FORMIRANJE = (I/*0=$89799,1=$89800//,$89644,,/WR4//"Q44.1")
DEF SONDA = (I/* 1=$89798,0=$89802//,$89801/WR4//"Q44.6")
DEF KAMEN = (I/* 0="90.000", 1="42.000",2="60.000",3="120.000",4="30.000"//,$89617/WR2//"MW40")


LOAD
   LA("GNIZ","CNIZOVI.COM")
   LS("menu","cmeni.com",1)
END_LOAD


//END


//M(OIL/$89150////)
;FB261
DEF RNIVO = (ID///,$89909,"Ha",$89068/AC1,WR2//"MW10"/10/310,,140)

def hidnivo2 = (IDD/0,1000//,$89907,,$89068/WR1//"MD180"/10,30/450,50,100)
DEF hidnivo = (IDD/-10,50,0,30///dt1,do0//"MD180"/20,80/10,50,450,20/9,4,,,,,,,3,7)

Def pritisak2 = (I///,$89908,,"bar"/WR1,UR5//"MD184"/10,75/450,95,100)
DEF pritisak = (I/0,12,4,10///DT1,DO0,UR5//"MD184"/0,80/10,95,450,20/9,4,,,,,,,3,7)

DEF TEMP2 = (I///,$89806,,"C"/WR1,UR5//"MD188"/10,120/450,140,100)
DEF TEMP = (I/10,60,25,45///DT1,DO0,UR5//"MD188"/0,140/10,140,450,20/6,4,,,,,,,7,3)


;DEF PNEU_PRIT = (I///,$89807,,"bar"/WR4,UR5//"MD166"/10,165/450,185,100)
;DEF PNEU_PRIT_1 = (I/0,12,4,10///DT1,DO0,UR4//"MD166"/290,80/10,185,450,20/9,4,,,,,,,7,3)

;DEF PRIT_ALAT = (I///,$89808,,"bar"/WR4,UR5//"MD170"/10,210/450,230,100)
;DEF PRIT_ALAT_1 = (I/0,12,1,6///DT1,DO0,UR4//"MD170"/290,80/10,230,450,20/9,4,,,,,,,3,7)

DEF IZLAZPUMPE = (I/*0=$89799,1=$89800//,$89910,,/WR2//"Q37.6"/10,185/310,185,140)
DEF VREME = (IDB/1,20//,$89281,,"MIN"///"MB4"/10,230/310,230,140)

DEF PREOSTALO = (I///,$89906,,"SEK"/WR1,UR5///10,310/450,330,100)
DEF PREOSTALO_1 = (I/0,20///DT1,DO0,UR5//"Mb5"/290,80/10,330,450,20/6,4)

VS1=($89812,,SE1)

change(preostalo_1)

preostalo = preostalo_1*30

end_change

press(vs1)
  izlazpumpe=1
end_press

LOAD
   LS("menu","cmeni.com",1)
END_LOAD

//END


//A(ARR1)
(0/1/2/3/4)
("OFF"/"PO X OSI"/"PO Z OSI"/"PO X+Z OSI"/"PO Z+X OSI")

//END


