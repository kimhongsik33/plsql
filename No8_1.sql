--No8-1.SIMPLE CASE Expression
SET SERVEROUTPUT ON
DECLARE
  v_BOOL BOOLEAN := TRUE;
  v_STR  STRING(100);
BEGIN
  v_STR := CASE v_BOOL WHEN TRUE  THEN 'v_BOOL is TRUE'
                       WHEN FALSE THEN 'v_BOOL is FALSE'
                       ELSE            'v_BOOL is NULL'
           END;
  DBMS_OUTPUT.PUT_LINE(v_STR);
END;


--以下、結果

--Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
--に接続されました。
--SQL> @C:\kim\tech\plsql\Chapter8\No8_1.sql
-- 24  /
--v_BOOL is TRUE
--
--PL/SQLプロシージャが正常に完了しました。