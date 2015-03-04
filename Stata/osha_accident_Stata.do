
/* Use insheet command to import csv file into Stata.
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_accident CSV file must first be downloaded
   and decompressed from the website.
   The line below should contain the complete path and name of the csv file. */
    
insheet using "<path/filename>.csv", comma

*label variables

label variable summary_nr "Summary NR"
label variable report_id "Report ID"
label variable event_date "Event Date"
label variable event_time "Event Time"
label variable event_desc "Event Description"
label variable event_keyword "Event Keyword"
label variable const_end_use "Construction End Use"
label variable build_stories "Stories in Building"
label variable nonbuild_ht "Non Building Height"
label variable project_cost "Project Cost"
label variable project_type "Project Type"
label variable sic_list "SIC List"
label variable fatality "Fatality"
label variable state_flag "State Flag"
label variable abstract_text "Abstract text"

*label values

/* Variables do not need value labels in this table */

/* The following line should contain the path to your output '.dta' file */

save "<path/filename>.dta", replace

/* Stata code ends here */



