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
	<% if(test.sign_up(request.getParameter("user"),request.getParameter("passwords"),request.getParameter("tel"),request.getParameter("username"))==1){ %>
		<%session.setAttribute("user",request.getParameter("user"));
		session.setAttribute("bookname","");
		session.setAttribute("booktag","");
		session.setAttribute("bookid","");
		%>
		<script type="text/javascript" language="javascript">
		alert("注册成功");
		window.document.location.href="main.jsp";
		</script>
	<%} else{ %>
		<script type="text/javascript" language="javascript">
		alert("注册失败！");
		window.document.location.href="login_up.jsp";
		</script>
	<%} %>
</body>
</html>