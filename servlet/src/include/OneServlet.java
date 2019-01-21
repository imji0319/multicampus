package include;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OneServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//http:.../one
	//+ SharedServlet 실행결과 포함
	
	String dev = request.getParameter("dev");
	request.setAttribute("devname", dev+"개발자님"); //이름, 값 
	
	response.setContentType("text/html;charSet=utf-8");
	PrintWriter out = response.getWriter();
	out.println("<h1> OneServlet 실행되었습니다.</h1>");
	
	RequestDispatcher rd = request.getRequestDispatcher("shared"); //SharedServlet의 mapping이름
	
	rd.include(request, response); //include : 현재 서블릿 포함
	//rd.forward(request, response); //forward : 이전 출력 저장 내용 삭제하고 실행, Shared로 완전 이동 
	
	
	
	
	
	
	out.println("<h1> 보이십니까?</h1>");
	
}
}
