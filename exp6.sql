set serveroutput on;
accept acc number prompt'Enter account number';
accept x number prompt'1.Debit 2.Credit 3.Show Balance';
accept val number prompt'Enter value to be transacted';
declare
x int;
bal int;
minbal int :=500;
acc int;
val int;
BEGIN
x:=&x;
acc:=&acc;
val:=&val;
select balance into bal from bankaccount where accountno=acc;
case 
when x=1 THEN
    if ((bal-val)>=minbal)THEN
        bal:=bal-val;
        update bankaccount set balance =bal where accountno=acc;
        dbms_output.put_line('Rs.'||val||' debited from account'||acc);
        commit;
    else
        dbms_output.put_line('insufficient funds');
    end if;
when x=2 then 
    bal:=bal+val;
    update bankaccount set balance =bal where accountno=acc;
    dbms_output.put_line('Rs.'||val||' credited to account'||acc);
when x=3 then
     dbms_output.put_line('Balance:'||bal);
end case;
end;
/
