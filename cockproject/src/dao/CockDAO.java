package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BestVO;
import vo.CocktailVO;
import vo.PersonalVO;

public class CockDAO {
	
	//all List by ji
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
	
	//base list by ji
	public ArrayList<CocktailVO> getBaseList(String base, int page){
		ArrayList<CocktailVO> list = new ArrayList <CocktailVO>(); ;
		
		try {	Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("jdbc driver 로딩 성공");
				
				//1. DB 연결
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
				System.out.println("DB 연결성공");
				
				String sql = "select row_num, cock_id, cock_name, alcohol_grade, base"
							+ " from (select rownum row_num, cock_id, cock_name, alcohol_grade, base "
							+ "		  from (select * "
							+ "				from cocktail where base=?"
							+ "				order by cock_id ))"
							+ " where row_num >= ? and row_num <= ?";
				
				PreparedStatement pt = con.prepareStatement(sql);
				
				int start = (page-1)*6+1;
				int end = page*6;
				
				pt.setString(1,base);
				pt.setInt(2, start);
				pt.setInt(3,end);
				
				ResultSet rs = pt.executeQuery();
				
				while (rs.next()) {
					
					int cock_id = rs.getInt("cock_id");
					String cock_name= rs.getString("cock_name");
					int alcohol_grade = rs.getInt("alcohol_grade");
					String base1 = rs.getString("base");
					
					CocktailVO vo = new CocktailVO();
					vo.setCock_id(cock_id);
					vo.setCock_name(cock_name);
					vo.setAlcohol_grade(alcohol_grade);
					vo.setBase(base1);
					
					
					list.add(vo);
					
				}
				
				con.close();
				System.out.println("DB 연결해제 성공");

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//total count by ji
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
	
	//total count by ji
	public int getTotalCock(String base) {
		int total =0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("jdbc driver 로딩 성공");
			
			//1. DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
			System.out.println("DB 연결성공");
			
			String sql = "select count(*) from cocktail where base=?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, base);
			
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
	
	
	//personal list by jong
	public ArrayList<CocktailVO> getPersonalList (PersonalVO vo) {
		
			ArrayList<CocktailVO> list = new ArrayList<CocktailVO>();
			try {
				//0. JDBC DRIVER 호출
				Class.forName("oracle.jdbc.driver.OracleDriver");
						
				//1. DB 연결
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
				System.out.println("DB 연결성공");
				
				String sql = "select * from (select * from cocktail where alcohol_grade = ? and base = ?) "
						+ "where taste_cola = ? or taste_choco = ? or taste_fruit = ? or taste_coffee = ?";
				
				PreparedStatement pt = con.prepareStatement(sql);
				
				pt.setInt(1, vo.getAlcohol_grade());
				pt.setString(2, vo.getBase());
				pt.setInt(3, vo.getTaste_cola());
				pt.setInt(4, vo.getTaste_choco());
				pt.setInt(5, vo.getTaste_fruit());
				pt.setInt(6, vo.getTaste_coffee());
				
				ResultSet rs = pt.executeQuery();
				while (rs.next()) {
					int cock_id = rs.getInt("cock_id");
					String cock_name = rs.getString("cock_name");
					
					CocktailVO vo2 = new CocktailVO();
					vo2.setCock_id(cock_id);
					vo2.setCock_name(cock_name);
					
					list.add(vo2);
					
					System.out.println(cock_id+":"+cock_name);
					
				}
				
				con.close();
				System.out.println("연결해제");
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
	}

	//best list by hoon
	public ArrayList<BestVO> getBestList() {
		ArrayList<BestVO> list = new ArrayList<BestVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe", "NA", "NA");
			
			String sql = "select * from (select * from COCKTAIL_BEST ORDER BY insta DESC) WHERE ROWNUM < 6";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("best_id");
				String name = rs.getString("best_name");
				int count = rs.getInt("insta");
				int rank = rs.getInt("rank");
		
				BestVO vo = new BestVO(num, name, count, rank);
				vo.setNum(num);
				vo.setName(name);
				vo.setCount(count);
				vo.setRank(rank);
				
				list.add(vo);
				

			}
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
} // class end
