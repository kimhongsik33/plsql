--No13-4.EXPLICIT CURSOR FOR LOOP
SET SERVEROUTPUT ON
DECLARE
  v_total_pay NUMBER := 0;
  
  CURSOR emp_cursor IS
    SELECT ename, hiredate, deptno, NVL(sal,0)+NVL(comm,0) total_pay
    FROM emp
    WHERE deptno = 10;
BEGIN
  FOR t IN emp_cursor
  LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(t.ename,6,' ')||', 入社日付='||TO_CHAR(t.hiredate, 'YYYY-MM-DD')||', 給与='||t.total_pay);
    v_total_pay := v_total_pay + NVL(t.total_pay, 0);
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('-----------------------');
  DBMS_OUTPUT.PUT_LINE('TOTAL OF SALARY ='||v_total_pay);
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter13\No13_4.sql
-- 33  /
--CLARK , 入社日付=1981-06-09, 給与=2450
--KING  , 入社日付=1981-11-17, 給与=5000
--MILLER, 入社日付=1982-01-23, 給与=1300
-------------------------
--TOTAL OF SALARY =8750
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>