import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rtest.RJavaText;

@WebServlet("/rjava2")
public class RJavaServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RJavaText ex = new RJavaText();
		String result1 = ex.getRVersion();
		double result2[] = ex.getDoubles1();
		double result3[] = ex.getDoubles2();
		String result4[][] = ex.getDataFrame(); 
		
		request.setAttribute("result1", result1);
		request.setAttribute("result2", result2);
		request.setAttribute("result3", result3);
		request.setAttribute("result4", result4);
		request.getRequestDispatcher("/result2.jsp").forward(request, response);
	}
}
