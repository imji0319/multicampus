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
			String sql ="insert into board"
					+ " values((select max(seq)+1 from board),?,?,?)"; //자동 숫자 지정
			
			//sql 저장 실행 객체 생성 
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1,vo.getTitle());
			pt.setString(2, vo.getContents());
			pt.setInt(3,vo.getViewcount());
			
		
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
		BoardVO vo= null;
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
			if (rs.next()) {
			int num = rs.getInt("seq");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				int count = rs.getInt("viewcount");
			
			//rs의결과를 boardvo 객체로 변화	
			vo = new BoardVO(num,title,contents, count);
			}
			else {
				vo = new BoardVO(0,"0","0",0);
			}
			con.close();
			return vo;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	
	}

	//DB 삭제
	public void deleteBoard(int seq) {
		try {
			//드라이버 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//DB연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
			System.out.println("DB 연결성공");
			
			//seq같은 번호 삭제
			String sql = "delete board where seq=?";
			
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, seq);
			
			int deleterow = pt.executeUpdate();
			System.out.println("삭제된 행의 수"+deleterow);
			con.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//DB 수정
	public void updateBoard(String oldString,String newString) {
		try {
			//드라이버 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//DB연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
			System.out.println("DB 연결성공");
			
			//title - contents 컬럼 둘중 하나에 있으면 수정
			String sql="update board set title= ?, contents=? "
					+ " where contents like '%'||?||'%' OR title like '%'||?||'%' ";

			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1,newString);
			pt.setString(2,newString);
			pt.setString(3,oldString);
			pt.setString(4,oldString);
			
			
			int updaterow = pt.executeUpdate();
			System.out.println("수정한 행의 수"+updaterow);
		
			
			//DB 해제
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
