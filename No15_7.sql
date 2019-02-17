--No15-7.OracleError’ORA-20001’をEXCEPTION名USER_DEFINED_EXCEPTIONと連結
SET SERVEROUTPUT ON
DECLARE
  user_defined_exception EXCEPTION;
  PRAGMA EXCEPTION_INIT(user_defined_exception, -20001); --ORA-20001
BEGIN
  RAISE_APPLICATION_ERROR(-20001, '使用者指定EXCEPTION');
EXCEPTION
  WHEN user_defined_exception THEN
    DBMS_OUTPUT.PUT_LINE('使用者指定EXCEPTION,user_defined_exceptionが検出されました。');
    DBMS_OUTPUT.PUT_LINE('SQLCODE='||SQLCODE);
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter15\No15_7.sql
-- 22  /
--使用者指定EXCEPTION,user_defined_exceptionが検出されました。
--SQLCODE=-20001
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>