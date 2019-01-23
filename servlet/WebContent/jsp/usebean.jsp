<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> useBean 태그 연습</title>
</head>
<body>
<%-- <%
	BoardVO vo = new BoardVO();
	vo.setSeq(10);
	vo.setTitle("10번게시물제목");
	vo.setContents("10번게시물내용");
	vo.setViewcount(500);
%>

<h1> 번호 : <%=vo.getSeq() %> </h1>
<h1> 제목 : <%=vo.getTitle() %> </h1>
<h1> 내용 : <%=vo.getContents() %> </h1>
<h1> 조회수 : <%=vo.getViewcount() %> </h1> --%>

<hr>

<h1> 액션 태그 이용 </h1>
<jsp:useBean class="vo.BoardVO" id="vo2" scope="request"/> 
<!-- scope="session" : 같은 세션 내에선 다 사용가능하도록 설정 : default scope="page" -->
<%-- scope="request" : request.setAttribute 와 같은 기능 => <jsp:forward page="">  --%>
<!-- 다릎 파일에서 같은 값을 공유하고 싶으면 class, id, scope을 동일하게 맞춰주면 된다. -->

<jsp:setProperty property="*" name="vo2"/> <!-- property == form's name 이면 모든 것을 연결 -->
<%-- 속성 이름이 같다면 한 문장으로 해결 가능 
<jsp:setProperty property="seq" name="vo2"/>
<!-- property != form's name 이면 param 또는 value 값을 지정해줘야함 -->
<jsp:setProperty property="title" name="vo2" />
<!-- property == form's name 이면 value 값을 지정하지 않아도 그 form값을 알아서 전달 -->
<jsp:setProperty property="contents" name="vo2" />
<jsp:setProperty property="viewcount" name="vo2" /> 
--%>

<jsp:forward page="usebean2.jsp" />  <!-- forward : request 객체 포함 -->


</body>
</html>