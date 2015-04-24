set echo off;
set verify off;
set heading off;

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

start C:\Users\ndevaughn\Desktop\Main.sql;
