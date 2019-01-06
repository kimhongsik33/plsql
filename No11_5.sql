--No11-5.VARRAY Collection (BULK COLLECT)
SET SERVEROUTPUT ON
DECLARE
  TYPE string_array IS VARRAY(20) OF VARCHAR2(100);
  v_arr string_array;
  
BEGIN
  --テーブルempすべてのレコードのenameをVARRAY Collectionに一回で保存する。
  SELECT ename
    BULK COLLECT INTO v_arr
    FROM emp
  WHERE ROWNUM <= 20;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of VARRAY Collection：'||v_arr.COUNT);
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_5.sql
-- 26  /
--A Number Of VARRAY Collection：15
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
