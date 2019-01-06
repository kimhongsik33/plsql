--No11-8.LIMITキーワードなし。全体SELECT及びROWNUMを使用してSELECT件数を制限する。
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_rec IS TABLE OF emp%ROWTYPE;
  v_emp_arr emp_rec;
  
BEGIN

  SELECT *
    BULK COLLECT INTO v_emp_arr
    FROM emp;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of Table Row1：'||v_emp_arr.COUNT);
  
  SELECT *
    BULK COLLECT INTO v_emp_arr
    FROM emp
  WHERE ROWNUM <= 10;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of Table Row2：'||v_emp_arr.COUNT);
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_8.sql
-- 32  /
--A Number Of Table Row1：15
--A Number Of Table Row2：10
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
