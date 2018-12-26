--No8-4.DECODEをCASE式に変えて処理
SET SERVEROUTPUT ON
DECLARE
  v_NUM NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_NUM || 'は' || 
                                 CASE MOD(v_NUM,2) WHEN 0 THEN '偶数'
                                                   ELSE '奇数' END
                       );
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter8\No8_4.sql
-- 22  /
--1は奇数
--
--PL/SQLプロシージャが正常に完了しました。