create or replace package ep as
 procedure ae(pid in int,pname in varchar2,paddress in varchar2,salary in number);
  procedure de(pid in int);
 procedure lae;
 function getSalary(pid IN number) return number;

 end ep;
 /

 create or replace PACKAGE BODY ep as
  pro


select custno from purchase where prodno in (select prodno fromm purchase where custno=c0004);


select custno from




