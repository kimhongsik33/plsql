--No16-3.FUNCTION�������Ă���SQL�����s����
SET SERVEROUTPUT ON
SELECT ename, empno, sal, comm, get_wage(empno)
FROM emp
WHERE deptno = 30
AND get_wage(empno) >= 2000
ORDER BY ename;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter16\No16_3.sql
--
--ENAME                     EMPNO        SAL       COMM GET_WAGE(EMPNO)
---------------------- ---------- ---------- ---------- ---------------
--BLAKE                      7698       2850                       2850
--MARTIN                     7654       1250       1400            2650
--
--SQL>