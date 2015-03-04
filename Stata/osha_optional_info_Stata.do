/* Use insheet command to import csv file into Stata.
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_optional_info CSV file must first be downloaded
   and decompressed from the website.
   The line below should contain the complete path and name of the csv file. */

insheet using "<path/filename>.csv", comma

*label variables

label variable activity_nr "Activity NR"
label variable opt_type "Optional Information Type"
label variable opt_id "Optional Information ID"
label variable opt_value "Optional information value"
label variable opt_info_id "Optional Information ID"

*label values

/* Variables do not need value labels in this table */

/* The following line should contain the path to your output '.dta' file */

save "<path/filename>.dta", replace

/* Stata code ends here */
