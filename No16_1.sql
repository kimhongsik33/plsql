--No16-1.STORED FUNCTION
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION get_wage(a_empno NUMBER)
RETURN NUMBER
IS
  v_wage NUMBER;
BEGIN
  SELECT sal + NVL(comm,0) comm
  INTO v_wage
  FROM emp
  WHERE empno = a_empno;
  
  RETURN v_wage;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter16\No16_1.sql
-- 27  /
--
--�t�@���N�V�������쐬����܂����B
--
--SQL>