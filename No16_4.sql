--No16-4.PLSQL���g�p������@
SET SERVEROUTPUT ON
DECLARE
  v_wage  NUMBER;
  v_wage2 NUMBER;
BEGIN
  v_wage  := get_wage(7654);
  v_wage2 := 100 + get_wage(7654);
  
  DBMS_OUTPUT.PUT_LINE('SALARY:'||get_wage(7654));
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter16\No16_4.sql
-- 20  /
--SALARY:2650
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>