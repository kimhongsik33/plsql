--No17-4.COLLECTION�Ԋ�FUNCTION�ɘA���łQ�̃J�b�R���g�p
SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE(get_emp_list(10)(1));
END;

--�ȉ��A����

--SQL> BEGIN
--  2  DBMS_OUTPUT.PUT_LINE(get_emp_list(10)(1));
--  3  END;
--  4
--  5  /
--7782
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B