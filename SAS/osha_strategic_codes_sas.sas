
/* --------------------------------------------------------------------
   IMPORT OSHA STRATEGIC CODES FILE INTO SAS DATASET

   Input file:	osha_strategic_codes.csv
   
   Output data: WORK.osha_strategic_codes
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_strategic_codes CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_strategic_codes CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location= <path/filename>;

DATA WORK.osha_strategic_codes;
    LENGTH
        activity_nr        8
        prog_type        $ 1
        prog_value       $ 25 ;
    FORMAT
        activity_nr      BEST9.
        prog_type        $CHAR1.
        prog_value       $CHAR25. ;
    INFORMAT
        activity_nr      BEST9.
        prog_type        $CHAR1.
        prog_value       $CHAR25. ;
    LABEL
        activity_nr='Activity NR'
        prog_type='Program Type'
        prog_value='Program Value';
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=37
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=37
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        activity_nr      : ?? BEST9.
        prog_type        : $CHAR1.
        prog_value       : $CHAR25. ;
RUN;


