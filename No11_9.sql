--No11-9.LIMITキーワードなし。SAMPLE及びFETCH FIRSTを使用してSELECT件数を制限する。
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_tab_type IS TABLE OF emp%ROWTYPE;
  v_emp emp_tab_type;
  
BEGIN
  --SAMPLE
  SELECT *
    BULK COLLECT INTO v_emp
    FROM emp SAMPLE(10);
  
  DBMS_OUTPUT.PUT_LINE('A Number Of SAMPLE：'||v_emp.COUNT);
  
  --FETCH FIRST(Version11.2以下ではCompile Error)
  SELECT *
    BULK COLLECT INTO v_emp
    FROM emp
  FETCH FIRST 10 ROWS ONLY;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of FETCH FIRST 10：'||v_emp.COUNT);
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_9.sql
-- 34  /
--  FETCH FIRST 10 ROWS ONLY;
--             *
--行17でエラーが発生しました。:
--ORA-06550: 行17、列9:
--PL/SQL: ORA-00933: SQLコマンドが正しく終了されていません。
--ORA-06550: 行14、列3:
--PL/SQL: SQL Statement ignored
--
--
--SQL>
