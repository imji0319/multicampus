<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H1> 지불 수단을 선택하세요. </H1>
<form action="shop">
<input type=hidden name="menu" value="pay">
<input type=radio name="pay" value="현금">현금
<input type=radio name="pay" value="신용카드">신용카드
<input type=radio name="pay">핸드폰소액결제
<input type="submit" value="선택">
</form>

<% String pay=""; 
if(request.getParameter("pay") != null){
	pay = request.getParameter("pay");
}
%>
<%
String product = (String)session.getAttribute("sessionproduct");
int balance = (Integer)session.getAttribute("sessionbalance");
int price = Integer.parseInt(product.split(":")[1]);
%>
<H1> 선택한 제품은 <%=product.split(":")[0]%> 이고 
가격은 <%=product.split(":")[1] %> 입니다.</H1>
<H1> 구입 수량은 <%=balance %> 입니다.</H1> 
<H1> 총 지불 가격은 <%=price*balance %> 입니다.</H1>
<H1> 선택하신 지불 수단은 <%=pay %> 입니다.</H1>
<%
if(!pay.equals("")){
session.removeAttribute("sessionproduct");
session.removeAttribute("sessionbalance");
%>
<H1> 장바구니를 비웠습니다. </H1>
<%
}
%>

</body>
</html>