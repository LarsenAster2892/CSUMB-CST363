prompt Please make a selection:
prompt 1: Input
prompt 2: Output
prompt 3: Create Tables

accept selection prompt "Enter option 1-3: "

set term off

column script new_value v_script

select case '&selection.'
       when '1' then 'C:\Users\ndevaughn\Desktop\Input.sql'
       when '2' then 'C:\Users\ndevaughn\Desktop\Output.sql'
       when '3' then 'C:\Users\ndevaughn\Desktop\Create.sql'
       else 'menu'
       end as script
from dual;

set term on

@&v_script.
