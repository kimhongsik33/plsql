CREATE OR REPLACE FUNCTION pracEx1(a_num NUMBER)
RETURN NUMBER
IS
BEGIN
  RETURN a_num * a_num;
END;
/

--DECLARE
--         v_num NUMBER;
--       BEGIN
--         v_num := pracEx1(10);
--         DBMS_OUTPUT.PUT_LINE(v_num);
--       END;
--       /