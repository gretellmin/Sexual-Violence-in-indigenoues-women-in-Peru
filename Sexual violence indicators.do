clear all
cd "C:\Users\surface user\Desktop\CHIRAPAQ_2020\ENDES"

use baseendes, clear
joinby caseid id1 using "C:\re516171.dta", unmatched(both)

gen adoles=1 if (v212<19 & hv024==15)
gen adolesvill=1 if (v212<19 & hv024==15 & sprovin==01 & sdistri==42)
gen adolestri=2 if (v212<19 & hv024==15 & sprovin==01 & sdistri==43)
gen adolessjm=3 if (v212<19 & hv024==15 & sprovin==01 & sdistri==33)

replace adolesvill=0 if adolesvill!=1
replace adolestri=0 if adolestri!=2
replace adolessjm=0 if adolessjm!=3
gen total=adolesvill+adolestri+adolessjm
 
tab v525 adoles 
tab v525 total 

gen mujelim=1 if (hv024==15)
tab v525 mujelim

/**var ind
gen ind=1 if (s119d<5)
replace ind=0 if ind!=1

gen indsel=1 if (hv024==5 & ind==1)
replace indsel=2 if (hv024==12  & ind==1)
replace indsel=3 if (hv024==19  & ind==1)
replace indsel=4 if (hv024==21 & ind==1)
replace indsel=5 if (hv024==25  & ind==1)
replace indsel=0 if indsel==.

gen sel=1 if (hv024==5)
replace sel=2 if (hv024==12)
replace sel=3 if (hv024==19)
replace sel=4 if (hv024==21)
replace sel=5 if (hv024==25)

gen metant=1 if (v312==0)
replace metant=2 if (v312==8| v312==13)
replace metant=3 if (v312==1| v312==2| v312==3| v312==5| v312==6| v312==7| v312==8| v312==11| v312==14| v312==15)
replace metant=4 if (v312==9)
replace metant=5 if (v312==16)
replace metant=6 if (v312==10)

gen metanti=1 if (v312==0 & ind==1)
replace metanti=2 if (metant==2 & ind==1)
replace metanti=3 if (metant==3 & ind==1)
replace metanti=4 if (v312==9  & ind==1)
replace metanti=5 if (v312==16  & ind==1)
replace metanti=6 if (v312==10  & ind==1)




***
gen planfamceni=1 if (v395==1 & ind==1)


gen splanfamceni=1 if (v395==0 & ind==1)


gen splanfamcen=1 if (v395==0 & ind==0)


gen planfamcen=1 if (v395==1 & ind==0)





gen planfampari=1 if (s618a==1 & ind==1)
replace planfampari=0 if planfampari!=1

*conoce las ETS
/*gen ets=1 if (s802==1| s815aa==1| s815ab==1| s815ac==1 |s815ad==1| s815ae==1| s815ax==1)
replace ets=0 if ets!=1

gen etsii=1 if (ets<3 & ind==1)
replace etsii=0 if etsii!=1

gen noetsii=1 if (ets==0 & ind==1)
replace noetsii=0 if noetsii!=1*/

*hijos
gen madre=1 if (v224>0)
replace madre=0 if madre!=1

gen madrei=1 if (madre==1 & ind==1)
replace madrei=0 if madrei!=1

gen madreipar=1 if (madrei==1 & s618a==0)
replace madreipar=0 if madreipar!=1

**region hv024 ciclo ov v217 total de hijo  v224 embarazo deseado v225

tab  v302 ind
tab  v302 indsel

**tablas peru
tab hv024 metant
tab hv024 metanti
tab hv024 v395
tab hv024 planfamceni
tab	hv024 s618a
tab	hv024 planfampari

tab hv024 etsi
tab hv024 etsii

*ha usado metodo anticonceptivo
tab v217 indsel v221

*usa
tab v312 indsel

*patron de uso
tab v361 indsel

*intencion de uso
tab v362 indsel 
*xq no usa
tab v375a indsel

*planificacion fam dentro centro medico
tab v395 indsel

*primera fuente del metodo actual
tab v3a07 indsel
*NRO DE HIJOS
tab v224 indsel

*planficacion fam con pareja
tab	s618a indsel
tab s621a indsel


***enfermedades

tab ets sel 
tab ets indsel 
