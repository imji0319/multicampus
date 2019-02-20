<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	html { 
		background: url(photo/backweb.jpg) no-repeat center center fixed; 
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}
		
	.main{
		margin-top:300px;
		border-radius: 40px;
		background-color:rgba(210,96,184,0.5);
		height:300px;
		width: 600px;
		margin-left:auto;
		margin-right:auto;
		vertical-align: middle;
	}
	
	.title{
		text-align:center;
		font-family: thefaceshop;
		font-size:40px;
		margin-bottom: 10px;
		color:white;
		
	}
	
	table {
		margin-top:20px;
		text-align:center;
		margin-left:auto;
		margin-right:auto;
		border-spacing: 10px;
		width:500px;
		margin-bottom: 10px;
	}
	.nothing{
		height:10px;
	}
	
	@font-face{
		font-family : thefaceshop;
		src : url("fonts/THEFACESHOP INKLIPQUID.TTF");
		
	}
	.font{
		font-family:thefaceshop;
		src : url("fonts/THEFACESHOP INKLIPQUID.TTF");
		font-size: 25px;	
		border:none;
	}
</style>
</head>
<body>
<div class=main>
	<div class=nothing></div>
	<p class=title>SING UP</p>
	
	<table>
	<form action=insertresult.jsp>
	<tr>
		<td class=font>NAME</td>
		<td><input style="width:150px;" class=font id="name" name="name" type="text"></td>	
		<td><input class=font id="insert" type="submit" value="sign up" style="width:80px;text-align: center; background-color: #ff9ee1;"></td>
	</tr>
	<tr>
		<td class=font>PHONE NUMBER </td>
		<td><input style="width:150px;"class=font id="phone" name="phone" type="text"></td>
	</form>
	
	<form action=homepage.jsp>
		<td><input class=font id="goBack" type="submit" value="go home" style="width:80px;text-align: center; background-color: #ff9ee1;"></td>
		</form>
	</tr>
	</table>
</div>

</body>
</html>