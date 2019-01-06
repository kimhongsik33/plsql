--No12-3.RECORD�ϐ��͈�̂ݎg�p�ł��A�ق��̕ϐ��ƈꏏ�Ɏg���Ȃ��B
SET SERVEROUTPUT ON
DECLARE
  --TABLE emp�̈ꕔ�J���������R�[�h�Ƃ��Đ錾
  TYPE emp_basic_info_type IS RECORD(
    empno    emp.empno    %TYPE,
    ename    emp.ename    %TYPE,
    job      emp.job      %TYPE,
    mgr      emp.mgr      %TYPE,
    hiredate emp.hiredate %TYPE,
    deptno   emp.deptno   %TYPE
  );

  --TABLE emp�̎c��J���������R�[�h�Ƃ��Đ錾
  TYPE emp_salary_info_type IS RECORD(
    sal      emp.sal      %TYPE,
    comm     emp.comm     %TYPE
  );
  
  --RECORD�ϐ�
  v_emp_basic  emp_basic_info_type;
  v_emp_salary emp_salary_info_type;
  
  --SCALA�ϐ�
  v_sal      emp.sal      %TYPE;
  v_comm     emp.comm     %TYPE;
  
BEGIN
  --�Q�̃��R�[�h�ϐ���INTO���Ɏg�p�ł��Ȃ��B
  SELECT empno, ename, job, mgr, hiredate, deptno, sal, comm
    INTO v_emp_basic, v_emp_salary
    FROM emp
  WHERE empno = 7788;
  
  --Scala�ϐ��ƃ��R�[�h�ϐ���INTO���Ɏg�p�ł��Ȃ��B
  SELECT empno, ename, job, mgr, hiredate, deptno, sal, comm
    INTO v_emp_basic, v_sal, v_comm
    FROM emp
  WHERE empno = 7788;
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter12\No12_3.sql
-- 53  /
--  SELECT empno, ename, job, mgr, hiredate, deptno, sal, comm
--                                                         *
--�s28�ŃG���[���������܂����B:
--ORA-06550: �s28�A��3:
--PLS-00494: �������R�[�h�E�^�[�Q�b�g�ւ̋����̓T�|�[�g����܂���B
--ORA-06550: �s30�A��5:
--PL/SQL: ORA-00904: : �����Ȏ��ʎq�ł��B
--ORA-06550: �s28�A��3:
--PL/SQL: SQL Statement ignored
--ORA-06550: �s34�A��3:
--PLS-00494: �������R�[�h�E�^�[�Q�b�g�ւ̋����̓T�|�[�g����܂���B
--ORA-06550: �s36�A��5:
--PL/SQL: ORA-00904: : �����Ȏ��ʎq�ł��B
--ORA-06550: �s34�A��3:
--PL/SQL: SQL Statement ignored
--
--
--SQL>
