--No9-6.暗黙的COMMIT
SET SERVEROUTPUT ON

DECLARE
  v_org_sal NUMBER := 5000;
BEGIN
  DELETE FROM emp WHERE empno = 9000;
  COMMIT;
  
  INSERT INTO emp (empno, ename, hiredate, sal) VALUES (9000, 'HONG', SYSDATE, v_org_sal);
  SAVEPOINT p1;
  
  UPDATE emp SET sal = sal + 100 WHERE empno = 9000;
  SAVEPOINT p2;
  
  BEGIN
    INSERT INTO emp (empno, ename, hiredate, sal) VALUES (9000, 'SIK', SYSDATE, v_org_sal);
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR IS OCCURED : ' ||SQLERRM);
    ROLLBACK TO p1;
  END;
  COMMIT;
  
  DECLARE
    v_sal NUMBER;
  BEGIN
    SELECT sal INTO v_sal FROM emp WHERE empno = 9000;
    DBMS_OUTPUT.PUT_LINE('SAL : '||v_sal);
    IF v_org_sal <> v_sal THEN
      DBMS_OUTPUT.PUT_LINE('salary is changed ');
    ELSE
      DBMS_OUTPUT.PUT_LINE('salary is not changed ');
    END IF;
  END;
END;

--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter9\No9_7.sql
-- 43  /
--ERROR IS OCCURED : ORA-00001: 一意制約(SCOTT.EMP_PK)に反しています
--SAL : 5000
--salary is not changed
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
