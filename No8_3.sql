--No8-3.DECODEはPLSQLでサポートしていない
SET SERVEROUTPUT ON
DECLARE
  v_NUM NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_NUM || 'は' || DECODE(MOD(v_NUM,2), 0, '偶数','奇数'));
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter8\No8_3.sql
-- 15  /
--  DBMS_OUTPUT.PUT_LINE(v_NUM || 'は' || DECODE(MOD(v_NUM,2), 0, '偶数','奇数'));
--                                         *
--行4でエラーが発生しました。:
--ORA-06550: 行4、列42:
--PLS-00204: 関数または疑似列DECODEはSQL文の中でしか使用できません。
--ORA-06550: 行4、列3:
--PL/SQL: Statement ignored