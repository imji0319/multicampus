<%@page import="java.util.ArrayList"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr {text-align: center;}
	th { background-color : pink;
		font-weight: bolder;
		border : solid navy 1px}
	td {border : solid navy 1px}
	table {border : dashed navy 2px;}
	#line {line-height:1em }
</style>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#write").on('click',function(){
		//boardwriteform.jsp 이동
		location.href="boardwriteform.jsp"
	})//write onclick end

	$("#return").on('click',function(){
		location.href="boardlist.jsp";
	})
	
	
});//ready end
</script>
</head>
<body>
	<%
		BoardDAO dao = new BoardDAO();
		String title = request.getParameter("name");
		ArrayList<BoardVO> list = dao.selectBoard(title);

	%>
<table>
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성시간</th></tr>
	
	<%
	for (int i=0; i<list.size(); i++){
		BoardVO vo =list.get(i);
		out.println("<tr><td>"+vo.getBoardseq()
					+"</td><td><a href='boarddetail.jsp?boardseq="+vo.getBoardseq()+"'>"+vo.getBoardtitle()+"</a>"
					+"</td><td>"+vo.getBoardwriter()
					+"</td><td>"+vo.getBoardtime()+"</td></tr>" );
	}
	
	%>
</table>
<br id=line>
<form action="boardselect.jsp">
	<input type=button id=write value=글쓰기>
	<input type=text id=name name=name placeholder='조회할 제목을 입력하시오.'>
	<input type=submit value='조회'>
	<input type=button id= return value="게시판목록">
</form>


</body>
</html>