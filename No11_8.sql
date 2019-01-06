--No11-8.LIMIT�L�[���[�h�Ȃ��B�S��SELECT�y��ROWNUM���g�p����SELECT�����𐧌�����B
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_rec IS TABLE OF emp%ROWTYPE;
  v_emp_arr emp_rec;
  
BEGIN

  SELECT *
    BULK COLLECT INTO v_emp_arr
    FROM emp;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of Table Row1�F'||v_emp_arr.COUNT);
  
  SELECT *
    BULK COLLECT INTO v_emp_arr
    FROM emp
  WHERE ROWNUM <= 10;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of Table Row2�F'||v_emp_arr.COUNT);
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter11\No11_8.sql
-- 32  /
--A Number Of Table Row1�F15
--A Number Of Table Row2�F10
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
