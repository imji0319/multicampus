package sevletpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CockDAO;

/**
 * Servlet implementation class BasketList
 */
public class BasketList extends HttpServlet {
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String [] cock_id = request.getParameterValues("cock_id");
		
		CockDAO dao = new CockDAO(); 	
		for (String i : cock_id) {
			dao.addBasketList(Integer.parseInt(i));
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("all_list.jsp"); //
		rd.forward(request, response);
			
	}

}
