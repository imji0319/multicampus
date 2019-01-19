package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//id, pw 이름 2개 값 전송 받음 
	String id = request.getParameter("id"); // 태그의 name = id
	String pw = request.getParameter("pw"); // name = pw
	
	//출력
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	out.println("<h2> 입력한 아이디는 "+id+"이고</h2>");
	out.println("<h2> 입력한 비밀번호는 "+pw+"입니다.</h2>");
	
	
}
}
