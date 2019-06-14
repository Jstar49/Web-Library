<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/loginstyle.css"> 
<script type="text/javascript">
	function submit(a){
	    var frm = document.getElementById(a); // 获取表单
	    frm.submit(); // 对表单进行提交
	}
	function regist(a,b,c,d,e){
		var v = document.getElementById(a).value;
		var vb = document.getElementById(b).value;
		var vc = document.getElementById(c).value;
		var vd = document.getElementById(d).value;
		var ve = document.getElementById(e).value;
		if(v=="" || vb =="" || vc=="" || vd==""){
			alert("请填写完整信息！");
		}else if(ve!=vd){
			alert("验证密码不相同！");
		}else{
			submit("check_up");
		}
	}
</script>
<style>
body {background-image:url('sourse/181.jpg');}
</style>
</head>
<body>
	<body>
 	<div class="ttop">
 		<h1><img class="img1" alt="" src="sourse/new.png" width="32" height="32" border="0"> 图书管理系统</h1>
 	</div>
  <div class="loginup">
  <form id="check_up" action="check_up.jsp" method="GET">
	<h3>用户注册</h3>
    <label for="fname">账号:</label>
    <input type="text" id="user" name="user" placeholder="Pick a user">
    <label for="fname">用户名:</label>
    <input type="text" id="username" name="username" placeholder="Pick a username">
    <label for="fname">联系电话:</label>
    <input type="text" id="tel" name="tel" placeholder="Pick a tel-phone">

    <label for="lname">密码:</label>
    <input type="password" id="passwords" name="passwords" placeholder="Creat a password">
    <label for="lname">确认密码:</label>
    <input type="password" id="passwords2" name="passwords2" placeholder="Check password">

    <label for="country">身份</label>
    <select id="users" name="users">
      
      <option value="user">普通用户</option>
    </select>
  
	 <a onclick="regist('user','username','tel','passwords','passwords2')">确认注册</a>
  </form>
</div>
</body>
</html>