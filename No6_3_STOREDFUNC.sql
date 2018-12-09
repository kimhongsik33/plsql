-- No2. PL/SQL �f�[�^TYPE�E�ϐ��ECONSTANT
-- Chapter6.DATA TYPE
-- No6_5  BOOLEAN�l�o��STORED FUNCTION
-- DBMS_OUTPUT.PUT �܂���PUT_LINE�@FUNCTION�̎g�p���s�\�̂��߁ACASE���y��IF���𗘗p����B

CREATE OR REPLACE FUNCTION boolean_string(a_boolean BOOLEAN) RETURN VARCHAR2
IS
BEGIN
	RETURN CASE WHEN a_boolean = TRUE THEN 'TRUE'
			    WHEN a_boolean = FALSE THEN 'FALSE'
			    WHEN a_boolean IS NULL THEN 'NULL'
		   END;
END;

