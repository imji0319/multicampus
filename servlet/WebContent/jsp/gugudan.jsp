<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, td {border : 2px solid blue;
				text-align :center}
</style>
</head>
<body>

<% 
	if(request.getMethod().equals("POST")){
	int dan =0;
	String input = request.getParameter("dan");
	
	if (input == null){
		dan=2;
	}
	else{
		dan= Integer.parseInt(input);
	}
%>
<form action="gugudan.jsp" method=post> <!-- 자신파일에 지정 -->
단을 입력하세요. <input type=text name=dan>
<input type=submit value=버튼>
</form>

<table>
	<%
	for (int i =1; i<=9;i++){
		out.println("<tr>");
		for (int j = 2; j<=dan ; j++){
			out.println("<td>"+j+"*"+i+"="+j*i+"</td>");
		}
		out.println("</tr>");
	}
	%>
</table>
<%} %>
<h1> 클라이언트 ip : <%=request.getRemoteAddr() %> </h1>
<% System.out.println(request.getRemoteAddr()); %>

</body>
</html>