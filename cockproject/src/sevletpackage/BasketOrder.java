package sevletpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CockDAO;
import dao.MemberDAO;

/**
 * Servlet implementation class BasketOrder
 */
public class BasketOrder extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charSet=utf-8");
		request.setCharacterEncoding("utf-8");
		MemberDAO m_dao = new MemberDAO(); 	
		CockDAO c_dao = new CockDAO();

		ArrayList<Integer> list = c_dao.getOrderList();
		
		for (int i : list) {
			System.out.println(i);
		}
		
		HttpSession session = request.getSession();
		String phone = (String)session.getAttribute("phone");
		
		m_dao.updateMemberChoice(list,phone);
		
		c_dao.deleteBasketList();
		
		request.getSession();
		
		
		RequestDispatcher rd = request.getRequestDispatcher("finally.jsp"); //
		rd.forward(request, response);
		
		
		
		
		
}
}
