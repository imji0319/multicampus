<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cock! tail</title>
<script src="jquery-3.3.1.min.js"></script>
<style>
	table {
		background-color: #d626b3;

		margin-left:auto;
		margin-right:auto;

	}
	
	td {
		background-color: purple;
		text-align: center;
		}		
</style>
</head>
<body>
<form action="logincheck.jsp">
<table border=1>
<tr></tr>
<tr>
	<td>phone number</td>
	<td><input name="phone"type="text"></td>
	<td rowspan=2><input type="submit" value="로그인"></td>
</tr>
<tr>
	<td>name</td>
	<td><input name="name"type="text"></td>
</tr>
<tr>
	<td><a href="insertform.jsp">회원가입</a></td>
	<td><a href="everyList.jsp">비회원으로 계속</a></td>

</tr>


</table>
</form>
</body>
</html>