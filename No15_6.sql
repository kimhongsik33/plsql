--No15-6.EXCEPTION�����Error�ԍ��ƕR�Â�(PRAGMA EXCEPTION_INIT)
SET SERVEROUTPUT ON
DECLARE
  invalide_date EXCEPTION;
  PRAGMA EXCEPTION_INIT(invalide_date, -1847); --ORA-01847
  v_date DATE;  
BEGIN
  v_date := TO_DATE('2000-12-32', 'YYYY-MM-DD');
EXCEPTION
  WHEN invalide_date THEN
    DBMS_OUTPUT.PUT_LINE('���tError�����o����܂����B');
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter15\No15_6.sql
-- 23  /
--���tError�����o����܂����B
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>