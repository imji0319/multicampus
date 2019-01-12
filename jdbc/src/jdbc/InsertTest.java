package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertTest {
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
	//member 테이블에 저장 
	//java 22222 염정아 010-7452-4563 yum@multi.com sysdate
	//jdbc 3333 곽미향 010-777-8888 me@multi.com sysdate
	//sql 4444 이자바 010-777-8965 lee@multi.com
	//sql 명령문 String 으로 저장 
	
	
	//키보드입력
	Scanner sc = new Scanner(System.in);
	System.out.println("회원정보를 입력하세요");
	String[] st = sc.nextLine().split(" ");

	String sql = "insert into member "
				+ " values(?,?,?,?,?,sysdate)"; //아직 모르겠다. 키보드로 받으면 변경하겠다. 등등 초기화 
			/*String sql = "insert into member "
					+ " values('java',3333,'곽미향','010-777-8888','me@multi.com',sysdate)";*/
	
	//sql저장 -> 전송역할 : 객체 api connection.prepareStatement -> PreparedStatement 객체 리턴
	PreparedStatement pt = con.prepareStatement(sql);
	
	
	// ? 값 세팅 
	pt.setString(1,st[0]);
	pt.setInt(2,Integer.parseInt(st[1]));
	pt.setString(3,st[2]);
	pt.setString(4,st[3]);
	pt.setString(5,st[4]);
	
	
	//3. SQL 결과 검색
	int insertRow = pt.executeUpdate(); //sql 실행명령 -> DB 변경사항 수정
	System.out.println("삽입행의 갯수 = "+ insertRow);
	
	
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
