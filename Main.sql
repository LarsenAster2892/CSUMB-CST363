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

set pagesize 1000;
set lines 250;


prompt Please make a selection:
prompt 1: Input
prompt 2: Output
prompt 3: Create Tables
prompt 4: Exit

accept selection prompt "Enter option 1-4: "

set term off

column script new_value v_script

select case '&selection.'
       when '1' then 'Input.sql'
       when '2' then 'Output.sql'
       when '3' then 'Create.sql'
       when '4' then 'Exit.sql'
       else 'menu'
       end as script
from dual;

set term on

@@&v_script.
