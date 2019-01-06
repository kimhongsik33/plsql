--No11-7.NESTED TABLE Collection (BULK COLLECT)
SET SERVEROUTPUT ON
DECLARE
  TYPE string_array IS TABLE OF VARCHAR2(100);
  v_arr string_array;
  
BEGIN
  --テーブルempすべてのレコードのenameをNESTED TABLE Collectionに一回で保存する。
  SELECT ename
    BULK COLLECT INTO v_arr
    FROM emp;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of NESTED TABLE Collection：'||v_arr.COUNT);
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_7.sql
-- 25  /
--A Number Of NESTED TABLE Collection：15
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
