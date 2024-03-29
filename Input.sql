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


prompt Please make a selection:
prompt 1: Add Employee
prompt 2: Add Project
prompt 3: Add Project Assignment
prompt 4: Add Timesheet
prompt 5: Add Department
prompt 6: Return to Main Menu

accept selection prompt "Enter option 1-6: "

set term off

column script new_value v_script

select case '&selection.'
       when '1' then 'addEmployee.sql'
       when '2' then 'addProject.sql'
       when '3' then 'addProjectAssignment.sql'
       when '4' then 'addTimesheet.sql'
       when '5' then 'addDepartment.sql'
       when '6' then 'Main.sql'
       else 'menu'
       end as script
from dual;

set term on

@@&v_script.
