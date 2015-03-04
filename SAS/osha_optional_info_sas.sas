/* --------------------------------------------------------------------
   IMPORT OSHA OPTIONAL INFO FILE INTO SAS DATASET

   Input file:	osha_optional_info.csv
   
   Output data: WORK.osha_optional_info
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_optional_info CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_optional_info CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location= <path/filename>;

DATA WORK.osha_optional_info;
    LENGTH
        activity_nr        8
        opt_type         $ 1
        opt_id             2
        opt_value        $ 50
        opt_info_id      $ 28 ;
    FORMAT
        activity_nr      BEST9.
        opt_type         $CHAR1.
        opt_id           BEST2.
        opt_value        $CHAR50.
        opt_info_id      $CHAR28. ;
    INFORMAT
        activity_nr      BEST9.
        opt_type         $CHAR1.
        opt_id           BEST2.
        opt_value        $CHAR50.
        opt_info_id      $CHAR28. ;
    LABEL
        activity_nr='Activity NR'
        opt_type='Optional Information Type'
        opt_id='Optional Information ID'
        opt_value='Optional information value'
        opt_info_id='Optional Information ID';
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=67
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=67
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        activity_nr      : ?? BEST9.
        opt_type         : $CHAR1.
        opt_id           : ?? BEST2.
        opt_value        : $CHAR50.
        opt_info_id      : $CHAR28. ;
RUN;


