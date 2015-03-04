/* --------------------------------------------------------------------
   IMPORT OSHA VIOLATION FILE INTO SAS DATASET

   Input file:	osha_violation.csv
   
   Output data: WORK.osha_violation
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_accident CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_violation CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location=<path/filename> ;

DATA WORK.osha_violation;
    LENGTH
        activity_nr        8
        citation_id      $ 7
        delete_flag      $ 1
        standard         $ 22
        viol_type        $ 1
        issuance_date      8
        abate_date         8
        abate_complete   $ 1
        current_penalty    8
        initial_penalty    8
        contest_date       8
        final_order_date   8
        nr_instances       8
        nr_exposed         8
        rec              $ 1
        gravity            8
        emphasis         $ 1
        hazcat           $ 10
        fta_insp_nr        8
        fta_issuance_date   8
        fta_penalty        8
        fta_contest_date   8
        fta_final_order_date   8
        hazsub1          $ 4
        hazsub2          $ 4
        hazsub3          $ 4
        hazsub4          $ 4
        hazsub5          $ 4 ;
    FORMAT
        activity_nr      BEST9.
        citation_id      $CHAR7.
        delete_flag      $CHAR1.
        standard         $CHAR22.
        viol_type        $CHAR1.
        issuance_date    YYMMDD10.
        abate_date       YYMMDD10.
        abate_complete   $CHAR1.
        current_penalty  BEST10.
        initial_penalty  BEST10.
        contest_date     YYMMDD10.
        final_order_date YYMMDD10.
        nr_instances     BEST5.
        nr_exposed       BEST5.
        rec              $CHAR1.
        gravity          BEST2.
        emphasis         $CHAR1.
        hazcat           $CHAR10.
        fta_insp_nr      BEST9.
        fta_issuance_date YYMMDD10.
        fta_penalty      BEST10.
        fta_contest_date YYMMDD10.
        fta_final_order_date YYMMDD10.
        hazsub1          $CHAR4.
        hazsub2          $CHAR4.
        hazsub3          $CHAR4.
        hazsub4          $CHAR4.
        hazsub5          $CHAR4. ;
    INFORMAT
        activity_nr      BEST9.
        citation_id      $CHAR7.
        delete_flag      $CHAR1.
        standard         $CHAR22.
        viol_type        $CHAR1.
        issuance_date    YYMMDD10.
        abate_date       YYMMDD10.
        abate_complete   $CHAR1.
        current_penalty  BEST10.
        initial_penalty  BEST10.
        contest_date     YYMMDD10.
        final_order_date YYMMDD10.
        nr_instances     BEST5.
        nr_exposed       BEST5.
        rec              $CHAR1.
        gravity          BEST2.
        emphasis         $CHAR1.
        hazcat           $CHAR10.
        fta_insp_nr      BEST9.
        fta_issuance_date YYMMDD10.
        fta_penalty      BEST10.
        fta_contest_date YYMMDD10.
        fta_final_order_date YYMMDD10.
        hazsub1          $CHAR4.
        hazsub2          $CHAR4.
        hazsub3          $CHAR4.
        hazsub4          $CHAR4.
        hazsub5          $CHAR4. ;
    LABEL
        activity_nr='Activity NR'
        citation_id='Citation ID'
        delete_flag='Delete Flag'
        standard='Standard'
        viol_type='Violation Type'
        issuance_date='Issuance Date'
        abate_date='Abate Date'
        abate_complete='Abate Complete'
        current_penalty='Current Penalty'
        initial_penalty='Initial Penalty'
        contest_date='Contested Date'
        final_order_date='Final Order Date'
        nr_instances='Number of Instances'
        nr_exposed='Number Exposed'
        rec='Rec'
        gravity='Gravity'
        emphasis='Emphasis'
        hazcat='Hazard Category'
        fta_insp_nr='FTA Inspection NR'
        fta_issuance_date='FTA Issuance Date'
        fta_penalty='FTA Current Penalty'
        fta_contest_date='FTA Contested Date'
        fta_final_order_date='FTA Final Order Date'
        hazsub1='Hazardous Substance 1'
        hazsub2='Hazardous Substance 2'
        hazsub3='Hazardous Substance 3'
        hazsub4='Hazardous Substance 4'
        hazsub5='Hazardous Substance 5';
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=186
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=186
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        activity_nr      : ?? BEST9.
        citation_id      : $CHAR7.
        delete_flag      : $CHAR1.
        standard         : $CHAR22.
        viol_type        : $CHAR1.
        issuance_date    : ?? YYMMDD10.
        abate_date       : ?? YYMMDD10.
        abate_complete   : $CHAR1.
        current_penalty  : ?? COMMA10.
        initial_penalty  : ?? COMMA10.
        contest_date     : ?? YYMMDD10.
        final_order_date : ?? YYMMDD10.
        nr_instances     : ?? BEST5.
        nr_exposed       : ?? BEST5.
        rec              : $CHAR1.
        gravity          : ?? BEST2.
        emphasis         : $CHAR1.
        hazcat           : $CHAR10.
        fta_insp_nr      : ?? BEST9.
        fta_issuance_date : ?? YYMMDD10.
        fta_penalty      : ?? COMMA10.
        fta_contest_date : ?? YYMMDD10.
        fta_final_order_date : ?? YYMMDD10.
        hazsub1          : $CHAR4.
        hazsub2          : $CHAR4.
        hazsub3          : $CHAR4.
        hazsub4          : $CHAR4.
        hazsub5          : $CHAR4. ;
RUN;


