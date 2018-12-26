--No7-1.NOT NULL変数に初期値を指定しない場合ERRORが発生する
SET SERVEROUTPUT ON
DECLARE
  v_name VARCHAR2(10) NOT NULL;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_name);
END;


--以下、結果

--Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production
--に接続されました。
--SQL> @C:\kim\tech\plsql\Chapter7\No7_1.sql
--  6  /
--  v_name VARCHAR2(10) NOT NULL;
--         *
--行2でエラーが発生しました。:
--ORA-06550: 行2、列10:
--PLS-00218: NOT NULLで宣言した変数には初期割当てが必要です。