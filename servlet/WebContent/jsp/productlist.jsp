<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
</head>
<body>

<form action='jsp/cart.jsp'>
<h1>상품리스트</h1>
<% ArrayList<ProductVO> list = (ArrayList<ProductVO>)request.getAttribute("productlist"); %>
<select name=product>
	<% for(ProductVO vo : list){ %>
	<option value = "<%= vo.getName()+':'+vo.getPrice() %>" > <%=vo.getName()%>
	<% } %>
</select>
구입수량: <input type=text name=balance>
<input type=submit value=장바구니저장>
</form>

</body>
</html>