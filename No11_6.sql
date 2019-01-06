--No11-6.NESTED TABLE Collection
SET SERVEROUTPUT ON
DECLARE
  --������INDEX�Ƃ���NESTED TABLE
  TYPE city IS TABLE OF VARCHAR2(64);
  
  v_city   city;
  
  v_city2  city := city('SEOUL','TOKYO','OSAKA');

BEGIN
  --���s���ł�Constructor���g�p���ď��������\�B
  v_city := city('SEOUL','TOKYO','OSAKA','BUSAN','NAGOYA');
  v_city := city();
  
  v_city.EXTEND; v_city(1) := 'SEOUL';
  v_city.EXTEND; v_city(2) := 'TOKYO';
  v_city.EXTEND; v_city(3) := 'OSAKA';
  v_city.EXTEND; v_city(4) := 'BUSAN';
  DBMS_OUTPUT.PUT_LINE('A Number Of City�F'||v_city.COUNT);
  
  FOR i IN v_city.FIRST .. v_city.LAST
  LOOP
    IF v_city.EXISTS(i) THEN
      DBMS_OUTPUT.PUT_LINE(CHR(9)||'v_city('||TO_CHAR(i)||'):'||v_city(i));
    END IF;
  END LOOP;
  
  v_city.DELETE(3);
  DBMS_OUTPUT.PUT_LINE('A Number Of City�F'||v_city.COUNT);
  
  FOR i IN v_city.FIRST.. v_city.LAST
  LOOP
    IF v_city.EXISTS(i) THEN
      DBMS_OUTPUT.PUT_LINE(CHR(9)||'v_city('||TO_CHAR(i)||'):'||v_city(i));
    END IF;
  END LOOP;
  
END;


--�ȉ��A����

--SQL> @C:\kim\tech\plsql\Chapter11\No11_6.sql
-- 49  /
--A Number Of City�F4
--        v_city(1):SEOUL
--        v_city(2):TOKYO
--        v_city(3):OSAKA
--        v_city(4):BUSAN
--A Number Of City�F3
--        v_city(1):SEOUL
--        v_city(2):TOKYO
--        v_city(4):BUSAN
--
--PL/SQL�v���V�[�W��������Ɋ������܂����B
--
--SQL>
