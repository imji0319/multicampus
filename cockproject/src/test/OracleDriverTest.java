package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CocktailVO;

public class OracleDriverTest {
public static void main(String[] args) {
	
	//ArrayList<CocktailVO> list = new ArrayList<CocktailVO>();
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("jdbc driver 로딩 성공");
		
		//1. DB 연결
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
		System.out.println("DB 연결성공");
		
			
		String sql = "select cock_id,cock_name from cocktail where cock_id<5";
		PreparedStatement pt = con.prepareStatement(sql);
			  
		ResultSet rs= pt.executeQuery(); 
		while(rs.next()) { 
			int cock_id = rs.getInt("cock_id"); 
			String cock_name =rs.getString("cock_name");
			  
		//CocktailVO vo = new CocktailVO(); //vo.setCock_id(cock_id);
		//vo.setCock_name(cock_name);
			  
		//list.add(vo);
			  
		System.out.println(cock_id+":"+cock_name);
			  
			  
		}
			 
		con.close();
		System.out.println("DB연결해제");
		

	}catch(ClassNotFoundException e) {
		System.out.println("jdbc driver 로딩 실패");
	}catch(SQLException e) {
		System.out.println("오라클 연결 실패");
	}catch(Exception e){
		e.getStackTrace();
	}


}
}
