package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.CocktailVO;

public class CockDAO {
	
	//all List 
	public ArrayList<CocktailVO> getAllList(int page){
		ArrayList<CocktailVO> list = new ArrayList<CocktailVO>();
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("jdbc driver 로딩 성공");
			
			//1. DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
			System.out.println("DB 연결성공");
			
			String sql = "select row_num, cock_id, cock_name, alcohol_grade, base"
						+ " from (select rownum row_num, cock_id, cock_name, alcohol_grade, base "
						+ "		  from (select * "
						+ "				from cocktail "
						+ "				order by cock_id ))"
						+ " where row_num >= ? and row_num <= ?";
			
			PreparedStatement pt = con.prepareStatement(sql);
			
			int start = (page-1)*6+1;
			int end = page*6;
			
			pt.setInt(1, start);
			pt.setInt(2,end);
			
			ResultSet rs = pt.executeQuery();
			
			while (rs.next()) {
				
				int cock_id = rs.getInt("cock_id");
				String cock_name= rs.getString("cock_name");
				int alcohol_grade = rs.getInt("alcohol_grade");
				String base = rs.getString("base");
				
				CocktailVO vo = new CocktailVO();
				vo.setCock_id(cock_id);
				vo.setCock_name(cock_name);
				vo.setAlcohol_grade(alcohol_grade);
				vo.setBase(base);
				
				list.add(vo);
				
			}
			
			con.close();
			System.out.println("DB 연결해제 성공");
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		return list;
	}
	
	//total count
	public int getTotalCock() {
		int total =0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("jdbc driver 로딩 성공");
			
			//1. DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
			System.out.println("DB 연결성공");
			
			String sql = "select count(*) from cocktail";
			PreparedStatement pt = con.prepareStatement(sql);
			
			ResultSet rs = pt.executeQuery();
			
			rs.next();
			total = rs.getInt("count(*)");
			
			
			con.close();
			System.out.println("DB 연결 해제");
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return total;
	}
	
	
	
}
