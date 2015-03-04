
/* --------------------------------------------------------------------
   IMPORT OSHA ACCIDENT FILE INTO SAS DATASET

   Input file:	osha_accident.csv
   
   Output data: WORK.osha_accident
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_accident CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_accident CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location=<path/filename>;

DATA WORK.osha_accident;
    LENGTH
        summary_nr         8
        report_id          8
        event_date         8
        event_time         8
        event_desc       $ 60
        event_keyword    $ 200
        const_end_use    $ 1
        build_stories      8
        nonbuild_ht        8
        project_cost     $ 1
        project_type     $ 1
        sic_list         $ 40
        fatality         $ 1
        state_flag       $ 1
        abstract_text    $ 1 ;
    FORMAT
        summary_nr       BEST9.
        report_id        BEST7.
        event_date       DATETIME18.
        event_time       BEST8.
        event_desc       $CHAR60.
        event_keyword    $CHAR200.
        const_end_use    $CHAR1.
        build_stories    BEST4.
        nonbuild_ht      BEST4.
        project_cost     $CHAR1.
        project_type     $CHAR1.
        sic_list         $CHAR40.
        fatality         $CHAR1.
        state_flag       $CHAR1.
        abstract_text    $CHAR1. ;
    INFORMAT
        summary_nr       BEST9.
        report_id        BEST7.
        event_date       DATETIME18.
        event_time       BEST8.
        event_desc       $CHAR60.
        event_keyword    $CHAR200.
        const_end_use    $CHAR1.
        build_stories    BEST4.
        nonbuild_ht      BEST4.
        project_cost     $CHAR1.
        project_type     $CHAR1.
        sic_list         $CHAR40.
        fatality         $CHAR1.
        state_flag       $CHAR1.
        abstract_text    $CHAR1. ;
    LABEL
        summary_nr='Summary NR'
        report_id='Report ID'
        event_date='Event Date'
        event_time='Event Time'
        event_desc='Event Description'
        event_keyword='Event Keyword'
        const_end_use='Construction End Use'
        build_stories='Stories in Building'
        nonbuild_ht='Non Building Height'
        project_cost='Project Cost'
        project_type='Project Type'
        sic_list='SIC List'
        fatality='Fatality'
        state_flag='State Flag'
        abstract_text='Abstract text';
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=283
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=283
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        summary_nr       : ?? BEST9.
        report_id        : ?? BEST7.
        event_date       : ?? ANYDTDTM19.
        event_time       : ?? BEST8.
        event_desc       : $CHAR60.
        event_keyword    : $CHAR200.
        const_end_use    : $CHAR1.
        build_stories    : ?? BEST4.
        nonbuild_ht      : ?? BEST4.
        project_cost     : $CHAR1.
        project_type     : $CHAR1.
        sic_list         : $CHAR40.
        fatality         : $CHAR1.
        state_flag       : $CHAR1.
        abstract_text    : $CHAR1. ;
RUN;


