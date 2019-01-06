--No11-10.LIMIT�L�[���[�h����BSELECT��������
SET SERVEROUTPUT ON
DECLARE
  TYPE emp_rec IS TABLE OF emp%ROWTYPE;
  v_emp_arr      emp_rec;
  c_size_limit   CONSTANT PLS_INTEGER := 10;
  v_fetched      PLS_INTEGER;
  CURSOR c IS
    SELECT *
    FROM emp;
  
BEGIN
  
  v_fetched := 0;
  OPEN c; --CURSOR OPEN
  LOOP
    FETCH c BULK COLLECT INTO v_emp_arr
      LIMIT c_size_limit; -- LIMIT���g�p���Ĉ��œǂݎ��ő匏���𐧌�����B
    DBMS_OUTPUT.PUT_LINE(v_emp_arr.COUNT||'��');
    
    IF 0 < v_emp_arr.COUNT THEN
      FOR i IN v_emp_arr.FIRST .. v_emp_arr.LAST
      LOOP
        DBMS_OUTPUT.PUT_LINE(CHR(9)||'����='||TO_CHAR(v_fetched+i, '99')||' �Ј��ԍ�='||v_emp_arr(i).empno||',���O='||v_emp_arr(i).ename);
      END LOOP;
      v_fetched := c%ROWCOUNT; --�������ꂽ����
      
    END IF;
    
    EXIT WHEN c%NOTFOUND; --����ȏ�f�[�^���Ȃ���ΏI������B
    
  END LOOP;
  
  CLOSE c;

END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter11\No11_10.sql
-- 51  /
--10��
--        ����=  1 �Ј��ԍ�=7369,���O=SMITH
--        ����=  2 �Ј��ԍ�=7499,���O=ALLEN
--        ����=  3 �Ј��ԍ�=7521,���O=WARD
--        ����=  4 �Ј��ԍ�=7566,���O=JONES
--        ����=  5 �Ј��ԍ�=7654,���O=MARTIN
--        ����=  6 �Ј��ԍ�=7698,���O=BLAKE
--        ����=  7 �Ј��ԍ�=7782,���O=CLARK
--        ����=  8 �Ј��ԍ�=7788,���O=SCOTT
--        ����=  9 �Ј��ԍ�=7839,���O=KING
--        ����= 10 �Ј��ԍ�=7844,���O=TURNER
--5��
--        ����= 11 �Ј��ԍ�=7876,���O=ADAMS
--        ����= 12 �Ј��ԍ�=7900,���O=JAMES
--        ����= 13 �Ј��ԍ�=7902,���O=FORD
--        ����= 14 �Ј��ԍ�=7934,���O=MILLER
--        ����= 15 �Ј��ԍ�=9000,���O=HONG
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
