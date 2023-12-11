set serveroutput on;
declare
    cursor ebil is select cno,present-past as req from electricity;
    consumer int;
    pre int;
    pas int;
    required int;

    amount float;
begin   
    consumer:=&consumer;
    for rec in ebil
    LOOP
        if consumer=rec.cno then
            required:=rec.req;
        end if;
    end loop;
    -- required:=pre-pas;
    if required >500 then
        amount:=100*5+200*7.5+200*15+(required-500)*22.5;
    elsif required<501 and required >300 then
        amount:=100*5+200*7.5+(required-300)*15;
    elsif required<301 and required>100 then
        amount:=100*5+(required-100)*7.5;
    else
        amount:=5*required;
    end if;
    dbms_output.put_line('The total bill for the customer '||consumer||'is :'||amount);
end;
/