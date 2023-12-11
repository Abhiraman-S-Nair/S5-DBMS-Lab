SET SERVEROUTPUT ON;

-- Create the package
CREATE OR REPLACE PACKAGE example_package AS
    -- Declaration of Cursor
    CURSOR example_cursor IS
        SELECT id, name, age FROM example_table;

    -- Declaration of Function
    FUNCTION get_name_by_id(p_id IN NUMBER) RETURN VARCHAR2;
END example_package;
/

-- Create the package body
CREATE OR REPLACE PACKAGE BODY example_package AS
    -- Definition of Function
    FUNCTION get_name_by_id(p_id IN NUMBER) RETURN VARCHAR2 IS
        v_name VARCHAR2(50);
    BEGIN
        SELECT name INTO v_name FROM example_table WHERE id = p_id;
        RETURN v_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END get_name_by_id;
END example_package;
/

-- Create a trigger for auto-incrementing the ID on insertion and deletion
CREATE OR REPLACE TRIGGER increment_id_trigger
BEFORE INSERT OR DELETE ON example_table
FOR EACH ROW
DECLARE
BEGIN
    IF INSERTING OR DELETING THEN
        -- Increment the ID
        :NEW.id := example_table_seq.nextval;
    END IF;
END;
/

-- Enable the trigger
ALTER TRIGGER increment_id_trigger ENABLE;

-- User interaction example
DECLARE
    v_id NUMBER;
    v_result VARCHAR2(50);
BEGIN
    v_id := &v_id;	
    -- Call the function from the package
    v_result := example_package.get_name_by_id(v_id);

    -- Display the result to the user
    DBMS_OUTPUT.PUT_LINE('Name for ID ' || v_id || ': ' || v_result);
END;
/
