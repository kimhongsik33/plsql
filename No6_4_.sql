-- No2. PL/SQL データTYPE・変数・CONSTANT
-- Chapter6.DATA TYPE
-- No6_6 STORED FUNCTION boolean_stringを利用してBOOLEAN値を出力

BEGIN
	DBMS_OUTPUT.PUT_LINE('TRUE :'||boolean_string(TRUE));
	DBMS_OUTPUT.PUT_LINE('FALSE:'||boolean_string(FALSE));
	DBMS_OUTPUT.PUT_LINE('NULL :'||boolean_string(NULL));
	DBMS_OUTPUT.PUT_LINE('1=1  :'||boolean_string(1=1));
	DBMS_OUTPUT.PUT_LINE('1=2  :'||boolean_string(1=2));
END;