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
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#write").on("click", function(){
		//boardwriteform.jsp 이동
		location.href="boardwriteform.jsp";
	});//on
});//ready
</script>
</head>
<body>
<% 
int pagenum = 1;
if(request.getParameter("page") != null){
	pagenum = Integer.parseInt
			(request.getParameter("page"));
}
	BoardDAO dao = new BoardDAO(); 
   ArrayList<BoardVO> list = dao.getBoardList
		   (pagenum);
   int total = dao.getTotalBoard();
   int pagecount = total / 5;
   if (pagecount % 5 != 0){
	   pagecount = pagecount + 1;
   }

%>
<table border="2px">
<tr>
<td>번호</td><td>제목</td><td>작성자</td>
<td>시간</td>
</tr>
<%
for(int i = 0; i < list.size(); i++){
	BoardVO vo = list.get(i);
	out.println
	("<tr><td>" + vo.getBoardseq() + "</td><td>"
	+ "<a href='boarddetail.jsp?boardseq=" + vo.getBoardseq() + "'>" + vo.getBoardtitle() + "</a></td><td>"
	+ vo.getBoardwriter() + "</td><td>"
	+ vo.getBoardtime() + "</td></tr>");
}

%>
</table>

<div>
<%  for (int i=1; i <= pagecount; i++){
	   out.println
	   ("<a href='boardlist.jsp?page="+i+"' > " + i + " </a>");
	  }
%>
</div>
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
</body>
</html>











