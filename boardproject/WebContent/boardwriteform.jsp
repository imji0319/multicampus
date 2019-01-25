<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면 </title>
<style type="text/css">
* {margin:0 ; padding:0;}

	body {font-famtily:'맑은 고딕';
		font-size : 0.75em;
		color : #333;
	}
	
	#loginform {width:500px;
			margin : 50px auto;
			border :2px solid gray;
			border-radius : 5px;
			padding :15px;
			
	}
	/* inline -> block 요소 변경  */

	#loginform input{
		margin-top : 5px;
	}
	#board {
		width : 500px;
		margin : 100px auto;
		text-align: center;
		border : 3px solid black;
		border-radius : 5px;
		padding : 15px;
	}
	
	input[type=submit] {
		width : 100px
	}
	input[type=reset] {
		width : 100px
	}

</style>
</head>
<body>
	<h2 id=board>게시물 내용을 입력하세요.</h2>
	<form id=loginform action="boardwriteresult.jsp"> 
		<table>
		<tr><td>제목</td><td><input type=text id=title name=title><td>
		<tr><td>내용 </td>
			<td><textarea name=contents id=contents rows=10 cols=50 placeholder="게시물 내용을 입력하세요">
			</textarea></td>
		<tr><td>작성자</td><td><%=session.getAttribute("writer")%></td></tr>
		</table>
		<input type=submit id=save value=저장 >
		<input type=reset value=취소 >
	</form>

</body>
</html>