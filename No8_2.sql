--No8-2.Searched CASE Expression
SET SERVEROUTPUT ON
DECLARE
  v_BOOL BOOLEAN := TRUE;
  v_STR  STRING(100);
BEGIN
  v_STR := CASE
             WHEN v_BOOL = TRUE  THEN 'v_BOOL is TRUE'
             WHEN v_BOOL = FALSE THEN 'v_BOOL is FALSE'
             ELSE                     'v_BOOL is NULL'
           END;
  DBMS_OUTPUT.PUT_LINE(v_STR);
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter8\No8_2.sql
-- 23  /
--v_BOOL is TRUE
--
--PL/SQLプロシージャが正常に完了しました。