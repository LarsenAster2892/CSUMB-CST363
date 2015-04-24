set echo off;
set verify off;
set heading off;

prompt;
prompt --- Add Project Form ---;
prompt;
prompt;

accept vProjectID prompt 'Please enter the project ID number: ';

accept vProjectName prompt 'Please enter the project name: ';

INSERT INTO project
VALUES ('&vProjectID', '&vProjectName');

prompt The following record has been added:;
prompt;

select * FROM project WHERE projectID = '&vProjectID';
