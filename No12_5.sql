--No12-5.�t�B�[���h���ׂẴt�B�[���h���������ɏ��������邽�߁A�g�p�Ғ�`FUNCTION���g�p����B
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_rec IS RECORD(
    empno  emp.empno%TYPE,
    ename  emp.ename%TYPE
  );
  
  v_emp emp_rec;
  
  FUNCTION make_emp_rec(a_empno emp.empno%TYPE, a_ename emp.ename%TYPE) RETURN emp_rec
  IS
    v_rec emp_rec;
  BEGIN
    v_rec.empno := a_empno;
    v_rec.ename := a_ename;
    RETURN v_rec;
  END;
  
BEGIN
  v_emp := make_emp_rec('9000','HONG');
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter12\No12_5.sql
-- 38  /
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
