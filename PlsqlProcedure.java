REM 24-4. 자바에서 저장 프로시저 호출 
-- PlsqlProcedure.java

import java.sql.*;

public class PlsqlProcedure{
  public static void main(String[] args) throws SQLException
  {
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    // DB 접속
    Connection conn = DriverManager.getConnection(
      "jdbc:oracle:this:@localhost:1521:dbname", "scott", "tiger");

    // 변수 선언
    int p1InValue    = Integer.parseInt(args[0]);
    int p2InOutValue = Integer.parseInt(args[1]);
    int p3OutValue ;

    // Prepare statement
    // 다음의 두 가지 방법 중 하나를 사용하면 된다. 두 방법은 완전히 동일하다.
    // 1. 익명 PL/SQL 블록 사용하는 방법
    // CallableStatement cs = conn.prepareCall("BEGIN compute_power(?, ?, ?); END;");
    // 2. JDBC 에서 지원하는 저장 함수 호출 방법
    CallableStatement cs = conn.prepareCall("{ call compute_power(?, ?, ?) }");

    // IN 매개변수는 setXXX 를 사용하여 값을 전달
    cs.setInt(1, p1InValue);

    // IN OUT 매개변수는 setXXX 와 registerOutParameter를 둘 다 사용
    cs.setInt(2, p2InOutValue);
    cs.registerOutParameter(2, Types.INTEGER);

    // OUT 매개변수는 registerOutParameter 를 사용하여 되돌려 받을 데이터타입을 저장
    cs.registerOutParameter(3, Types.INTEGER);

    // Statement 수행
    cs.execute();

    // 수행 결과 data 를 가져옴
    p2InOutValue = cs.getInt(2);
    p3OutValue   = cs.getInt(3);

    // 수행 결과 출력
    System.out.println(p1InValue + "^" + p2InOutValue + " = " + p3OutValue);
  }
}