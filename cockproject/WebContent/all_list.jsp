<%@ page import="vo.CocktailVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CockDAO" %>

<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.3.1.min.js"></script>

<script>
$(document).ready(function(){
	
})//ready end 

</script>


</head>
<body>

<%
	int pagenum=1;
	if (request.getParameter("page") != null){
		pagenum =Integer.parseInt(request.getParameter("page"));
	}
	
	CockDAO dao = new CockDAO();
	ArrayList<CocktailVO> list = dao.getAllList(pagenum);
	
	int total = dao.getTotalCock();
	int pagecount = total/6;
	if (pagecount%6 != 0){
		pagecount = pagecount+1;
	}
	
%>

<table border=1>
<tr>
<td>cock_id</td><td>cock_name</td><td>alcohol_grade</td><td>base</td>
</tr>

<%
	for (int i=0; i <list.size(); i++){
		CocktailVO vo = list.get(i);
		out.println("<tr><td>" + vo.getCock_id() 
				+"</td><td>" + vo.getCock_name() 
				+"</td><td>" + vo.getAlcohol_grade()
				+"</td><td>" + vo.getBase()+"</tr>" );
		
	}

%>
</table>

<div>

<%
	for (int i=1; i <=pagecount; i++){
		
		out.println("<a href='all_list.jsp?page=" +i+"' >" + i +"</a>");
	}
%>

</div>



</body>
</html>