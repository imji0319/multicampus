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
<title>Insert title here</title>
</head>
<body>
<%
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
	
<table border="1" align="center" style="border-collapse:collapse; border:1px gray solid;">

	<tr align="center">
		<td>번호</td>
		<td>이름</td>
	</tr>
	
	<%
	for(int i = 0; i < list.size(); i++) {
		CocktailVO vo = list.get(i);
		out.println("<tr><td align='center'>" + vo.getCock_id() + "</td>"
				+ "<td>"+ vo.getCock_name() + "</td><td>");
	}
	
	
	
%>


</body>
</html>