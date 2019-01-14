package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemberVO;

public class SelectTest3 {
public static void main(String[] args) {

	try {
	//0. JDBC DRIVER 호출
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//1. DB 연결
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
	System.out.println("DB 연결성공");
	
	//2. SQL 전송
	//가입회원수 출력
	String sql ="select id, password,"
			+ " nvl(name,'무명') as name, "
			+ " nvl(phone,'010') as phone,"
			+ " nvl(email,'none') as email, "
			+ " nvl(indate,sysdate) as indate"
			+ " from member";
	
	//sql저장 -> 전송역할 : 객체 api connection.prepareStatement -> PreparedStatement 객체 리턴
	PreparedStatement pt = con.prepareStatement(sql);

	
	//3. SQL 결과 검색
	ResultSet rs = pt.executeQuery(); //행열 형태의  테이블
	ArrayList <MemberVO> list = new ArrayList<MemberVO>(); //레코드 -> 객체 -> ArrayList의 원소
	
	
	while (rs.next()) { //레코드 개수를 한번에 확인할 수 있는 메소드가 없기 때문에 다음행에 대한 유무를 계속 확인해야 함 
		// 여러 레코드가 있을 가능성이 있을 때 while(rs.next()){} 사용
		String id = rs.getString("id");
		int pw = rs.getInt("password");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		String email = rs.getString("email");
		String indate = rs.getString("indate"); 
		
		//읽은 레코드 값 클래스 활용해서 객체생성  
		MemberVO vo = new MemberVO(id,pw,name,phone,email,indate);
		list.add(vo);
		
	}
	
	
	//4. DB 연결해제
	con.close();
	System.out.println("연결 해제 성공");
	for (MemberVO vo:list) {
		//System.out.println(vo.getId()+","+vo.getName());
		System.out.println(vo);
	}
	
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
