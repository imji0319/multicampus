import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rtest.RLeaflet;
import rtest.WordCloud2;

@WebServlet("/rjava5")
public class RJavaServlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");		
		
		if(action.equals("leaflet1")) {
			RLeaflet rc = new RLeaflet();		
			String real_path = request.getSession().getServletContext().getRealPath("/");
			System.out.println(real_path);
		    real_path = real_path.replace("\\", "/");
		    System.out.println(real_path);		
			File f = new File(real_path+"/leafletchart1");
			if(!f.exists()) f.mkdir();
			String type = request.getParameter("type");
			if(type == null)
				type = "종합";
			String result = rc.returnLeaflet1(real_path+"/leafletchart1", type);
			request.setAttribute("leafletChartName", "http://localhost:8081/redu/leafletchart1/"+result);	
		
		} else if(action.equals("leaflet2")) {
			RLeaflet rc = new RLeaflet();		
			String real_path = request.getSession().getServletContext().getRealPath("/");
			System.out.println(real_path);
		    real_path = real_path.replace("\\", "/");
			File f = new File(real_path+"/leafletchart2");
			if(!f.exists()) f.mkdir();
			String result = rc.returnLeaflet2(real_path+"/leafletchart2");
			request.setAttribute("leafletChartName", "http://localhost:8081/redu/leafletchart2/"+result);	
		
		} else if(action.equals("leaflet3")) {
			RLeaflet rc = new RLeaflet();		
			String real_path = request.getSession().getServletContext().getRealPath("/");
			System.out.println(real_path);
		    real_path = real_path.replace("\\", "/");
		    System.out.println(real_path);		
			File f = new File(real_path+"/leafletchart3");
			if(!f.exists()) f.mkdir();
			String result = rc.returnLeaflet3(real_path+"/leafletchart3");
			request.setAttribute("leafletChartName", "http://localhost:8081/redu/leafletchart3/"+result);	
		
		} else if(action.equals("wc2")) {
			WordCloud2 wc = new WordCloud2();
			request.setAttribute("content", wc.returnWC2());
		} 
		request.getRequestDispatcher("/result5.jsp").forward(request, response);
	}
}
