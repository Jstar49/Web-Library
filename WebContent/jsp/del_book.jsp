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
	<%int t = Integer.parseInt(request.getParameter("book"));%>
	<%if(test.delete_book(t)==1){%>
	<%ResultSet bi=test.book();bi.last(); %>
	<%session.setAttribute("modibook", bi.getString("bid")); %>
	<script type="text/javascript">
	alert("删除成功");
	self.location="http://localhost:8080/TomcatTest/admin.jsp#book_manager"; 
	</script>
	<%}else{ %>
	<script type="text/javascript">
	alert("删除失败");
	self.location="http://localhost:8080/TomcatTest/admin.jsp#book_manager"; 
	</script>
	<%} %>
</body>
</html>