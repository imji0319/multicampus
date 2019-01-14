package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectTest2 {
public static void main(String[] args) {

	try {
	//0. JDBC DRIVER 호출
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//1. DB 연결
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
	System.out.println("DB 연결성공");
	
	//2. SQL 전송
	//가입회원수 출력
	String sql ="select count(indate) as cnt "
			+ " from member";
	
	//sql저장 -> 전송역할 : 객체 api connection.prepareStatement -> PreparedStatement 객체 리턴
	PreparedStatement pt = con.prepareStatement(sql);

	
	//3. SQL 결과 검색
	ResultSet rs = pt.executeQuery(); //행열 형태의  테이블
	
	rs.next(); //래코드 포인터 지정해야 읽을 수 있음 -> 첫번째 레코드이동
	//레코드가 단하나라고 단정할 수 있을 때 while문을 사용하지 않음
	System.out.println(rs.getInt("cnt"));

	
	//4. DB 연결해제
	con.close();
	System.out.println("연결 해제 성공");
	
	
	}
	catch(ClassNotFoundException e){
		System.out.println(e.getMessage());
	}
	catch(SQLException e){
		//System.out.println(e.getMessage()); //원인
		e.printStackTrace(); //원인 , 라인 -> 자세히
	}
	
	
	

}
}
