<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>다양한 R 코드 실행 결과</h1>
<hr>
문자열 : ${ result1 }
<hr>
double 타입 배열1 : 
<ul>
<%
	double[] d1 = (double[])request.getAttribute("result2");
    for(int i=0; i < d1.length; i++) {
    	out.print("<li>"+d1[i]+"</li>");
    }
%>
</ul>
<hr>
double 타입 배열2 : 
<ul>
<%
	double[] d2 = (double[])request.getAttribute("result3");
    for(int i=0; i < d2.length; i++) {
    	out.print("<li>"+d2[i]+"</li>");
    }
%>
</ul>
<hr>
string 타입 배열2 : 
<table border=1>
<%
	String[][] sAry = (String[][])request.getAttribute("result4");
    for(int i=0; i < sAry.length; i++) {
    	out.print("<tr>");
    	for(int j=0; j < sAry[i].length; j++) {
        	out.print("<td>"+sAry[i][j]+"</td>");
        }
    	out.print("</tr>");
    }
%>
</table>
</body>
</html>