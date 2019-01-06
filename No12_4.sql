--No12-4.フィールドが同一だとしてもTYPE名が異なるレコードには「:＝」演算が不可能
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
  v_emp1 := v_emp2; --フィールドのデータタイプが同一だとしてもレコードタイプが異なるためError
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter12\No12_4.sql
-- 43  /
--  v_emp1 := v_emp2; --フィールドのデータタイプが同一だとしてもレコードタイプが異なるためError
--            *
--行16でエラーが発生しました。:
--ORA-06550: 行16、列13:
--PLS-00382: 式の型が正しくありません。
--ORA-06550: 行16、列3:
--PL/SQL: Statement ignored
--
--
--SQL>
