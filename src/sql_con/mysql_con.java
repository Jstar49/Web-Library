package sql_con;
import java.sql.*;
import java.io.*;

public class mysql_con {
	String url="jdbc:mysql://localhost:3306/web?useUnicode=true&amp;characterEncoding=utf-8";
	String root= "root";
	String rootpass = "starman";
	Connection con = null;
	ResultSet rs = null;
	//连接
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//System.out.println("锟斤拷锟捷匡拷锟斤拷锟斤拷锟斤拷锟截成癸拷");
			con = DriverManager.getConnection(url, root, rootpass);
			//System.out.println("锟斤拷锟捷匡拷锟斤拷锟接成癸拷");
			//return 1; 
		}catch (Exception e) {
			//System.out.println("锟斤拷锟捷匡拷锟斤拷锟斤拷失锟斤拷");
			//return 0;
		}
	}
	//断开连接
	public void disconnect() {
		try {
			if(con!=null) {
				con.close();
				con = null;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//执行查询语句
	public ResultSet excute(String sql) {
		try {
			//System.out.println("executeQuery(). sql = " + sql);
			PreparedStatement pstm = con.prepareStatement(sql);
			// 执锟叫诧拷询
			rs = pstm.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	//执行修改语句并返回修改行数
	public int excuteUpdata(String sql) {
		int count = 0;
		connect();
		try {
			System.out.println("executeQuery(). sql = " + sql);
			Statement stmt = con.createStatement();
			count = stmt.executeUpdate(sql);
		} 
		catch(SQLException ex) { 
			System.err.println(ex.getMessage());		
			count = -1;
		}
		disconnect();
		return count;
	}
	//验证用户
	public int is_user(String user_name,String user_pass,String anth) {
		connect();
		String sql="select * from usertable where user='"+user_name+"';";
		int flag=0;
		try {
			ResultSet re = excute(sql);
			re.next();
			String u = re.getString("user");
			String p = re.getString("passwords");
			String a = re.getString("authority");
			if(u.equals(user_name)&&p.equals(user_pass)&&a.equals(anth)) {
				if(a.equals("1"))
					flag=1;
				else	flag=2;
			}
			return flag;
		}catch(Exception e){
			return 0;
		}
	}
	//插入用户信息
	public int sign_up(String user,String passwords,String tel,String username) {
		String sql = "insert into usertable values('"+user+"','"+username+"','"+passwords+"','"+tel+"',\"0\");";
		connect();
		int flag=0;
		try {
			if(excuteUpdata(sql)>0) {flag=1;}
			return flag;
		}catch(Exception e){
			return 0;
		}
	}
	//查询用户
	public ResultSet reader() {
		String sql = "select * from usertable where authority='0';";
		//ResultSet re =null;
		connect();
		try {
			ResultSet re = excute(sql);
			//re.next();
			return re;
		}catch(Exception e) {
			return null;
		}
	}
	//删除用户
	public int delete_user(String name) {
		String sql = "delete from usertable where user='"+name+"';";
		int flag=0;
		try {
			connect();
			if(excuteUpdata(sql)>0) {flag=1;}
			return flag;
		}catch(Exception e) {return 0;}
		
	}
	//返回ID索引用户
	public ResultSet a_user(String id){
		String sql="select * from usertable where user='"+id+"';";
		connect();
		try {
			ResultSet re = excute(sql);
			return re;
		}catch(Exception e) {
			return null;
		}
	}
	//返回BOOK表
	public ResultSet book() {
		String sql="select * from book;";
		connect();
		try {
			ResultSet re = excute(sql);
			return re;
		}catch(Exception e) {
			return null;
		}
	}
	//搜索书籍列表
	public ResultSet search_book(String bookid,String bookname,String booktag) {
		String sql="select * from book where btag like '%"+booktag+"%' and bname like '%"+bookname+"%' and bid like '%"+bookid+"%';";
		//System.out.println("executeQuery(). sql = " + sql);
		connect();
		try {
			ResultSet re = excute(sql);
			return re;
		}catch(Exception e) {
			return null;
		}
	}
	//删除书籍
	public int delete_book(int id) {
		String sql="delete from book where bid="+id+";";
		int flag=0;
		try {
			connect();
			if(excuteUpdata(sql)>0) {flag=1;}
			return flag;
		}catch(Exception e) {return 0;}
	}
	//添加图书
	public int add_book(String id,String name,String author,String tag) {
		String sql="insert into book values("+id+",'"+name+"','"+tag+"','"+author+"','未借出');";
		int flag=0;
		try {
			connect();
			if(excuteUpdata(sql)>0) {flag=1;}
			return flag;
		}catch(Exception e) {return 0;}
	}
	//返回ID索引书籍
	public ResultSet a_book(String id){
		String sql="select * from book where bid="+String.valueOf(id)+";";
		connect();
		try {
			ResultSet re = excute(sql);
			return re;
		}catch(Exception e) {
			return null;
		}
	}
	//修改书籍
	public int modi_book(String bid,String bname,String bauthor,String btag) {
		String sql="update book set bname='"+bname+"',bauthor='"+bauthor+"',btag='"+btag+"' where bid="+bid+";";
		int flag=0;
		try {
			connect();
			if(excuteUpdata(sql)>0) {flag=1;}
			return flag;
		}catch(Exception e) {return 0;}
	}
	//借阅书籍
	public int reade_book(String user,String bid) {
		int flag=0;
		ResultSet u = a_user(user);
		
		ResultSet b = a_book(bid);
		
		String sql1="select * from reade;";
		ResultSet red = excute(sql1);
		int cout=0;
		try {
		if(!red.next()) 
			cout=1;
		else {
			red.last();
			String c = red.getString("rid");
			cout=Integer.parseInt(c);
			cout++;
		}
		}catch(Exception e) {}
		try {
			u.next();b.next();
			String sql="insert into reade values("+cout+",'"+u.getString("user")+"','"+u.getString("username")+"',"+b.getString("bid")+",'"+b.getString("bname")+"','未归还');";
			String sql2="update book set bstate='借出' where bid="+b.getString("bid")+";";
			if(excuteUpdata(sql)>0 && excuteUpdata(sql2)>0) {
				flag=1;
			}
			return flag;
		}catch(Exception e) {
			return 0;
		}
	}
	//索引阅览记录
	public ResultSet r_book(String id){
		String sql="select * from reade where user='"+id+"';";
		connect();
		try {
			ResultSet re = excute(sql);
			return re;
		}catch(Exception e) {
			return null;
		}
	}
	//返回借阅记录
	public ResultSet red_book(){
		String sql="select * from reade;";
		connect();
		try {
			ResultSet re = excute(sql);
			return re;
		}catch(Exception e) {
			return null;
		}
	}
	//索引阅览ing记录
	public ResultSet ring_book(String id){
		String sql="select * from reade where user='"+id+"' and state='未归还';";
		connect();
		try {
			ResultSet re = excute(sql);
			return re;
		}catch(Exception e) {
			return null;
		}
	}
	//索引阅览ing数量记录
	public int get_low_read(String id) {
		ResultSet ts = ring_book(id);
		int flag = 0;
		try {
			while(ts.next()) {
				flag=flag+1;
			}
			return flag;
		}catch(Exception e) {return flag;}
	}
	//归还书籍
	public int backbook(String id,String bid) {
		String sql = "update reade set state='已归还' where rid="+id+";";
		String sql2 = "update book set bstate='未借出' where bid="+bid+";";
		int flag=0;
		connect();
		try {
			if(excuteUpdata(sql)>0 && excuteUpdata(sql2)>0)	flag=1;
			return flag;
		}catch(Exception e) {
			return flag;
		}
	}
	//用户修改个人信息
	public int modi_user(String user, String username, String passwords, String tel) {
		String sql="";
		if(passwords!="") {
			sql = "update usertable set username='"+username+"',passwords='"+passwords+"',tel='"+tel+"' where user='"+user+"';";
		}else {
			sql = "update usertable set username='"+username+"',tel='"+tel+"' where user='"+user+"';";
		}
		connect();
		int flag = 0;
		try {
			if(excuteUpdata(sql)>0)	flag=1;
			return flag;
		}catch(Exception e) {
			return flag;
		}
	}
}
