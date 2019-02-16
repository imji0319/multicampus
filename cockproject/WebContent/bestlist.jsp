<%@page import="java.util.ArrayList"%>
<%@page import="vo.BestVO"%>
<%@page import="dao.CockDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이달의 추천 리스트</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#write").on('click', function(){
		location.href="boardwriteform.jsp";
	});
});
</script>
</head>
<h3 align="center">이달의 추천 리스트</h3>
<body>
<%
CockDAO dao = new CockDAO();
ArrayList<BestVO> list = dao.getBestList();

%>

<table border="1" align="center" style="border-collapse:collapse; border:1px gray solid;">
	<tr align="center">
		<td>번호</td>
		<td>이름</td>
		<td>인기도</td>
	</tr>
<%
for(int i = 0; i < list.size(); i++){
	BestVO vo = list.get(i);
	out.println("<tr><td align='center'>" + vo.getNum() + "</td>"
			+ "<td>"+ vo.getName() + "</td><td>"
			+ vo.getRank() + "</td></tr>");
}
%>
</table>
<div style="text-align:center;margin:10px">
<input type=button id="back" value="목록으로"><input type=button id="order" value="주문하기">
</div>
</body>
</html>
