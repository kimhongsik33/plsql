--No17-2.COLLECTION��RETURN����FUNCTION
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


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter17\No17_2.sql
-- 23  /
--
--�t�@���N�V�������쐬����܂����B
--
--SQL>