
/* --------------------------------------------------------------------
   IMPORT OSHA ACCIDENT INJURY FILE INTO SAS DATASET

   Input file:	osha_accident_injury.csv
   
   Output data: WORK.osha_accident_injury
 
   INSTRUCTIONS:
   
   This program can be used to import the osha_accident_injury CSV file into a SAS dataset. 
   The CSV file is located at http://ogesdw.dol.gov/views/data_summary.php. The osha_accident_injury CSV file must first be downloaded and decompressed from the website.
   The location of the CSV file must be specified in the below macro variable "location".
   The output of this program will be placed in the WORK library.
   There are two versions to read in the file. One is for reading a Windows formatted file to a UNIX platform.
   The other is when reading a Windows file on a Windows system. See the INFILE statement below to select the appropriate options.

   -------------------------------------------------------------------- */

%let location=<path/filename>;

DATA WORK.osha_accident_injury;
    LENGTH
        summary_nr         8
        rel_insp_nr        8
        age                8
        sex              $ 1
        nature_of_inj      8
        part_of_body       8
        src_of_injury      8
        event_type         8
        evn_factor         8
        hum_factor         8
        occ_code           8
        degree_of_inj      8
        task_assigned      8
        hazsub           $ 4
        const_op           8
        const_op_cause     8
        fat_cause          8
        fall_distance      8
        fall_ht            8
        injury_line_nr     8 ;
    FORMAT
        summary_nr       BEST9.
        rel_insp_nr      BEST9.
        age              BEST2.
        sex              $CHAR1.
        nature_of_inj    BEST2.
        part_of_body     BEST2.
        src_of_injury    BEST2.
        event_type       BEST2.
        evn_factor       BEST2.
        hum_factor       BEST2.
        occ_code         BEST3.
        degree_of_inj    BEST1.
        task_assigned    BEST1.
        hazsub           $CHAR4.
        const_op         BEST2.
        const_op_cause   BEST2.
        fat_cause        BEST2.
        fall_distance    BEST4.
        fall_ht          BEST4.
        injury_line_nr   BEST3. ;
    INFORMAT
        summary_nr       BEST9.
        rel_insp_nr      BEST9.
        age              BEST2.
        sex              $CHAR1.
        nature_of_inj    BEST2.
        part_of_body     BEST2.
        src_of_injury    BEST2.
        event_type       BEST2.
        evn_factor       BEST2.
        hum_factor       BEST2.
        occ_code         BEST3.
        degree_of_inj    BEST1.
        task_assigned    BEST1.
        hazsub           $CHAR4.
        const_op         BEST2.
        const_op_cause   BEST2.
        fat_cause        BEST2.
        fall_distance    BEST4.
        fall_ht          BEST4.
        injury_line_nr   BEST3. ;
    LABEL
        summary_nr='Summary NR'
        rel_insp_nr='Related Inspection NR'
        age='Age'
        sex='Sex'
        nature_of_inj='Nature of Injury'
        part_of_body='Part of Body'
        src_of_injury='Source of Injury'
        event_type='Event Type'
        evn_factor='Environmental Factor'
        hum_factor='Human Factor'
        occ_code='Occupation Code'
        degree_of_inj='Degree of Injury'
        task_assigned='Task Assigned'
        hazsub='Hazardous Substance'
        const_op='Construction Operation Code'
        const_op_cause='Construction Cause of Injury'
        fat_cause='Construction Cause of Fatality'
        fall_distance='Distance of Fall'
        fall_ht='Height of Person'
        injury_line_nr='Injury Line Number';
/* The following is for reading Windows formatted files to a UNIX system*/
    INFILE "&location"
        LRECL=70
        ENCODING="LATIN1"
        TERMSTR=CRLF
        DLM='7F'x
        MISSOVER
        DSD ;
/* For reading files that are not being read into a Unix system use the following:
    INFILE "&location"
        LRECL=70
        DLM=','
        MISSOVER
        DSD ;
*/
    INPUT
        summary_nr       : ?? BEST9.
        rel_insp_nr      : ?? BEST9.
        age              : ?? BEST2.
        sex              : $CHAR1.
        nature_of_inj    : ?? BEST2.
        part_of_body     : ?? BEST2.
        src_of_injury    : ?? BEST2.
        event_type       : ?? BEST2.
        evn_factor       : ?? BEST2.
        hum_factor       : ?? BEST2.
        occ_code         : ?? BEST3.
        degree_of_inj    : ?? BEST1.
        task_assigned    : ?? BEST1.
        hazsub           : $CHAR4.
        const_op         : ?? BEST2.
        const_op_cause   : ?? BEST2.
        fat_cause        : ?? BEST2.
        fall_distance    : ?? BEST4.
        fall_ht          : ?? BEST4.
        injury_line_nr   : ?? BEST3. ;
RUN;


