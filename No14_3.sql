--No14-3.CURSOR�ϐ��ɂ���OPEN,FETCH,CLOSE�����g�p���铮�ISQL��SELECT���݂̂Ŏg�p�ł���
SET SERVEROUTPUT ON
DECLARE
  TYPE empcur_type IS REF CURSOR;
  v_emp_cur   empcur_type; --CURSOR�ϐ�
  emp_rec     emp%ROWTYPE;
  v_stmt      VARCHAR2(200);
  v_empno     NUMBER;
BEGIN
  v_stmt := 'SELECT * FROM emp WHERE empno = :empno';
  v_empno := 7788;
  
  OPEN v_emp_cur FOR v_stmt USING v_empno;
  
  LOOP
    FETCH v_emp_cur INTO emp_rec;
    EXIT WHEN v_emp_cur%NOTFOUND;
  END LOOP;
  
  CLOSE v_emp_cur;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter14\No14_3.sql
-- 31  /
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>