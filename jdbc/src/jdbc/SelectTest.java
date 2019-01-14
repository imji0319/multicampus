package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectTest {
public static void main(String[] args) {

	try {
	//0. JDBC DRIVER 호출
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//1. DB 연결
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
	System.out.println("DB 연결성공");
	
	//2. SQL 전송
	String sql ="select id, to_char(nvl(indate,sysdate),'yyyy/mm/dd') as indate, sysdate "
			+ " from member where id like ?";
	//sql저장 -> 전송역할 : 객체 api connection.prepareStatement -> PreparedStatement 객체 리턴
	PreparedStatement pt = con.prepareStatement(sql);
	//키보드 입력 + "%"
	pt.setString(1,"ora%");

	
	//3. SQL 결과 검색
	ResultSet rs = pt.executeQuery(); //행열 형태의  테이블
	
	
	while (rs.next()) { //레코드 개수를 한번에 확인할 수 있는 메소드가 없기 때문에 다음행에 대한 유무를 계속 확인해야 함 
		// 여러 레코드가 있을 가능성이 있을 때 while(rs.next()){} 사용
		String id = rs.getString("id");
		//int pw = rs.getInt("password");
		//String name = rs.getString("name");
		//String phone = rs.getString("phone");
		//String email = rs.getString("email");
		String indate = rs.getString("indate"); //java.sql.Date date = rs.getDate("indate"); -> yyyy-mm-dd
												//조회에 함수를 적용했을 때 번호를 지정하는 것이 좋음
		//System.out.println(id +"-"+pw+"-"+name+"-"+phone+"-"+email+"-"+indate);
		System.out.println(id+":"+indate);

	}
	
	
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
