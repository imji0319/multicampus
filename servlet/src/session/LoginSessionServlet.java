package session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginSessionServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//1. HttpSession 생성 
		//브라우저를 열고 최초 요청 -HttpSession 객체 생성
		//브라우저 2번이상 요청시 생성된 HttpSession 객체 리턴 
	
		HttpSession session = request.getSession();
		System.out.println(session.isNew()); //t/f
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String html = "";
		
		if (session.getAttribute("sessionid") != null &&
				((String)session.getAttribute("sessionid")).equals(request.getParameter("id"))) {
			html="<h1>이미 로그인하셨습니다.</h1>";
			
		}
		else {
			//2. 입력 ID 전송 받아 생성된 세션에 저장 
			session.setAttribute("sessionid", //session에 저장되는 값의 이름  
						request.getParameter("id"));
			html="<h1> 아이디를 세션에 저장했습니다.</h1>";
				
			//session.getAttribute("sessionid") -> set 과 같은 페이지에서 만드느 것보단 get을 하는 파일에서 만드는 것이 좋음
		}		
		out.println(html);
		out.println("<a href='mypagesession'> 마이페이지로 이동하기 </a> <br>"); //servlet <-> servlet 연결 가능 
		out.println("<a href='logoutsession'> 로그아웃하기 </a>"); //servlet <-> servlet 연결 가능 
		out.println("<a href='http://localhost:8081/servlet/jsp/boardwrite_session.jsp'> 글쓰러 이동하기  </a>");

}
}
