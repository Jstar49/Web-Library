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
	<%String new_id = request.getParameter("new_b_id");
		String new_name=request.getParameter("new_b_name");
		String new_author = request.getParameter("new_b_author");
		String new_tag = request.getParameter("new_b_tag");
	%>
	<%if(test.add_book(new_id, new_name, new_author, new_tag)==1){%>
	<script type="text/javascript">
	alert("增加图书成功");
	self.location="http://localhost:8080/TomcatTest/admin.jsp#book_manager"; 
	</script>
	<%}else{ %>
	<script type="text/javascript">
	alert("增加图书失败");
	self.location="http://localhost:8080/TomcatTest/admin.jsp#book_manager"; 
	</script>
	<%} %>
</body>
</html>