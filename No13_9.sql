--No13-9.SELECT FOR UPDATE
SET SERVEROUTPUT ON
DECLARE
  CURSOR emp_cursor IS
    SELECT empno, ename, job, sal
    FROM emp
    WHERE sal < 1500
    FOR UPDATE; --�����Ɠ�����Lock���|����B  
BEGIN
  FOR e IN emp_cursor
  LOOP
    IF e.job = 'SALESMAN' THEN
      UPDATE emp
        SET comm = comm * 1.1
      WHERE CURRENT OF emp_cursor; --����CURSOR���ʒu����Ă���ROW�̂�UPDATE����B
    END IF;
  END LOOP;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter13\No13_9.sql
-- 32  /
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>