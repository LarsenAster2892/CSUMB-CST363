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

spool C:\cst363Oracle\Output\TimesheetAddDepartment.txt;

cl scr;

prompt;
prompt --- Add Department Form ---;
prompt;
prompt;

accept vDeptID prompt 'Please enter the Department ID number: ';

accept vDeptName prompt 'Please enter the Department name: ';

accept vDeptManagerID prompt 'Please enter the Department manager employee ID number: ';


INSERT INTO Department
VALUES ('&vDeptID', '&vDeptName', '&vDeptManager');

prompt The following record has been added:;
prompt;

select * FROM Department WHERE deptID = '&vDeptID';

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