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
<script type="text/javascript">

$(document).ready(function(){
	
	var result = document.getElementById('result').getAttribute('value');
	var seq = $("#seq").html();
	$("#delete").on('click',function(){
		if(result =='true'){
			if(confirm("삭제하시겠습니까?")){
				location.href="boarddelete.jsp?boardseq="+seq 
				}
		}else{
			alert("해당 권한이 없습니다.");
			location.href="boarddetail.jsp?boardseq="+seq;
		}
	})//delete click end
	$("#update").on('click',function(){
		if(result == 'true'){	
			location.href="boardupdateform.jsp?boardseq="+seq ;
		}else{
			alert("해당 권한이 없습니다.");
			location.href="boarddetail.jsp?boardseq="+seq;
		}
		})//update click end

})//ready end
</script>
</head>
<body>
	<% 
	int seq = Integer.parseInt(request.getParameter("boardseq"));
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.getBoardDetail(seq);
	%>
	
<table border=2>
	<tr><td>번호</td><td id=seq><%=vo.getBoardseq()%></td></tr>
	<tr><td>제목</td><td><%=vo.getBoardtitle()%></td></tr>
	<tr><td>내용</td><td><%=vo.getBoardcontents()%></td></tr>
	<tr><td>작성자</td><td><%=vo.getBoardwriter()%></td></tr>
	<tr><td>작성시간</td><td><%=vo.getBoardtime()%></td></tr>
	<tr><td>조회수</td><td><%=vo.getBoardviewcount()%></td></tr>
</table>
<form>
	<input type=button id=delete name=delete value=삭제>
	<input type=button id=update name=update value=수정>
</form>

<%
	String writer = vo.getBoardwriter();

	String ss_writer = (String)session.getAttribute("writer");

	if (writer.equals(ss_writer)){
		out.println("<div id=result value='true'></div>");
	}
	else{
		out.println("<div id=result value='false'></div>");
	}
%>
</body>
</html>