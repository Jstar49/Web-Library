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
	<%String user = request.getParameter("uid");
		String username = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String upas = request.getParameter("upas");
		String utel = request.getParameter("utel");
	%>
	<%if(!upass.equals(upas)){ %>
	<script type="text/javascript" language="javascript">
		alert("验证密码错误！");
		window.document.location.href="http://localhost:8080/TomcatTest/admin.jsp";
	</script>
		
	<%}else{ %>
	<%if(test.modi_user(user,username,upass,utel)==1){ %>
	<script type="text/javascript" language="javascript">
		alert("修改成功！");
		window.document.location.href="http://localhost:8080/TomcatTest/admin.jsp";
	</script>
	<%}else{ %>
	<script type="text/javascript" language="javascript">
		alert("修改失败！");
		window.document.location.href="http://localhost:8080/TomcatTest/admin.jsp";
	</script>
	<%}} %>
</body>
</html>