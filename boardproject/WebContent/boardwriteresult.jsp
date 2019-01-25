<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border=1>
	<%
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String writer = (String)session.getAttribute("writer");
	
 	BoardVO vo = new BoardVO();
	vo.setBoardtitle(title);
	vo.setBoardcontents(contents);
	vo.setBoardwriter(writer);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(vo); 
	%>
	
	<tr><td>제목</td><td>내용</td><td>작성자</td></tr>
	<tr>
	<td><%=title%></td>
	<td><%=contents%></td>
	<td><%=writer%></td>
</table>

<h1> 저장되었습니다. </h1>
<form action="boardlist.jsp">
	<input type=submit value='게시판 목록'>
</form>
</body>
</html>