import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rtest.RJavaGraph;

@WebServlet("/rjava4")
public class RJavaServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");		
		RJavaGraph rg = new RJavaGraph();		

		if(action.equals("test1")) {
			request.setAttribute("img_content", rg.returnRImg1());	
		} else if(action.equals("test2")) {
			request.setAttribute("img_content", rg.returnRImg2());
		} else if(action.equals("test3")) {
			request.setAttribute ("img_content", rg.returnRImg3());
		} else if(action.equals("test4")) {
			request.setAttribute ("img_content", rg.returnRImg4());
		} 
		request.getRequestDispatcher("/result4.jsp").forward(request, response);
	}

}
