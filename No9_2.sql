--No9-2.INSERT %ROWTYPE
DELETE FROM emp WHERE empno = 9000;

SET SERVEROUTPUT ON
DECLARE
  v_emprec emp%ROWTYPE;
BEGIN
  v_emprec.empno    := 9000;
  v_emprec.ename    := 'KIM';
  v_emprec.deptno   := 30;
  v_emprec.hiredate := SYSDATE;
  
  INSERT INTO emp
  VALUES v_emprec;
  
  DBMS_OUTPUT.PUT_LINE('a number of INSERTs  :'|| SQL%ROWCOUNT);
  COMMIT;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter9\No9_2.sql
--
--0行が削除されました。
--
-- 24  /
--a number of INSERTs  :1
--
--PL/SQLプロシージャが正常に完了しました。