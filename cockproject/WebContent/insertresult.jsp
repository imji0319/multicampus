<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>

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

String phone=request.getParameter("phone");
String name=request.getParameter("name");

MemberVO vo = new MemberVO(name,phone);
MemberDAO dao = new MemberDAO();
String result = dao.insertBoard(vo);
if(name !=""){
	if(result.equals("success")){
%>
<script>
	alert("회원가입 완료");
</script>
<%}
else{ %>
<script>
	alert("이미 가입된 번호입니다.");
</script>
<%}
%>
<script>
location.href="homepage.jsp";
</script>
<%}
else{
%>
<script>
	alert("정확히 입력 바랍니다.");
	location.href="insertform.jsp";
</script>
<% 
}
%>


</body>
</html>