-- create table bookmaster(bname varchar(20) primary key,aname varchar(20),price int,quantity int);
-- insert into bookmaster values('Jack and Jill','Alan',450,7);
-- insert into bookmaster values('Jack and Donl','Marco',50,8);
-- insert into bookmaster values('Jack','Polo',1450,4);
-- insert into bookmaster values('Avay and Jill','Roho',4520,7);
-- insert into bookmaster values('Jack and John','Temptest',450,3);
-- insert into bookmaster values('Josephl','Qwert',4570,2);
-- insert into bookmaster values('Hercules','Mathew',50,7);
-- insert into bookmaster values('Jack and Hercules','Hercules',400,2);
-- insert into bookmaster values('JIll','Hercules',40,8);
-- insert into bookmaster values('Jim','Hercules',4050,3);
-- insert into bookmaster values('Tamil','Vimal',5450,1);

-- update bookmaster set quantity=(2*quantity) where bname=bname;

-- select bname from bookmaster where price>400;

-- select aname,price,bname from bookmaster where aname like 'A%';


-- create table reg_result(rno int primary key,math_t int,math_s int,os_t int,os_s int,dbms_t int,dbms_s int,grand_total int);

-- create table imp_suppl_result(rno int primary key, math varchar(4),os varchar(4),dbms varchar(4), foreign key(rno) references reg_result(rno));


create or replace trigger result
after update or insert on reg_result 
for each row
begin 
if :new.math_t>40 and :new.math_t+:new.math_s>74 then
    insert into imp_suppl_result(rno,math) values(:new.rno,'pass');
else
    insert into imp_suppl_result(rno,math) values(:new.rno,'fail');
end if;
if :new.os_t>40 and :new.os_t+:new.os_s>74 then
    update imp_suppl_result set os='pass' where :new.rno=rno;
else
    update imp_suppl_result set os='fail' where :new.rno=rno;
end if;
if :new.dbms_t>40 and :new.dbms_t+:new.dbms_s>74 then
    update imp_suppl_result set dbms='pass' where :new.rno=rno;
else
    update imp_suppl_result set dbms='fail' where :new.rno=rno;
end if;
end result;
/

-- insert into reg_result values(2,90,50,85,46,75,45,null);
-- insert into reg_result values(3,90,50,43,40,75,45,null);
-- insert into reg_result values(4,90,50,85,40,85,15,null);
-- insert into reg_result values(5,90,50,85,39,75,45,null);
create or replace trigger grand after update or insert on imp_suppl_result for each row
begin
if :new.math='pass' and :new.os='pass' and :new.dbms='pass' then
update reg_result set grand_total=(math_t+math_s+os_t+os_s+dbms_t+dbms_s) where reg_result.rno=:new.rno;
end if;
end grand;
/

-- insert into reg_result values(1,90,50,85,46,75,45,null);


-- insert into reg_result values(2,90,50,85,46,75,45,null);
-- insert into reg_result values(3,90,50,43,40,75,45,null);
-- insert into reg_result values(4,90,50,85,40,85,15,null);
-- insert into reg_result values(5,90,50,85,39,75,45,null);
