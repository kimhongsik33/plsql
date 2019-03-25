REM 24-1. 자바에서 저장 함수 호출하기. 익명 PL/SQL와 JDBC 의 프로시저 호출 사용
-- PlsalFunction.java

import java.sql.*;

public class PlsqlFunction{
  public static void main(String[] args) throws SQLException
  {
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    // DB 접속
    Connection conn = DriverManager.getConnection(
      "jdbc:oracle:this:@localhost:1521:dbname", "scott", "tiger");

    // 변수 선언
    int p1OutValue;
    int p2InValue = Integer.parseInt(args[0]);
    CallableStatement cs;
    // 다음의 두 가지 방법 중 하나를 사용하면 된다. 두 방법은 완전히 동일하다.
    // 1. 익명 PL/SQL 블록 사용하는 방법
    cs = conn.propareCall("BEGIN ? := factorial(?) ; END;");
    // 2. JDBC 에서 지원하는 저장 함수 호출 방법
    //cs = conn.prepareCall("{? = call factorial(?)}");

    // 결과를 받을 OUT parameter 에 대한 정보를 registerOutParameter 함수를 이용하여 설정
    cs.registerOutParamater(1, Types.INTEGER);

    // IN parameter 값을 setXXX 함수 사용
    cs.setInt(2, p2InValue);

    // Statement 수행
    cs.execute();

    // 수행 결과 data를 가져옴
    p1OutValue = cs.getInt(1);

    // 수행 결과 출력
    System.out.println(p2InValue + "! = " + p1OutValue);
  }
}