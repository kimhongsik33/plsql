--No13-2.BULK COLLECT���g�p���ĕ�������FETCH
SET SERVEROUTPUT ON
DECLARE
  TYPE empno_arr IS TABLE OF NUMBER;
  TYPE ename_arr IS TABLE OF emp.ename%TYPE;
  
  v_empno empno_arr;
  v_ename ename_arr;
  
  --EXPLICT CURSOR
  CURSOR ename_cursor IS
  SELECT empno, ename FROM emp;

BEGIN
  OPEN ename_cursor;
  
  FETCH ename_cursor
  BULK COLLECT INTO v_empno, v_ename;

  DBMS_OUTPUT.PUT_LINE('�Ј���='||v_empno.COUNT);
  
  CLOSE ename_cursor;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter13\No13_2.sql
-- 47  /
--�Ј���=15
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>