<%@ page 
language="java" 
contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"
import="java.sql.Connection"
%>
 <!-- 지시자태그 : 톰캣에 지시하는 태그  -->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>html 태그 영역입니다.</h1>
<%
	System.out.println("콘솔 출력jsp 문장 영역입니다.");
	out.println("<h1>브라우저 출력 문자 영역입니다.</h1>"); //out : 브라우저 출력 내장 함수 , html태그 사용 가능
	String s ="local"; //태그 안에서만 사용 가능  : _jspService메소드 지역변수
%>

<%= "<h2>브라우저 전용 출력입니다</h2>"+
request.getParameter("id")
%>

<%! String s ="global"; //해당 태그 밖에서도 사용 가능  : 필드변수
%>
<%=request.getMethod() %>

<% out.println("<h2>브라우저 전용 출력입니다</h2>"); %>
<input type=text name=n value=<%= request.getParameter("id") %> >

</body>
</html>