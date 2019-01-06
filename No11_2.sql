--No11-2.Associative Array Collection (BULK COLLECT)
SET SERVEROUTPUT ON
DECLARE
  --整数をINDEXとするAsscociative Arrayタイプを宣言
  TYPE string_array IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
  v_arr string_array;
  
BEGIN
  --テーブルempすべてのレコードのenameをAsscociative Array Collectionに一回で保存する。
  SELECT ename
    BULK COLLECT INTO v_arr
    FROM emp;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of Asscociative Array Collection：'||v_arr.COUNT);
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_2.sql
-- 26  /
--A Number Of Asscociative Array Collection：15
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
