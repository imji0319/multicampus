<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	session.getAttribute("phone"); %>

<a id="all" href="all_list.jsp">전체 List</a>
<a id="personnel" href="personal.jsp"> 개인 추천 List</a>
<a id="best" href="bestlist.jsp">Best List</a>
</body>
</html>
