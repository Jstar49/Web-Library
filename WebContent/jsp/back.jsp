<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="test" class="sql_con.mysql_con"/>
	<%String t = request.getParameter("back");%>
	<%String bid = request.getParameter("bidd"); %>
	<%if(test.backbook(t, bid)==1){ %>
	<script type="text/javascript" language="javascript">
		alert("归还成功！");
		window.document.location.href="http://localhost:8080/TomcatTest/main.jsp";
	</script>
	<%}else{ %>
	<script type="text/javascript" language="javascript">
		alert("归还失败！");
		window.document.location.href="http://localhost:8080/TomcatTest/main.jsp";
	</script>
	<%} %>
</body>
</html>