--No7-2.TYPEが違うNULLはERRORが発生する
SET SERVEROUTPUT ON
DECLARE
  v_num  NUMBER  := NULL;
  v_bool BOOLEAN := NULL;
BEGIN
  --NUMBER型LITERALのNULLとBOOLEAN型LITERALのNULLはお互い一致しない。
  --→次のIF文をコンパイルERRORが発生する。
  IF v_num = v_bool THEN
    DBMS_OUTPUT.PUT_LINE('NULL NUMBER = NULL BOOLEAN');
  END IF;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter7\No7_2.sql
-- 24  /
--    DBMS_OUTPUT.PUT_LINE('NULL NUMBER = NULL BOOLEAN');
--                 *
--行8でエラーが発生しました。:
--ORA-06550: 行7、列12:
--PLS-00306: '='の呼出しで、引数の数または型が正しくありません。
--ORA-06550: 行7、列3:
--PL/SQL: Statement ignored
