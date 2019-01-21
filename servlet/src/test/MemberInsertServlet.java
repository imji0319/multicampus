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

public class MemberInsertServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//호출 
		request.setCharacterEncoding("utf-8");
		
		//파라미터 5개 입력 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		//입력받은 정보 member 테이블에 저장 
		//id의 primarykey 확인 -> not :insert 실행하지않고 result="다른 아이디를 입력하세요"
		//result= "회원가입되었습니다."
		String result="";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
			System.out.println("DB 연결성공");
			
			String sql="";
			PreparedStatement pt;
			
			sql= "select id from member where id = ? ";
			pt = con.prepareStatement(sql);
			pt.setString(1,id);
			ResultSet rs = pt.executeQuery();
			
			if (rs.next()) {
				
				result="다른 아이디를 입력하세요.";
				
			}
			else {
				
				sql = "insert into member values (?,?,?,?,?,sysdate)";
				pt = con.prepareStatement(sql);
			
				pt.setString(1, id);
				pt.setInt(2,Integer.parseInt(pw));
				pt.setString(3, name);
				pt.setString(4, phone);
				pt.setString(5, email);
			
				pt.executeUpdate();
				result = "회원가입되었습니다.";
			
			}
			con.close();
			System.out.println("연결 해제 성공");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>"+result+"</h1>");
		

}
}
