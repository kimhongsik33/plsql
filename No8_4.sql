--No8-4.DECODE��CASE���ɕς��ď���
SET SERVEROUTPUT ON
DECLARE
  v_NUM NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_NUM || '��' || 
                                 CASE MOD(v_NUM,2) WHEN 0 THEN '����'
                                                   ELSE '�' END
                       );
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter8\No8_4.sql
-- 22  /
--1�͊
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B