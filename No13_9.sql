--No13-9.SELECT FOR UPDATE
SET SERVEROUTPUT ON
DECLARE
  CURSOR emp_cursor IS
    SELECT empno, ename, job, sal
    FROM emp
    WHERE sal < 1500
    FOR UPDATE; --検索と同時にLockが掛かる。  
BEGIN
  FOR e IN emp_cursor
  LOOP
    IF e.job = 'SALESMAN' THEN
      UPDATE emp
        SET comm = comm * 1.1
      WHERE CURRENT OF emp_cursor; --現在CURSORが位置されているROWのみUPDATEする。
    END IF;
  END LOOP;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter13\No13_9.sql
-- 32  /
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>