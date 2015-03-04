
/* --------------------------------------------------------------------
   IMPORT OSHA RELATED ACTIVITY FILE INTO SAS DATASET

   Input file:	osha_related_activity.csv
   
   Output data: WORK.osha_related_activity
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_related_activity CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_related_activity CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location=<path/filename>;

DATA WORK.osha_related_activity;
    LENGTH
        activity_nr        8
        rel_type         $ 1
        rel_act_nr         8
        rel_safety       $ 1
        rel_health       $ 1 ;
    FORMAT
        activity_nr      BEST9.
        rel_type         $CHAR1.
        rel_act_nr       BEST9.
        rel_safety       $CHAR1.
        rel_health       $CHAR1. ;
    INFORMAT
        activity_nr      BEST9.
        rel_type         $CHAR1.
        rel_act_nr       BEST9.
        rel_safety       $CHAR1.
        rel_health       $CHAR1. ;
    LABEL
        activity_nr='Activity NR'
        rel_type='Related Activity Type'
        rel_act_nr='Related Activity NR'
        rel_safety='Related Activity Safety'
        rel_health='Related Activitiy Health';
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=25
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=25
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        activity_nr      : ?? BEST9.
        rel_type         : $CHAR1.
        rel_act_nr       : ?? BEST9.
        rel_safety       : $CHAR1.
        rel_health       : $CHAR1. ;
RUN;


