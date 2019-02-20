<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>선택</title>
<script src="jquery-3.3.1.min.js"></script>
<style type="text/css">

	html {
		background:url("photo/backweb.jpg") no-repeat center center fixed;
				-webkit-background-size:cover;
				-moz-background-size:cover;
				-o-background-size:cover;
				background-size:cover;
	}
	
	@font-face{font-family : thefaceshop;src : url("fonts/THEFACESHOP INKLIPQUID.TTF");}		
	@font-face{font-family : yeonsung; src : url("fonts/BMYEONSUNG_TTF.TTF");}
	
	.container{
	margin:auto;	
	}
	
	.text{
	font-family: thefaceshop;
	font-size: 60px;
	text-align: center;	
	margin-top: 100px;
	margin-bottom : 20px;
	color:white;
	}	

	
	table{
		border-radius:20px;
		margin-top:30px;
		text-align:center;
		margin-left:auto;
		margin-right:auto;
		background-color:rgba(210,96,184,0.5);
		width:600px;
		height:500px;
		border-spacing: 20px}
	
	td{
		background:rgb(112,48,160,0.5);
		border-radius:25px;
		font-family: thefaceshop;
		font-size: 30px;
		text-align: center;
	}
	
	#alcohol_grade{
		margin-left : 20px;
		padding-left : 10px;
	}
	
	#taste{
		margin-left : 15px;
		padding-left : 10px;
	}
	
	#base{
		margin-left : 15px;
		padding-left : 10px;
		
	}
	
	#go{
	float:right;
	}
	
	#back{
	float:left;
	}
	
	
	.move{
		width:60px;
		height:auto;
	}
	
	
</style>
</head>
<body>
	
	<% 
	session.getAttribute("phone");
	
	%>
	
<p class="text">Yours</p>
<div class=container>
	<div class=yourform>
	<form id=personal action="personal_list.jsp">
	<table>
		<tr>
			<td>
			알코올 도수
			</td>
			<td>
			<input type=radio id=alcohol_grade name=alcohol_grade value=0>0
			<input type=radio id=alcohol_grade name=alcohol_grade value=1>1
			<input type=radio id=alcohol_grade name=alcohol_grade value=2>2
			<input type=radio id=alcohol_grade name=alcohol_grade value=3>3
			<input type=radio id=alcohol_grade name=alcohol_grade value=4>4
			</td>			
		</tr>
		<tr>
			<td>
			맛
			</td>
			<td>
			<input type=checkbox id=taste name=taste value=taste_cola>콜라
			<input type=checkbox id=taste name=taste value=taste_choco>초코
			<input type=checkbox id=taste name=taste value=taste_fruit>과일
			<input type=checkbox id=taste name=taste value=taste_coffee>커피
			</td>
		</tr>
		<tr>
			<td>
			베이스
			</td>
			<td>
			<input type=radio id=base name=base value="논알콜">논알콜
			<input type=radio id=base name=base value="보드카">보드카
			<input type=radio id=base name=base value="진">진
			<input type=radio id=base name=base value="데킬라">데킬라<br>
			<input type=radio id=base name=base value="럼">럼
			<input type=radio id=base name=base value="와인">와인
			<input type=radio id=base name=base value="브랜디">브랜디
			<input type=radio id=base name=base value="위스키">위스키
			</td>
		</tr>
	</table>
	
	<div>
		<a id="back" href="everyList.jsp"><img class=move src="photo/Back.png"></a>
		<input id="go" type="image" class=move src="photo/go.png">
	</div>
	
	</form>
	</div>
</div>
</body>
</html>