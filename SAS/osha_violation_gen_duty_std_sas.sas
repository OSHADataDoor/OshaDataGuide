
/* --------------------------------------------------------------------
   IMPORT OSHA VIOLATION GEN DUTY STD FILE INTO SAS DATASET

   Input file:	osha_violation_gen_duty_std.csv
   
   Output data: WORK.osha_violation_gen_duty_std
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_violation_gen_duty_std CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_violation_gen_duty_std CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location= <path/filename>;


DATA WORK.osha_violation_gen_duty_std;
    LENGTH
        activity_nr        8
        citation_id      $ 7
        line_nr            6
        line_text        $ 80 ;
    FORMAT
        activity_nr      BEST9.
        citation_id      $CHAR7.
        line_nr          BEST6.
        line_text        $CHAR80. ;
    INFORMAT
        activity_nr      BEST9.
        citation_id      $CHAR7.
        line_nr          BEST6.
        line_text        $CHAR80. ;
    LABEL
        activity_nr='Activity NR'
        citation_id='Citation ID'
        line_nr='Line NR'
        line_text='Line Text';
/* The following is for reading Windows formatted files to a UNIX system */
    INFILE "&location"
        LRECL=18933
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading Windows formatted files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=18933
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        activity_nr      : ?? BEST9.
        citation_id      : $CHAR7.
        line_nr          : ?? BEST6.
        line_text        : $CHAR80. ;
RUN;


