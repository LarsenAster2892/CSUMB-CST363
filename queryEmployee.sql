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
set linesize 200;

set echo off;
set verify off;
set heading on;

spool C:\cst363Oracle\Output\TimesheetqueryEmployee.txt;

Column employeeID heading 'Employee ID' format 09999999999;
Column firstname heading 'First Name' format a20;
Column lastname heading 'Last Name' format a20;
Column email heading 'Email Address' format a30;
Column phonenumber heading 'Phone Number' format a15;
Column DeptID heading 'Dept ID' format 09999999999;
Column DeptName heading 'Deptartment Name' format a30;

accept vID prompt 'Please enter the Employee ID:';

prompt;
prompt Thank you!;
prompt;

select employeeID, firstname, lastname, email, phonenumber, DeptName
FROM employee 
JOIN Department on employee.DeptID = Department.DeptID
WHERE employeeID = '&vID';

--
-- Turn off Spooled output
spool off;

prompt
accept vPause prompt "Press ENTER to continue.."
prompt
@@Output.sql;