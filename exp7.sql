set serveroutput on;
accept rn number prompt 'Enter student rollnumber';
declare
rn int;
m1 int;
m2 int;
m3 int;
average int;
cday varchar(30);
BEGIN
rn:=&rn;
select mark1 into m1 from students where rollno=rn;
select mark2 into m2 from students where rollno=rn;
select mark3 into m3 from students where rollno=rn;
average:=(m1+m2+m3)/3;
dbms_output.put_line('Mark1: '||m1||' Mark2: '||m2||' Mark3: '||m3||' Average: '||average);
if average<40 then
dbms_output.put_line('Needs Improvement');
end if;
cday:=to_char(sysdate,'Day');
dbms_output.put_line('Current Day is: '||cday||','||to_char(sysdate,'DD-MON-YYYY'));
end;
/