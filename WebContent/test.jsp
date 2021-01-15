<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test.css"> 
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
<!-- 在form中设置隐藏控件，用来存储JS中的值 -->
<a href="jsp/modi.jsp">打开modi.jsp</a>
<br>
<jsp:include page="jsp/modi.jsp" flush="true">
<jsp:param name="modi" value="testing"/>
</jsp:include>

</body>
</html>