package sevletpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CockDAO;

/**
 * Servlet implementation class DeleteItemBasket
 */
public class DeleteItemBasket extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String cock_id = request.getParameter("cock_id");
		System.out.println(cock_id);
		CockDAO dao = new CockDAO(); 	
	
		dao.deleteBasketList(Integer.parseInt(cock_id));
		
		RequestDispatcher rd = request.getRequestDispatcher("basket.jsp"); //
		rd.forward(request, response);
		
		
	}
}
