<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reader.css"> 
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	function setItemValue(){
	    var tmp = "testing";
	    document.getElementById("test1").value = tmp;  // 将JS变量值存储到隐藏控件中
	    submit();
	}
	
	function submit(){
	    var frm = document.getElementById("frmAppId"); // 获取表单
	    frm.submit(); // 对表单进行提交
	}
	function del(a){
		var v=document.getElementById(a).innerHTML;
		if(confirm("确认要删除用户 "+v+" 吗？")){
			document.getElementById("test1").value=v;
			
			submit();
			document.getElementById('test').innerHTML="testing";
			$("#test").load(location.href + " #test");
		}
	}
</script>
</head>
<body>
	<h2>借阅者信息</h2>
	<form name="frmApp" action="tools.jsp" id="frmAppId" mothed="post">
   		<input id="test1" type="hidden" name="test">
	</form>
	<jsp:useBean id="test" class="sql_con.mysql_con"/>
	<div id="all_reader" class="t">
	<%ResultSet rs=test.reader();%>
	<table id="customers">
	<tr>
		<th>账号</th>
		<th>用户名</th>
		<th>借书数目</th>
		<th>电话</th>
		<th>密码</th>
		<th>操作</th>
	</tr><%int i=0; %>
	<% while(rs.next()){%>
	<%i=i+1; %>
	<%if(i%2==0){ %>
	<tr class="alt">
	<%}else{ %><tr><%} %>
		<%String id = "123"+String.valueOf(i); %>
		<td id=<%=id %>><%=rs.getString("user") %></td>
		<td><%=rs.getString("username") %></td>
		<td><%=0 %></td>
		<td><%=rs.getString("tel") %></td>
		<td><%=rs.getString("passwords") %></td>
		<%String n=rs.getString("username"); %>
		<td><button class="button blue" onclick="document.getElementById('modify').style.display='block';document.getElementById('all_reader').style.display='none';">编辑</button>&nbsp;&nbsp;<button class="button red" onclick="del(<%=id%>)">删除</button></td>
	</tr>
	<%} %>
	</table>
	</div>
	<div id="modify" style="display:none">
		
	</div>
		
	
</body>
</html>