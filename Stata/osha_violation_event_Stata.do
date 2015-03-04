/* Use insheet command to import csv file into Stata.
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_violation_event CSV file must first be downloaded
   and decompressed from the website.
   The line below should contain the complete path and name of the csv file. */

insheet using "<path/filename>.csv", comma

*label variables

label variable  activity_nr "Activity NR"
label variable  citation_id "Citation ID"
label variable  hist_abate_date "History Abate Date"
label variable  hist_date "History Event Date"
label variable  hist_event "History Event"
label variable  hist_insp_nr "History Inspection NR"
label variable  hist_penalty "History Penalty"
label variable  hist_vtype "History Violation Type"
label variable  pen_fta "Penalty/FTA"

*label values

*Note: There is not generic code to provide value labels for non-integer categorical variables.  
 *The codes are provided for clarity, the user can use these to interpret the existing variables
 *or to create named variables.

* pen_fta: P=Penalty. F=FTA

* label values hist_event: Z=Issued.P=Petition to Mod Abatement.I=Informal Settlement.A=Amendment.W=Empr Withdrew.D=Govt Dismissed.L=State Settlement.
                           *Y=State Decision.F=Formal Settlement.J=ALJ Decision.R=Review Commission.1=State Lower Court.2=Appeals Court.3=Supreme Court

/* The following line should contain the path to your output '.dta' file */

save "<path/filename>.dta", replace

/* Stata code ends here */





