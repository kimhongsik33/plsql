--No15-4.TOO_MANY_ROWS EXCEPTION�����̃P�[�X
SET SERVEROUTPUT ON
DECLARE
  v_empno emp.empno%TYPE;
  v_ename emp.ename%TYPE;
BEGIN
  SELECT empno, ename INTO v_empno, v_ename
  FROM emp
  WHERE empno >= 7900;
  DBMS_OUTPUT.PUT_LINE('�Ј��ԍ�'||v_empno||'�̖��O��'||v_ename||'�ł��B');
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('�擾������1����葽���ł��B');
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter15\No15_4.sql
-- 24  /
--�擾������1����葽���ł��B
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>