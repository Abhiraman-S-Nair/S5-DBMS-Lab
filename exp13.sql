set serveroutput on;

create or replace trigger stud_avg_trig
before insert or update on stud
for each row

declare 
    oprtn_msg varchar(100);

begin
    :NEW.Total := :NEW.Sub1 + :NEW.Sub2 + :NEW.Sub3;
    :NEW.Average := :NEW.Total/3;
end stud_avg_trig;
/