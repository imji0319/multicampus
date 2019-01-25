<%@page import="vo.BoardVO"%>
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
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	vo.setBoardtitle(title);
	vo.setBoardcontents(contents);
	vo.setBoardseq(seq);
	
	dao.updateBoard(vo);
%>
</body>
<script type="text/javascript">
$(document).ready(function(){
	alert("해당 게시물을 수정하였습니다.");
	location.href="boardlist.jsp";
})
</script>
</html>