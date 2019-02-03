--No14-1.EXECUTE IMMEDIATE����SQL���ʂ�ϐ��ɕۑ�
SET SERVEROUTPUT ON
DECLARE
  v_query CONSTANT VARCHAR2(200) := 'SELECT empno, ename FROM emp WHERE empno=7788';
  
  TYPE emp_type IS RECORD(
    empno emp.empno%TYPE,
    ename emp.ename%TYPE
  );
  
  v_rec   emp_type;        -- Record Variable
  v_empno emp.empno%TYPE;  -- Scalar Variable
  v_ename emp.ename%TYPE;  -- Scalar Variable
  
  TYPE emp_arr IS TABLE OF emp_type;
  v_emps emp_arr;          -- Record Collection Variable

BEGIN
  --INTO Scalar�ϐ�
  EXECUTE IMMEDIATE v_query INTO v_empno, v_ename;
  DBMS_OUTPUT.PUT_LINE(v_empno||', '||v_ename);
  
  --INTO Record�ϐ�
  EXECUTE IMMEDIATE v_query INTO v_rec;
  DBMS_OUTPUT.PUT_LINE(v_rec.empno||', '||v_rec.ename);
  
  --INTO Record Collection�ϐ�
  EXECUTE IMMEDIATE 'SELECT empno, ename FROM emp' BULK COLLECT INTO v_emps;
  DBMS_OUTPUT.PUT_LINE('A Number Of Employee: '||v_emps.COUNT);
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter14\No14_1.sql
-- 54  /
--7788, SCOTT
--7788, SCOTT
--A Number Of Employee: 15
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>