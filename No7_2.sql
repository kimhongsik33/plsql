--No7-2.TYPE���ႤNULL��ERROR����������
SET SERVEROUTPUT ON
DECLARE
  v_num  NUMBER  := NULL;
  v_bool BOOLEAN := NULL;
BEGIN
  --NUMBER�^LITERAL��NULL��BOOLEAN�^LITERAL��NULL�͂��݂���v���Ȃ��B
  --������IF�����R���p�C��ERROR����������B
  IF v_num = v_bool THEN
    DBMS_OUTPUT.PUT_LINE('NULL NUMBER = NULL BOOLEAN');
  END IF;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter7\No7_2.sql
-- 24  /
--    DBMS_OUTPUT.PUT_LINE('NULL NUMBER = NULL BOOLEAN');
--                 *
--�s8�ŃG���[���������܂����B:
--ORA-06550: �s7�A��12:
--PLS-00306: '='�̌ďo���ŁA�����̐��܂��͌^������������܂���B
--ORA-06550: �s7�A��3:
--PL/SQL: Statement ignored
