--No17-3.RECORD��RETURN����FUNCTION
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION get_emp_rec(a_empno NUMBER)
RETURN emp%ROWTYPE
IS
  v_emp_rec emp%ROWTYPE;
BEGIN
  SELECT * INTO v_emp_rec
  FROM emp
  WHERE empno = a_empno;
  RETURN v_emp_rec;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter17\No17_3.sql
-- 21  /
--
--�t�@���N�V�������쐬����܂����B
--
--SQL>