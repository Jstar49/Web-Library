<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="css/loginstyle.css"> 
<style>
body {background-image:url('sourse/181.jpg');}
</style>
</head>
<body>
	<div class="ttop">
 		<h1><img class="img1" alt="" src="sourse/new.png" width="32" height="32" border="0"> 图书管理系统</h1>
 	</div>
  <div class="loging">
  <form name="myform" action="check.jsp" method="GET">
	<h3>用户登录</h3>
    <label for="fname">账号:</label>
    <input type="text" id="username" name="username" placeholder="Your username..">

    <label for="lname">密码:</label>
    <input type="password" id="passwords" name="passwords" placeholder="Your passwords..">

    <label for="country">身份:</label>
    <select id="users" name="users">
      <option value="1">管理员</option>
      <option value="0">普通用户</option>
    </select>
  
    <input type="submit" value="登录"><br>
	 
	 <a href="login_up.jsp">注册</a>
  </form>
</div>
</body>
</html>