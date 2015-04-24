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

spool C:\cst363Oracle\Output\TimesheetAddProject.txt;

prompt;
prompt --- Add Project Form ---;
prompt;
prompt;

accept vProjectID prompt 'Please enter the project ID number: ';

accept vProjectName prompt 'Please enter the project name: ';

INSERT INTO project
VALUES ('&vProjectID', '&vProjectName');

prompt The following record has been added:;
prompt;

select * FROM project WHERE projectID = '&vProjectID';

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
