--No9-1.SELECT %ROWTYPE
SET SERVEROUTPUT ON
DECLARE
  v_emprec emp%ROWTYPE;
BEGIN
  v_emprec.empno := 7788;
  SELECT *
    INTO v_emprec
    FROM emp
  WHERE empno = v_emprec.empno;
  DBMS_OUTPUT.PUT_LINE('NAME   :'|| v_emprec.ename);
  DBMS_OUTPUT.PUT_LINE('DEPTNO :'|| v_emprec.deptno);
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter9\No9_1.sql
-- 23  /
--NAME   :SCOTT
--DEPTNO :20
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
