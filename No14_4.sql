--No14-4.DBMS_SQL���g�p����SELECT����
SET SERVEROUTPUT ON
DECLARE
  v_cursor_id NUMBER;
  v_sql_stmt  VARCHAR2(4000) := Q'<SELECT * FROM emp WHERE deptno = :deptno AND hiredate >= TO_DATE(:hiredate, 'YYYY-MM-DD')>';
  TYPE vc_array IS TABLE OF VARCHAR2(100);
  v_bind_var  vc_array;
  v_bind_val  vc_array;
  v_ret       NUMBER;
  
  v_desc_tab  DBMS_SQL.DESC_TAB;
  v_col_cnt   PLS_INTEGER;
  v_str_var   VARCHAR2(100);
  v_num_var   NUMBER;
  v_date_var  DATE;
  v_row_cnt   PLS_INTEGER;
  
BEGIN
  v_bind_var := vc_array('deptno', 'hiredate');
  v_bind_val := vc_array('20', '1980-12-17');
  
  --SQL CURSOR��IPEN����CURSOR�ԍ���ԊҖႤ�B
  v_cursor_id := DBMS_SQL.OPEN_CURSOR;
  
  --SQL��Parcing����B
  DBMS_SQL.PARSE(v_cursor_id, v_sql_stmt, DBMS_SQL.NATIVE);
  
  --BIND�ϐ��ɒl��BIND����B
  FOR i IN 1 .. v_bind_var.COUNT LOOP
    DBMS_SQL.BIND_VARIABLE(v_cursor_id, v_bind_var(i), v_bind_val(i));
  END LOOP;
  
  --SELECT����Column���������Ă���B
  DBMS_SQL.DESCRIBE_COLUMNS(v_cursor_id, v_col_cnt, v_desc_tab);
  
  --SELECT�����Column���`����B
  FOR i IN 1 .. v_col_cnt LOOP
    IF v_desc_tab(i).col_type = DBMS_SQL.NUMBER_TYPE THEN
      DBMS_SQL.DEFINE_COLUMN(v_cursor_id, i, v_num_var);
    ELSIF v_desc_tab(i).col_type = DBMS_SQL.DATE_TYPE THEN
      DBMS_SQL.DEFINE_COLUMN(v_cursor_id, i, v_date_var);
    ELSE
      DBMS_SQL.DEFINE_COLUMN(v_cursor_id, i, v_str_var, 100);
    END IF;
  END LOOP;
  
  --CURSOR�����s����B
  v_ret := DBMS_SQL.EXECUTE(v_cursor_id);
  
  --�l���o�͂���B
  v_row_cnt := 0;
  WHILE DBMS_SQL.FETCH_ROWS(v_cursor_id) > 0
  LOOP
    v_row_cnt := v_row_cnt + 1;
    DBMS_OUTPUT.PUT_LINE(v_row_cnt||'�Ԗ�ROW');
    FOR i IN 1 .. v_col_cnt LOOP
      IF(v_desc_tab(i).col_type = DBMS_SQL.NUMBER_TYPE) THEN
        DBMS_SQL.COLUMN_VALUE(v_cursor_id, i, v_num_var);
        DBMS_OUTPUT.PUT_LINE(CHR(9)||rpad(v_desc_tab(i).col_name, 8, ' ')||' : ' ||v_num_var);
      ELSIF(v_desc_tab(i).col_type = DBMS_SQL.DATE_TYPE) THEN
        DBMS_SQL.COLUMN_VALUE(v_cursor_id, i, v_date_var);
        DBMS_OUTPUT.PUT_LINE(CHR(9)||rpad(v_desc_tab(i).col_name, 8, ' ')||' : ' ||TO_CHAR(v_date_var,'YYYY-MM-DD'));
      ELSE
        DBMS_SQL.COLUMN_VALUE(v_cursor_id, i, v_str_var);
        DBMS_OUTPUT.PUT_LINE(CHR(9)||rpad(v_desc_tab(i).col_name, 8, ' ')||' : ' ||v_str_var);
      END IF;
    END LOOP;
  END LOOP;
  
  --CURSOR���N���[�Y����B
  DBMS_SQL.CLOSE_CURSOR(v_cursor_id);
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter14\No14_4.sql
-- 81  /
--1�Ԗ�ROW
--        EMPNO    : 7369
--        ENAME    : SMITH
--        JOB      : CLERK
--        MGR      : 7902
--        HIREDATE : 1980-12-17
--        SAL      : 800
--        COMM     :
--        DEPTNO   : 20
--2�Ԗ�ROW
--        EMPNO    : 7566
--        ENAME    : JONES
--        JOB      : MANAGER
--        MGR      : 7839
--        HIREDATE : 1981-04-02
--        SAL      : 2975
--        COMM     :
--        DEPTNO   : 20
--3�Ԗ�ROW
--        EMPNO    : 7788
--        ENAME    : SCOTT
--        JOB      : ANALYST
--        MGR      : 7566
--        HIREDATE : 1987-04-19
--        SAL      : 3000
--        COMM     :
--        DEPTNO   : 20
--4�Ԗ�ROW
--        EMPNO    : 7876
--        ENAME    : ADAMS
--        JOB      : CLERK
--        MGR      : 7788
--        HIREDATE : 1987-05-23
--        SAL      : 1100
--        COMM     :
--        DEPTNO   : 20
--5�Ԗ�ROW
--        EMPNO    : 7902
--        ENAME    : FORD
--        JOB      : ANALYST
--        MGR      : 7566
--        HIREDATE : 1981-12-03
--        SAL      : 3000
--        COMM     :
--        DEPTNO   : 20
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>