--No15-5.OTHERS EXCEPTION処理のケース
SET SERVEROUTPUT ON
DECLARE
  v_ename emp.ename%TYPE NOT NULL := ' ';
  v_mgr   emp.mgr  %TYPE NOT NULL := -1;
  v_code  NUMBER;
  v_errm  VARCHAR2(64);
BEGIN
  SELECT ename, mgr INTO v_ename, v_mgr
  FROM emp
  WHERE empno = 'KING';
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('社員が存在していません。');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('取得件巣が1件より多いです。');
  WHEN OTHERS THEN
    v_code := SQLCODE;
    v_errm := SUBSTR(SQLERRM, 1, 64);
    DBMS_OUTPUT.PUT_LINE('EXCEPTIONが発生しました。');
    DBMS_OUTPUT.PUT_LINE('Error Code：'||v_code||':'||v_errm);
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter15\No15_5.sql
-- 32  /
--EXCEPTIONが発生しました。
--Error Code：-1722:ORA-01722: 数値が無効です。
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>