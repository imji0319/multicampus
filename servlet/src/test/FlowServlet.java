package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//main : 콘솔 출력
//main X : 브라우저  서블릿 실행 
//tomcat : 웹어플리케이션 서버 (=servlet container) :: 객체생성 -메소드실행 순서 제어 

public class FlowServlet extends HttpServlet {
	@Override
	public void destroy() {
		System.out.println("destory 메소드 호출"); //destory() 서버 종료하면  한번
	}

	@Override
	public void init() throws ServletException { //init() 서버 시작한후 바로 단 한번
		System.out.println("수정 init 메소드 호출");
	}
	
	//doGet() multithread 운영, 요청할 때마다 실행
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메소드 호출");
	
}
}
