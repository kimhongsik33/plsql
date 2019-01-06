--No11-5.VARRAY Collection (BULK COLLECT)
SET SERVEROUTPUT ON
DECLARE
  TYPE string_array IS VARRAY(20) OF VARCHAR2(100);
  v_arr string_array;
  
BEGIN
  --�e�[�u��emp���ׂẴ��R�[�h��ename��VARRAY Collection�Ɉ��ŕۑ�����B
  SELECT ename
    BULK COLLECT INTO v_arr
    FROM emp
  WHERE ROWNUM <= 20;
  
  DBMS_OUTPUT.PUT_LINE('A Number Of VARRAY Collection�F'||v_arr.COUNT);
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter11\No11_5.sql
-- 26  /
--A Number Of VARRAY Collection�F15
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
