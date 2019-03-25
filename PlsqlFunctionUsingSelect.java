REM 24-2. 자바에서 저장 함수 호출하기. SELECT 사용
-- PlsqlFunctionUsingSelect.java

import java.sql.*;

public class PlsqlFunctionUsingSelect{
  public static void main(String[] args) throws SQLException
  {
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    // DB 접속
    Connection conn = DriverManager.getConnection(
      "jdbc:oracle:this:@localhost:1521:dbname", "scott", "tiger");

    // 변수 선언
    int inValue = Integer.parseInt(args[0]);

    PreparedStatement = stmt;
    // SELECT 문을 사용한 함수 호출
    stmt = conn.prepareStatement("SELECT factorial(?) FROM DUAL");

    // setXXX 함수를 사용하여 바인드 변수 값 설정
    cs.setInt(1, inValue);

    // SELECT 문 수행
    ResultSet rs = stmt.executeQuery();

    // 결과 출력
    while (rs.next())
    {
      System.out.println(inValue + "! = " + rs.getLong(1);
    }
  }
}