<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String[] cock_id_test = request.getParameterValues("cock_id");

	int[] result= new int[cock_id_test.length];
	
	for (int i=0;i<cock_id_test.length;i++){
		result[i] = Integer.parseInt(cock_id_test[i]);

	}
	
	
	ArrayList<Integer> list =  new ArrayList<Integer>();
	
	
	for (int i : result){
		list.add(i);
		System.out.println("cock_id : "+i);
	}
	
	session.setAttribute("productlist",list);
	
	String phone = (String)session.getAttribute("phone");
	System.out.println("phone : "+ phone );
	
	
%>

</body>
</html>