--No16-2.STORED PROCEDURE
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE raise_salary(a_empno NUMBER, a_amt NUMBER)
IS
BEGIN
  IF a_amt IS NOT NULL
  THEN
    UPDATE emp SET sal = sal + a_amt
    WHERE empno = a_empno;
  END IF;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter16\No16_2.sql
-- 20  /
--
--プロシージャが作成されました。
--
--SQL>