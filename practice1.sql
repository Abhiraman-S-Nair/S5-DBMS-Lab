create table stud_details(rno int primary key,sname varchar(20),dob date,address varchar(20),city varchar(20));
create table mark_details(rno int primary key,mark1 int,mark2 int,mark3 int,total int,foreign key(rno) references stud_details(rno));


insert into stud_details values(1,'Alan','02-JUN-2003','ABC','Kerala');
insert into stud_details values(2,'Ann','27-MAY-2003','BCD','Kerala');
insert into stud_details values(3,'Tej','12-APR-2003','CDE','Kerala');
insert into stud_details values(4,'John','25-JUN-2003','CDE','Kerala');
insert into stud_details values(5,'Dev','17-DEC-2003','DEF','Kerala');
insert into stud_details values(6,'Donn','23-JUN-2003','TBC','Kerala');
insert into stud_details values(7,'Dan','29-JAN-2003','AWE','Kerala');
insert into stud_details values(8,'Travis','18-MAY-2003','KTC','Kerala');
insert into stud_details values(9,'Roman','08-NOV-2003','AJT','Kerala');

insert into mark_details values(1,89,75,25,null);
insert into mark_details values(2,99,99,99,null);
insert into mark_details values(3,79,74,57,null);
insert into mark_details values(4,78,88,45,null);
insert into mark_details values(5,78,37,95,null);
insert into mark_details values(6,89,75,95,null);
insert into mark_details values(7,99,29,65,null);
insert into mark_details values(8,80,74,45,null);
insert into mark_details values(9,70,77,75,null);

update mark_details set total=((mark1+mark2+mark3)/3) where rno=rno;


select sname as name ,total as percentmarks from stud_details,mark_details where stud_details.rno=mark_details.rno and sname='Ann';

select sname as name, city from stud_details s,mark_details m where m.total>80 and m.rno=s.rno;

alter table mark_details rename to stud_marks;


set serveroutput on;
create or replace procedure largest(id in int)as
begin
for row in (select sname as name,greatest(mark1,mark2,mark3) as max_val, least(mark1,mark2,mark3) as low_val from stud_marks,stud_details where stud_marks.rno=id and stud_marks.rno=stud_details.rno)
loop
dbms_output.put_line('Name:'||row.name||',Highest Mark:'||row.max_val||',Least Value:'||row.low_val);
end loop;
end;
/

begin
largest(8);
largest(3);
largest(2);
largest(1);
end;
/