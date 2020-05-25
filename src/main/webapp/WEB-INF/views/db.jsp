<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/study";
		String user = "root";
		String pass = "java";
		String query = "select * from member";
		
		//2.데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, user, pass);
		
		//3.Statement 생성
		stmt = conn.createStatement();
		//4. 쿼리실행
		rs = stmt.executeQuery(query);
%>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>생일</th>
				<th>등급</th>
			</tr>
<%		while(rs.next()) { %>
			<tr>
				<td><%=rs.getString("mem_id") %></td>
				<td><%=rs.getString("mem_pass") %></td>
				<td><%=rs.getString("mem_name") %></td>
				<td><%=rs.getString("mem_email") %></td>
				<td><%=rs.getString("mem_tel") %></td>
				<td><%=rs.getString("mem_addr") %></td>
				<td><%=rs.getDate("mem_birth") %></td>
				<td><%=rs.getString("grade") %></td>
			</tr>
		<%}%> 
		</table>
		<%
		}catch(SQLException ex) {
		%>
		에러발생:<%= ex.getMessage() %>
		<%
			}finally {
				if(rs!=null) try{rs.close();} catch(SQLException ex) {}
				if(stmt!=null) try{stmt.close();} catch(SQLException ex) {}
				if(conn!=null) try{conn.close();} catch(SQLException ex) {}
			}
		%>
</body>
</html>