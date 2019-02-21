<%@page import="dao.CockDAO" %>
<%@page import="vo.PersonalVO" %>
<%@page import="vo.CocktailVO" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>개별 추천 리스트</title>
<script src="jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#back").on('click', function(){
			location.href="personal.jsp";
		})
		$("#best").on('click', function(){
			location.href="bestlist.jsp";
		})
	})
	
</script>
<style type="text/css">

html { background: url(photo/backweb.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;}


@font-face{font-family : thefaceshop;src : url("fonts/THEFACESHOP INKLIPQUID.TTF");}		

@font-face{font-family : yeonsung; src : url("fonts/BMYEONSUNG_TTF.TTF");}

	
	.personal_menu_list{
		font-family: thefaceshop;
		font-size: 50px;
		text-align: center;	
		padding-top: 100px;
		padding-bottom: 10px;
		color:white;
	}
	
	.container {
	width:83%;
	height : 650px;
	padding:30px 0;
	border-radius:7px;
	background-color: rgba(209,143,208,0.5);
	margin-bottom: 0px;
	}
	
	
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

	
	.item{
	display:inline-block;
	font-family: thefaceshop;
	margin:5px;
	}

	.info{
	margin-bottom:10px;
	}
	.info_name{
	font-size: 20px;
	font-weight: bold;
	}
	.alcohol{
	font-size:16px;
	}
input[type=submit]{
	margin-top : 20px;
	background-color: rgba(242,175,208,0.8);
	border : none;
	font-family: yeonsung;
	font-size: 20px;
	text-align: center;
	border-radius: 8px;
	width:100px;
}
	
	#go {
		float:right;
	}
	
	#back{
		float:left;
	}
	
	.move{
		width:60px;
		height:auto;
	}
	
.movebest{
	font-family: thefaceshop;
	font-size: 35px;
	text-align: center;
	background-color: rgba(209,143,208,0.5);
	width:800px;
	height:150px;
	border-radius: 10px;
}	

h3{
	padding-top:25px;
}

#best{
	border:none;
	background-color: rgba(242,175,208,0.8);
	font-family:thefaceshop;
	font-size:30px;
	border-radius: 20px;
	margin-top:10px;
	width:100px;
	
}
	.back_button{
	width:40px;
	height:auto;
	float:right;
	margin-top:20px;
	margin-right:30px;
	}
	
	.choice{
		text-align: center;
		margin:auto;
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
	margin : auto;
	margin-left:10px;
	
}	

input[type=checkbox]{
	position:relative;
	top:-35px;
}
</style>
</head>
<body>


<div class=personal>
	<a href="everyList.jsp"><img class=back_button src="photo/menu.png"></a>
	<p class=personal_menu_list>PERSONAL MENU LIST</p>	
</div>


<div class=contatiner align="center">	

<% 
	session.getAttribute("phone");
	
	int cola = -1;
	int choco = -1;
	int fruit = -1;
	int coffee = -1;
	int alcohol_grade = Integer.parseInt(request.getParameter("alcohol_grade"));
	String base = request.getParameter("base");
	String[] taste = request.getParameterValues("taste");
	
	if(base == null || base == "") {
		base = "";
	}
	
	if(taste == null) {
		cola = 0;
		choco = 0;
		fruit = 0;
		coffee = 0;
	}
	else if(taste != null) {
  		for (String i : taste){
 			if(i.equals("taste_cola")) {	
 				cola = 1;
 			}
 			if(i.equals("taste_choco")) {
 				choco = 1;
 			}
 			if(i.equals("taste_fruit")) {
 				fruit = 1;
 			}
 			if(i.equals("taste_coffee")) {
 				coffee = 1;
 			}
 		}  
	}
	
	CockDAO dao = new CockDAO();
	PersonalVO vo1 = new PersonalVO(alcohol_grade,cola,choco,fruit,coffee,base);
	CocktailVO vo = new CocktailVO();
	
	
	ArrayList<CocktailVO> list = dao.getPersonalList(vo1);
	
	out.println("<form name='project' method='post' action='BasketListToPersonal'>"
			+ "<div class='jb-table'><div class='jb-table-row'>");
	
	%>
	
	<%
	if(list.size() == 1){
		vo = list.get(0);
		out.println("<div class='jb-table-cell'>"
				+"<div class='item total'>"
				+ "<input type=checkbox name=cock_id id=cock_id value="+vo.getCock_id()+">"
					+ "<div class='item img'><img src=" + "photo/cocktail_image/" + vo.getCock_id()+ ".jpg class='cock_img'>" 
					+ "</div>"
					+ "<div class='item info'>"
					+ "<p class='item info_name'>"+vo.getCock_name()+"</p><p class='alcohol'> ALCOHOL : "+vo.getAlcohol()+"</p>"
					+ "</div>"
				+"</div></div>");
	}
	
	
	else if(list.size() != 0) {
		for(int i = 0; i < 5 && i < list.size(); i++) {
			vo = list.get(i);
			out.println("<div class='jb-table-cell'>"
					+"<div class='item total'>"
					+ "<input type=checkbox name=cock_id id=cock_id value="+vo.getCock_id()+">"
						+ "<div class='item img'><img src=" + "photo/cocktail_image/" + vo.getCock_id()+ ".jpg class='cock_img'>" 
						+ "</div>"
						+ "<div class='item info'>"
						+ "<p class='item info_name'>"+vo.getCock_name()+"</p><p class='alcohol'> ALCOHOL : "+vo.getAlcohol()+"</p>"
						+ "</div>"
					+"</div></div>");
			
		}	

	}
	
	else {
		out.println("<div class=movebest>"
					+"<h3> 조건에 맞는 Cocktail 을 찾지 못했습니다.<br>"
					+" Best 메뉴를 확인해보세요. </h3></div>"
					+"<input type=button id=best name=best value=best>");
	}
	
	out.println("</div></div>");
	out.println("<div class=choice>"
			+"<input class=add type=submit value='ADD'>"
			+"<input type=button onclick='location.href='basket.jsp';' class='basket' value='BASKET'>"
			+"</div>");
	%>
	<% out.println("</form>");%>
	
</div>

</body>
</html>