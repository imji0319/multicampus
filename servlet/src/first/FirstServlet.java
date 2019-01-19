package first;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FirstServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//다국어 처리  - html태그 외에도 xml과 같은 태그가 있을 수 있음 
		response.setContentType("text/html;charset=utf-8"); 
		
		PrintWriter out = response.getWriter();
		out.println("<h1> hello 서블릿 실행결과입니다.</h1>");
		
		out.println("<h3> hello Servlet complete.</h3>");
		
		
	}

}
