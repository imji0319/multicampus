<%@page import="dao.CockDAO" %>
<%@page import="vo.PersonalVO" %>
<%@page import="vo.CocktailVO" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>개별 추천 리스트</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#back").on('click', function(){
			location.href="personal.jsp";
		})
	})
</script>
<style type="text/css">

	body {
		background:url("photo/backweb.jpg") no-repeat center center fixed;
				-webkit-background-size:cover;
				-moz-background-size:cover;
				-o-background-size:cover;
				background-size:cover;
	}
	
	
	#go {
		float:right;
	}
	
	#back{
		float:left;
	}
	
</style>
</head>
<body>
<% 
	session.getAttribute("phone");
	
	int cola = -1;
	int choco = -1;
	int fruit = -1;
	int coffee = -1;
	int alcohol_grade = Integer.parseInt(request.getParameter("alcohol_grade"));
	String base = request.getParameter("base");
	String[] taste = request.getParameterValues("taste");
	
	if(base == null) {
		base = "리큐어";
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
	
	
	
	ArrayList<CocktailVO> list = dao.getPersonalList(vo1);
	
	%>
<form id=personal_list action="basket.jsp">
<table border="1" align="center" style="border-collapse:collapse; border:1px gray solid;">
	<tr>
		<td>주문</td>
		<td>번호</td>
		<td>이름</td>
		<td>사진</td>
	</tr>
	
	<%
	for(int i = 0; i < list.size(); i++) {
		CocktailVO vo = list.get(i);
		out.println("<tr><td><input type=checkbox name=cock_id id=cock_id value="+vo.getCock_id()+"></td>"
		+ "<td>" + vo.getCock_id() + "</td>"
				+ "<td>"+ vo.getCock_name() + "</td><td><img src=" + "photo/" + vo.getCock_id()
				+ ".jpg" + "></td></tr>");
	}	
	%>

	<!-- <tr>
		<td colspan=3><input type=submit id=cart name=cart value="장바구니">
		<input type=button id=back name=back value="다시 선택"></td>
	</tr> -->
	
</table>
	<a id="back" href="everyList.jsp"><img src="photo/Back.png"></a>
	<input id="go" type="image" img src="photo/go.png">

</form>



</body>
</html>