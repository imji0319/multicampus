package dao;
//Data access object 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import vo.BoardVO;

public class BoardDAO {
	
	//DB 추가
	public void insertBoard(BoardVO vo) {
		try {
			//jdbc driver 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
			System.out.println("DB 연결성공");
			
			//vo(키보드입력)board -> BoardInsertView.input();

			//테이블 저장 sql정의			
			String sql ="insert into board values(?,?,?,?)";
			
			//sql 저장 실행 객체 생성 
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1,vo.getSeq());
			pt.setString(2,vo.getTitle());
			pt.setString(3, vo.getContents());
			pt.setInt(4,vo.getViewcount());
			
		
			//sql 실행메소드 호출 
			int insertrow = pt.executeUpdate();
			System.out.println("추가된 행의 수"+insertrow);
			//DB 해제
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	//DB 조최
	public BoardVO selectBoard(int seq) {
		
		try {
			//jdbc driver 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
			System.out.println("DB 연결성공");
			
			//seq매개변수와 같은 번호 게시물 조회
			String sql ="select * from board where seq =?";
			//sql 저장 실행 객체 생성 
			PreparedStatement pt = con.prepareStatement(sql);
			//seq에 대해 ?로 하고 setXX()
			pt.setInt(1, seq);

			//sql 실행메소드
			ResultSet rs = pt.executeQuery(); 
			
			//resultset rs
			rs.next();
			int num = rs.getInt("seq");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				int count = rs.getInt("viewcount");
			
			//rs의결과를 boardvo 객체로 변화	
			BoardVO vo = new BoardVO(num,title,contents, count);
			return vo;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
		

	}

	//DB 삭제
	public void deleteBoard() {
		
	}
	
	//DB 수정
	public void updateBoard() {
		
	}
	
	
	
	
	
}
