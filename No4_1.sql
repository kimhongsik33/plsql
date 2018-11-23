--No1. PL/SQL プログラムの基本Structure
--4.1 블록구조
--   ・익명 PLSQL블록
--   ・저장 서브프로그램

DECLARE
    v_str VARCHAR2(100);
BEGIN
    v_str := '~~~~';
    DBMS_OUTPUT.PUT_LINE(v_str);
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;