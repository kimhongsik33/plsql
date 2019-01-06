--No11-1.Associative Array Collection
SET SERVEROUTPUT ON
DECLARE
  --整数をINDEXとするAsscociative Arrayタイプを宣言
  TYPE city IS TABLE OF VARCHAR2(64) INDEX BY PLS_INTEGER;
  
  --StringをIndexとするAsscociative Arrayタイプを宣言
  Type population IS TABLE OF NUMBER INDEX BY VARCHAR(64);
  
  v_city       city;
  v_population population;
  
BEGIN
  v_city(-1) := 'SEOUL';
  v_city(0)  := 'TOKYO';
  v_city(2)  := 'PARIS';
  
  v_population('SEOUL') := 10373234;
  v_population('TOKYO') := 3812392;
  v_population('PARIS') := 1390510;
  
  DBMS_OUTPUT.PUT_LINE(v_city(-1)||':'||TO_CHAR(v_population(v_city(-1)), '99,999,999'));
  DBMS_OUTPUT.PUT_LINE(v_city(0)||':'||TO_CHAR(v_population(v_city(0)), '99,999,999'));
  DBMS_OUTPUT.PUT_LINE(v_city(2)||':'||TO_CHAR(v_population(v_city(2)), '99,999,999'));
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_1.sql
-- 35  /
--SEOUL: 10,373,234
--TOKYO:  3,812,392
--PARIS:  1,390,510
--
--PL/SQLプロシージャが正常に完了しました。
