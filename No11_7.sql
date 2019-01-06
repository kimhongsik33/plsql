--No11-7.NESTED TABLE Collection (BULK COLLECT)
SET SERVEROUTPUT ON
DECLARE
  TYPE string_array IS TABLE OF VARCHAR2(100);
  v_arr string_array;
  
BEGIN
  --�e�[�u��emp���ׂẴ��R�[�h��ename��NESTED TABLE Collection�Ɉ��ŕۑ�����B
  SELECT ename
    BULK COLLECT INTO v_arr
    FROM emp;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of NESTED TABLE Collection�F'||v_arr.COUNT);
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter11\No11_7.sql
-- 25  /
--A Number Of NESTED TABLE Collection�F15
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
