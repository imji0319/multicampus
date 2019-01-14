package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteTest {
public static void main(String[] args) {

	try {
	//0. JDBC DRIVER 호출
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//1. DB 연결
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
								//1번째 oracle의 정보 - jdbc:oracle:thin:@localhost:포트번호:데이터베이스이름, 
								//2번째: 계정이름
								//3번째: 비밀번호
	
	System.out.println("DB 연결성공");
	
	//2. SQL 전송
	//sql 명령문 String 으로 저장 
	//member 테이블에 있는 데이터 수정
	//java 22222 염정아 010-7452-4563 yum@multi.com sysdate
	
	
	//키보드입력 : id 1개 입력
	//id ="" 인 회원과 같은 날에 가입한 회원들 삭제
	
	Scanner sc = new Scanner(System.in);
	System.out.println("회원정보를 입력하세요");
	System.out.print("아이디 : ");
	String id = sc.nextLine();

	//데이터 삭제
	String sql = "delete member"
				+ "	where substr(indate,1,8) ="
				+ " (select substr(indate,1,8) from member where id = ?)";
			
	
	//sql저장 -> 전송역할 : 객체 api connection.prepareStatement -> PreparedStatement 객체 리턴
	PreparedStatement pt = con.prepareStatement(sql);
	
	pt.setString(1, id);
	
	
	//3. SQL 결과 검색
	int insertRow = pt.executeUpdate(); //sql 실행명령 -> DB 변경사항 수정
	System.out.println("삭제된 행의 갯수 = "+ insertRow);
	
	
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
