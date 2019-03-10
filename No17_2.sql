--No17-2.COLLECTIONをRETURNするFUNCTION
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION get_emp_list(a_deptno NUMBER)
RETURN empno_arr_type
IS
  v_empno_arr empno_arr_type;
BEGIN
  SELECT empno
    BULK COLLECT INTO v_empno_arr
  FROM emp
  WHERE deptno = a_deptno
  ORDER BY empno;
  RETURN v_empno_arr;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter17\No17_2.sql
-- 23  /
--
--ファンクションが作成されました。
--
--SQL>