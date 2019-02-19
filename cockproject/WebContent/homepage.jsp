<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cock! tail</title>
<script src="jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#signup").on("click",function(){
			location.href="insertform.jsp"		
		})
		$("#no").on("click",function(){
			location.href="everyList.jsp"
		})
	});
</script>


<style>

	html { 
		background: url(photo/backweb.jpg) no-repeat center center fixed; 
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}
	.pink{	
		margin-top:230px;
		border-radius: 40px;
		background-color:rgba(210,96,184,0.7);
		height: 350px;
		width: 300px;
		margin-left:auto;
		margin-right:auto;
	}
	table {
		margin-top:30px;
		text-align:center;
		margin-left:auto;
		margin-right:auto;
	}
	td {
		background-color:rgba(210,96,184,0);
	}
	@font-face{
		font-family : thefaceshop;
		src : url("fonts/THEFACESHOP INKLIPQUID.TTF");
		
	}
	.font{
		font-family : thefaceshop;
		text-align: center;
		font-size: 28px;
	}
	#name,#phone{
		width: 200px;
	}
	
	.login{
		font-family : thefaceshop;
		text-align: center;
		padding-top:40px;
		margin:auto;
		font-size:50px;
	}
	
	.button{
		text-align: center;
		margin:auto;
		
	}
	
	.button_shape {
		margin-top : 30px;
		padding-left:10px;
		padding-right: 10px;
		text-align: center;
		background-color:rgba(242,175,208,1);
		border:none;
		width : 130px;
	}
	
		
</style>
</head>
<body>

	<div class=pink>
	<p class=login >LOGIN</p>
	
	<form action="logincheck.jsp">
		<table>
		<tr>
			<td><input class="font"id="name" name="name"type="text" placeholder=name></td>
			<td rowspan=2><input class="font" type="submit" value="sign in" style="height: 80px; background-color:rgba(242,175,208,1);border:none; "></td>
		</tr>
		<tr>
		<td><input class="font" id="phone" name="phone" type="text" placeholder=phone></td>
		</tr>
		</table>
	<div class=button>	
		<input class="font button_shape" type="button" id=no name=no value="non-member" >
		<input class="font button_shape" type="button" id=signup name=signup value="sign up">
	</div>
	</form>
	</div>


</body>
</html>