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
	<%String t = request.getParameter("test");%>
	<%if(test.delete_user(t)==1){%>
	<script type="text/javascript">
	alert("修改成功");
	self.location='admin.jsp#reader_information';
	</script>
	<%}else{ %>
	<script type="text/javascript">
	alert("修改失败");
	self.location='admin.jsp#reader_information';
	</script>
	<%} %>
</body>
</html>