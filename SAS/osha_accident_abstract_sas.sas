
/* --------------------------------------------------------------------
   IMPORT OSHA ACCIDENT ABSTRACT FILE INTO SAS DATASET

   Input file:	osha_accident_abstract.csv
   
   Output data: WORK.osha_accident_abstract
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_accident_abstract CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_accident_abstract CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location=<path/filename> ;

DATA WORK.osha_accident_abstract;
    LENGTH
        summary_nr         8
        line_nr            4
        abstract_text    $ 80 ;
    FORMAT
        summary_nr       BEST9.
        line_nr          BEST4.
        abstract_text    $CHAR80. ;
    INFORMAT
        summary_nr       BEST9.
        line_nr          BEST4.
        abstract_text    $CHAR80. ;
    LABEL
        summary_nr='Summary NR'
        line_nr='Line NR'
        abstract_text='Abstract text' ;
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=98
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=98
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        summary_nr       : ?? BEST9.
        line_nr          : ?? BEST4.
        abstract_text    : $CHAR80. ;
RUN;


