--No15-1.EXCEPTION�������̃P�[�X
SET SERVEROUTPUT ON
BEGIN
  INSERT INTO dept(deptno, dname, loc)
  VALUES(40, 'CONSULTING', 'MANHATTAN');
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter15\No15_1.sql
-- 18  /
--BEGIN
--*
--�s1�ŃG���[���������܂����B:
--ORA-00001: ��Ӑ���(SCOTT.DEPT_PK)�ɔ����Ă��܂�
--ORA-06512: �s2
--
--
--SQL>