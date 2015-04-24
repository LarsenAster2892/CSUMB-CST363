set echo off;
set verify off;
set heading off;

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
