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
	
	<%if(test.is_user(request.getParameter("username"),request.getParameter("passwords"),request.getParameter("users"))==1){%>
	<%ResultSet bi=test.book();bi.last(); %>
	<%session.setAttribute("modibook", bi.getString("bid")); %>
	<%ResultSet bi1=test.reader();bi1.last(); %>
	<%session.setAttribute("modi_user", bi1.getString("user")); %>
	<%session.setAttribute("user",request.getParameter("username"));
		session.setAttribute("bookname","");
		session.setAttribute("booktag","");
		session.setAttribute("bookid","");
		response.sendRedirect("admin.jsp");
	%>
	<%}else if(test.is_user(request.getParameter("username"),request.getParameter("passwords"),request.getParameter("users"))==2){ %>
		<%session.setAttribute("user",request.getParameter("username"));
		session.setAttribute("bookname","");
		session.setAttribute("booktag","");
		session.setAttribute("bookid","");
		response.sendRedirect("main.jsp");%>
	<%} else{ %>
	<script type="text/javascript" language="javascript">
		alert("账号密码错误！");
		window.document.location.href="login.jsp";
	</script>
	<%} %>
</body>
</html>