-- No2. PL/SQL データTYPE・変数・CONSTANT
-- Chapter6.DATA TYPE
-- No6_7 BOOLEAN値出力FUNCTION tvl

CREATE OR REPLACE FUNCTION tvl(
	a_boolean BOOLEAN,
	a_trueval VARCHAR2,
	a_falseval VARCHAR2,
	a_nullval VARCHAR2 := NULL) RETURN VARCHAR2
IS
BEGIN
	RETURN CASE WHEN a_boolean = TRUE THEN a_trueval
			    WHEN a_boolean = FALSE THEN a_falseval
			    WHEN a_boolean IS NULL THEN a_nullval
		   END;
END;

