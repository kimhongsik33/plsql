--No9-4.MERGE %ROWTYPE
SET SERVEROUTPUT ON
DECLARE
  v_emprec emp%ROWTYPE;
BEGIN
  SELECT * INTO v_emprec FROM emp WHERE empno = 7788;
  
  v_emprec.empno    := 9000;
  v_emprec.ename    := 'HONG';
  
  --MERGE
  MERGE INTO emp a
  USING DUAL
    ON (a.empno = v_emprec.empno)
  WHEN MATCHED THEN
    UPDATE
      SET a.comm = a.comm*1.1
  WHEN NOT MATCHED THEN
    INSERT
    VALUES v_emprec;
  
  DBMS_OUTPUT.PUT_LINE('a number of MERGE : ' || SQL%ROWCOUNT);
  COMMIT;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter9\No9_4.sql
-- 42  /
--a number of MERGE : 1
--
--PL/SQLプロシージャが正常に完了しました。
--
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
