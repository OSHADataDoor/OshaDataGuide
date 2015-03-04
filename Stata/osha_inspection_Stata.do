
/* Use insheet command to import csv file into Stata.
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_inspection CSV file must first be downloaded
   and decompressed from the website.
   The line below should contain the complete path and name of the csv file. */

insheet using "<path/filename>.csv", comma

*label variables

label variable activity_nr "Activity NR"
label variable reporting_id "Reporting ID"
label variable state_flag "State Flag"
label variable estab_name "Establishment Name"
label variable site_address "Site Street Address"
label variable site_city "Site City"
label variable site_state "Site State"
label variable site_zip "Site Zip Code"
label variable owner_type "Owner Type"
label variable owner_code "Owner Code"
label variable adv_notice "Advance Notice"
label variable safety_hlth "Safety/Health"
label variable sic_code "SIC"
label variable naics_code "NAICS Code"
label variable insp_type "Inspection Type"
label variable insp_scope "Inspection Scope"
label variable why_no_insp "Why No Inspection"
label variable union_status "Union Status"
label variable safety_manuf "Safety Manufacturing"
label variable safety_const "Safety Construction"
label variable safety_marit "Safety Maritime"
label variable health_manuf "Health Manufacturing"
label variable health_const "Health Construction"
label variable health_marit "Health Maritime"
label variable migrant "Migrant"
label variable mail_street "Mailing Street Address"
label variable mail_city "Mailing Address City"
label variable mail_state "Mailing Address State"
label variable mail_zip "Mailing Address Zip Code"
label variable host_est_key "Host Establishment Key"
label variable nr_in_estab "Number of Employees"
label variable open_date "Open Date"
label variable case_mod_date "Case Modification Date"
label variable close_conf_date "Closing Conference Date"
label variable close_case_date "Case Closed Date"
label variable open_year "Open Year"
label variable case_mod_year "Case Modification Year"
label variable close_conf_year "Closing Conference Year"
label variable close_case_year "Case Closed Year"
label variable osha_accident_indicator "OSHA accident indicator"
label variable violation_type_s "violation_type_s"
label variable violation_type_o "violation_type_o"
label variable violation_type_r "violation_type_r"
label variable violation_type_u "violation_type_u"
label variable violation_type_w "violation_type_w"
label variable inspection_to_filter "inspection_to_filter"

* label values

*Note: There is not generic code to provide value labels for non-integer categorical variables.  
 *The codes are provided for clarity, the user can use these to interpret the existing variables
 *or to create named variables.

* Inspection Type: A=Accident. B=Complaint. C=Referral. D=Monitoring. E=Variance. F=FollowUp. G=Unprog Rel. H=Planned. I=Prog Related. J=Unprog Other.
  *K=Prog Other. L=Other-L


* Inspection Scope: A=Complete.B=Partial.C=Records.D=NoInspection


* Owner Type: A=Private. B=LocalGovt. C=StateGovt. D=Federal


* Why No Inspection: A=No Insp/Not Found B=No Insp/Out of Business C=No Insp/Process Inactive. D=No Insp/10 or Fewer Empe. E=No Insp/Denied Entry.
  *F=No Insp/SIC not on PG. G=No Insp/Exempt/Voluntary. H=No Insp/NonExempt Consult. I=No Insp/Other


/* The following line should contain the path to your output '.dta' file */

save "<path/filename>.dta", replace

/* Stata code ends here */






