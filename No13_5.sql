--No13-5.REF CURSOR
SET SERVEROUTPUT ON
DECLARE
  TYPE empcursor_type      IS REF CURSOR RETURN emp%ROWTYPE;  --Strong Type
  TYPE genericcursor_type  IS REF CURSOR;                     --Weak Type
  
  v_c1 empcursor_type;
  v_c2 genericcursor_type;
  v_c3 SYS_REFCURSOR;
  
  TYPE empcursor_type2 IS REF CURSOR RETURN v_c1%ROWTYPE;
  v_c4 SYS_REFCURSOR;
  
  CURSOR emp_cursor IS
    SELECT empno, ename 
    FROM emp;
  TYPE empcursor_type3 IS REF CURSOR RETURN emp_cursor%ROWTYPE;
  v_c5 empcursor_type3;
  
  TYPE emp_rec IS RECORD (
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );
  TYPE empcursor_type4 IS REF CURSOR RETURN emp_rec;
  v_c6 empcursor_type4;
BEGIN
  NULL;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter13\No13_5.sql
-- 42  /
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>