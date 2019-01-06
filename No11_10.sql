--No11-10.LIMITキーワードあり。SELECT件数制限
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_rec IS TABLE OF emp%ROWTYPE;
  v_emp_arr      emp_rec;
  c_size_limit   CONSTANT PLS_INTEGER := 10;
  v_fetched      PLS_INTEGER;
  CURSOR c IS
    SELECT *
    FROM emp;
  
BEGIN
  
  v_fetched := 0;
  OPEN c; --CURSOR OPEN
  LOOP
    FETCH c BULK COLLECT INTO v_emp_arr
      LIMIT c_size_limit; -- LIMITを使用して一回で読み取る最大件数を制限する。
    DBMS_OUTPUT.PUT_LINE(v_emp_arr.COUNT||'個');
    
    IF 0 < v_emp_arr.COUNT THEN
      FOR i IN v_emp_arr.FIRST .. v_emp_arr.LAST
      LOOP
        DBMS_OUTPUT.PUT_LINE(CHR(9)||'順番='||TO_CHAR(v_fetched+i, '99')||' 社員番号='||v_emp_arr(i).empno||',名前='||v_emp_arr(i).ename);
      END LOOP;
      v_fetched := c%ROWCOUNT; --処理された件数
      
    END IF;
    
    EXIT WHEN c%NOTFOUND; --これ以上データがなければ終了する。
    
  END LOOP;
  
  CLOSE c;

END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_10.sql
-- 51  /
--10個
--        順番=  1 社員番号=7369,名前=SMITH
--        順番=  2 社員番号=7499,名前=ALLEN
--        順番=  3 社員番号=7521,名前=WARD
--        順番=  4 社員番号=7566,名前=JONES
--        順番=  5 社員番号=7654,名前=MARTIN
--        順番=  6 社員番号=7698,名前=BLAKE
--        順番=  7 社員番号=7782,名前=CLARK
--        順番=  8 社員番号=7788,名前=SCOTT
--        順番=  9 社員番号=7839,名前=KING
--        順番= 10 社員番号=7844,名前=TURNER
--5個
--        順番= 11 社員番号=7876,名前=ADAMS
--        順番= 12 社員番号=7900,名前=JAMES
--        順番= 13 社員番号=7902,名前=FORD
--        順番= 14 社員番号=7934,名前=MILLER
--        順番= 15 社員番号=9000,名前=HONG
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
