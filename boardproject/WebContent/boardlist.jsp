<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div {
		margin : auto;
	}
	tr {text-align: center;}
	th { background-color : pink;
		font-weight: bolder;
		border : solid navy 1px}
	td {border : solid navy 1px}
	table {border : dashed navy 2px;
			width : 500px}
	#name {width : 385px}
</style>
<script src="jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#write").on('click',function(){
		//boardwriteform.jsp 이동
		location.href="boardwriteform.jsp"
	})//write onclick end

});//ready end
</script>
</head>
<body>

<% 
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardVO> list = dao.getBoardList();
%>
<div>
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
<!-- 
html input 태그 : 입력 
-> css, jquery(id속성)
-> 전송 받은 servlet, jsp 파일 파라메터 (name 속성)  
 -->


<form action="boardselect.jsp">
	<input type=button id=write value=글쓰기>
	<input type=text id=name name=name placeholder='조회할 제목을 입력하시오.'>
	<input type=submit id=button value='조회'>
</form>
</div>
</body>
</html>