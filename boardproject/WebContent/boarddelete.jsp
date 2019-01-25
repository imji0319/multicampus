<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
</head>
<body>
<%
	int seq = Integer.parseInt(request.getParameter("boardseq"));
	BoardDAO dao = new BoardDAO();
	dao.deleteBoard(seq);
%>
</body>

<script type="text/javascript">
$(document).ready(function(){
	alert("해당 게시물이 삭제되었습니다.")
	location.href="boardlist.jsp";
})
</script>

</html>