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

spool C:\cst363Oracle\Output\TimesheetAddEmployee.txt;

prompt;
prompt --- Add Employee Form ---;
prompt;
prompt;

accept vID prompt 'Please enter the employee ID number: ';

accept vFirstName prompt 'Please enter the employee first name: ';

accept vLastName prompt 'Please enter the employee last name: ';

accept vEmail prompt 'Please enter the employee email address: ';

accept vPhoneNumber prompt 'Please enter the employee phone number: ';

accept vDeptID prompt 'Please enter the employee department ID number:' ;

INSERT INTO employee
VALUES ('&vID', '&vFirstName', '&vLastName', '&vEmail', '&vPhoneNumber',  '&vDeptID');

prompt The following record has been added:;
prompt;

select * FROM employee WHERE employeeID = '&vID';

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