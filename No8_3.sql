--No8-3.DECODE��PLSQL�ŃT�|�[�g���Ă��Ȃ�
SET SERVEROUTPUT ON
DECLARE
  v_NUM NUMBER := 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE(v_NUM || '��' || DECODE(MOD(v_NUM,2), 0, '����','�'));
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter8\No8_3.sql
-- 15  /
--  DBMS_OUTPUT.PUT_LINE(v_NUM || '��' || DECODE(MOD(v_NUM,2), 0, '����','�'));
--                                         *
--�s4�ŃG���[���������܂����B:
--ORA-06550: �s4�A��42:
--PLS-00204: �֐��܂��͋^����DECODE��SQL���̒��ł����g�p�ł��܂���B
--ORA-06550: �s4�A��3:
--PL/SQL: Statement ignored