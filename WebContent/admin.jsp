<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书管理系统</title>
<link rel="stylesheet" type="text/css" href="css/admin.css"> 
<link rel="stylesheet" type="text/css" href="css/reader.css"> 
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	function setItemValue(){
	    var tmp = "testing";
	    document.getElementById("test1").value = tmp;  // 将JS变量值存储到隐藏控件中
	    submit();
	}
	
	function submit(a){
	    var frm = document.getElementById(a); // 获取表单
	    frm.submit(); // 对表单进行提交
	}
	function del(a,b){
		var v=document.getElementById(a).innerHTML;
		var vb=document.getElementById(b).innerHTML;

		if(parseInt(vb)!=0){
			alert("警告！该读者有未归还书籍，不可删除！");
		}else{
			if(confirm("确认要删除用户 "+v+" 吗？")){
				document.getElementById("test1").value=v;
				submit("frmAppId");
				//document.getElementById('test').innerHTML="testing";
				//$("#test").load(location.href + " #test");
			}
		}
	}
	function del_book(a,b,c){//删除提交
		var v=document.getElementById(a).innerHTML;
		var vb=document.getElementById(b).innerHTML;
		var vc=document.getElementById(c).innerHTML;
		if(vc=="借出"){
			alert("警告！请在该图书归还后再进行删除操作。");
		}
		else{
			if(confirm("确认要删除书籍"+vb+" 吗？")){
				document.getElementById("book1").value=v;
				submit("frmAppId3");
				$("#all_book").load(location.href + " #all_book");
			}
		}
	}
	function modi_book(a,b){//修改提交
		var vb=document.getElementById(b).innerHTML;
		var xmlhttp;
		if(vb=="借出"){
			alert("警告！请在该图书归还后再进行编辑操作。");
		}else{
			document.getElementById('all_book').style.display='none';
			//document.getElementById('add_book').style.display='block';
			if (window.XMLHttpRequest)
			  {
			    	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			    	xmlhttp=new XMLHttpRequest();
			  }
			  xmlhttp.open("GET","demo.jsp?modibook="+document.getElementById(a).innerHTML,true);
			  xmlhttp.send();
			  //window.location.href=window.location.href;
			  $("#book_mation").load(location.href + " #book_mation");
			  document.getElementById('mofibook').style.display='block';
		}
	}
	function u_modi(a){
		if (window.XMLHttpRequest)
		  {
		    	// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		    	xmlhttp=new XMLHttpRequest();
		  }
		xmlhttp.open("GET","jsp/modi_tools.jsp?modi_user="+document.getElementById(a).innerHTML,true);
		xmlhttp.send();
		document.getElementById('all_reader').style.display='none';
		$("#user_modi").load(location.href + " #user_modi");
		document.getElementById('modi_user').style.display='block'; 
	}
	function addbook(){//新增书籍
		document.getElementById('all_book').style.display='none';
		document.getElementById('add_book').style.display='block';
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
	function mo(a)
	{
	  var xmlhttp;
	  
	  if (window.XMLHttpRequest)
	  {
	    // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
	    xmlhttp=new XMLHttpRequest();}
	  xmlhttp.open("GET","demo.jsp?mo_user="+document.getElementById(a).innerHTML,true);
	  xmlhttp.send();
	  //$("#book_mation").load(location.href + " #book_mation");
	}
	function quxiao(){
		$("#text2").load(location.href + " #text2");
		document.getElementById('all_reader').style.display='block';
	}
	function quxiao1(){
		//$("#text1").load(location.href + " #text1");
		document.getElementById('modi_user').style.display='none';
		document.getElementById('all_reader').style.display='block';
	}
	function modiu(a,b){
		var v = document.getElementById(a).value;
		var vb = document.getElementById(b).value;
		if(v==vb){
			submit("user_modi");
		}else{
			alert("验证密码不一致！");
		}
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
  <li id="list1"><a id="list11" href="#reader_information" onclick="document.getElementById('text1').style.display='block';document.getElementById('all_reader').style.display='block';document.getElementById('modi_user').style.display='none';
		document.getElementById('text3').style.display='none';document.getElementById('text2').style.display='none';"><h3>借阅者信息</h3></a> </li>
	<li id="list2"><a id="list22" href="#book_manager" onclick="document.getElementById('text2').style.display='block';document.getElementById('all_book').style.display='block';document.getElementById('mofibook').style.display='none';document.getElementById('add_book').style.display='none';
		document.getElementById('text1').style.display='none';document.getElementById('text3').style.display='none';"><h3>图书管理</h3></a></li>
	<li id="list3"><a id="list33" href="#reade_list" onclick="document.getElementById('text3').style.display='block';
	document.getElementById('text1').style.display='none';document.getElementById('text2').style.display='none';"><h3>借阅记录</h3></a></li>
</ul>
</div>
<jsp:useBean id="test" class="sql_con.mysql_con"/>

<div class="content" id="right" style="">
<!-- 借阅者信息 -->
<div id="text1" style="display:none">
	<h2>借阅者信息</h2>
	<form name="frmApp" action="jsp/tools.jsp" id="frmAppId" mothed="post">
   		<input id="test1" type="hidden" name="test">
	</form>
	
	<div id="all_reader" class="t">
	<table id="customers">
	<%ResultSet rs=test.reader();%>
	<tr>
		<th>账号</th>
		<th>用户名</th>
		<th>借书数目</th>
		<th>电话</th>
		<th>密码</th>
		<th>操作</th>
	</tr>
	<%int i=0; %>
	<% while(rs.next()){%>
	<%i=i+1; %>
	<%if(i%2==0){ %>
	<tr class="alt">
	<%}else{ %><tr><%} %>
		<%String id = "123"+String.valueOf(i); %>
		<td id=<%=id %>><%=rs.getString("user") %></td>
		<td><%=rs.getString("username") %></td>
		<%int low = test.get_low_read(rs.getString("user")); %>
		<%String iddd2="234"+String.valueOf(i); %>
		<td id=<%=iddd2 %>><%=low %></td>
		<td><%=rs.getString("tel") %></td>
		<td><%=rs.getString("passwords") %></td>
		<%String n=rs.getString("username"); %>
		<td><button class="button blue" onclick="u_modi(<%=id %>)">编辑</button>&nbsp;&nbsp;<button class="button red" onclick="del(<%=id%>,<%=iddd2%>)">删除</button></td>
	</tr>
	<%} %>
	</table>
	</div>
	<div id="modi_user" style="display:none">
		<%String ui=(String)session.getAttribute("modi_user"); %>
		<%ResultSet uo=test.a_user(ui);uo.next(); %>
		<Form id="user_modi" action="jsp/modi_user.jsp" method="GET">
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="to" onclick="quxiao1()">取消</button>
	</div>
</div>

<div id="text2" style="display:">
<h2>图书管理</h2>
	<form name="frmApp3" action="jsp/del_book.jsp" id="frmAppId3" mothed="post">
   		<input id="book1" type="hidden" name="book">
	</form>
	<form name="frmApp2" action="jsp/modi.jsp" id="frmAppId2" mothed="post">
   		<input id="modi1" type="hidden" name="modibook">
	</form>
	<jsp:useBean id="java" class="sql_con.mysql_con"/>
	<div id="all_book" class="t" style="display:">
	<label>&nbsp;书籍号:&nbsp;&nbsp;</label><input id="bookid" type="text">&nbsp;<label>书名：&nbsp;</label><input id="bookname" type="text">&nbsp;<label>&nbsp;分类：&nbsp;</label><input id="booktag" type="text">
	&nbsp;<button class="button green" onclick="search('bookid','bookname','booktag')">查找</button>
	&nbsp;<button class="button blue" onclick="addbook()">新增图书</button>
	
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
	<div id="all_tables" style="display:">
	<%int k=0; %>
	<%while(rs2.next()){ %>
	<%k=k+1; %>
	<%if(k%2==0){ %>
	<tr class="alt">
	<%}else{ %><tr><%} %>
		<%String bid = "1234"+String.valueOf(k); %>
		<%String bid2 ="12"+String.valueOf(k); %>
		<%String istate = "1123"+String.valueOf(k); %>
		<td id=<%=bid %>><%=rs2.getString("bid") %></td>
		<td id=<%=bid2 %>><%=rs2.getString("bname") %></td>
		<td><%=rs2.getString("bauthor") %></td>
		<td><%=rs2.getString("btag") %></td>
		<%if(rs2.getString("bstate").equals("借出")){ %>
		<td id=<%=istate %> style="color:red"><%=rs2.getString("bstate") %></td>
		<%}else{ %>
		<td id=<%=istate %>><%=rs2.getString("bstate") %></td>
		<%} %>
		<td><button class="button blue" onclick="modi_book(<%=bid%>,<%=istate %>)">编辑</button>&nbsp;&nbsp;<button class="button red" onclick="del_book(<%=bid%>,<%=bid2%>,<%=istate%>)">删除</button></td>
	</tr>
	<%} %>
	</div>
	</table>
	</div>
	<div id="add_book" style="display:none">
		<%ResultSet at = java.book();at.last();int atid=Integer.parseInt(at.getString("bid"))+1; %>
		
		<form id="book_add" action="jsp/add_book.jsp" method="get">
			&nbsp;&nbsp;&nbsp;<h4>书籍编号：&nbsp;<%=atid %> </h4>
			<input type="hidden" name="new_b_id" value=<%=atid %>>
			&nbsp;&nbsp;<lable>书名：</lable>
			<input type="text" id="new_b_name" name="new_b_name"><br>
			&nbsp;&nbsp;<lable>作者：</lable>
			<input type="text" id="new_b_author" name="new_b_author"><br>
			&nbsp;&nbsp;<lable>分类：</lable>
			<input type="text" id="new_b_tag" name="new_b_tag"><br>
			&nbsp;&nbsp;<input class="to" type="submit" value="新增书籍">
		</form>
		&nbsp;&nbsp;<button class="to" onclick="quxiao()">取消</button>
	</div>
	<div id="mofibook" style="display:none">
	
	<%String p=(String)session.getAttribute("modibook"); %>
	<%ResultSet rst=java.a_book(p);rst.next(); %>
	
	<form id="book_mation" action="jsp/modi.jsp" method="GET">
	&nbsp;&nbsp;&nbsp;<h4>书籍编号：<%=p %> </h4>
	<input type="hidden" name="bid" value=<%=p %>>
	&nbsp;&nbsp;<lable>书名：</lable>
	<input type="text" id="bname" name="bname" value=<%=rst.getString("bname") %>>
	<br><br>
	&nbsp;&nbsp;<lable>作者：</lable>
	<input type="text" id="bauthor" name="bauthor" value=<%=rst.getString("bauthor") %>>
	<br><br>
	&nbsp;&nbsp;<lable>分类：</lable>
	<input type="text" id="btag" name="btag" value=<%=rst.getString("btag") %>>
	<br><br>&nbsp;&nbsp;
	&nbsp;&nbsp;<input class="to" type="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	</form>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="to" onclick="quxiao()">取消</button>
	</div>
</div>

<div id="text3" style="display:none">
<h2>借阅记录</h2> 
	<div id="all_read" class="t">
	<table id="customers">
	<%ResultSet rs3=java.red_book(); %>
	<tr>
		<th>借阅号</th>
		<th>用户账号</th>
		<th>用户名</th>
		<th>书籍号</th>
		<th>书名</th>
		<th>借阅情况</th>
	</tr>
	<%int n=0; %>	
	<%while(rs3.next()){ %>
	<%n=n+1; %>
	<%if(n%2==0){ %>
	<tr class="alt">
	<%}else{ %><tr><%} %>
		<td><%=rs3.getString("rid") %></td>
		<td><%=rs3.getString("user") %></td>
		<td><%=rs3.getString("username") %></td>
		<td><%=rs3.getString("bid") %></td>
		<td><%=rs3.getString("bname") %></td>
		<%if(rs3.getString("state").equals("未归还")){ %>
		<td style="color:red"><%=rs3.getString("state") %></td>
		<%}else{ %> <td><%=rs3.getString("state") %></td><%} %>
	<%} %>
	</table>
	</div>
</div>

</div>

</body>
</html>