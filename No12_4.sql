--No12-4.�t�B�[���h�����ꂾ�Ƃ��Ă�TYPE�����قȂ郌�R�[�h�ɂ́u:���v���Z���s�\
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_rec1 IS RECORD(
    empno  emp.empno%TYPE,
    ename  emp.ename%TYPE
  );
  
  TYPE emp_rec2 IS RECORD(
    empno  emp.empno%TYPE,
    ename  emp.ename%TYPE
  );
  
  v_emp1 emp_rec1;
  v_emp2 emp_rec2;
  
BEGIN
  v_emp1 := v_emp2; --�t�B�[���h�̃f�[�^�^�C�v�����ꂾ�Ƃ��Ă����R�[�h�^�C�v���قȂ邽��Error
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter12\No12_4.sql
-- 43  /
--  v_emp1 := v_emp2; --�t�B�[���h�̃f�[�^�^�C�v�����ꂾ�Ƃ��Ă����R�[�h�^�C�v���قȂ邽��Error
--            *
--�s16�ŃG���[���������܂����B:
--ORA-06550: �s16�A��13:
--PLS-00382: ���̌^������������܂���B
--ORA-06550: �s16�A��3:
--PL/SQL: Statement ignored
--
--
--SQL>
