<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="test" class="sql_con.mysql_con"/>
	
	<%
	String bid=request.getParameter("bid"); 
		String rid=(String)session.getAttribute("user");	
	%>
	<%if(test.reade_book(rid,bid)==1){ %>
	<script type="text/javascript" language="javascript">
		alert("借阅成功！");
		window.document.location.href="http://localhost:8080/TomcatTest/main.jsp";
	</script>
	<%}else{ %>
	<script type="text/javascript" language="javascript">
		alert("借阅失败！");
		window.document.location.href="http://localhost:8080/TomcatTest/main.jsp";
	</script>
	<%} %>

	
	
</body>
</html>