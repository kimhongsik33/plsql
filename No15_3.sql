--No15-3.NO_DATA_FOUND EXCEPTION�����̃P�[�X
SET SERVEROUTPUT ON
DECLARE
  v_empno emp.empno%TYPE := 1000;
  v_ename emp.ename%TYPE;
BEGIN
  SELECT ename INTO v_ename
  FROM emp
  WHERE empno = v_empno;
  DBMS_OUTPUT.PUT_LINE('�Ј��ԍ�'||v_empno||'�̖��O��'||v_ename||'�ł��B');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('�Ј��ԍ�'||v_empno||'�̖��O��'||v_ename||'���݂��Ă��܂���B');
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter15\No15_3.sql
-- 24  /
--�Ј��ԍ�1000�̖��O�͑��݂��Ă��܂���B
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>