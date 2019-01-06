--No11-4.VARRAY Collection
SET SERVEROUTPUT ON
DECLARE

  TYPE languages IS VARRAY(10) OF VARCHAR2(64);
  
  v_lang   languages;
  v_lang2  languages := languages('KOREAN','JAPANESE','ENGLISH');
  
BEGIN
  v_lang := languages();
  v_lang := languages('KOREAN');
  v_lang := languages('KOREAN','JAPANESE');
  
  v_lang.EXTEND(2);
  v_lang(3) := 'CHINESE';
  v_lang(4) := 'ENGLISH';
  
  FOR i IN v_lang.FIRST .. v_lang.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(i)||':'||v_lang(i));
  END LOOP;
  
END;


--以下、結果

--SQL> @C:\kim\tech\plsql\Chapter11\No11_4.sql
-- 33  /
--1:KOREAN
--2:JAPANESE
--3:CHINESE
--4:ENGLISH
--
--PL/SQLプロシージャが正常に完了しました。
--
--SQL>
