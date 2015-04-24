set echo off;
set verify off;
set heading off;


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
prompt 1: Query all data 
prompt 2: Query by employee ID
prompt 3: Return to Main Menu

accept selection prompt "Enter option 1-3: "

set term off

column script new_value v_script

select case '&selection.'
       when '1' then 'queryAll.sql'
       when '2' then 'queryEmployee.sql'
       when '3' then 'Main.sql'
       else 'menu'
       end as script
from dual;

set term on

@@&v_script.