set serveroutput on;
create or replace function dc(bal in number) return varchar2 is v_category varchar2(10);
begin
    if bal > 50000 then
        v_category:='Platinum';
    elsif bal>10000 and bal<50001 then
        v_category:='Gold';
    elsif bal<10001 then
        v_category:='Silver';
    end if;
    return v_category;
end;
/


accept acc number prompt'Enter account number: ';
declare
acc int;
bal int;
rating varchar(20);
begin
    acc:=&acc;
    select balance into bal from bankaccount where accountno=acc;
    rating:=dc(bal);
    dbms_output.put_line('The account rating is:'||rating);
end;
/