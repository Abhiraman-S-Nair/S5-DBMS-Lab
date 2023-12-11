set serveroutput on;

create or replace trigger stud_trig
before insert or update or delete on stud
for each row

declare 
    oprtn_msg varchar(100);

begin
    if inserting then
        oprtn_msg := 'Inserting' || :NEW.name;
    elsif updating('name') then
        oprtn_msg := 'Updated' ||:OLD.name || ' to ' || :NEW.name;
    elsif updating('roll_no') or updating('sub1') or updating('sub2') or updating('sub3') then
        oprtn_msg := 'Updated Roll No or marks of Sub1 or Sub2 or Sub3' || :NEW.name;
    elsif deleting then
        oprtn_msg := 'Deleting' || :OLD.name;
    end if;
    
    DBMS_OUTPUT.PUT_LINE(oprtn_msg);

end stud_trig;
/