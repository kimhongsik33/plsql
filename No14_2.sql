--No14-1.EXECUTE IMMEDIATE文でSQL結果を変数に保存
SET SERVEROUTPUT ON
DECLARE
  v_query CONSTANT VARCHAR2(200) := 'SELECT COUNT(*) FROM emp WHERE deptno = :deptno AND job = :job';
  v_deptno emp.deptno%TYPE;
  v_cnt PLS_INTEGER;
  
BEGIN
  v_deptno := 20;
  EXECUTE IMMEDIATE v_query INTO v_cnt USING IN v_deptno, 'CLERK';
  DBMS_OUTPUT.PUT_LINE('COUNT = '||v_cnt);
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter14\No14_2.sql
-- 24  /
--COUNT = 2
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>