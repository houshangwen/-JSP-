<span style="font-size:12px;">
<span style="font-size:14px;">
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
	<style type="text/css">
	table {
		border: 2px #CCCCCC solid;
		width: 360px;
	}

	td,th {
		height: 30px;
		border: #CCCCCC 1px solid;
	}
</style>
</head>
<body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");//记载数据库驱动，注册到驱动管理器
    	String url="jdbc:mysql://localhost:3306/world?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
    	String username="root";
    	String password="q1w2e3r4t5/";
    	Connection connection = DriverManager.getConnection(url,username,password);
		Statement statement = connection.createStatement();
		String sql = "SELECT * FROM websites";
		ResultSet rs = statement.executeQuery(sql);
	%>
	<br>
	<br>
	<table align="center">
		<tr>
			<th>
				<%
					out.print("ID");
				%>
			</th>
			<th>
				<%
					out.print("网站名");
				%>
			</th>
			<th>
				<%
					out.print("地址");
				%>
			</th>
			<th>
				<%
					out.print("Alexa");
				%>
			</th>
			<th>
				<%
					out.print("国家");
				%>
			</th>
		</tr>

		<%
			while (rs.next()) {
		%>
		<tr>
			<td>
				<%
					out.print(rs.getString(1));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString(2));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString(3));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString(4));
				%>
			</td>
			<th>
				<%
					out.print(rs.getString(5));
				%>
			</th>
		</tr>
		<%
			}
		%>
	</table>
	<div align="center">
		<br> <br> <br>
		<%
			out.print("数据查询成功，恭喜你");
		%>
	</div>
	<%
		rs.close();
		statement.close();
		connection.close();
	%>
</body>
</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">
</span>
</span>