package dao;

import java.sql.*;
import java.util.ArrayList;

import vo.BestVO;

public class BestDAO {
	
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
			System.out.println("������������");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}