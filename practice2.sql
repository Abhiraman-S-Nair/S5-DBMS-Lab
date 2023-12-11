create table publisher(pid int primary key, pname varchar(20),city varchar(15),state varchar(15),country varchar(15));
create table book_details(isbn int primary key,title varchar(35),mrp int,pid int, author varchar(15));


insert into publisher values(1,'Haha Publ','Kochi','Kerala','India');
insert into publisher values(2,'Hehe Publ','Chennai','Tamilnadu','India');
insert into publisher values(3,'Tehe Publ','Mysore','Karnataka','India');
insert into publisher values(4,'Behe Publ','Trichy','Tamilnadu','India');
insert into publisher values(5,'Zehe Publ','Kollam','Kerala','India');

insert into book_details values(1234,'Jack and Jill',780,1,'John');
insert into book_details values(1235,'Jack and John',1780,1,'Donn');
insert into book_details values(1236,'Jack and Tom',725,1,'Mary');
insert into book_details values(1237,'Jack and Jack',1000,2,'Jocob');
insert into book_details values(1238,'Jack and Devon',700,2,'Yokab');
insert into book_details values(1239,'Mary and Jill',500,4,'Yakob');
insert into book_details values(1240,'Mercy and Jill',450,4,'Jacob');
insert into book_details values(1241,'Jack and Jim',450,5,'Mercy');
insert into book_details values(1242,'Jim and Jill',1000,5,'Harry');
insert into book_details values(1243,'Tory and Jill',450,3,'John');
insert into book_details values(1244,'Darcy and Jill',1080,3,'John');
insert into book_details values(1245,'Jack and Darcy',650,1,'John');

select isbn,title,mrp,publisher.pid,author,publisher.pname from book_details,publisher where book_details.pid=publisher.pid;

select * from book_details b,publisher p where b.pid=p.pid;

select title,mrp,p.pname from book_details b,publisher p where pname like 'H%' and mrp>(select min(mrp) from book_details) and b.pid=p.pid order by mrp;