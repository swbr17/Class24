<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String u_id = request.getParameter("id");
	String u_pw = request.getParameter("pw");
	String u_level = request.getParameter("level");
	System.out.println(u_id + "<-- u_id /login/login_pro.jsp");
	System.out.println(u_pw + "<-- u_pw /login/login_pro.jsp");
	System.out.println(u_level + "<-- u_level /login/login_pro.jsp");
	String dbid = null;
	String dbpw = null;
	String dblevel = null;
	String dbname = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev24db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev24id";
	String dbPass = "dev24pw";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	
	pstmt = conn.prepareStatement(
			"select id, pw, level, name from tb_startup where id=? and pw=? and level=?");
	System.out.println(pstmt + "<-- pstmt 1");

	pstmt.setString(1, u_id);
	pstmt.setString(2, u_pw);
	pstmt.setString(3, u_level);
	
	System.out.println(pstmt + "<-- pstmt 2");
	
	rs = pstmt.executeQuery();
	System.out.println(rs+" <--rs");
	
	if(rs.next()){
		dbid = rs.getString("id");
		dbpw = rs.getString("pw");
		dblevel = rs.getString("level");
		dbname = rs.getString("name");
		System.out.println(dbid+" <-- dbid");
		System.out.println(dbpw+" <-- dbpw");
		System.out.println(dblevel+" <-- dblevel");
		System.out.println(dbname+" <-- dbname");
		request.getSession().setAttribute("S_NAME", dbname);
		response.sendRedirect(request.getContextPath()+"/startupproject/startupmain_0501.jsp");
	}else{
%>
	<center>
		<p>회원정보가 불일치하여 로그인을 할 수 없습니다.<br>로그인을 다시 시도해주시기 바랍니다.</p>
		<form action="<%= request.getContextPath() %>/Login/Login_form.jsp">
			<input type="submit" value="로그인하기">
		</form>
	</center>
<%	
	}
	
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
%>