<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	
	MemberVO vo = new MemberVO(name,phone);
	MemberDAO dao = new MemberDAO();
	name = dao.login(vo);
	
	session.setAttribute("phone", phone);
	
	if (name != ""){
%>
		<script>	
		location.href="everyList.jsp"; 
		</script>
	<% }
	else{ %>
	<script>
		alert("다시입력해주세요");
		location.href="homepage.jsp";
	</script>
	<% }%>

</body>
</html>