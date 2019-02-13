package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.MemberVO;

public class MemberDAO {
	public String getMember(MemberVO vo) {
		String result="";
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("jdbc driver 로딩 성공");
			
			//1. DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
			System.out.println("DB 연결성공");
			
			//2. sql 질의 
			
			String sql = "select * from test where phone=?";
			
			PreparedStatement pt = con.prepareStatement(sql);
			
			pt.setString(1,vo.getPhone());
			
			ResultSet rs = pt.executeQuery();
			
			if (!rs.next()){
				String sub_sql = "insert into test values(?,?)";
				PreparedStatement sub_pt = con.prepareStatement(sub_sql);
				
				sub_pt.setString(1, vo.getName());
				sub_pt.setString(2, vo.getPhone());
				
				int row =sub_pt.executeUpdate();
				System.out.println(row+"행이 추가되었습니다.");
			}
			
			con.close();
			System.out.println("DB 연결 해제");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
