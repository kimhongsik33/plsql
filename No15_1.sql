--No15-1.EXCEPTION未処理のケース
SET SERVEROUTPUT ON
BEGIN
  INSERT INTO dept(deptno, dname, loc)
  VALUES(40, 'CONSULTING', 'MANHATTAN');
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter15\No15_1.sql
-- 18  /
--BEGIN
--*
--行1でエラーが発生しました。:
--ORA-00001: 一意制約(SCOTT.DEPT_PK)に反しています
--ORA-06512: 行2
--
--
--SQL>