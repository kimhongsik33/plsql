--No19-2.PACKAGE BODY
SET SERVEROUTPUT ON
CREATE OR REPLACE PACKAGE BODY pkg_emp 
IS
  c_null_commission    CONSTANT NUMBER := 0;
  c_failed_return_wage CONSTANT NUMBER := -1;
  
  CURSOR emp_cursor(a_empno NUMBER) IS
    SELECT sal + NVL(comm, c_null_commission) comm
    FROM emp
    WHERE empno = a_empno;
  
  FUNCTION get_wage(a_empno NUMBER) RETURN NUMBER
  IS
  BEGIN
    FOR rec IN emp_cursor(a_empno)
    LOOP
      v_last_wage := rec.comm;
      return rec.comm;
    END LOOP;
    RETURN c_failed_return_wage;
  END;
  
  PROCEDURE raise_bonus(a_empno NUMBER, a_amt NUMBER)
  IS
    v_ename emp.ename%TYPE;
  BEGIN
    BEGIN
      SELECT ename INTO v_ename
      FROM emp
      WHERE empno = a_empno;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
      RETURN;
    END;
    
    IF a_amt IS NOT NULL
    THEN
      MERGE INTO bonus
      USING DUAL
        ON (bonus.ename = v_ename)
      WHEN MATCHED THEN
        UPDATE SET comm = comm + a_amt
      WHEN NOT MATCHED THEN
        INSERT (ename, comm)
        VALUES (v_ename, a_amt);
    END IF;
  END;
  
BEGIN
  v_last_wage := -1;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter19\No19_2.sql
-- 61  /
--
--パッケージ本体が作成されました。
--
--SQL> show err
--エラーはありません。
--SQL>