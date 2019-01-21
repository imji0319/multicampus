package include;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TwoServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charSet=utf-8");
	PrintWriter out = response.getWriter();
	out.println("<h1> TwoServlet 실행되었습니다.</h1>");
	
	RequestDispatcher rd =request.getRequestDispatcher("shared"); //SharedServlet의 mapping이름

	rd.include(request, response); 
	out.println("<h1> 보이십니까?</h1>");


}
}
