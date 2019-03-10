--No18-1.STORED PROCEDUREのSTRUNCTURE
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE raise_bonus(a_empno NUMBER, a_amt NUMBER) 
IS
  v_ename emp.ename%TYPE; 
BEGIN
  BEGIN
    SELECT ename INTO v_ename FROM emp WHERE empno = a_empno;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RETURN; --RETURN値がない
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


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter18\No18_1.sql
-- 34  /
--
--プロシージャが作成されました。
--
--SQL>