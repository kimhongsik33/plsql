--No7-1.NOT NULL�ϐ��ɏ����l���w�肵�Ȃ��ꍇERROR����������
SET SERVEROUTPUT ON
DECLARE
  v_name VARCHAR2(10) NOT NULL;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_name);
END;


--�ȉ��A����

--Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
--�ɐڑ�����܂����B
--SQL> @C:\kim\tech\plsql\Chapter7\No7_1.sql
--  6  /
--  v_name VARCHAR2(10) NOT NULL;
--         *
--�s2�ŃG���[���������܂����B:
--ORA-06550: �s2�A��10:
--PLS-00218: NOT NULL�Ő錾�����ϐ��ɂ͏��������Ă��K�v�ł��B