<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%session.setAttribute("bookid",request.getParameter("bookid")); 
	session.setAttribute("bookname",request.getParameter("bookname")); 
	session.setAttribute("booktag",request.getParameter("booktag")); 
	%>
	
	
	
</body>
</html>