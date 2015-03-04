/* Use insheet command to import csv file into Stata.
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_strategic_codes CSV file must first be downloaded
   and decompressed from the website.
   The line below should contain the complete path and name of the csv file. */

insheet using "<path/filename>.csv", comma

*label variables

label variable activity_nr "Activity NR"
label variable prog_type "Program Type"
label variable prog_value "Program Value"

*label values

*Note: There is not generic code to provide value labels for non-integer categorical variables.  
 *The codes are provided for clarity, the user can use these to interpret the existing variables
 *or to create named variables.

*Program Type: N=NEP (National Emphasis Program).L=LEP (Local Emphasis Program).S=Strategic Plan Code

/* The following line should contain the path to your output '.dta' file */

save "<path/filename>.dta", replace

/* Stata code ends here */

