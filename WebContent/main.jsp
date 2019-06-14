<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理系统</title>
<link rel="stylesheet" type="text/css" href="css/admin.css"> 
<link rel="stylesheet" type="text/css" href="css/reader.css"> 
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	function submit(a){
	    var frm = document.getElementById(a); // 获取表单
	    frm.submit(); // 对表单进行提交
	}
	function reade(a,b,c){
		var v = document.getElementById(a).innerHTML;
		var vb = document.getElementById(b).innerHTML;
		var vc= document.getElementById(c).innerHTML;
		if(vc=="借出"){
			alert("抱歉！该书已被其他读者借阅。");
		}else{
		if(confirm("确认要借阅 "+vb+" 吗？")){
			document.getElementById("bid1").value=v;
			
			submit("frmAppId");
			//document.getElementById('test').innerHTML="testing";
			//$("#test").load(location.href + " #test");
		}}
	}
	function book_back(a,b,c){
		var v = document.getElementById(a).innerHTML;
		var vb = document.getElementById(b).innerHTML;
		var vc = document.getElementById(c).innerHTML;
		if(confirm("确认要归还 "+vb+" 吗？")){
			document.getElementById("back1").value=v;
			document.getElementById("bidd1").value=v;
			
			submit("backbook");
			//document.getElementById('test').innerHTML="testing";
			//$("#test").load(location.href + " #test");
		}
	}
	function modiu(a,b){
		var v = document.getElementById(a).value;
		var vb = document.getElementById(b).value;
		if(v!=vb){
			alert("验证密码不一致！");
		}else{
			submit("user_modi");
		}
	}
	function search(a,b,c){//搜索提交
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {
		    	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		    	xmlhttp=new XMLHttpRequest();
		  }
		xmlhttp.open("GET","jsp/search_tools.jsp?bookid="+document.getElementById(a).value+"&bookname="+document.getElementById(b).value+"&booktag="+document.getElementById(c).value,true);
		xmlhttp.send();
		$("#all_book").load(location.href + " #all_book");
	}
</script>
<style>
body {background-image:url('sourse/18.jpg');}
</style>
</head>
<body style="margin:0">
	
	<div class="ttop">
 		<h1><img class="log_img" alt="" src="sourse/new.png" width="32" height="32" border="0"> 图书管理系统</h1>
 	</div>
	

<div id="left">
<ul class="sidenav">
  	<li id="list1"><a id="list11" href="#" onclick="document.getElementById('text1').style.display='block';document.getElementById('text2').style.display='none';document.getElementById('text3').style.display='none';document.getElementById('text4').style.display='none';"><h3>书籍借阅</h3></a> </li>
	<li id="list2"><a id="list22" href="#" onclick="document.getElementById('text2').style.display='block';document.getElementById('text1').style.display='none';document.getElementById('text3').style.display='none';document.getElementById('text4').style.display='none';"><h3>已借阅书籍</h3></a></li>
	<li id="list3"><a id="list33" href="#" onclick="document.getElementById('text3').style.display='block';document.getElementById('text1').style.display='none';document.getElementById('text2').style.display='none';document.getElementById('text4').style.display='none';"><h3>借阅记录</h3></a></li>
	<li id="list4"><a id="list44" href="#" onclick="document.getElementById('text4').style.display='block';document.getElementById('text1').style.display='none';document.getElementById('text2').style.display='none';document.getElementById('text3').style.display='none';"><h3>个人信息</h3></a></li>
	
</ul>
</div>
<jsp:useBean id="java" class="sql_con.mysql_con"/>
<div class="content" id="right" style="">
<!-- 借阅者信息 -->
<div id="text1" style="display:">
	<form name="frmApp" action="jsp/reade.jsp" id="frmAppId" mothed="post">
   		<input id="bid1" type="hidden" name="bid">
	</form>
	<h2>书籍借阅</h2>
	<div id="all_book" class="t">
	<label>&nbsp;书籍号:&nbsp;&nbsp;</label><input id="bookid" type="text">&nbsp;<label>书名：&nbsp;</label><input id="bookname" type="text">&nbsp;<label>&nbsp;分类：&nbsp;</label><input id="booktag" type="text">
	&nbsp;<button class="button green" onclick="search('bookid','bookname','booktag')">查找</button>
	<table id="customers">
	<% String seid = (String)session.getAttribute("bookid") ;
		String sename = (String)session.getAttribute("bookname");
		String setag = (String)session.getAttribute("booktag"); %>
	<%ResultSet rs2=java.search_book(seid,sename,setag); %>
	<tr>
		<th>编号</th>
		<th>书名</th>
		<th>作者</th>
		<th>分类</th>
		<th>借阅情况</th>
		<th>操作</th>
	</tr>
	<%int k=0; %>
	<%while(rs2.next()){ %>
	<%k=k+1; %>
	<%if(k%2==0){ %>
	<tr class="alt">
	<%}else{ %><tr><%} %>
		<%String id = "1234"+String.valueOf(k); %>
		<%String id2 ="12"+String.valueOf(k); %>
		<%String id3 = "1"+String.valueOf(k); %>
		<td id=<%=id %>><%=rs2.getString("bid") %></td>
		<td id=<%=id2 %>><%=rs2.getString("bname") %></td>
		<td><%=rs2.getString("bauthor") %></td>
		<td><%=rs2.getString("btag") %></td>
		<%if(rs2.getString("bstate").equals("借出")){ %>
		<td id=<%=id3 %> style="color:red"><%=rs2.getString("bstate") %></td>
		<%}else{ %> <td id=<%=id3 %>><%=rs2.getString("bstate") %></td><%} %>
		
		<td><button class="button blue" onclick="reade(<%=id%>,<%=id2%>,<%=id3%>)">借阅</button></td>
	<tr>
	<%} %>
	</table>
	</div>
</div>

<div id="text2" style="display:none">
	<form name="backbook" action="jsp/back.jsp" id="backbook" mothed="post">
   		<input id="back1" type="hidden" name="back">
   		<input id="bidd1" type="hidden" name="bidd">
	</form>
	<h2>已借阅书籍</h2>
	<div id="read_book" class="t">
	<table id="customers">
	<%String oo=(String)session.getAttribute("user"); %>
	<%ResultSet rs4=java.ring_book(oo); %>
	<tr>
		<th>借阅号</th>
		<th>书籍号</th>
		<th>书名</th>
		<th>借阅情况</th>
		<th>操作</th>
	</tr>
	<%int l=0; %>	
	<%while(rs4.next()){ %>
	<%l=l+1; %>
	<%if(l%2==0){ %>
	<tr class="alt">
	<%}else{ %><tr><%} %>
		<%String idb="14"+String.valueOf(l); %>
		<%String idb2="114"+String.valueOf(l); %>
		<%String idb3="1114"+String.valueOf(l); %>
		<td id=<%=idb %>><%=rs4.getString("rid") %></td>
		<td id=<%=idb3 %>><%=rs4.getString("bid") %></td>
		<td id=<%=idb2 %>><%=rs4.getString("bname") %></td>
		<td><%=rs4.getString("state") %></td>
		<td><button class="button blue" onclick="book_back(<%=idb%>,<%=idb2%>,<%=idb3%>)">归还书籍</button></td>
	</tr>
	<%} %>
	</table>
	</div>
</div>

<div id="text3" style="display:none">
	<h2>借阅记录</h2>
	<div id="all_read" class="t">
	<table id="customers">
	<%String oo1=(String)session.getAttribute("user"); %>
	<%ResultSet rs3=java.r_book(oo1); %>
	<tr>
		<th>借阅号</th>
		<th>书籍号</th>
		<th>书名</th>
		<th>借阅情况</th>
	</tr>
	<%int m=0; %>	
	<%while(rs3.next()){ %>
	<%m=m+1; %>
	<%if(m%2==0){ %>
	<tr class="alt">
	<%}else{ %><tr><%} %>
		<td><%=rs3.getString("rid") %></td>
		<td><%=rs3.getString("bid") %></td>
		<td><%=rs3.getString("bname") %></td>
		
		<%if(rs3.getString("state").equals("未归还")){ %>
		<td style="color:red"><%=rs3.getString("state") %></td>
		<%}else{ %> <td><%=rs3.getString("state") %></td><%} %>
	</tr>
	<%} %>
	</table>
	</div>
</div>

<div id="text4" style="display:none">
	<h2>个人信息</h2>
	<%String ui=(String)session.getAttribute("user"); %>
	<%ResultSet uo=java.a_user(ui);uo.next(); %>
	<Form id="user_modi" action="jsp/user_modi.jsp" method="post">
		&nbsp;&nbsp;&nbsp;&nbsp;<h4>账号：<%=uo.getString("user") %> </h4>
		<input type="hidden" name="uid" value=<%=uo.getString("user") %>>
		&nbsp;&nbsp;&nbsp;<h4>用户名： </h4>
		<input type="text" id="uname" name="uname" value=<%=uo.getString("username") %>><BR>
		
		&nbsp;&nbsp;&nbsp;<h4>联系方式： </h4>
		<input type="text" id="utel" name="utel" value=<%=uo.getString("tel") %>><BR>
		
		&nbsp;&nbsp;&nbsp;<h4>修改密码： </h4>
		<input type="password" id="upass" name="upass" placeholder="Your new passwords.."><BR><br>
		<input type="password" id="upas" name="upas" placeholder="Check new passwords.."><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="to" type="submit" value="修改">
		
	</Form>
</div>

</div>

</body>
</html>