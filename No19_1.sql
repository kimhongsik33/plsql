--No19-1.PACKAGE SPECIFICATION
SET SERVEROUTPUT ON
CREATE OR REPLACE PACKAGE pkg_emp 
IS
  TYPE emp_type IS TABLE OF emp%ROWTYPE;
  
  c_deptno_accounting CONSTANT NUMBER := 10;
  c_deptno_research   CONSTANT NUMBER := 20;
  c_deptno_sales      CONSTANT NUMBER := 30;
  c_deptno_operations CONSTANT NUMBER := 40;
  
  v_last_wage NUMBER;
  
  FUNCTION  get_wage(a_empno NUMBER) RETURN NUMBER;
  PROCEDURE raise_bonus(a_empno NUMBER, a_amt NUMBER);
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter19\No19_1.sql
-- 25  /
--
--パッケージが作成されました。
--
--SQL>