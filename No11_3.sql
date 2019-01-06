--No11-3.FunctionのReturnとしてAssociative Arrayを使用する
SET SERVEROUTPUT ON
DECLARE
  --整数をINDEXとするAsscociative Arrayタイプを宣言
  TYPE int_array IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
  
  v_fibonacci int_array;
  c_order CONSTANT PLS_INTEGER := 20;

  FUNCTION fibonacci_sequence(num IN PLS_INTEGER) RETURN int_array
  IS
    v_arr int_array;
  BEGIN
    v_arr(1) := 0;
    v_arr(2) := 1;
    FOR i IN 3..num LOOP
      v_arr(i) := v_arr(i-1) + v_arr(i-2);
    END LOOP;
    RETURN v_arr;
  END;

BEGIN
  
  v_fibonacci := fibonacci_sequence(c_order);  
  DBMS_OUTPUT.PUT_LINE('fibonacci '|| c_order || '個');
  FOR i IN 1..c_order LOOP
    DBMS_OUTPUT.PUT(
      CASE WHEN 1 < i THEN ', ' END || v_fibonacci(i)
    );
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('');
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_3.sql
-- 42  /
--fibonacci 20個
--0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584,
--4181
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
