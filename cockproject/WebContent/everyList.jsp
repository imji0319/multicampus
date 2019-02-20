<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

html { background: url(photo/backweb.jpg) no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;background-size: cover;}


	.container {
		width: 70%;
		height : 70%;
		margin:auto;
		margin-top:200px;
		posistion:relative;
		
		text-align: center;
	}
	
	@font-face{
		font-family : thefaceshop;
		src : url("fonts/THEFACESHOP INKLIPQUID.TTF");
		
	}
	
	
	.menu {
		height : 150px;
		font-family:thefaceshop;
		font-size: 35px;
	}
	
	.menu_list{
		width : 200px;
		height : auto;
	}

	.left {
		display:inline-block;
		text-align: center;
	}
	
	.center {
		display:inline-block;
		margin-left : 10px;
		margin-right : 10px;
		text-align: center;
		
	}
	
	.right {
		display:inline-block;
		text-align: center;
	}
	
	
	#back{
	float:left;
	margin-left:20px;
	}
	
	
	.move{
		margin-top:130px;
		width:60px;
		height:auto;
	}
	
	
</style>


</head>
<body>
<%	session.getAttribute("phone"); %>

<div class=container>

	<div class='menu'>
		<h1>MENU</h1>
	</div>
		
	<div class='list'>
		<div class=left><a id="all" href="all_list.jsp"><img class="menu_list" src="photo/all.png"></a></div>
		<div class=center><a id="personnel" href="personal.jsp"> <img class="menu_list" src="photo/personal.png"></a></div>
		<div class=right><a id="best" href="bestlist.jsp"><img class="menu_list" src="photo/best.png"></a></div>
	</div>

</div>
<div>
		<a id="back" href="homepage.jsp"><img class=move src="photo/Back.png"></a>
</div>

</body>
</html>
