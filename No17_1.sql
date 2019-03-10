--No17-1.FUNCTIONの宣言部
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION f 
RETURN NUMBER
IS
--FUNCTIONの宣言部
  FUNCTION get_emp_sal(a_empno NUMBER) RETURN NUMBER; --FUNCTION宣言
  no_emp_found EXCEPTION;                             --使用者指定EXCEPTION宣言
  TYPE number_arr_type IS TABLE OF NUMBER;            --TYPE宣言
  v_empno_arr number_arr_type;                        --変数宣言
  c_nulm_comm CONSTANT NUMBER := 0;                   --CONSTANT宣言
  v_wage NUMBER;                                      --変数宣言
  
  CURSOR emp_cursor(a_empno NUMBER) IS                --CURSOR宣言
    SELECT sal + NVL(comm,0) comm
    FROM emp
    WHERE empno = a_empno;
  
  FUNCTION get_emp_sal(a_empno NUMBER)                --FUNCTION宣言
  RETURN NUMBER IS 
    v_sal NUMBER;
  BEGIN
    OPEN emp_cursor(7788);
    FETCH emp_cursor INTO v_sal;
    CLOSE emp_cursor;
    RETURN v_sal;
  END;
  
BEGIN
  NULL;
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter17\No17_1.sql
-- 40  /
--
--ファンクションが作成されました。
--
--SQL>