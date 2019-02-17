--No15-5.OTHERS EXCEPTION�����̃P�[�X
SET SERVEROUTPUT ON
DECLARE
  v_ename emp.ename%TYPE NOT NULL := ' ';
  v_mgr   emp.mgr  %TYPE NOT NULL := -1;
  v_code  NUMBER;
  v_errm  VARCHAR2(64);
BEGIN
  SELECT ename, mgr INTO v_ename, v_mgr
  FROM emp
  WHERE empno = 'KING';
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('�Ј������݂��Ă��܂���B');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('�擾������1����葽���ł��B');
  WHEN OTHERS THEN
    v_code := SQLCODE;
    v_errm := SUBSTR(SQLERRM, 1, 64);
    DBMS_OUTPUT.PUT_LINE('EXCEPTION���������܂����B');
    DBMS_OUTPUT.PUT_LINE('Error Code�F'||v_code||':'||v_errm);
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter15\No15_5.sql
-- 32  /
--EXCEPTION���������܂����B
--Error Code�F-1722:ORA-01722: ���l�������ł��B
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>