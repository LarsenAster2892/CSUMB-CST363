cl scr;

prompt Please make a selection:
prompt 1: Add Employee
prompt 2: Add Project
prompt 3: Add Project Assignment
prompt 4: Add Timesheet
prompt 5: Add Department

accept selection prompt "Enter option 1-5: "

set term off

column script new_value v_script

select case '&selection.'
       when '1' then 'C:\Users\ndevaughn\Desktop\addEmployee.sql'
       when '2' then 'C:\Users\ndevaughn\Desktop\addProject.sql'
       when '3' then 'C:\Users\ndevaughn\Desktop\addProjectAssignment.sql'
       when '4' then 'C:\Users\ndevaughn\Desktop\addTimesheet.sql'
       when '5' then 'C:\Users\ndevaughn\Desktop\addDepartment.sql'
       else 'menu'
       end as script
from dual;

set term on

@&v_script.
