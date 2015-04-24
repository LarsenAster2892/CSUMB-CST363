set echo off;
set verify off;
set heading off;

prompt;
prompt --- Add Project Assignment Form ---;
prompt;
prompt;

accept vProjectAssignmentID prompt 'Please enter the project Assignment ID number: ';

accept vEmployeeID prompt 'Please enter the project Assignment associated employee ID number: ';

accept vProjectID prompt 'Please enter the project Assignment associated project ID number: ';

INSERT INTO projectAssignment
VALUES ('&vProjectAssignmentID', '&vEmployeeID', '&vProjectID');

prompt The following record has been added:;
prompt;

select * FROM projectAssignment WHERE projectAssignID = '&vProjectAssignmentID';

start C:\Users\ndevaughn\Desktop\Main.sql;
