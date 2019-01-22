<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3 {
		width : 500px;
		border : 1px dashed red;
		background-color: pink;
	}
</style>
</head>
<body>
<h1>login2.jsp 파일 영역입니다.</h1>
<h2><%=request.getParameter("a") %></h2>
<h1>입력한 회원가입 정보는 다음과 같습니다.</h1>
<h3>
<% MemberVO vo = (MemberVO)request.getAttribute("memberinform"); %>
<!-- setAttribute("memberinform",vo) --> 
<%=vo %>
</h3> 
</body>
</html>