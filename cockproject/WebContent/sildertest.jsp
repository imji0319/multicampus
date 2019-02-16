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
<link rel="stylesheet" href="swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>

<style type="text/css">

.swiper-container {
	width:640px;
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
.swiper-slide img {
	box-shadow:0 0 5px #555;
}

/* 예제를 위한 설정 */
.swiper-slide:nth-child(odd) img { height:400px; } /* 홀수번째 이미지 높이 400px */
/* 참고 : 예제에서는 짝수 번째에 적용됩니다. Swiper를 적용하면 그렇게 됩니다. */

</style>

</head>
<body>
<div>
	<h1>  ALL MENU </h1>
</div>

<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/474.jpg"></div>

		<% 
			for (int i=1;i<=17;i++){
				out.println("<div class='swiper-slide'>"+
							"<table border='1'>"+
							"<tr><td> cock_id </td><td> cock_name </td><td> alcohol_grade </td><td> base </td></tr>"); 
				
				
				CockDAO dao = new CockDAO();
				ArrayList<CocktailVO> list = dao.getAllList(i);
				
				
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
<div style="text-align:center; margin-top:5px;">랜덤사진 갤러리</div>



<!-- 예제 종료 -->


</body>
</html>