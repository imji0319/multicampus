<%@page import="java.util.Date"%>
<%@page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
buffer="8kb" autoFlush="true"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>
	<% 
	out.println(out.getBufferSize()); //buffer='8kb'=8*1024=8912
	out.println(new Date()); 
	//응답 : 서버 버퍼(buffer='8kb') 임시 저장&모아둠 ->현재 수행완료후 클라이언트 전송 시작
	//out.clear(); //출력내용 삭제 -> 버퍼 삭제
	out.println(out.getRemaining());
	// 버퍼 내용 다 채우면 일단 브라우저 출력 -> 버퍼비움 :flush() 
	out.flush(); //브라우저 출력후 버퍼비움 -> 브라우저의 변화가 없음 => autoFlush ="true" : 버퍼가 차면 자동으로 flush 실행
	out.println(out.getRemaining());
	%>
	
</h1>
</body>
</html>