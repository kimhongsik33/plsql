--No13-6.String Type CURSOR変数は返還方が一致するとどんなSELECT文でもOPENできる。
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_rec IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE,
    sal   emp.sal%TYPE
  );
  v_emprec emp_rec; --FETCH結果を保存するレコード変数
  TYPE     emp_cursor_type IS REF CURSOR RETURN emp_rec;
  v_empcur emp_cursor_type; --CURSOR変数

BEGIN
  OPEN v_empcur FOR SELECT empno, ename, sal FROM EMP WHERE deptno = 10;
  LOOP
    FETCH v_empcur INTO v_emprec;
    EXIT WHEN v_empcur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emprec.empno||', ENAME='||v_emprec.ename||', SAL='||v_emprec.sal);
  END LOOP;
  CLOSE v_empcur;
  
  DBMS_OUTPUT.PUT_LINE(' ');
  
  OPEN v_empcur FOR SELECT empno, ename, sal+NVL(comm,0) FROM EMP WHERE deptno = 20;
  LOOP
    FETCH v_empcur INTO v_emprec;
    EXIT WHEN v_empcur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emprec.empno||', ENAME='||v_emprec.ename||', SAL='||v_emprec.sal);
  END LOOP;
  CLOSE v_empcur;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter13\No13_6.sql
-- 40  /
--EMPNO=7782, ENAME=CLARK, SAL=2450
--EMPNO=7839, ENAME=KING, SAL=5000
--EMPNO=7934, ENAME=MILLER, SAL=1300
--EMPNO=7369, ENAME=SMITH, SAL=800
--EMPNO=7566, ENAME=JONES, SAL=2975
--EMPNO=7788, ENAME=SCOTT, SAL=3000
--EMPNO=7876, ENAME=ADAMS, SAL=1100
--EMPNO=7902, ENAME=FORD, SAL=3000
--
--PL/SQLプロシージャが正常に完了しました。