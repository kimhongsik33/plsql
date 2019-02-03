--No14-3.CURSOR変数についてOPEN,FETCH,CLOSE文を使用する動的SQLはSELECT文のみで使用できる
SET SERVEROUTPUT ON
DECLARE
  TYPE empcur_type IS REF CURSOR;
  v_emp_cur   empcur_type; --CURSOR変数
  emp_rec     emp%ROWTYPE;
  v_stmt      VARCHAR2(200);
  v_empno     NUMBER;
BEGIN
  v_stmt := 'SELECT * FROM emp WHERE empno = :empno';
  v_empno := 7788;
  
  OPEN v_emp_cur FOR v_stmt USING v_empno;
  
  LOOP
    FETCH v_emp_cur INTO emp_rec;
    EXIT WHEN v_emp_cur%NOTFOUND;
  END LOOP;
  
  CLOSE v_emp_cur;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter14\No14_3.sql
-- 31  /
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>