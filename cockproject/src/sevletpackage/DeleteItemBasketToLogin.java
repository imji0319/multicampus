package sevletpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CockDAO;

/**
 * Servlet implementation class DeleteItemBasketToLogin
 */
public class DeleteItemBasketToLogin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CockDAO dao = new CockDAO(); 	
	
		dao.deleteBasketList();
		
		RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp"); //
		rd.forward(request, response);
		
		
}
}
