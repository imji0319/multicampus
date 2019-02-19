<%@page import="java.util.ArrayList"%>
<%@page import="vo.BestVO"%>
<%@page import="dao.CockDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>이달의 추천 리스트</title>

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>		
<head>
<style>
html { background: url(photo/backweb.jpg) no-repeat center center fixed; 
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
}
	.container {
		width: 70%;
		height : 70%;
		margin:auto;
		margin-top:10px;
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
	
	
</style>

</head>
<h3 align="center">이달의 추천 리스트</h3>
<body>
<%
CockDAO dao = new CockDAO();
ArrayList<BestVO> list = dao.getBestList();
%>

<form action=basket.jsp name=cock_id>
	<table border="1" align="center" style="border-collapse:collapse; border:1px gray solid;">
	<tr align="center">
		<td>주문</td>
		<td>번호</td>
		<td>이미지</td>
		<td>이름</td>
		<td>순위</td>
	</tr>

	<%
	for(int i = 0; i < list.size(); i++){
	BestVO vo = list.get(i);
	out.println("<tr><td align='center'><input type = checkbox name=cock_id value="+vo.getNum()+"></td><td>" 
			+ vo.getNum() + "</td>"
			+"<td><img src = photo/cocktail_image/"+vo.getNum()+".jpg width=60 hidth=100></td>"			
			+ "<td>"+ vo.getName() + "</td><td>"
			+ vo.getRank() + "</td></tr>");
	}
	%>
	</table><br>
	<div class=container>		
		<div class='list'>
			<div class=left>
				<a id="every" href="everylist.jsp"><img src="photo/Back.png" width=80 height=80></a>
			</div>
			<div class=right>
				<input type="image" img src="photo/go.png" width=80 height=80>
			</div>
		</div>
	</div>
	</form>

</body>
</html>