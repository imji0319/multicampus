<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean class="vo.BoardVO" id="vo2" scope="request"/> 
<!-- 데이터 전송파일 & 데이터 수신 파일 모두 지정 :  scope=session/request-->

<h1> 번호 : <jsp:getProperty property="seq" name="vo2"/> </h1>
<h1> 제목 : <jsp:getProperty property="title" name="vo2"/> </h1>
<h1> 내용 : <jsp:getProperty property="contents" name="vo2"/> </h1>
<h1> 조회수 : <jsp:getProperty property="viewcount" name="vo2"/> </h1>

</body>
</html>