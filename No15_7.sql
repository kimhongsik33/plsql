--No15-7.OracleError�fORA-20001�f��EXCEPTION��USER_DEFINED_EXCEPTION�ƘA��
SET SERVEROUTPUT ON
DECLARE
  user_defined_exception EXCEPTION;
  PRAGMA EXCEPTION_INIT(user_defined_exception, -20001); --ORA-20001
BEGIN
  RAISE_APPLICATION_ERROR(-20001, '�g�p�Ҏw��EXCEPTION');
EXCEPTION
  WHEN user_defined_exception THEN
    DBMS_OUTPUT.PUT_LINE('�g�p�Ҏw��EXCEPTION,user_defined_exception�����o����܂����B');
    DBMS_OUTPUT.PUT_LINE('SQLCODE='||SQLCODE);
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter15\No15_7.sql
-- 22  /
--�g�p�Ҏw��EXCEPTION,user_defined_exception�����o����܂����B
--SQLCODE=-20001
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>