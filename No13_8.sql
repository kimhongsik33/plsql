--No13-8.Weak TypeのCURSOR変数は返還Typeが異なるSQLについても使用できる。
SET SERVEROUTPUT ON
DECLARE
  v_cursor   SYS_REFCURSOR;
  v_selector CHAR;
  v_deptno   NUMBER;
  
  --a_selector 値によって、異なる数とTypeを返還するSELECT文を利用してCURSORをOPENする。
  PROCEDURE open_cursor(a_cursor IN OUT SYS_REFCURSOR, a_selector CHAR, a_deptno NUMBER) IS
  BEGIN
    IF a_selector = 'E' THEN
      OPEN a_cursor FOR SELECT * FROM emp WHERE deptno = a_deptno;
    ELSE
      OPEN a_cursor FOR SELECT * FROM dept WHERE deptno = a_deptno;
    END IF;
  END;
  
  --a_selector 値によって、異なる数とTypeを返還するCURSOR変数からそれぞれのColumnをPrintする。
  PROCEDURE print_cursor(a_cursor IN OUT SYS_REFCURSOR, a_selector CHAR) IS
    v_emprec  emp%ROWTYPE;
    v_deptrec dept%ROWTYPE;
  BEGIN
    IF a_selector = 'E' THEN
      LOOP
        FETCH a_cursor INTO v_emprec;
        EXIT WHEN a_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('EMPNO='||v_emprec.empno||', ENAME='||v_emprec.ename||', JOB='||v_emprec.job||', SAL='||v_emprec.sal);
      END LOOP;
    ELSE
      LOOP
        FETCH a_cursor INTO v_deptrec;
        EXIT WHEN a_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('EMPNO='||v_deptrec.deptno||', DNAME='||v_deptrec.dname||', LOC='||v_deptrec.loc);
      END LOOP;
    END IF;
  END;
  
BEGIN
  v_selector := 'D';
  v_deptno := 10;
  
  open_cursor(v_cursor, v_selector, v_deptno);
  print_cursor(v_cursor, v_selector);
  CLOSE v_cursor;
  
  DBMS_OUTPUT.PUT_LINE('---------');
  
  v_selector := 'E';
  v_deptno := 10;
  
  open_cursor(v_cursor, v_selector, v_deptno);
  print_cursor(v_cursor, v_selector);
  CLOSE v_cursor;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter13\No13_8.sql
-- 78  /
--EMPNO=10, DNAME=ACCOUNTING, LOC=NEW YORK
-----------
--EMPNO=7782, ENAME=CLARK, JOB=MANAGER, SAL=2450
--EMPNO=7839, ENAME=KING, JOB=PRESIDENT, SAL=5000
--EMPNO=7934, ENAME=MILLER, JOB=CLERK, SAL=1300
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>