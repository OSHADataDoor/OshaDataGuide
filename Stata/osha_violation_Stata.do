/* Use insheet command to import csv file into Stata.
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_violation CSV file must first be downloaded
   and decompressed from the website.
   The line below should contain the complete path and name of the csv file. */

insheet using "<path/filename>.csv", comma

*label variables

label variable activity_nr "Activity NR"
label variable citation_id "Identifies the citation number. item number. and item group of the issued citation"
label variable delete_flag "Delete Flag"
label variable standard "Standard"
label variable viol_type "Violation Type"
label variable issuance_date "Issuance Date"
label variable abate_date "Abate Date"
label variable abate_complete "Abate Complete"
label variable current_penalty "Current Penalty"
label variable initial_penalty "Initial Penalty"
label variable contest_date "Contested Date"
label variable final_order_date "Final Order Date"
label variable nr_instances "Number of Instances"
label variable nr_exposed "Number Exposed"
label variable rec "Rec"
label variable gravity "Gravity"
label variable emphasis "Emphasis"
label variable hazcat "Hazard Category"
label variable fta_insp_nr "FTA Inspection NR"
label variable fta_issuance_date "FTA Issuance Date"
label variable fta_penalty "FTA Current Penalty"
label variable fta_contest_date "FTA Contested Date"
label variable fta_final_order_date "FTA Final Order Date"
label variable hazsub1 "Hazardous Substance 1"
label variable hazsub2 "Hazardous Substance 2"
label variable hazsub3 "Hazardous Substance 3"
label variable hazsub4 "Hazardous Substance 4"
label variable hazsub5 "Hazardous Substance 5"

*label values

*Note: There is not generic code to provide value labels for non-integer categorical variables.  
 *The codes are provided for clarity, the user can use these to interpret the existing variables
 *or to create named variables.

* Violation Type: S=Serious.W=Willful.R=Repeat.O=Other

* Abate Complete: Q=Quick Fix.X=Abatement Completed.I=Corrected During Inspection.E=Not Completed - Employer out of business.W=Not Changed - Worksite changed.
                 *S=Not Completed - Solicitor advised.A=Not Completed - AD discretion

* Rec: A=Accident.C=Complaint.I=Imminent Danger.R=Referral.V=Variance

/* The following line should contain the path to your output '.dta' file */

save "<path/filename>.dta", replace

/* Stata code ends here */




