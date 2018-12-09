-- No2. PL/SQL データTYPE・変数・CONSTANT
-- Chapter6.DATA TYPE
-- No6_2 データベース　CHARACTERSETとSTRING SIZE
-- CHARは保存可能な文字の最大数を指定する。EX）VARCHAR2(8 CHAR):8文字まで指定可能。

set serveroutput on
DECLARE
    v_charset		VARCHAR2(16);
    v_name1			VARCHAR2(8 CHAR);
    v_name2			VARCHAR2(12);
BEGIN
	
	SELECT VALUE INTO v_charset FROM v$nls_parameters WHERE parameter = 'NLS_CHARACTERSET';
	DBMS_OUTPUT.PUT_LINE('データベースCHARACTERSET:' || v_charset);
	DBMS_OUTPUT.PUT_LINE(CHR(9)); --TAP
	
	--========
	-- STRING
	--========
	DBMS_OUTPUT.PUT_LINE('v_name1 VARCHAR2(8 CHAR)');
	DBMS_OUTPUT.PUT_LINE('========================');
	v_name1 := 'Miller'; --ALPHABET
	DBMS_OUTPUT.PUT_LINE(RPAD(v_name1, 9)||':'||lengthb(v_name1)|| 'BYTE');
    v_name1 := 'テスト１'; --JAPANESE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_name1, 9)||':'||lengthb(v_name1)|| 'BYTE');
    DBMS_OUTPUT.PUT_LINE(CHR(9));
    
    
    --========
	-- BYTE
	--========
    DBMS_OUTPUT.PUT_LINE('v_name2 VARCHAR2(12)');
	DBMS_OUTPUT.PUT_LINE('========================');
	v_name2 := 'Miller'; --ALPHABET
	DBMS_OUTPUT.PUT_LINE(RPAD(v_name2, 9)||':'||lengthb(v_name2)|| 'BYTE');
    v_name2 := 'テスト２'; --JAPANESE
    DBMS_OUTPUT.PUT_LINE(RPAD(v_name2, 9)||':'||lengthb(v_name2)|| 'BYTE');
    
END;