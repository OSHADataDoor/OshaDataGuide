
/* --------------------------------------------------------------------
   IMPORT OSHA INSPECTION FILE INTO SAS DATASET

   Input file:	osha_inspection.csv
   
   Output data: WORK.osha_inspection
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_inspection CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_inspection CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library. 
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location= <path/filename>;

DATA WORK.osha_inspection;
    LENGTH
        activity_nr        8
        reporting_id       8
        state_flag       $ 1
        estab_name       $ 100
        site_address     $ 142
        site_city        $ 30
        site_state       $ 18
        site_zip         $ 8
        owner_type       $ 5
        owner_code         8
        adv_notice       $ 4
        safety_hlth      $ 8
        sic_code         $ 8
        naics_code       $ 6
        insp_type        $ 6
        insp_scope       $ 6
        why_no_insp      $ 1
        union_status     $ 1
        safety_manuf     $ 1
        safety_const     $ 1
        safety_marit     $ 1
        health_manuf     $ 1
        health_const     $ 1
        health_marit     $ 1
        migrant          $ 1
        mail_street      $ 110
        mail_city        $ 30
        mail_state       $ 2
        mail_zip           8
        host_est_key     $ 18
        nr_in_estab        8
        open_date          8
        case_mod_date      8
        close_conf_date    8
        close_case_date    8
        open_year          8
        case_mod_year      8
        close_conf_year    8
        close_case_year    8
        osha_accident_indicator $ 1
        violation_type_s $ 1
        violation_type_o $ 1
        violation_type_r $ 1
        violation_type_u $ 1
        violation_type_w $ 1
        inspection_to_filter $ 1 ;
    FORMAT
        activity_nr      BEST9.
        reporting_id     BEST7.
        state_flag       $CHAR1.
        estab_name       $CHAR100.
        site_address     $CHAR142.
        site_city        $CHAR30.
        site_state       $CHAR18.
        site_zip         $CHAR8.
        owner_type       $CHAR5.
        owner_code       BEST5.
        adv_notice       $CHAR4.
        safety_hlth      $CHAR8.
        sic_code         $CHAR8.
        naics_code       $CHAR6.
        insp_type        $CHAR6.
        insp_scope       $CHAR6.
        why_no_insp      $CHAR1.
        union_status     $CHAR1.
        safety_manuf     $CHAR1.
        safety_const     $CHAR1.
        safety_marit     $CHAR1.
        health_manuf     $CHAR1.
        health_const     $CHAR1.
        health_marit     $CHAR1.
        migrant          $CHAR1.
        mail_street      $CHAR110.
        mail_city        $CHAR30.
        mail_state       $CHAR2.
        mail_zip         BEST5.
        host_est_key     $CHAR18.
        nr_in_estab      BEST5.
        open_date        YYMMDD10.
        case_mod_date    YYMMDD10.
        close_conf_date  YYMMDD10.
        close_case_date  YYMMDD10.
        open_year        BEST4.
        case_mod_year    BEST4.
        close_conf_year  BEST4.
        close_case_year  BEST4.
        osha_accident_indicator $CHAR1.
        violation_type_s $CHAR1.
        violation_type_o $CHAR1.
        violation_type_r $CHAR1.
        violation_type_u $CHAR1.
        violation_type_w $CHAR1.
        inspection_to_filter $CHAR1. ;
    INFORMAT
        activity_nr      BEST9.
        reporting_id     BEST7.
        state_flag       $CHAR1.
        estab_name       $CHAR100.
        site_address     $CHAR142.
        site_city        $CHAR30.
        site_state       $CHAR18.
        site_zip         $CHAR8.
        owner_type       $CHAR5.
        owner_code       BEST5.
        adv_notice       $CHAR4.
        safety_hlth      $CHAR8.
        sic_code         $CHAR8.
        naics_code       $CHAR6.
        insp_type        $CHAR6.
        insp_scope       $CHAR6.
        why_no_insp      $CHAR1.
        union_status     $CHAR1.
        safety_manuf     $CHAR1.
        safety_const     $CHAR1.
        safety_marit     $CHAR1.
        health_manuf     $CHAR1.
        health_const     $CHAR1.
        health_marit     $CHAR1.
        migrant          $CHAR1.
        mail_street      $CHAR110.
        mail_city        $CHAR30.
        mail_state       $CHAR2.
        mail_zip         BEST5.
        host_est_key     $CHAR18.
        nr_in_estab      BEST5.
        open_date        YYMMDD10.
        case_mod_date    YYMMDD10.
        close_conf_date  YYMMDD10.
        close_case_date  YYMMDD10.
        open_year        BEST4.
        case_mod_year    BEST4.
        close_conf_year  BEST4.
        close_case_year  BEST4.
        osha_accident_indicator $CHAR1.
        violation_type_s $CHAR1.
        violation_type_o $CHAR1.
        violation_type_r $CHAR1.
        violation_type_u $CHAR1.
        violation_type_w $CHAR1.
        inspection_to_filter $CHAR1. ;
    LABEL
        activity_nr='Activity NR'
        reporting_id='Reporting ID'
        state_flag='State Flag'
        estab_name='Establishment Name'
        site_address='Site Street Address'
        site_city='Site City'
        site_state='Site State'
        site_zip='Site Zip Code'
        owner_type='Owner Type'
        owner_code='Owner Code'
        adv_notice='Advance Notice'
        safety_hlth='Safety/Health'
        sic_code='SIC'
        naics_code='NAICS Code'
        insp_type='Inspection Type'
        insp_scope='Inspection Scope'
        why_no_insp='Why No Inspection'
        union_status='Union Status'
        safety_manuf='Safety Manufacturing'
        safety_const='Safety Construction'
        safety_marit='Safety Maritime'
        health_manuf='Health Manufacturing'
        health_const='Health Construction'
        health_marit='Health Maritime'
        migrant='Migrant'
        mail_street='Mailing Street Address'
        mail_city='Mailing Address City'
        mail_state='Mailing Address State'
        mail_zip='Mailing Address Zip Code'
        host_est_key='Host Establishment Key'
        nr_in_estab='Number of Employees'
        open_date='Open Date'
        case_mod_date='Case Modification Date'
        close_conf_date='Closing Conference Date'
        close_case_date='Case Closed Date';
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=440
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=440
        DLM=','
        MISSOVER
        DSD ;

*/
    INPUT
        activity_nr      : ?? BEST9.
        reporting_id     : ?? BEST7.
        state_flag       : $CHAR1.
        estab_name       : $CHAR100.
        site_address     : $CHAR142.
        site_city        : $CHAR30.
        site_state       : $CHAR18.
        site_zip         : $CHAR8.
        owner_type       : $CHAR5.
        owner_code       : ?? BEST5.
        adv_notice       : $CHAR4.
        safety_hlth      : $CHAR8.
        sic_code         : $CHAR8.
        naics_code       : $CHAR6.
        insp_type        : $CHAR6.
        insp_scope       : $CHAR6.
        why_no_insp      : $CHAR1.
        union_status     : $CHAR1.
        safety_manuf     : $CHAR1.
        safety_const     : $CHAR1.
        safety_marit     : $CHAR1.
        health_manuf     : $CHAR1.
        health_const     : $CHAR1.
        health_marit     : $CHAR1.
        migrant          : $CHAR1.
        mail_street      : $CHAR110.
        mail_city        : $CHAR30.
        mail_state       : $CHAR2.
        mail_zip         : ?? BEST5.
        host_est_key     : $CHAR18.
        nr_in_estab      : ?? BEST5.
        open_date        : ?? YYMMDD10.
        case_mod_date    : ?? YYMMDD10.
        close_conf_date  : ?? YYMMDD10.
        close_case_date  : ?? YYMMDD10.
        open_year        : ?? BEST4.
        case_mod_year    : ?? BEST4.
        close_conf_year  : ?? BEST4.
        close_case_year  : ?? BEST4.
        osha_accident_indicator : $CHAR1.
        violation_type_s : $CHAR1.
        violation_type_o : $CHAR1.
        violation_type_r : $CHAR1.
        violation_type_u : $CHAR1.
        violation_type_w : $CHAR1.
        inspection_to_filter : $CHAR1. ;
RUN;


