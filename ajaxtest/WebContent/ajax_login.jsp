<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
//ajax jquery 함수 요청-json형태응답리턴
//json 형태
//json : { : , : ,... }
//id-hr 이고 pw-hr 인 경우에만 정상로그인 취급 -> json : { "auth":true, "time" : "2019-01-23" }
String result="";
if (id.equals("hr")&&pw.equals("hr")){
	result="{ \"auth\":true, \"time\":\"2019-01-23\" }"; // 문자열 내 이중따옴표 그대로 사용하기 위해 \"
	//data -> json : json변환 라이브러리 : GSON / JACKSON
	
}
else{
	result="{ \"auth\":false }";
}
%>
<%=result%>
