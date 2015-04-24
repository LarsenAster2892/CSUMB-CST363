
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

spool C:\cst363Oracle\Output\TimesheetAddTimesheet.txt;

prompt;
prompt --- Add Timesheet Form ---;
prompt;
prompt;

accept vTimesheetID prompt 'Please enter the timesheet ID number: ';

accept vEmployeeID prompt 'Please enter the timesheet associated employee ID number: ';

accept vWeekStartDate prompt 'Please enter the timesheet week start date: ';

accept vWeekEndDate prompt 'Please enter the timesheet week end date: ';

accept vHours prompt 'Please enter the timesheet hour amount: ';

INSERT INTO timesheet
VALUES ('&vTimesheetID', '&vEmployeeID', '&vWeekStartDate', '&vWeekEndDate', '&vHours');

prompt The following record has been added:;
prompt;

select * FROM timesheet WHERE timesheetID = '&vTimesheetID';

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