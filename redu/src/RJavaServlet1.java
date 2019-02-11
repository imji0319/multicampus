import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rtest.MyRConnect;

@WebServlet("/rjava1")
public class RJavaServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyRConnect conn = new MyRConnect();
		request.setAttribute("conn",conn);
		request.getRequestDispatcher("/result1.jsp").forward(request, response);
	}
}
