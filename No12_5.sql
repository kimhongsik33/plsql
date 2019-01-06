--No12-5.フィールドすべてのフィールドをいっきに初期化するため、使用者定義FUNCTIONを使用する。
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


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter12\No12_5.sql
-- 38  /
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
