package shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ProductVO;

public class ShopServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException {
	
	//http: servlet/shop?
	//http: servlet/jsp/*.jsp
	String file="";
	
	if(request.getParameter("menu")== null) {
		file="jsp/start.jsp";
	}else{
		String menu = request.getParameter("menu");
		file= "jsp/"+menu+".jsp";
	}

	
	//5개의 상품 저장 배열 생성 - productlist.jsp 출력 
	//Product VO 상품 : code, 이름 ,가격,재고, 설명 ,이미지파일
	
	ArrayList<ProductVO> list = new ArrayList<ProductVO>();

	list.add(new ProductVO(1000,"삼성에어컨",1000000,10));
	list.add(new ProductVO(2000,"LG공기청정기",500000,20));
	list.add(new ProductVO(3000,"LG그램",1200000,30));
	list.add(new ProductVO(4000,"맥주",2500,350));
	list.add(new ProductVO(5000,"라면",1000,1000));
	
	request.setAttribute("productlist", list);
	
	RequestDispatcher rd = request.getRequestDispatcher(file); 
	rd.forward(request, response);
	
	
}
}
