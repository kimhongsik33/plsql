--No15-4.TOO_MANY_ROWS EXCEPTION処理のケース
SET SERVEROUTPUT ON
DECLARE
  v_empno emp.empno%TYPE;
  v_ename emp.ename%TYPE;
BEGIN
  SELECT empno, ename INTO v_empno, v_ename
  FROM emp
  WHERE empno >= 7900;
  DBMS_OUTPUT.PUT_LINE('社員番号'||v_empno||'の名前は'||v_ename||'です。');
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('取得件巣が1件より多いです。');
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter15\No15_4.sql
-- 24  /
--取得件巣が1件より多いです。
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>