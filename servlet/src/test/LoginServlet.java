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
	//request.setCharacterEncoding("utf-8"); //doPost 일때만 필요한 함수, 읽기 전에 실행
	String id = request.getParameter("id"); // 태그의 name = id
	String pw = request.getParameter("pw"); // name = pw
	String habby[]=request.getParameterValues("habby"); 
	//복수의 값 여러개 : getParameterValues - <input type=checkbox> <select multiple="multiple">
	
	String total="";
	for (String s :habby) {
		total+="-"+s;
	}
	//출력
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	
	out.println("<h2> 입력한 아이디는 "+id+" 이고</h2>");
	out.println("<h2> 비밀번호는 "+pw+" 입니다.</h2>");
	out.println("<h2> 취미는 "+total+" 입니다.</h2>");
	
	
	
}
}
