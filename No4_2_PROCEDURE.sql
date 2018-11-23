set serveroutput on
DECLARE
         v_num NUMBER;
       BEGIN
         v_num := pracEx1(10);
         DBMS_OUTPUT.PUT_LINE(v_num);
       END;