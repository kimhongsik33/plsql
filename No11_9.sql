--No11-9.LIMIT�L�[���[�h�Ȃ��BSAMPLE�y��FETCH FIRST���g�p����SELECT�����𐧌�����B
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_tab_type IS TABLE OF emp%ROWTYPE;
  v_emp emp_tab_type;
  
BEGIN
  --SAMPLE
  SELECT *
    BULK COLLECT INTO v_emp
    FROM emp SAMPLE(10);
  
  DBMS_OUTPUT.PUT_LINE('A Number Of SAMPLE�F'||v_emp.COUNT);
  
  --FETCH FIRST(Version11.2�ȉ��ł�Compile Error)
  SELECT *
    BULK COLLECT INTO v_emp
    FROM emp
  FETCH FIRST 10 ROWS ONLY;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of FETCH FIRST 10�F'||v_emp.COUNT);
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter11\No11_9.sql
-- 34  /
--  FETCH FIRST 10 ROWS ONLY;
--             *
--�s17�ŃG���[���������܂����B:
--ORA-06550: �s17�A��9:
--PL/SQL: ORA-00933: SQL�R�}���h���������I������Ă��܂���B
--ORA-06550: �s14�A��3:
--PL/SQL: SQL Statement ignored
--
--
--SQL>
