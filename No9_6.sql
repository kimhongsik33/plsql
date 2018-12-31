--No9-6.�ÖٓICOMMIT
SET SERVEROUTPUT ON

BEGIN
  DELETE FROM emp WHERE empno = 9000;
  COMMIT;
  
  INSERT INTO emp (empno, ename, hiredate, sal) VALUES (9000, 'HONG', SYSDATE, 9000);
  UPDATE emp SET sal = sal + 100 WHERE empno = 9000;
  EXECUTE IMMEDIATE 'CREATE TABLE t(C1 NUMBER)';
  ROLLBACK;
  
  DECLARE
    v_sal NUMBER;
  BEGIN
    SELECT sal INTO v_sal FROM emp WHERE empno = 9000;
  DBMS_OUTPUT.PUT_LINE('SAL='||v_sal);
  END;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter9\No9_6.sql
-- 30  /
--SAL=9100
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
