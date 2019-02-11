import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rtest.RJavaOracleDB;


@WebServlet("/rjava3")
public class RJavaServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		RJavaOracleDB rdb = new RJavaOracleDB();
		if(action.equals("test1")) {
			request.setAttribute("result", rdb.returnDBData(1));
		} else if(action.equals("test2")) {
			request.setAttribute ("result", rdb.returnDBData(2));
		} else if(action.equals("test3")) {
			String name = request.getParameter("name");
			if(name == null)
				request.setAttribute ("result", "name=xx 형식으로 쿼리 전달하숑!!");
			else
				request.setAttribute ("result", rdb.returnDBData("\\'"+name+"\\'"));
		} else if(action.equals("test4")) {
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			request.setAttribute ("result", rdb.insertDBData("\\'"+name+"\\'", "\\'"+content+"\\'"));
		}
		request.getRequestDispatcher("/result3.jsp").forward(request, response);
	}
}
