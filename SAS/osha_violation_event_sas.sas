
/* --------------------------------------------------------------------
   IMPORT OSHA VIOLATION EVENT FILE INTO SAS DATASET

   Input file:	osha_violation_event.csv
   
   Output data: WORK.osha_violation_event
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_violation_event CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_violation_event CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location= <path/filename>;

DATA WORK.osha_violation_event;
    LENGTH
        activity_nr        8
        citation_id      $ 7
        pen_fta          $ 1
        hist_event       $ 1
        hist_date          8
        hist_penalty       8
        hist_abate_date    8
        hist_vtype       $ 1
        hist_insp_nr       8 ;
    FORMAT
        activity_nr      BEST9.
        citation_id      $CHAR7.
        pen_fta          $CHAR1.
        hist_event       $CHAR1.
        hist_date        YYMMDD10.
        hist_penalty     DOLLAR10.2
        hist_abate_date  YYMMDD10.
        hist_vtype       $CHAR1.
        hist_insp_nr     BEST9. ;
    INFORMAT
        activity_nr      BEST9.
        citation_id      $CHAR7.
        pen_fta          $CHAR1.
        hist_event       $CHAR1.
        hist_date        YYMMDD10.
        hist_penalty     DOLLAR10.2
        hist_abate_date  YYMMDD10.
        hist_vtype       $CHAR1.
        hist_insp_nr     BEST9. ;
    LABEL
        activity_nr='Activity NR'
        citation_id='Citation ID'
        pen_fta='Penalty/FTA'
        hist_event='History Event'
        hist_date='History Event Date'
        hist_penalty='History Penalty'
        hist_abate_date='History Abate Date'
        hist_vtype='History Violation Type'
        hist_insp_nr='History Inspection NR';
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=56
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=56
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        activity_nr      : ?? BEST9.
        citation_id      : $CHAR7.
        pen_fta          : $CHAR1.
        hist_event       : $CHAR1.
        hist_date        : ?? YYMMDD10.
        hist_penalty     : ?? COMMA10.2
        hist_abate_date  : ?? YYMMDD10.
        hist_vtype       : $CHAR1.
        hist_insp_nr     : ?? BEST9. ;
RUN;


