clear all
cd "C:\Users\surface user\Desktop\CHIRAPAQ_2020"

use CPV2017_POB, clear




*abro la otra base y me quedo con las variables que quiero


*keep id_pob_imp_f id_hog_imp_f id_viv_imp_f ubigeo2019 ccdd ccpp ccdi area factor_pond c5_p11 c5_p25_i_mc c5_p25_o_a_mc c5_p25_o_b_mc c5_p25_o_mc c5_p25_i_old c5_p4_1 c5_p27 c5_p12 c5_p13_niv c5_p14 c5_p16

destring ccdd, replace

*madres

recode c5_p27 (99=.)
gen madres=1 if (c5_p27>=1 & c5_p4_1>9 & c5_p27!=.)



***NIÑAS

gen nina=1 if (c5_p4_1<19 & c5_p4_1>9 & c5_p4_1!=.)




gen embfor=1 if (c5_p27>0 & nina==1 & nina!=. & c5_p27!=.)

tab embfor [iw=factor_pond]

tab ccdd embfor [iw=factor_pond]

**
destring ccpp ccdi, replace
gen selvill=1 if (ccdd==15 & ccpp==01 & ccdi==42)
replace selvill=0 if selvill!=1
gen seltri=2 if (ccdd==15 & ccpp==01 & ccdi==43)
replace seltri=0 if seltri!=2
gen selsjm=3 if (ccdd==15 & ccpp==01 & ccdi==33)
replace selsjm=0 if selsjm!=3
gen sellim=4 if (ccdd==15 & ccpp==01)
replace sellim=0 if sellim!=4
gen total=selvill+seltri+selsjm

***otros ind
*trabajo c5_p16
*institucion a la que asiste  c5_p14

gen selville=1 if (ccdd==15 & ccpp==01 & ccdi==42 & embfor==1)
replace selville=0 if selville!=1
gen seltrie=2 if (ccdd==15 & ccpp==01 & ccdi==43 & embfor==1)
replace seltrie=0 if seltrie!=2
gen selsjme=3 if (ccdd==15 & ccpp==01 & ccdi==33 & embfor==1)
replace selsjme=0 if selsjme!=3
gen sellime=4 if (ccdd==15 & ccpp==01  & embfor==1)
replace sellime=0 if sellime!=4

gen totale=selville+seltrie+selsjme
tab c5_p13_niv totale
tab c5_p13_niv sellime

tab c5_p16 totale
tab c5_p16 sellime

gen selvilln=1 if (ccdd==15 & ccpp==01 & ccdi==42 & nina==1)
replace selvilln=0 if selvilln!=1
gen seltrin=2 if (ccdd==15 & ccpp==01 & ccdi==43 & nina==1)
replace seltrin=0 if seltrin!=2
gen selsjmn=3 if (ccdd==15 & ccpp==01 & ccdi==33 & nina==1)
replace selsjmn=0 if selsjmn!=3
gen sellimn=4 if (ccdd==15 & ccpp==01 & nina==1)
replace sellimn=0 if sellimn!=4
gen totaln=selvilln+seltrin+selsjmn
tab totaln
tab sellimn
**Ninas indigenas madres
gen ind=1 if (c5_p11!=. & c5_p11==1| c5_p11==2|c5_p11==3| c5_p11==4| c5_p11==5| c5_p11==6| c5_p11==7| c5_p11==8| c5_p11==9| c5_p11==15| c5_p11==16| c5_p11==17| c5_p11==18| c5_p11==19| c5_p11==20| c5_p11==21| c5_p11==22| c5_p11==23| c5_p11==24| c5_p11==25| c5_p11==26| c5_p11==27| c5_p11==28| c5_p11==29| c5_p11==30| c5_p11==31| c5_p11==32| c5_p11==33| c5_p11==34| c5_p11==35| c5_p11==36| c5_p11==37| c5_p11==38| c5_p11==39| c5_p11==40| c5_p11==41| c5_p11==42| c5_p11==43| c5_p11==44)


gen embforind=1 if (ind==1 & embfor==1)
replace embforind=0 if embforind!=1
tab c5_p11 embforind

tab embforind [iw=factor_pond]

tab ccdd embforind [iw=factor_pond]

*otra form
gen indigena=1 if (c5_p25_i_mc!=. & c5_p25_i_mc==1 |c5_p25_i_mc==2 |c5_p25_i_mc==3 |c5_p25_i_mc==4)
replace indigena=0 if ind==1
replace indigena=0 if indigena!=1

gen aaaa=1 if (indigena==1 & embfor==1 & embforind==0)

/*gen embforind2=1 if (indigena==1 & embfor==1)
replace embforind2=0 if embforind2!=1 

tab embforind2 [iw=factor_pond]
tab ccdd embforind2 [iw=factor_pond]*/

*total

gen totalind=ind+indigena
replace totalind=0 if totalind!=1

gen matinfind=1 if (totalind==1 & embfor==1)
replace matinfind=0 if matinfind!=1

tab ccdd matinfind


gen matind=1 if (ind==1 & madres==1)
replace matind=0 if matind!=1 

gen mujerind=1 if (ind==1 & c5_p2==2)
replace mujerind=0 if mujerind!=1 
tab ccdd mujerind

save base_pob_censo, replace

/*

**Escogiendo 5 dregiones

gen elegido=1 if (ccdd==5 |ccdd==12 |ccdd==19 |ccdd==21 |ccdd==25)
replace elegido=0 if elegido!=1

drop if elegido!=1
*creando variable para indigena
sort ubigeo2019

save base_pob_censo, replace */




***Ayacucho
clear all
cd "C:\Users\surface user\Desktop\CHIRAPAQ_2020"
use base_pob_censo, clear
/*
gen ayacucho=1 if (ccdd==5)
replace ayacucho=0 if ayacucho!=1
drop if ayacucho!=1

/*gen indigena=1 if (c5_p25_i_mc==1 |c5_p25_i_mc==2 |c5_p25_i_mc==3 |c5_p25_i_mc==4| c5_p25_i_mc==5 |c5_p25_i_mc== 8| c5_p25_i_mc==10| c5_p25_i_mc==11| c5_p25_i_mc==12| c5_p25_i_mc==13| c5_p25_i_mc==14| c5_p25_i_mc==15| c5_p25_i_mc==16)
replace indigena=0 if indigena!=1


gen ind2=1 if (c5_p11==1| c5_p11==2|c5_p11==3| c5_p11==4| c5_p11==5| c5_p11==6| c5_p11==7| c5_p11==8| c5_p11==9| c5_p11==15| c5_p11==16| c5_p11==17| c5_p11==18| c5_p11==19| c5_p11==20| c5_p11==21| c5_p11==22| c5_p11==23| c5_p11==24| c5_p11==25| c5_p11==26| c5_p11==27| c5_p11==28| c5_p11==29| c5_p11==30| c5_p11==31| c5_p11==32| c5_p11==33| c5_p11==34| c5_p11==35| c5_p11==36| c5_p11==37| c5_p11==38| c5_p11==39| c5_p11==40| c5_p11==41| c5_p11==42| c5_p11==43| c5_p11==44)
replace ind2=0 if indigena==1
replace ind2=0 if ind2!=1 

gen totalind=indigena+ind2
tab ubigeo2019 totalind [iw=factor_pond]
tab ccpp totalind [iw=factor_pond]*/


tab c5_p11 matinfind
*por autoidentificacion
tab c5_p25_i_mc matinfind 

*nivel de estudios
 tab c5_p13_niv matinfind
 
 *trabajo
 tab c5_p16 matinfind
 *provincias
 tab ccpp madres
 tab ccpp embfor
 tab ccpp matinfind
**svyset id_pob_imp_f[pw = factor_pond]
***svyset tab ubigeo2019 c5_p11, raw
***JUNIN
clear all
cd "C:\Users\surface user\Desktop\CHIRAPAQ_2020"
use base_pob_censo, clear

gen junin=1 if (ccdd==12)
replace junin=0 if junin!=1
drop if junin!=1


tab c5_p11 matinfind
*por autoidentificacion
tab c5_p25_i_mc matinfind 

*nivel de estudios
 tab c5_p13_niv matinfind
 
 *trabajo
 tab c5_p16 matinfind
 *provincias
 tab ccpp madres
 tab ccpp embfor
 tab ccpp matinfind

/* tab id_pob_imp_f if (c5_p11==10 & c5_p25_i_mc==3)

tab c5_p25_i_mc [iw=factor_pond]

tab c5_p11 nina [iw=factor_pond]

gen indigena=1 if ( c5_p25_i_mc==1 |c5_p25_i_mc==2 |c5_p25_i_mc==3 |c5_p25_i_mc==4| c5_p25_i_mc==5 |c5_p25_i_mc== 8| c5_p25_i_mc==10| c5_p25_i_mc==11| c5_p25_i_mc==12| c5_p25_i_mc==13| c5_p25_i_mc==14| c5_p25_i_mc==15| c5_p25_i_mc==16)
replace indigena=0 if indigena!=1
tab ubigeo2019 c5_p25_i_mc

gen ind2=1 if (c5_p11==1| c5_p11==2|c5_p11==3| c5_p11==4| c5_p11==5| c5_p11==6| c5_p11==7| c5_p11==8| c5_p11==9| c5_p11==15| c5_p11==16| c5_p11==17| c5_p11==18| c5_p11==19| c5_p11==20| c5_p11==21| c5_p11==22| c5_p11==23| c5_p11==24| c5_p11==25| c5_p11==26| c5_p11==27| c5_p11==28| c5_p11==29| c5_p11==30| c5_p11==31| c5_p11==32| c5_p11==33| c5_p11==34| c5_p11==35| c5_p11==36| c5_p11==37| c5_p11==38| c5_p11==39| c5_p11==40| c5_p11==41| c5_p11==42| c5_p11==43| c5_p11==44)
replace ind2=0 if indigena==1
replace ind2=0 if ind2!=1 

gen totalind=indigena+ind2

tab ubigeo2019 totalind [iw=factor_pond]
tab ccpp totalind [iw=factor_pond]*/

***PASCO
clear all
cd "C:\Users\surface user\Desktop\CHIRAPAQ_2020"
use base_pob_censo, clear

gen pasco=1 if (ccdd==19)
replace pasco=0 if pasco!=1
drop if pasco!=1

*nivel de estudios
 tab c5_p13_niv matinfind
 
 *trabajo
 tab c5_p16 matinfind
 *provincias
 tab ccpp madres
 tab ccpp embfor
 tab ccpp matinfind
 
 tab c5_p11 matinfind
*por autoidentificacion
tab c5_p25_i_mc matinfind 
drop if matinfind!=1
tab c5_p11 c5_p25_i_mc


*drop if matinfind!=1
*tab c5_p11 c5_p25_i_mc
*en nat=1 if (c5_p11==10 & c5_p25_i_mc==3)
*tab c5_p11 embfor [iw=factor_pond]
/*
tab c5_p11 nina [iw=factor_pond]
tab c5_p25_i_mc [iw=factor_pond]

gen indigena=1 if (c5_p25_i_mc==1 |c5_p25_i_mc==2 |c5_p25_i_mc==3 |c5_p25_i_mc==4| c5_p25_i_mc==5 |c5_p25_i_mc== 8| c5_p25_i_mc==10| c5_p25_i_mc==11| c5_p25_i_mc==12| c5_p25_i_mc==13| c5_p25_i_mc==14| c5_p25_i_mc==15| c5_p25_i_mc==16)
replace indigena=0 if indigena!=1
tab ubigeo2019 c5_p25_i_mc

gen ind2=1 if (c5_p11==1| c5_p11==2|c5_p11==3| c5_p11==4| c5_p11==5| c5_p11==6| c5_p11==7| c5_p11==8| c5_p11==9| c5_p11==15| c5_p11==16| c5_p11==17| c5_p11==18| c5_p11==19| c5_p11==20| c5_p11==21| c5_p11==22| c5_p11==23| c5_p11==24| c5_p11==25| c5_p11==26| c5_p11==27| c5_p11==28| c5_p11==29| c5_p11==30| c5_p11==31| c5_p11==32| c5_p11==33| c5_p11==34| c5_p11==35| c5_p11==36| c5_p11==37| c5_p11==38| c5_p11==39| c5_p11==40| c5_p11==41| c5_p11==42| c5_p11==43| c5_p11==44)
replace ind2=0 if indigena==1
replace ind2=0 if ind2!=1 

gen totalind=indigena+ind2

tab ubigeo2019 totalind [iw=factor_pond]
tab ccpp totalind [iw=factor_pond]*/

***PUNO
clear all
cd "C:\Users\surface user\Desktop\CHIRAPAQ_2020"
use base_pob_censo, clear

gen puno=1 if (ccdd==21)
replace puno=0 if puno!=1
drop if puno!=1

*nivel de estudios
 tab c5_p13_niv matinfind
 
 *trabajo
 tab c5_p16 matinfind
 *provincias
 tab ccpp madres
 tab ccpp embfor
 tab ccpp matinfind
 
 
 drop if matinfind!=1
tab c5_p11 c5_p25_i_mc
 
 tab c5_p11 matinfind
*por autoidentificacion
tab c5_p25_i_mc matinfind 




*en nat=1 if (c5_p11==10 & c5_p25_i_mc==3)

*tab c5_p11 embfor [iw=factor_pond]

/*
tab c5_p11 nina [iw=factor_pond]

tab c5_p25_i_mc [iw=factor_pond]

gen indigena=1 if (c5_p25_i_mc==1 |c5_p25_i_mc==2 |c5_p25_i_mc==3 |c5_p25_i_mc==4| c5_p25_i_mc==5 |c5_p25_i_mc== 8| c5_p25_i_mc==10| c5_p25_i_mc==11| c5_p25_i_mc==12| c5_p25_i_mc==13| c5_p25_i_mc==14| c5_p25_i_mc==15| c5_p25_i_mc==16)
replace indigena=0 if indigena!=1
tab ubigeo2019 c5_p25_i_mc

gen ind2=1 if (c5_p11==1| c5_p11==2|c5_p11==3| c5_p11==4| c5_p11==5| c5_p11==6| c5_p11==7| c5_p11==8| c5_p11==9| c5_p11==15| c5_p11==16| c5_p11==17| c5_p11==18| c5_p11==19| c5_p11==20| c5_p11==21| c5_p11==22| c5_p11==23| c5_p11==24| c5_p11==25| c5_p11==26| c5_p11==27| c5_p11==28| c5_p11==29| c5_p11==30| c5_p11==31| c5_p11==32| c5_p11==33| c5_p11==34| c5_p11==35| c5_p11==36| c5_p11==37| c5_p11==38| c5_p11==39| c5_p11==40| c5_p11==41| c5_p11==42| c5_p11==43| c5_p11==44)
replace ind2=0 if indigena==1
replace ind2=0 if ind2!=1 

gen totalind=indigena+ind2

tab ubigeo2019 totalind [iw=factor_pond]
tab ccpp totalind [iw=factor_pond]*/


***UCAYALI
clear all
cd "C:\Users\surface user\Desktop\CHIRAPAQ_2020"
use base_pob_censo, clear

gen uca=1 if (ccdd==25)
replace uca=0 if uca!=1
drop if uca!=1

*nivel de estudios
 tab c5_p13_niv matinfind
 
 *trabajo
 tab c5_p16 matinfind
 *provincias
 tab ccpp madres
 tab ccpp embfor
 tab ccpp matinfind
 
 
 drop if matinfind!=1
tab c5_p11 c5_p25_i_mc
gen nat=1 if (c5_p11==10 & c5_p25_i_mc==3)
 
*tab c5_p11 embfor [iw=factor_pond]*/

/*
tab c5_p11 nina [iw=factor_pond]

gen indigena=1 if (c5_p25_i_mc==1 |c5_p25_i_mc==2 |c5_p25_i_mc==3 |c5_p25_i_mc==4| c5_p25_i_mc==5 |c5_p25_i_mc== 8| c5_p25_i_mc==10| c5_p25_i_mc==11| c5_p25_i_mc==12| c5_p25_i_mc==13| c5_p25_i_mc==14| c5_p25_i_mc==15| c5_p25_i_mc==16)
replace indigena=0 if indigena!=1
tab ubigeo2019 c5_p25_i_mc

gen ind2=1 if (c5_p11==1| c5_p11==2|c5_p11==3| c5_p11==4| c5_p11==5| c5_p11==6| c5_p11==7| c5_p11==8| c5_p11==9| c5_p11==15| c5_p11==16| c5_p11==17| c5_p11==18| c5_p11==19| c5_p11==20| c5_p11==21| c5_p11==22| c5_p11==23| c5_p11==24| c5_p11==25| c5_p11==26| c5_p11==27| c5_p11==28| c5_p11==29| c5_p11==30| c5_p11==31| c5_p11==32| c5_p11==33| c5_p11==34| c5_p11==35| c5_p11==36| c5_p11==37| c5_p11==38| c5_p11==39| c5_p11==40| c5_p11==41| c5_p11==42| c5_p11==43| c5_p11==44)
replace ind2=0 if indigena==1
replace ind2=0 if ind2!=1 

gen totalind=indigena+ind2

tab ubigeo2019 totalind [iw=factor_pond]
tab ccpp totalind [iw=factor_pond]

tab c5_p25_i_mc [iw=factor_pond]*/


 gen muca=1 if (ccdd==25 & matinfin==1)
replace muca=0 if muca!=1


gen mpuno=2 if (ccdd==21 & matinfin==1)
replace mpuno=0 if mpuno!=2

gen mpasco=3 if (ccdd==19 & matinfin==1)
replace mpasco=0 if mpasco!=3

gen mjunin=4 if (ccdd==12 & matinfin==1)
replace mjunin=0 if mjunin!=4
(3,785,385 real changes made)

gen mayacucho=5 if (ccdd==5 & matinfin==1)
replace mayacucho=0 if mayacucho!=5

gen totalm=muca+mpuno+mpasco+mjunin+mayacucho
drop if totalm==0

*nivel de estudios
tab c5_p13_niv totalm
