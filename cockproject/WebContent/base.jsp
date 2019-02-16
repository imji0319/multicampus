<%@ page import="vo.CocktailVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CockDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){

new Swiper('.swiper-container', {

	loop : true, // 슬라이드 반복
	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

});

</script>

<!-- 예제 시작 -->

<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
<link rel="stylesheet" href="css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>

<style type="text/css">

.swiper-container {
	width:75%;
	height : 700px;
	padding:30px 0;
	border:5px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
	}
	
a:visited {
	text-decoration: None;
	text:black
}

a:hover{
	text-decoration: underline;
}

#menu {
	float:left;
	width:15%;
	text-align: center;
}

ul{
	list-style-type: none;
}


</style>

</head>
<body>
<div class=container>
	<div>
		<h1 style="text-align:center">  ALL MENU </h1>
	</div>

	<nav id=menu>
		<h3>BASE</h3>
		<ul>
		<li><a href="all_list.jsp">ALL</a></li>
		<li><a href="base.jsp?base=보드카">VODCA</a></li>
		<li><a href="base.jsp?base=위스키">WHISKY</a></li>
		<li><a href="base.jsp?base=데킬라">TEQULIA</a></li>
		<li><a href="base.jsp?base=와인">WINE</a></li>
		<li><a href="base.jsp?base=럼">LUM</a></li>
		<li><a href="base.jsp?base=리큐어">LIQUEUR</a></li>
		<li><a href="base.jsp?base=논알콜">NONE</a></li>
		</ul>
	</nav>
	
	<!-- 클래스명은 변경하면 안 됨 -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
		<% 	
		String base = request.getParameter("base");
		CockDAO dao = new CockDAO();
		int total=dao.getTotalCock(base);
		int pagecount;
		
		if (total % 6 != 0){
			  pagecount = total/6 + 1;
		}
		else{
			pagecount = total/6;
		}
		
		for (int i=1;i<=pagecount;i++){
			out.println("<div class='swiper-slide'>"+
						"<table border='1'>"+
						"<tr><td> cock_id </td><td> cock_name </td><td> alcohol_grade </td><td> base </td></tr>"); 

			ArrayList<CocktailVO> list = dao.getBaseList(base,i);
				
				
			for (int j=0; j<list.size();j++){
				CocktailVO vo = list.get(j);
				out.println("<tr><td>" + vo.getCock_id() 
							+"</td><td>" + vo.getCock_name() 
							+"</td><td>" + vo.getAlcohol_grade()
							+"</td><td>" + vo.getBase()+"</tr>" );
				}
		%>

		<% out.println("</table></div>");
		} //for end  %>

		
		</div>

		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	
</div>


<!-- 예제 종료 -->


</body>
</html>

