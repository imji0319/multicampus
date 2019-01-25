<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<script src="jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#save").on('click',function(){
		if(confirm("수정하시겠습니까?")){
			var title = $("#title").val();
			var contents = $("#contents").val();
			var seq =$("#seq").val();
			location.href="boardupdateresult.jsp?title="+title+"&contents="+contents+"&seq="+seq;
			
		}
	})
})
</script>
</head>
<body>
<%
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	int seq = Integer.parseInt(request.getParameter("boardseq"));
	
	vo = dao.getBoardDetail(seq);
	//System.out.println(vo.getBoardtitle());
%>
<form> 
	<table>
	<tr><td>제목</td><td><input type=text id=title name=title value='<%=vo.getBoardtitle()%>'><td>
	<tr><td>내용 </td>
		<td><textarea name=contents id=contents rows=10 cols=50><%=vo.getBoardcontents()%>
		</textarea></td>
	<tr><td>작성자</td><td><%=vo.getBoardwriter()%></td></tr>
	</table>
	<input type=hidden id=seq name=seq value=<%=vo.getBoardseq()%>>
	<input type=button id=save value=저장버튼 >
	<input type=reset value=취소버튼 >
	
</form>
</body>
</html>