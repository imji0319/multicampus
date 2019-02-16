<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var name = document.getElementById('result').getAttribute('value');
	alert(name);
	if ( name !=""){
		alert("로그인")
		location.href="everyList.jsp"; 
	}
	else{
		alert("다시입력해주세요");
		location.href="homepage.jsp";
	}
})//ready end
</script>



</head>
<body>

<%
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	
	MemberVO vo = new MemberVO(phone,name);
	MemberDAO dao = new MemberDAO();
	name = dao.login(vo);
	
	session.setAttribute("phone", phone);
	
	if (name != ""){
%>
		<script>
		alert(name+"로그인");
		
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