<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 글쓰기</title>
</head>
<body>

<%
	//LoginSessionServlet : 로그인아이디를 세션 저장 
	if ((String)session.getAttribute("sessionid") != null){
		out.println("<h1>"+session.getAttribute("sessionid")+" 회원님 글쓰기 가능합니다.</h1>");
		
	}else{
		out.println("<h1>회원로그인하셔야 합니다.</h1>");
		out.println("<a href='../session/loginform.html'>로그인</a> 하시겠습니까?");
		
	}

%>


</body>
</html>