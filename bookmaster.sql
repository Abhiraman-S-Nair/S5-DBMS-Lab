create or replace trigger grades_trigger
after insert on reg_result
for each row
declare
  v_maths_result varchar2(10);
  v_os_result varchar2(10);
  v_dbms_result varchar2(10);
begin
  -- Math result
  if (:new.maths >= 40 and :new.maths_sess >= 75) then
    v_maths_result := 'Pass';
  else
    v_maths_result := 'Fail';
  end if;

  -- OS result
  if (:new.os >= 40 and :new.os_sess >= 75) then
    v_os_result := 'Pass';
  else
    v_os_result := 'Fail';
  end if;

  -- DBMS result
  if (:new.dbms >= 40 and :new.dbms_sess >= 75) then
    v_dbms_result := 'Pass';
  else
    v_dbms_result := 'Fail';
  end if;

  -- Update the imp_suppl_result table
  insert into imp_suppl_result (regno, maths, os, dbms)
  values (:new.regno, v_maths_result, v_os_result, v_dbms_result);
  
  -- No need for a commit in a trigger

  dbms_output.put_line('Results updated for student with regno ' || :new.regno);
end grades_trigger;
/
