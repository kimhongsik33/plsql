--No17-4.COLLECTION返還FUNCTIONに連続で２つのカッコを使用
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE(get_emp_list(10)(1));
END;

--以下、結果

--SQL> BEGIN
--  2  DBMS_OUTPUT.PUT_LINE(get_emp_list(10)(1));
--  3  END;
--  4
--  5  /
--7782
--
--PL/SQLプロシージャが正常に完了しました。