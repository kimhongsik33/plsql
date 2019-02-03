--No13-7.CURSOR変数はParameterでSubProgramに渡すことができる。
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_rec IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );
  
  TYPE     emp_cursor_type IS REF CURSOR RETURN emp_rec;
  v_empcur emp_cursor_type; --CURSOR変数

  PROCEDURE print_emp(a_empcur emp_cursor_type) IS
    v_emprec emp_rec;
    
  BEGIN
    LOOP
      FETCH a_empcur INTO v_emprec;
      EXIT WHEN a_empcur%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emprec.empno||', ENAME='||v_emprec.ename);
    END LOOP;
  END;
BEGIN
  OPEN v_empcur FOR SELECT empno, ename FROM EMP;
  print_emp(v_empcur);
  CLOSE v_empcur;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter13\No13_7.sql
-- 41  /
--EMPNO=7369, ENAME=SMITH
--EMPNO=7499, ENAME=ALLEN
--EMPNO=7521, ENAME=WARD
--EMPNO=7566, ENAME=JONES
--EMPNO=7654, ENAME=MARTIN
--EMPNO=7698, ENAME=BLAKE
--EMPNO=7782, ENAME=CLARK
--EMPNO=7788, ENAME=SCOTT
--EMPNO=7839, ENAME=KING
--EMPNO=7844, ENAME=TURNER
--EMPNO=7876, ENAME=ADAMS
--EMPNO=7900, ENAME=JAMES
--EMPNO=7902, ENAME=FORD
--EMPNO=7934, ENAME=MILLER
--EMPNO=9000, ENAME=HONG
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>