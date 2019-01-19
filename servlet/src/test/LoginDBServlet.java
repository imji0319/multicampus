package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginDBServlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//호출 
	request.setCharacterEncoding("utf-8");
	
	//id, pw 이름 파라미터 2개 입력 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//로그인 처리 : jdbc
	//DB member 테이블 id,pw 조사 sql
	String result="";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
		System.out.println("DB 연결성공");
		
		String sql = "select id, password from member where id=?";
		
		PreparedStatement pt= con.prepareStatement(sql);
		pt.setString(1,id);
		
		ResultSet rs = pt.executeQuery();
		
		String db_id="";
		String db_pw="";
		if (rs.next()) {
			db_id =rs.getString("id");
			db_pw =rs.getString("password");
		}
		con.close();
		System.out.println("연결 해제 성공");
		
		if (id.equals(db_id)) {
			if (pw.equals(db_pw)) {
				result ="정상 로그인 사용자입니다.";
			}
			else {
				result="암호를 확인하세요";
			}
		}
		else {
			result ="회원이 아닙니다.";
		}

	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	//응답
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	out.println("<h1>"+result+"</h1>");
	
	
}
}
