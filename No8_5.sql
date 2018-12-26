--No8-5.DECODE文はPLSQL内の内部SQLでは使用できる。
SET SERVEROUTPUT ON
DECLARE
  v_NUM NUMBER := 1;
  v_TYPE STRING(10);
BEGIN
  SELECT DECODE(MOD(v_NUM,2),0,'偶数','奇数')
    INTO v_TYPE
  FROM DUAL;
  DBMS_OUTPUT.PUT_LINE(v_NUM || 'は' || v_TYPE || 'です。');
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter8\No8_5.sql
-- 23  /
--1は奇数です。
--
--PL/SQLプロシージャが正常に完了しました。