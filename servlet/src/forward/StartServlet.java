package forward;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StartServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException {
	
	/* 1. http에서 startservlet?id=&pw=
	 * 2. id= system이거나admin이며 (대소문자무시) -> adminservelt
	 * 3. 2번이 아닌  나머지 경우 ->userservlet 이동 (id,pw 전달) 
	 */
	
	response.setContentType("text/html;charSet=utf-8");
	PrintWriter out = response.getWriter();
	out.println("시작페이지입니다.");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	for (int i=0; i<pw.length();i++) {
		pw = pw.replace(pw.charAt(i), '*');
	}
	
	
	request.setAttribute("id", id);
	request.setAttribute("pw", pw);
	
	
	if (id.equalsIgnoreCase("system") || id.equalsIgnoreCase("admin")) {
		RequestDispatcher rd = request.getRequestDispatcher("AdminServlet"); 
		rd.forward(request, response);
	
	}else {
		RequestDispatcher rd =request.getRequestDispatcher("UserServlet");
		rd.forward(request,response);
	}

}
}
