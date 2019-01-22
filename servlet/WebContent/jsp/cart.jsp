<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String product = request.getParameter("product");
	int balance = Integer.parseInt(request.getParameter("balance"));
	
	int price = Integer.parseInt(product.split(":")[1]);
	
	
%>


<h1> 선택한 제품은 <%= product.split(":")[0] %> 이고 가격은 <%=product.split(":")[1] %> 입니다. </h1>
<h1> 구입수량은 <%= balance %> 개입니다. </h1>
<h1> 총 지불 가격은 <%= (price * balance) %> 입니다. </h1>


</body>
</html>