<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
    
<% 	
	request.setCharacterEncoding("utf-8"); //한글처리
	//1. parameter 불러오기

	String id = request.getParameter("id");
	int pw = Integer.parseInt(request.getParameter("pw"));
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	//2. db에 insert
	String result="";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 
		System.out.println("DB 연결성공");
			
		String sql="";
		PreparedStatement pt;
			
		sql= "select id from member where id = ? ";
		pt = con.prepareStatement(sql);
		pt.setString(1,id);
		ResultSet rs = pt.executeQuery();
			
		if (rs.next()) {
				
			result="다른 아이디를 입력하세요.";
				
		}
		else {
				
			sql = "insert into member values (?,?,?,?,?,sysdate)";
			pt = con.prepareStatement(sql);
			
			pt.setString(1, id);
			pt.setInt(2,pw);
			pt.setString(3, name);
			pt.setString(4, phone);
			pt.setString(5, email);
			
			pt.executeUpdate();
			result = "회원가입되었습니다.";
			
		}
		con.close();
		System.out.println("연결 해제 성공");
			
			
	}catch(Exception e) {
			e.printStackTrace();
	}
%>
<!-- 
3. login2.jsp로 forward : 
forward 이전의 버퍼 삭제
-->

<jsp:forward page="login2.jsp">
	<jsp:param value="<%= result %>" name="a"/>
</jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
</body>
</html>