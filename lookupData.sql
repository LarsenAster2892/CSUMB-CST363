cl scr;
--
--
--
set pagesize 1000;
set linesize 120;
set echo off;
set verify off;
set heading off;

spool C:\cst363Oracle\Output\lookupData.txt;

/****************************************/
/* CST363 SP15 Intro to Database System */
/* Assignment: Week 7 Homework          */
/* Instructor: Dr. Wendy Wang           */
/* Student   : Clarence Mitchell        */
/* Team      : (10) Clarus Solution     */
/****************************************/
--
--
--
prompt ----------------------------------------;
prompt -     CST363 Intro To Database systems -;
prompt -     Module 7 Homework                -;
prompt -     Part 2.3                         -;
prompt -     Instructor: Dr. Wang             -;
prompt -     Student: Clarence Mitchell       -;
prompt ----------------------------------------;

prompt
prompt --- CSU Monterey Bay Student ---;
prompt

--
--  Add Students
-- 
accept vOtterID prompt 'Please enter the OtterID:'
prompt
prompt Thank you!

prompt
prompt
Select 'Student OtterID:' || TO_CHAR(012345678, '000g00g0000','nls_numeric_characters=.-') || chr(13)||chr(10)||chr(10) || 
       'Name  :' || NLS_UPPER(Name) || chr(13)||chr(10)||chr(10) 
FROM student
Where OtterID = '&vOtterID';



--
-- Turn off Spooled output
spool off