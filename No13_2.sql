--No13-2.BULK COLLECTを使用して複数件をFETCH
SET SERVEROUTPUT ON
DECLARE
  TYPE empno_arr IS TABLE OF NUMBER;
  TYPE ename_arr IS TABLE OF emp.ename%TYPE;
  
  v_empno empno_arr;
  v_ename ename_arr;
  
  --EXPLICT CURSOR
  CURSOR ename_cursor IS
  SELECT empno, ename FROM emp;

BEGIN
  OPEN ename_cursor;
  
  FETCH ename_cursor
  BULK COLLECT INTO v_empno, v_ename;

  DBMS_OUTPUT.PUT_LINE('社員数='||v_empno.COUNT);
  
  CLOSE ename_cursor;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter13\No13_2.sql
-- 47  /
--社員数=15
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>