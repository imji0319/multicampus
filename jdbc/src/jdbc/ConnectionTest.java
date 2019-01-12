package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest {
public static void main(String[] args) {

	try {
	//0. Oracle의 JDBC DRIVER 호출
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//1. DB 연결
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
								//1번째 oracle의 정보 - jdbc:oracle:thin:@localhost:포트번호:데이터베이스이름, 
								//2번째: 계정이름
								//3번째: 비밀번호
	
	System.out.println("DB 연결성공");
	
	//2. SQL 전송
	//3. SQL 결과 검색

	
	//4. DB 연결해제
	con.close();
	System.out.println("연결 해제 성공");

	
	}
	catch(ClassNotFoundException e){
		System.out.println(e.getMessage());
	}
	catch(SQLException e){
		System.out.println(e.getMessage());
	}
	
	
	

}
}
