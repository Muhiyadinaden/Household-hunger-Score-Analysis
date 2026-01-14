

* Prepared by Muhiyadin Aden



clear all

set more off

capture log close



* Upload data  into stata


use "D:\MuhiydenAden\Livelihood manuals\HHS\Trainingdata.dta


** Open log file


log using "D:\MuhiydenAden\Livelihood manuals\HHS\HHSresult", text replace


recode HHhSNoFood_FR HHhSBedHung_FR HHhSNotEat_FR ( 3=2)

sum HHhSNoFood_FR HHhSBedHung_FR HHhSNotEat_FR


* create HHS total


egen HHStotal= rowtotal(HHhSNoFood_FR HHhSBedHung_FR HHhSNotEat_FR)


* Create HHS categorical variable


recode HHStotal ( 0/1 =1) (2/3 =2) (4/6=3), generate ( HHSCategory)

lab def HHSCategory 1 " No or light hunger" 2" Moderate hunger" 3" Severe hunger"

lab val HHSCategory HHSCategory

* Inspect
tab HHSCategory



** Analyse

graph bar HHStotal, over( HHSCategory)



tab HHSCategory, sum(HHStotal)





log close
