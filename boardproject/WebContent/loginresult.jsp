<%@page import="dao.BoardDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var test =document.getElementById('result').getAttribute('value');
	//alert(test);
	
	if ( test != '' ){
		alert("로그인완료하였습니다.");
		location.href="boardlist.jsp";
	}//success end
	else{
		alert("로그인 정보가 틀렸습니다. 다시 로그인하세요.");
		location.href="loginform.jsp";
	}//fail end

})//ready end

</script>
</head>
<body>
<%
	String id = request.getParameter("id");
	int pw = Integer.parseInt(request.getParameter("pw"));
	
	BoardDAO dao = new BoardDAO();
	String writer = dao.loginBoard(id,pw);
	System.out.println(writer);
	session.setAttribute("writer", writer);
	
%>
<div id=result value='<%=writer%>'></div>

</body>
</html>