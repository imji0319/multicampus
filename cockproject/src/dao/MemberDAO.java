package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.CocktailVO;
import vo.MemberVO;

public class MemberDAO {
	
	//sign up
	public String insertBoard(MemberVO vo) {
		String result="";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA");
			System.out.println("DB 연결");
			String sql1 = 
					"select phone from membertable where phone=?";
			System.out.print(vo.getPhone());
			PreparedStatement pt1 = con.prepareStatement(sql1);
			pt1.setString(1, vo.getPhone());
			ResultSet rs1 = pt1.executeQuery();
			
			if( !rs1.next()) {
				String sql = "insert into membertable(phone,name) values(?,?)";
				System.out.println("가입하러 if문 들어옴");
				PreparedStatement pt = con.prepareStatement(sql);
				pt.setString(1,vo.getPhone());
				pt.setString(2,vo.getName());
				pt.executeUpdate();
				result="success";
				
			}
			
			con.close();
			System.out.println("db 연결 해제");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	//login
	public String login(MemberVO vo) {
		String name="";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
			//System.out.println("DB 연결");
			String sql = "select name "
					+ " from membertable where phone=? and name=?";
			
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1,vo.getPhone());
			pt.setString(2,vo.getName());
			
			ResultSet rs = pt.executeQuery();
			
			if (rs.next()) {
				name = rs.getString("name");
				System.out.println(name+"회원임");
			}
		
			con.close();
			//System.out.println("연결해제");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	
	
	//order list update;
	public void updateMemberChoice(ArrayList<Integer> list, String phone) {
		
		CockDAO dao = new CockDAO();
		ArrayList<CocktailVO> cocklist = new ArrayList<CocktailVO>();
		
		for (int i : list) {
			CocktailVO vo = dao.getBasketList(i);
			System.out.println(i);
			cocklist.add(vo);
		}
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@70.12.111.101:1521:xe","NA","NA"); 
			
			String sql = "insert into membertable(name,phone,choice,order_date)  "
						+ " values((select distinct name from membertable where phone=?),"
						+ "       	?, ?, sysdate)";
			
			for (CocktailVO  vo_m : cocklist ) {
				PreparedStatement pt = con.prepareStatement(sql);
				pt.setString(1,phone);
				pt.setString(2,phone);
				pt.setInt(3,vo_m.getCock_id());
				
				pt.executeUpdate();
				
			}
			
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	
}

