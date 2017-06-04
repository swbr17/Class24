<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;

	String u_id = request.getParameter("id");
	String u_pw = request.getParameter("pw");
	String u_level = request.getParameter("level");
	String u_name = request.getParameter("name");
	String u_phone = request.getParameter("phone");
	String u_birth = request.getParameter("birth");
	String u_address = request.getParameter("address");
	String u_email = request.getParameter("emailaddr");
	String u_field = request.getParameter("field");
	System.out.println(u_id + "<-- u_id /Insert/i_insert_pro.jsp");
	System.out.println(u_pw + "<-- u_pw /Insert/i_insert_pro.jsp");
	System.out.println(u_level + "<-- u_level /Insert/i_insert_pro.jsp");
	System.out.println(u_name + "<-- u_name /Insert/i_insert_pro.jsp");
	System.out.println(u_phone + "<-- u_phone /Insert/i_insert_pro.jsp");
	System.out.println(u_birth + "<-- u_birth /Insert/i_insert_pro.jsp");
	System.out.println(u_address + "<-- u_address /Insert/i_insert_pro.jsp");
	System.out.println(u_email + "<-- u_email /Insert/i_insert_pro.jsp");
	System.out.println(u_field + "<-- u_field /Insert/i_insert_pro.jsp");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/db17lbr?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dbid17lbr";
	String dbPass = "dbpw17lbr";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	
	pstmt = conn.prepareStatement(
			"INSERT INTO tb_startupuser (id, pw, `level`, name, phone, birth, address, email, field) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
	System.out.println(pstmt + "<-- pstmt 1");

	pstmt.setString(1, u_id);
	pstmt.setString(2, u_pw);
	pstmt.setString(3, u_level);
	pstmt.setString(4, u_name);
	pstmt.setString(5, u_phone);
	pstmt.setString(6, u_birth);
	pstmt.setString(7, u_address);
	pstmt.setString(8, u_email);
	pstmt.setString(9, u_field);
	System.out.println(pstmt + "<-- pstmt 2");
	
	pstmt.executeUpdate();
%>
	<br>
	<center>
	<form action="<%= request.getContextPath() %>/Login/Login_form.jsp">
	<p>회원가입이 완료되었습니다. 로그인 후 이용해 주시기 바랍니다.</p><br>
	<input type="submit" value="로그인">
	</form>
	</center>
<% 
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
%>