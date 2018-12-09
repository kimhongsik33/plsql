-- No2. PL/SQL �f�[�^TYPE�E�ϐ��ECONSTANT
-- Chapter6.DATA TYPE
-- No6_2 �f�[�^�x�[�X�@CHARACTERSET��STRING SIZE
-- CHAR�͕ۑ��\�ȕ����̍ő吔���w�肷��BEX�jVARCHAR2(8 CHAR):8�����܂Ŏw��\�B

set serveroutput on
DECLARE
    v_charset		VARCHAR2(16);
    v_name1			VARCHAR2(8 CHAR);
    v_name2			VARCHAR2(12);
BEGIN
	
	SELECT VALUE INTO v_charset FROM v$nls_parameters WHERE parameter = 'NLS_CHARACTERSET';
	DBMS_OUTPUT.PUT_LINE('�f�[�^�x�[�XCHARACTERSET:' || v_charset);
	DBMS_OUTPUT.PUT_LINE(CHR(9)); --TAP
	
	--========
	-- STRING
	--========
	DBMS_OUTPUT.PUT_LINE('v_name1 VARCHAR2(8 CHAR)');
	DBMS_OUTPUT.PUT_LINE('========================');
	v_name1 := 'Miller'; --ALPHABET
	DBMS_OUTPUT.PUT_LINE(RPAD(v_name1, 9)||':'||lengthb(v_name1)|| 'BYTE');
    v_name1 := '�e�X�g�P'; --JAPANESE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_name1, 9)||':'||lengthb(v_name1)|| 'BYTE');
    DBMS_OUTPUT.PUT_LINE(CHR(9));
    
    
    --========
	-- BYTE
	--========
    DBMS_OUTPUT.PUT_LINE('v_name2 VARCHAR2(12)');
	DBMS_OUTPUT.PUT_LINE('========================');
	v_name2 := 'Miller'; --ALPHABET
	DBMS_OUTPUT.PUT_LINE(RPAD(v_name2, 9)||':'||lengthb(v_name2)|| 'BYTE');
    v_name2 := '�e�X�g�Q'; --JAPANESE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_name2, 9)||':'||lengthb(v_name2)|| 'BYTE');
    
END;