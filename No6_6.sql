-- No2. PL/SQL �f�[�^TYPE�E�ϐ��ECONSTANT
-- Chapter6.DATA TYPE
-- No6_8 STORED FUNCTION tvl�𗘗p����BOOLEAN�l���o��

BEGIN
	DBMS_OUTPUT.PUT_LINE('NULL :'||tvl(NULL, 'TRUE', 'FALSE', 'NULL'));
	DBMS_OUTPUT.PUT_LINE('1=1  :'||tvl(1=1, 'TRUE', 'FALSE'));
	DBMS_OUTPUT.PUT_LINE('1=2  :'||tvl(1=2, 'TRUE', 'FALSE'));
END;