/*
************************************************
CSUMB
CST363 Introduction to Database System
SP-15B
Instructor	: Dr. Wang
Team	:  10 - Clarus Solutions
Members	: Gracie Alderete-Fisher
	  Nigel Devaughn
	  Clarence Mitchell
************************************************
*/

set echo off;
set verify off;
set heading off;

set pagesize 1000;
set linesize 120;

spool C:\cst363Oracle\Output\TimesheetAddProjectAssignment.txt;


prompt;
prompt --- Add Project Assignment Form ---;
prompt;
prompt;

accept vProjectAssignmentID prompt 'Please enter the project Assignment ID number: ';

accept vEmployeeID prompt 'Please enter the project Assignment associated employee ID number: ';

accept vProjectID prompt 'Please enter the project Assignment associated project ID number: ';

INSERT INTO projectAssignment
VALUES ('&vProjectAssignmentID', '&vEmployeeID', '&vProjectID');

prompt The following record has been added:;
prompt;

select * FROM projectAssignment WHERE projectAssignID = '&vProjectAssignmentID';


prompt
accept vPause prompt "Press ENTER to continue.."
prompt
--
-- Turn off Spooled output
spool off;
--
-- Return to Main script
--
@@Main.sql;
