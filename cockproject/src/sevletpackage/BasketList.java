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
		response.setContentType("text/html;charSet=utf-8");
		request.setCharacterEncoding("utf-8");
		String [] cock_id = request.getParameterValues("cock_id");
		String base = (String)request.getParameter("base");
		//System.out.println(base);
		
		CockDAO dao = new CockDAO(); 	
		for (String i : cock_id) {
			dao.addBasketList(Integer.parseInt(i));
		}
		
		
		if (base == null) {
			RequestDispatcher rd = request.getRequestDispatcher("all_list.jsp"); //
			rd.forward(request, response);
		
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("base.jsp?base="+base);
			rd.forward(request, response);
		}
		
		
	}

}
