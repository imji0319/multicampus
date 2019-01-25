package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BoardVO;
import vo.MemberVO;

public class BoardDAO {
	
	//로그인 -> Member
	public String loginBoard(String id, int pw){
		String writer="";
		try {
			//0. JDBC DRIVER 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
					
			//1. DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board"); 
			System.out.println("DB 연결성공");
			String sql = "select id from member where id=? and password=?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, id);
			pt.setInt(2,pw);
			
			
			ResultSet rs = pt.executeQuery();
			if (rs.next()) {
				writer = rs.getString("id");
			}
			con.close();
			System.out.println("연결해제");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return writer;
	}
	
	//게시판 전체 목록 조회
	public ArrayList<BoardVO> getBoardList(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
		//0. JDBC DRIVER 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
				
		//1. DB 연결
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board"); 
		System.out.println("DB 연결성공");
		
		String sql="select boardseq, boardtitle, boardwriter, to_char(boardtime,'yyyy-mm-dd hh24:mi-ss') as boardtime" + 
					" from board order by boardtime desc";
		
		PreparedStatement pt = con.prepareStatement(sql);
		
		ResultSet rs = pt.executeQuery();
		
		while (rs.next()) {
			int boardseq = rs.getInt("boardseq");
			String boardtitle =rs.getString("boardtitle");
			String boardwriter = rs.getString("boardwriter");
			String boardtime = rs.getString("boardtime");
			
			BoardVO vo = new BoardVO();
			vo.setBoardseq(boardseq);
			vo.setBoardtitle(boardtitle);
			vo.setBoardwriter(boardwriter);
			vo.setBoardtime(boardtime);
			
			list.add(vo);
		}

		con.close();
		System.out.println("DB 연결해제");
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return list;

	} //getBoardList
	
	//게시물 상세페이지
	public BoardVO getBoardDetail(int seq) {
		BoardVO vo =new BoardVO();
		
		try {
		//0. JDBC DRIVER 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
				
		//1. DB 연결
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board"); 
		System.out.println("DB 연결성공");
		
		//조회수 증가
		String pre_sql = "update board set boardviewcount=boardviewcount+1 where boardseq=?";
		PreparedStatement pt1 = con.prepareStatement(pre_sql);
		pt1.setInt(1,seq);
		
		int row =pt1.executeUpdate();
		System.out.println("조회수 1이 증가하였습니다.");
		
		String sql="select * from board where boardseq=?";
		
		PreparedStatement pt = con.prepareStatement(sql);
		pt.setInt(1,seq);
		
		ResultSet rs = pt.executeQuery();
		if(rs.next()){
			vo.setBoardseq(rs.getInt("boardseq"));
			vo.setBoardtitle(rs.getString("boardtitle"));
			vo.setBoardcontents(rs.getString("boardcontents"));
			vo.setBoardwriter(rs.getString("boardwriter"));
			vo.setBoardtime(rs.getString("boardtime"));
			vo.setBoardviewcount(rs.getString("boardviewcount"));
			
		}
	
		
		con.close();
		System.out.println("DB 연결해제");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
		
	}
	
	//게시물검색
	public ArrayList<BoardVO> selectBoard(String title) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
		//0. JDBC DRIVER 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
				
		//1. DB 연결
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board"); 
		System.out.println("DB 연결성공");
		
		String sql="select boardseq, boardtitle, boardwriter, to_char(boardtime,'yyyy-mm-dd hh24:mi-ss') as boardtime" 
					+ " from board"
					+ " where boardtitle like ? "
					+ " order by boardtime desc";
		
		PreparedStatement pt = con.prepareStatement(sql);
		pt.setString(1, "%"+title+"%");
		
		ResultSet rs = pt.executeQuery();
		
		while (rs.next()) {
			int boardseq = rs.getInt("boardseq");
			String boardtitle =rs.getString("boardtitle");
			String boardwriter = rs.getString("boardwriter");
			String boardtime = rs.getString("boardtime");
			
			BoardVO vo = new BoardVO();
			vo.setBoardseq(boardseq);
			vo.setBoardtitle(boardtitle);
			vo.setBoardwriter(boardwriter);
			vo.setBoardtime(boardtime);
			
			list.add(vo);
		}

		con.close();
		System.out.println("DB 연결해제");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	//저장 
	public void insertBoard(BoardVO vo) {
		try {
		//0. JDBC DRIVER 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
				
		//1. DB 연결
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board"); 
		System.out.println("DB 연결성공");
		
		String sql="insert into board"
				+ " values ((select max(boardseq)+1 from board),?,?,?,sysdate,0) ";
		
		PreparedStatement pt = con.prepareStatement(sql);
		System.out.println(vo.getBoardtitle());
		
		pt.setString(1,vo.getBoardtitle());
		pt.setString(2,vo.getBoardcontents());
		pt.setString(3,vo.getBoardwriter());
		
		
		int insertrow = pt.executeUpdate();
		System.out.println("삽입행의 개수 = "+insertrow);
		con.close();
		System.out.println("DB 연결해제");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//수정
	public void updateBoard(BoardVO vo) {
		try {
		//0. JDBC DRIVER 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
				
		//1. DB 연결
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board"); 
		System.out.println("DB 연결성공");
		
		String sql="update board set boardtitle=?, boardcontents=? where boardseq=?";
		
		PreparedStatement pt = con.prepareStatement(sql);
		pt.setString(1,vo.getBoardtitle());
		pt.setString(2, vo.getBoardcontents());
		pt.setInt(3, vo.getBoardseq());
		
		pt.executeUpdate();
		System.out.println("해당파일이 수정되었습니다.");
		
		con.close();
		System.out.println("DB 연결해제");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//삭제
	public void deleteBoard(int seq) {
		try {
		//0. JDBC DRIVER 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//1. DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board"); 
			System.out.println("DB 연결성공");
			
			String sql="delete board where boardseq=?";
		
		PreparedStatement pt = con.prepareStatement(sql);
		pt.setInt(1,seq);
		
		int insertrow =pt.executeUpdate();
		System.out.println("삭제한 게시물수는"+ insertrow);
		
		con.close();
		System.out.println("DB 연결해제");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//페이지 분할 
	public ArrayList<BoardVO> divBoardList(int page){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//1. DB 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board"); 
			System.out.println("DB 연결성공");
			
			String sql="select X.boardseq, X.boardtitle, X.boardcontents, X.boardwriter" + 
					  " from (select rownum as rnum, A.boardseq, A.boardtitle, A.boardcontents, A.boardwriter" + 
					  " 	  from (select boardseq, boardtitle, boardcontents,boardwriter" + 
					  "	  	        from board order by boardseq) A" + 
					  "	  	  where rownum < ? ) X" + 
					  " where X.rnum > ?";
			PreparedStatement pt= con.prepareStatement(sql);
			pt.setInt(1, page*5);
			pt.setInt(2, (page*2-4));
			
			ResultSet rs = pt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setBoardseq(rs.getInt("boardseq"));
				vo.setBoardtitle(rs.getString("boardtitle"));
				vo.setBoardcontents(rs.getString("boardwriter"));
				vo.setBoardtime(rs.getString("boardtime"));
				list.add(vo);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
