--No12-2.RECORD�̃t�B�[���h����SELECT�̃J�������ƈ�v���Ȃ��Ă����Ȃ�
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_type IS RECORD(
    emp_no    NUMBER(4) NOT NULL := 0,
    emp_name  emp.ename%TYPE,
    job       VARCHAR2(9)
  );
  v_emp emp_type;
  
BEGIN
  SELECT empno, ename, job
    INTO v_emp
    FROM emp
  WHERE empno = 7788;
  
  DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emp.emp_no);
  DBMS_OUTPUT.PUT_LINE('ENAME='||v_emp.emp_name);
  DBMS_OUTPUT.PUT_LINE('JOB='||v_emp.job);
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter12\No12_2.sql
-- 33  /
--EMPNO=7788
--ENAME=SCOTT
--JOB=ANALYST
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
