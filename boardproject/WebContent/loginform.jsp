<%@page import="vo.MemberVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {margin:0 ; padding:0;}

	body {font-famtily:'맑은 고딕';
		font-size : 0.75em;
		color : #333;
	}
	#loginform {width:200px;
			margin : 100px auto;
			border :2px solid gray;
			border-radius : 5px;
			padding :15px;
			
	}
	/* inline -> block 요소 변경  */
	#loginform input, #loginform label{
		display:block;
	}
	#loginform label{
		margin-top : 10px;
	}
	#loginform input{
		margin-top : 5px;
	}
	#loginform #login {
		margin-top : 10px;
	}
	

</style>
<script src="jquery-3.2.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>


<form id=loginform action="loginresult.jsp">
	<small> BOARD LOGIN </small>
	<label class ='legend'>아이디</label>
	<input class=inbox type=text id=id name=id >
	<label class ='legend'>패스워드</label>
	<input class=inbox type=password id=pw name=pw >
	<input type=submit id=login name=login value=로그인>
</form>


</body>
</html>