--No8-5.DECODE����PLSQL���̓���SQL�ł͎g�p�ł���B
SET SERVEROUTPUT ON
DECLARE
  v_NUM NUMBER := 1;
  v_TYPE STRING(10);
BEGIN
  SELECT DECODE(MOD(v_NUM,2),0,'����','�')
    INTO v_TYPE
  FROM DUAL;
  DBMS_OUTPUT.PUT_LINE(v_NUM || '��' || v_TYPE || '�ł��B');
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter8\No8_5.sql
-- 23  /
--1�͊�ł��B
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B