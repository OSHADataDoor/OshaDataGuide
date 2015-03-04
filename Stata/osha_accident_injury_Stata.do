
/* Use insheet command to import csv file into Stata.
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_accident_injury CSV file must first be downloaded
   and decompressed from the website.
   The line below should contain the complete path and name of the csv file. */

insheet using "<path/filename>.csv", comma

*label variables

label variable summary_nr "Summary NR"
label variable rel_insp_nr "Related Inspection NR"
label variable age "Age"
label variable sex "Sex"
label variable nature_of_inj "Nature of Injury"
label variable part_of_body "Part of Body"
label variable src_of_injury "Source of Injury"
label variable event_type "Event Type"
label variable evn_factor "Environmental Factor"
label variable hum_factor "Human Factor"
label variable occ_code "Occupation Code"
label variable degree_of_inj "Degree of Injury"
label variable task_assigned "Task Assigned"
label variable hazsub "Hazardous Substance"
label variable const_op "Construction Operation Code"
label variable const_op_cause "Construction Cause of Injury"
label variable fat_cause "Construction Cause of Fatality"
label variable fall_distance "Distance of Fall"
label variable fall_ht "Height of Person"
label variable injury_line_nr "Injury Line Number"

*label values

*sex: M=Male. F=Female
capture label define sex "M" "Male" "F" "Female"
capture label values sex sex

*Degree of Injury: 1=Fatality 2=Hospitalized injuries 3=No Hospitalized injuries
label define degree_of_inj 1 "Fatality" 2 "Hospitalized injuries" 3 "No Hospitalized injuries" 
label values degree_of_inj degree_of_inj

*Task Assigned: 1=Task regularly assigned 2=Task not regularly assigned
label define task_assigned 1 "Task regularly assigned"	2 "Task not regularly assigned"
label values task_assigned task_assigned

/* The following line should contain the path to your output '.dta' file */

save "<path/filename>.dta", replace

/* Stata code ends here */




