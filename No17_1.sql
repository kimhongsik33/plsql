--No17-1.FUNCTION�̐錾��
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION f 
RETURN NUMBER
IS
--FUNCTION�̐錾��
  FUNCTION get_emp_sal(a_empno NUMBER) RETURN NUMBER; --FUNCTION�錾
  no_emp_found EXCEPTION;                             --�g�p�Ҏw��EXCEPTION�錾
  TYPE number_arr_type IS TABLE OF NUMBER;            --TYPE�錾
  v_empno_arr number_arr_type;                        --�ϐ��錾
  c_nulm_comm CONSTANT NUMBER := 0;                   --CONSTANT�錾
  v_wage NUMBER;                                      --�ϐ��錾
  
  CURSOR emp_cursor(a_empno NUMBER) IS                --CURSOR�錾
    SELECT sal + NVL(comm,0) comm
    FROM emp
    WHERE empno = a_empno;
  
  FUNCTION get_emp_sal(a_empno NUMBER)                --FUNCTION�錾
  RETURN NUMBER IS 
    v_sal NUMBER;
  BEGIN
    OPEN emp_cursor(7788);
    FETCH emp_cursor INTO v_sal;
    CLOSE emp_cursor;
    RETURN v_sal;
  END;
  
BEGIN
  NULL;
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter17\No17_1.sql
-- 40  /
--
--�t�@���N�V�������쐬����܂����B
--
--SQL>