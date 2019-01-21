package forward;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException {
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charSet=utf-8");
	PrintWriter out = response.getWriter();
	
	out.println("<h1> 일반 유저용 화면입니다. </h1>");
	String id = (String)request.getAttribute("id");
	String pw = (String)request.getAttribute("pw");
	
	out.println("<h2> 아이디 : "+id+" 비밀번호: "+pw+" </h2>");
	
		
		
	
	
}
}
