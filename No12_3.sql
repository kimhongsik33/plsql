--No12-3.RECORD変数は一つのみ使用でき、ほかの変数と一緒に使えない。
SET SERVEROUTPUT ON
DECLARE
  --TABLE empの一部カラムをレコードとして宣言
  TYPE emp_basic_info_type IS RECORD(
    empno    emp.empno    %TYPE,
    ename    emp.ename    %TYPE,
    job      emp.job      %TYPE,
    mgr      emp.mgr      %TYPE,
    hiredate emp.hiredate %TYPE,
    deptno   emp.deptno   %TYPE
  );

  --TABLE empの残りカラムをレコードとして宣言
  TYPE emp_salary_info_type IS RECORD(
    sal      emp.sal      %TYPE,
    comm     emp.comm     %TYPE
  );
  
  --RECORD変数
  v_emp_basic  emp_basic_info_type;
  v_emp_salary emp_salary_info_type;
  
  --SCALA変数
  v_sal      emp.sal      %TYPE;
  v_comm     emp.comm     %TYPE;
  
BEGIN
  --２つのレコード変数をINTO文に使用できない。
  SELECT empno, ename, job, mgr, hiredate, deptno, sal, comm
    INTO v_emp_basic, v_emp_salary
    FROM emp
  WHERE empno = 7788;
  
  --Scala変数とレコード変数をINTO文に使用できない。
  SELECT empno, ename, job, mgr, hiredate, deptno, sal, comm
    INTO v_emp_basic, v_sal, v_comm
    FROM emp
  WHERE empno = 7788;
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter12\No12_3.sql
-- 53  /
--  SELECT empno, ename, job, mgr, hiredate, deptno, sal, comm
--                                                         *
--行28でエラーが発生しました。:
--ORA-06550: 行28、列3:
--PLS-00494: 複数レコード・ターゲットへの強制はサポートされません。
--ORA-06550: 行30、列5:
--PL/SQL: ORA-00904: : 無効な識別子です。
--ORA-06550: 行28、列3:
--PL/SQL: SQL Statement ignored
--ORA-06550: 行34、列3:
--PLS-00494: 複数レコード・ターゲットへの強制はサポートされません。
--ORA-06550: 行36、列5:
--PL/SQL: ORA-00904: : 無効な識別子です。
--ORA-06550: 行34、列3:
--PL/SQL: SQL Statement ignored
--
--
--SQL>
