<%@ page import="vo.CocktailVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CockDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALL MENU LIST</title>
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

<script src="js/swiper.min.js"></script>

<style type="text/css">

html { background: url(photo/backweb.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;}


@font-face{font-family : thefaceshop;src : url("fonts/THEFACESHOP INKLIPQUID.TTF");}		

@font-face{font-family : yeonsung; src : url("fonts/BMYEONSUNG_TTF.TTF");}

.container{
	margin-top:0px;
	margin-buttom:0px;
}

.all_menu_list{
	font-family: thefaceshop;
	font-size: 50px;
	text-align: center;	
	padding-bottom : 20px;
	color:white;
	margin-top:0px;
	margin-bottom: 10px;
}	

.swiper-container {
	width:83%;
	height : 650px;
	padding:30px 0;
	border-radius:7px;
	background-color: rgba(209,143,208,0.5);
	margin-bottom: 0px;
}

.swiper-slide {
	text-align:left;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
	}


a {text-decoration: None; color : black; }

.left {
	float:left;
	width : 13%;
	height:900px;;
	text-align: center;
	background-color: rgba(184,96,161,0.3);
	margin-top:0px;
}


#base_menu {
	padding-top: 200px;
}


.base_list{
	list-style-type: none;
	font-size: 25px;
	font-family: yeonsung;
}

.base {
	font-family: thefaceshop;
	font-size: 40px;
}


.back_button{
	width:40px;
	height:auto;
	float:right;
	margin-top:20px;
	margin-right:30px;
}

.swiper-pagination-bullet-active{opacity:1;
								background:rgb(112,48,160)}


.jb-table{display:table;
		border-spacing: 20px}

.jb-table-row{display:table-row;}
			
.jb-table-cell{display:table-cell; 
			vertical-align: middle;
			border-radius: 10px;
			background-color: rgba(112,48,160,0.4);
			width:430px;
			height:150px;
			}

.cock_img{
	width : 60px;
	height:auto;
	border-radius : 20px;
	border : solid 1px rgba(242,175,208,0.8) ;
	margin-left: 10px;
	margin-right : 5px;
	
}

input[type=submit]{
	margin-top : 20px;
	background-color: rgba(242,175,208,0.8);
	border : none;
	font-family: yeonsung;
	font-size: 20px;
	text-align: center;
	border-radius: 8px;
	width : 100px;
}

.basket{
	margin-top : 40px;
	background-color: rgba(242,175,208,0.8);
	border : none;
	font-family: yeonsung;
	font-size: 20px;
	text-align: center;
	border-radius: 8px;
	width:100px;
	margin-left : 20px;
}


.item{
	display:inline-block;
	font-family: thefaceshop;
	margin:5px;
}

.info{
	display:inline-block;
	font-family: thefaceshop;
	margin:5px;
	font-size : 16px;
	font-weight:bold;
}

.info_name{
	font-size: 18px;
}
input[type=checkbox]{
	position:relative;
	top:-35px;
}

	.button{
		float:right;
		margin-right:30px;
		margin-top:20px;
	}
	
	#back{
		display:inline-block;
		padding-left:10px;
	}
	
	#basket{
		display:inline-block;
	}
	
	.back_button{
		display:inline-block;
	}

	.move{
		width:40px;
		height:auto;
	}


</style>
</head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<body>
<div class=button>
	<a id="back" href="DeleteItemBasketToLogin"><img class=move src="photo/login.png"></a>
	<a id="basket" href="basket.jsp"><img class=move src="photo/shopping-basket.png"></a>
	<a id='back_button' href="everyList.jsp"> <img src="photo/menu.png" class=move></a>
</div>	
<div class=left>
<nav id=base_menu>
	<p class=base>  BASE </p>
	
	<div class=base_list>
		<a href="all_list.jsp">ALL</a><br>
		<a href="base.jsp?base=보드카">VODCA</a><br>
		<a href="base.jsp?base=위스키">WHISKY</a><br>
		<a href="base.jsp?base=데킬라">TEQULIA</a><br>
		<a href="base.jsp?base=와인">WINE</a><br>
		<a href="base.jsp?base=럼">LUM</a><br>
		<a href="base.jsp?base=리큐어">LIQUEUR</a><br>
		<a href="base.jsp?base=논알콜">NONE</a><br>
	</div>
</nav>

</div>
<div class=container>

<div >
	<p class=all_menu_list> ALL MENU LIST </p>
</div>
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
	
	out.println("<div class='swiper-slide'>" 
			+ "<form name='prohect' method='post' action='BasketList'>" 
			+ "<input type=hidden name='base' value="+base+">"
			+ "<div class='jb-table'>"); 

	ArrayList<CocktailVO> list = dao.getBaseList(base,i);
	
	
	int num;
	if (list.size() % 2 !=0){
		num = list.size()/2+1;
	}else{
		num = list.size()/2;
	}
				
			int h;
			for (h=0;h<num;h++){
				out.println("<div class='jb-table-row'>");
					
				for (int j=(h*2); j<(h*2+2) && j<list.size(); j++){
					CocktailVO vo = list.get(j);
					out.println("<div class=jb-table-cell>" 
								+"<div class='item total'>"
								+"<input type='checkbox' id='cock_id' name='cock_id' value='"+vo.getCock_id()+"'>"
								+"<div class='item img'>"
									+"<img src='photo/cocktail_image/"+vo.getCock_id()+".jpg' class='cock_img'>"
								+"</div>"
								+"<div class='item info'>"
									+ "<p class='itme info_name'>"+ vo.getCock_name() +"</p>"
									+"ALCOHOL : " + vo.getAlcohol_grade()+"<br>"
									+"BASE : " + vo.getBase()
								+"</div>"
								+"</div></div>" );
					} // cell for end;
					
					out.println("</div>");
				}
				
			out.println("</div>"
					+"<input class=add type=submit value='ADD'>"
					+"</form>"
					+"</div>");
		};
				
		%>

		
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next" style="width:50px;height:50px;background-size:45px; background-image: url('photo/rightbutton.png')"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev" style="width:50px;height:50px;background-size:45px;  background-image: url('photo/leftbutton.png')"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
</div>

<!-- 예제 종료 -->

</body>
</html>