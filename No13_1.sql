--No13-1.LOOP文を使用して複数件をFETCH
SET SERVEROUTPUT ON
DECLARE
  v_empno NUMBER;
  v_ename emp.ename%TYPE;
  
  CURSOR ename_cursor IS
  SELECT empno, ename FROM emp ORDER BY empno;

BEGIN
  OPEN ename_cursor;
  
  LOOP
    FETCH ename_cursor INTO v_empno, v_ename;
    EXIT WHEN ename_cursor%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('EMPNO='||v_empno|| ', ENAME='||v_ename );
  END LOOP;
  
  CLOSE ename_cursor;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter13\No13_1.sql
-- 33  /
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