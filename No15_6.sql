--No15-6.EXCEPTIONを特定Error番号と紐づく(PRAGMA EXCEPTION_INIT)
SET SERVEROUTPUT ON
DECLARE
  invalide_date EXCEPTION;
  PRAGMA EXCEPTION_INIT(invalide_date, -1847); --ORA-01847
  v_date DATE;  
BEGIN
  v_date := TO_DATE('2000-12-32', 'YYYY-MM-DD');
EXCEPTION
  WHEN invalide_date THEN
    DBMS_OUTPUT.PUT_LINE('日付Errorが検出されました。');
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter15\No15_6.sql
-- 23  /
--日付Errorが検出されました。
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>