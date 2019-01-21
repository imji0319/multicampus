package session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutSessionServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException {
	
	//1. 생성된 session 객체 호출
	HttpSession session = request.getSession();
	
	//2. 저장된 sessionid 삭제
	session.removeAttribute("sessionid");
	
	
		
	
}
}
