set echo off;
set verify off;
set heading off;

prompt;
prompt --- Add Employee Form ---;
prompt;
prompt;

accept vID prompt 'Please enter the employee ID number: ';

accept vFirstName prompt 'Please enter the employee first name: ';

accept vLastName prompt 'Please enter the employee last name: ';

accept vEmail prompt 'Please enter the employee email address: ';

accept vPhoneNumber prompt 'Please enter the employee phone number: ';

accept vIsActive prompt 'Employee active (0-1):' ;

accept vDeptID prompt 'Please enter the employee department ID number:' ;

INSERT INTO employee
VALUES ('&vID', '&vFirstName', '&vLastName', '&vEmail', '&vPhoneNumber', '&vIsActive', '&vDeptID');

prompt The following record has been added:;
prompt;

select * FROM employee WHERE employeeID = '&vID';
