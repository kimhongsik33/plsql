--No9-3.UPDATE %ROWTYPE
SET SERVEROUTPUT ON
DECLARE
  v_emprec emp%ROWTYPE;
BEGIN
  v_emprec.empno    := 9000;
  
  SELECT *
    INTO v_emprec
  FROM emp
  WHERE empno = v_emprec.empno;
  
  v_emprec.ename  := 'HONG';
  v_emprec.deptno := 40;
  
  UPDATE emp
    SET ROW = v_emprec
  WHERE empno = v_emprec.empno;
  
  COMMIT;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter9\No9_3.sql
-- 32  /
--
--PL/SQLプロシージャが正常に完了しました。
--SQL> select * from emp where empno = 9000;
--
--     EMPNO ENAME                JOB                       MGR HIREDATE
------------ -------------------- ------------------ ---------- --------
--       SAL       COMM     DEPTNO
------------ ---------- ----------
--      9000 HONG                                               18-12-31
--                              40
--
--
--SQL>