set serveroutput on; 

declare
A VOLUNTEERING2.vrate%TYPE;

B VOLUNTEERING2.vrate%TYPE;
begin
select sum(vsalary) into A from VOLUNTEERING1 @MAIN1;
select sum(vrate) into B from VOLUNTEERING2;
if (A>B)then
dbms_output.put_line('total salary'||CHR(10)||A||CHR(10)||'TEAMS from dhaka is involved in more concerts than teams from ctg');
elsif(A=B)then
dbms_output.put_line('total salary'||CHR(10)||A||CHR(9)||B||CHR(10)||'TEAMS from dhaka & teams from ctg are equally involved');
else
dbms_output.put_line('total salary'||CHR(10)||B||CHR(10)||'TEAMS from ctg is involved in more concerts than teams from dhaka');
end if;
end;
/