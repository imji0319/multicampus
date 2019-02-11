<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
   	<title>Rserve</title>
    <script src="/redu/resources/wordcloud2/htmlwidgets-0.8/htmlwidgets.js?ver=2"></script>
	<link href="/redu/resources/wordcloud2/wordcloud2-0.0.1/wordcloud.css" rel="stylesheet" />
	<script src="/redu/resources/wordcloud2/wordcloud2-0.0.1/wordcloud2-all.js"></script>
	<script src="/redu/resources/wordcloud2/wordcloud2-0.0.1/hover.js"></script>
	<script src="/redu/resources/wordcloud2/wordcloud2-binding-0.2.0/wordcloud2.js?ver=2"></script>
</head>
<body>
<h1>leaflet 시각화 결과 표현하기</h1> 
<hr>
<%if(request.getAttribute("content") != null) { %>
${ content }		
<%}%>
<%if(request.getAttribute("leafletChartName") != null) { %>
<iframe src="${leafletChartName }" width="100%" height="500" seamless></iframe>
<%}%> 
</body>
</html> 
