--No15-2.EXCEPTION�����̃P�[�X
SET SERVEROUTPUT ON
BEGIN
  INSERT INTO dept(deptno, dname, loc)
  VALUES(40, 'CONSULTING', 'MANHATTAN');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('KEY VALUE IS DUPLICATED');
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter15\No15_2.sql
-- 22  /
--KEY VALUE IS DUPLICATED
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>