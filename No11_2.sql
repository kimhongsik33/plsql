--No11-2.Associative Array Collection (BULK COLLECT)
SET SERVEROUTPUT ON
DECLARE
  --������INDEX�Ƃ���Asscociative Array�^�C�v��錾
  TYPE string_array IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
  v_arr string_array;
  
BEGIN
  --�e�[�u��emp���ׂẴ��R�[�h��ename��Asscociative Array Collection�Ɉ��ŕۑ�����B
  SELECT ename
    BULK COLLECT INTO v_arr
    FROM emp;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of Asscociative Array Collection�F'||v_arr.COUNT);
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter11\No11_2.sql
-- 26  /
--A Number Of Asscociative Array Collection�F15
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
