package session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginSessionServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//1. HttpSession 생성 
		HttpSession session = request.getSession();
		
		//2. 입력 ID 전송 받아 생성된 세션에 저장 
		session.setAttribute("sessionid", //session에 저장되는 값의 이름 
				request.getParameter("id"));
		
		//session.getAttribute("sessionid") -> set 과 같은 페이지에서 만드느 것보단 get을 하는 파일에서 만드는 것이 좋음
		
		
		

}
}
