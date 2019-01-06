--No12-1.Record使用
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_type IS RECORD(
    empno  NUMBER(4) NOT NULL := 0,
    ename  emp.ename%TYPE,
    job    VARCHAR2(9)
  );
  v_emp emp_type;
  
BEGIN
  v_emp.empno := 9000;
  v_emp.ename := 'HONG';
  v_emp.job := 'Engineer';
  
  DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emp.empno);
  DBMS_OUTPUT.PUT_LINE('ENAME='||v_emp.ename);
  DBMS_OUTPUT.PUT_LINE('JOB='||v_emp.job);
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter12\No12_1.sql
-- 30  /
--EMPNO=9000
--ENAME=HONG
--JOB=Engineer
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
