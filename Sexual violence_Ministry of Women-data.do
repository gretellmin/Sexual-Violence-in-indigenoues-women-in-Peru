clear all
cd "C:\Users\surface user\Desktop\CHIRAPAQ_2020\MIMP"

use cemgeneral, clear

gen nina=1 if (edad_victima>9 & edad_victima<15 & sexo_victima==0)
replace nina=0 if nina!=1

**NIÑA
gen ninavio=1 if (nina==1 & tipo_violencia==3)
replace ninavio=0 if ninavio!=1

tab lengua_materna_victima ninavio

destring dpto_domicilio prov_domicilio dist_domicilio, replace

tab dpto_domicilio ninavio

****
gen ind=1 if (etnia_victima<4)
replace ind=0 if ind!=1

gen indsx=1 if (ind==1 & tipo_violencia==3)
replace indsx=0 if indsx!=1

tab dpto_domicilio indsx

gen ninavioind=1 if (ninavio==1 & ind==1)
replace ninavioind=0 if ninavioind!=1

tab dpto_domicilio ninavioind



***AYACUCHO
gen ninavio_aya=1 if (ninavioind==1 & dpto_domicilio==5)
replace ninavio_aya=0 if ninavio_aya!=1

tab lengua_materna_victima ninavio_aya

tab etnia_victima ninavio_aya
***JUNIN
gen ninavio_j=2 if (ninavioind==1 & dpto_domicilio==12)
replace ninavio_j=0 if ninavio_j!=2

tab lengua_materna_victima ninavio_j

***PASCO
gen ninavio_pa=3 if (ninavioind==1 & dpto_domicilio==19)
replace ninavio_pa=0 if ninavio_pa!=3

tab lengua_materna_victima ninavio_pa

***PUNO
gen ninavio_pu=4 if (ninavioind==1 & dpto_domicilio==21)
replace ninavio_pu=0 if ninavio_pu!=4

tab lengua_materna_victima ninavio_pu

***UCAYALI
gen ninavio_uca=5 if (ninavioind==1 & dpto_domicilio==25)
replace ninavio_uca=0 if ninavio_uca!=5

gen totalninavioind=ninavio_aya+ninavio_j+ninavio_pa+ninavio_pu+ninavio_uca

tab lengua_materna_victima ninavio_uca

*tab otra_lengua_nativa_victima ninavio_uca
tab etnia_victima ninavio_uca

***********************JOVEN*********************************
gen joven=1 if (edad_victima>14 & edad_victima<30 & sexo_victima==0)
replace joven=0 if joven!=1

gen jovenvio=1 if (joven==1 & tipo_violencia==3)
replace jovenvio=0 if jovenvio!=1

gen jovenvioind=1 if (jovenvio==1 & ind==1)
replace jovenvioind=0 if jovenvioind!=1

tab dpto_domicilio jovenvioind

tab lengua_materna_victima jovenvio

**Mujer
gen mujerind=1 if (sexo_victima==0 & ind==1)
replace mujerind=0 if mujerind!=1

gen mujerindvio=1 if (mujerind==1 & tipo_violencia==3)
replace mujerindvio=0 if mujerindvio!=1


tab dpto_domicilio mujerindvio

gen mujervio=1 if (sexo_victima==0 & tipo_violencia==3)
replace mujervio=0 if mujervio!=1

tab dpto_domicilio mujervio

***AYACUCHO
gen jovenvio_aya=1 if (jovenvioind==1 & dpto_domicilio==5)
replace jovenvio_aya=0 if jovenvio_aya!=1



***JUNIN
gen jovenvio_j=2 if (jovenvioind==1 & dpto_domicilio==12)
replace jovenvio_j=0 if jovenvio_j!=2



***PASCO
gen jovenvio_pa=3 if (jovenvioind==1 & dpto_domicilio==19)
replace jovenvio_pa=0 if jovenvio_pa!=3



***PUNO
gen jovenvio_pu=4 if (jovenvioind==1 & dpto_domicilio==21)
replace jovenvio_pu=0 if jovenvio_pu!=4



***UCAYALI
gen jovenvio_uca=5 if (jovenvioind==1 & dpto_domicilio==25)
replace jovenvio_uca=0 if jovenvio_uca!=5

gen totaljovenvioind=jovenvio_aya+jovenvio_j+jovenvio_pa+jovenvio_pu+jovenvio_uca



*tab otra_lengua_nativa_victima ninavio_uca
tab etnia_victima ninavio_uca

tab dpto_domicilio jovenvio

gen violesex=1 if (hostigamiento_sexual==1)


replace violesex=2 if (acoso_sex_esp_pub==1)
replace violesex=3 if (violacion==1)
replace violesex=4 if (actos_contra_el_pudor==1)
replace violesex=5 if ( trata_con_fines_explotacion_sexu==1)
replace violesex=6 if ( explotacion_sexual==1)
replace violesex=7 if (pornografia==1)
replace violesex=8 if (otra_vsex==1)
tab violesex totalninavioind




