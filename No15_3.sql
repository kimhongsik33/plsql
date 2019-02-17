--No15-3.NO_DATA_FOUND EXCEPTION処理のケース
SET SERVEROUTPUT ON
DECLARE
  v_empno emp.empno%TYPE := 1000;
  v_ename emp.ename%TYPE;
BEGIN
  SELECT ename INTO v_ename
  FROM emp
  WHERE empno = v_empno;
  DBMS_OUTPUT.PUT_LINE('社員番号'||v_empno||'の名前は'||v_ename||'です。');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('社員番号'||v_empno||'の名前は'||v_ename||'存在していません。');
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter15\No15_3.sql
-- 24  /
--社員番号1000の名前は存在していません。
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>