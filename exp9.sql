declare
    cursor honours is select rollno,name ,s1,s2 from student where s1+s2>12 order by rollno;
    name varchar(10);
    highestgrade int;
    s1grade int;
    s2grade int;
    rollnumber int;
begin
    open honours;
    LOOP
        fetch honours into rollnumber,name,s1grade,s2grade;
        exit when honours %notfound;

        dbms_output.put_line('Name:'||name||' S1:'||s1grade||' S2:'||s2grade);
        highestgrade:=s1grade;
        if highestgrade<s2grade then
            dbms_output.put_line('Highest Grade:'||s2grade||' Semester 2');
        else
            dbms_output.put_line('Highest Grade:'||s1grade||' Semester 1');
        end if;
    end LOOP;
    close honours;
end;
/


