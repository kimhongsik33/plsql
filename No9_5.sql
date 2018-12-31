--No9-5.RETURNING INTO
SET SERVEROUTPUT ON
DECLARE
  c_hiredate DATE := DATE'2016-01-02';
  v_empno  emp.empno %TYPE;
  v_ename  emp.ename %TYPE;
  v_hiredate emp.hiredate %TYPE;
BEGIN
  DELETE FROM emp WHERE empno = 9000;
  
  INSERT INTO emp (empno, ename, hiredate, deptno)
    VALUES (9000, 'HONG', c_hiredate, 40)
  RETURNING empno, ename, hiredate
    INTO    v_empno, v_ename, v_hiredate;
  DBMS_OUTPUT.PUT_LINE('INSERT EMPLOYEE=('||v_empno||','||v_ename||','||TO_CHAR(v_hiredate,'YYYY-MM-DD')||')');
  
  UPDATE emp
    SET hiredate = c_hiredate
  WHERE empno = v_empno
  RETURNING empno, ename, hiredate
    INTO    v_empno, v_ename, v_hiredate;
  DBMS_OUTPUT.PUT_LINE('UPDATE EMPLOYEE=('||v_empno||','||v_ename||','||TO_CHAR(v_hiredate,'YYYY-MM-DD')||')');
  
  DELETE FROM emp WHERE empno = v_empno
  RETURNING empno, ename, hiredate
    INTO    v_empno, v_ename, v_hiredate;
  DBMS_OUTPUT.PUT_LINE('DELETE EMPLOYEE=('||v_empno||','||v_ename||','||TO_CHAR(v_hiredate,'YYYY-MM-DD')||')');

  COMMIT;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter9\No9_5.sql
-- 50  /
--INSERT EMPLOYEE=(9000,HONG,2016-01-02)
--UPDATE EMPLOYEE=(9000,HONG,2016-01-02)
--DELETE EMPLOYEE=(9000,HONG,2016-01-02)
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
