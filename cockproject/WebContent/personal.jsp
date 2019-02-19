<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>선택</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
	/* $(document).ready(function(){
		$("#back").on('click', function(){
			location.href="everyList.jsp";
		})
	}) */
</script>
<style type="text/css">
	
	

	body {
		background:url("photo/backweb.jpg") no-repeat center center fixed;
				-webkit-background-size:cover;
				-moz-background-size:cover;
				-o-background-size:cover;
				background-size:cover;
	}
	
	.text {
		border: 3px solid;
		border-radius:40px;
		width:100px;
		height:50px;
		margin-left:auto; margin-right:auto;
		background-color:silver;
		opacity:0.3;
	}
	
	
	div {
		margin-left:auto; margin-right:auto;
		line-height:10px;
		position:relative;
		text-align:center;
	}

	table {
		width:400px;
		height:300px;
		border-radius:40px;
		margin-left:auto; margin-right:auto;
		text-align:center;
		border:3px solid silver;
	}
	
	#go {
		float:right;
	}
	
	#back{
		float:left;
	}
	
</style>
</head>
<body>
	
	<% 
	session.getAttribute("phone");
	
	%>
	
	<div class="text"><h2>Yours</h2></div>
	
	
	<form id=personal action="personal_list.jsp">
	<div>
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
			<input type=radio id=base name=base value="데킬라">데킬라<br><br><br>
			<input type=radio id=base name=base value="럼">럼
			<input type=radio id=base name=base value="와인">와인
			<input type=radio id=base name=base value="브랜디">브랜디
			<input type=radio id=base name=base value="위스키">위스키
			</td>
		</tr>
		<!-- <tr>
			<td colspan=2>
			<input type=submit id=go value="제출">
			<input type=button id=back name=back value="뒤로">
			</td>
		</tr> -->
	</table>
	</div>
	
	<div>
		<a id="back" href="everyList.jsp"><img src="photo/Back.png"></a>
		<input id="go" type="image" img src="photo/go.png">
	</div>
	</form>
	
	
</body>
</html>