<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id=personal action="personal_list.jsp">
	<table border=2>
		<tr>
			<td>
			알코올 도수
			</td>
			<td>
			<input type=radio id=alcohol_grade name=alcohol_grade value=0>0
			<input type=radio id=alcohol_grade name=alcohol_grade value=1>1
			<input type=radio id=alcohol_grade name=alcohol_grade value=2>2
			<input type=radio id=alcohol_grade name=alcohol_grade value=3>3
			<input type=radio id=alcohol_grade name=alcohol_grade value=4>4
			</td>			
		</tr>
		<tr>
			<td>
			맛
			</td>
			<td>
			<input type=checkbox id=taste name=taste value=taste_cola>콜라
			<input type=checkbox id=taste name=taste value=taste_choco>초코
			<input type=checkbox id=taste name=taste value=taste_fruit>과일
			<input type=checkbox id=taste name=taste value=taste_coffee>커피
			</td>
		</tr>
		<tr>
			<td>
			베이스
			</td>
			<td>
			<input type=radio id=base name=base value="논알콜">논알콜
			<input type=radio id=base name=base value="보드카">보드카
			<input type=radio id=base name=base value="진">진
			<input type=radio id=base name=base value="데킬라">데킬라
			<input type=radio id=base name=base value="럼">럼
			<input type=radio id=base name=base value="와인">와인
			<input type=radio id=base name=base value="브랜디">브랜디
			<input type=radio id=base name=base value="위스키">위스키
			</td>
		</tr>
		<tr>
			<td colspan=2>
			<input type=submit id=go value="제출">
			</td>
		</tr>
	</table>
	<br>
	
	</form>
</body>
</html>