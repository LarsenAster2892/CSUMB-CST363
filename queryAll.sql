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
cl scr;
--
--
--
set pagesize 1000;
set linesize 120;

set echo off;
set verify off;
set heading on;

spool C:\cst363Oracle\Output\TimesheetqueryAll.txt;

--------------------------------------------------------

Column employeeID heading 'Employee ID' format 09999999999;
Column firstname heading 'First Name' format a20;
Column lastname heading 'Last Name' format a20;
Column email heading 'Email Address' format a30;
Column phonenumber heading 'Phone Number' format a15;
Column DeptID heading 'Dept ID' format 09999999999;

prompt
prompt -- All employees --
prompt

SELECT * 
FROM employee
ORDER BY employeeID;

--------------------------------------------------------

Column deptID heading 'Dept ID' format 09999999999;
Column DeptName heading 'Deptartment Name' format a30;
Column DeptManagerID heading 'Deptartment Manager ID' format 09999999999;

prompt
prompt -- All departments --
prompt

SELECT *
FROM Department
ORDER BY deptID;

--------------------------------------------------------

Column projectID heading 'Project ID' format 09999999999;
Column projectName heading 'Project Name' format a30;

prompt
prompt -- All projects --
prompt

SELECT *
FROM project
ORDER BY projectID;


--------------------------------------------------------

Column projectAssignID heading 'Project Assign ID' format 09999999999;
Column employeeid heading 'Employee ID' format 09999999999;
Column projectid heading 'Project ID' format 09999999999;

prompt
prompt -- All project assignments --
prompt

SELECT *
FROM projectAssignment
ORDER BY projectAssignID;

--------------------------------------------------------

Column timesheetID heading 'Timesheet ID' format 09999999999;
Column employeeid heading 'Employee ID' format 09999999999;
Column weekstartdate heading 'Week Start Date' format a20;
Column weekendingdate heading 'Week End Date' format a20;
Column hours heading 'Hours' format 0999.99;

prompt
prompt -- All timesheets --
prompt

SELECT * 
FROM timesheet
ORDER BY timesheetID;

--------------------------------------------------------

--
-- Turn off Spooled output
spool off;

prompt
accept vPause prompt "Press ENTER to continue.."
prompt
@@Output.sql;