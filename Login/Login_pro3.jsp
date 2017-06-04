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

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id + "<-- id");
	System.out.println(pw + "<-- pw");
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
			"select m_id, m_pw, m_level, m_name from tb_member where m_id=? and m_pw=?");
	System.out.println(pstmt + "<-- pstmt 1");

	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	System.out.println(pstmt + "<-- pstmt 2");
	
	rs = pstmt.executeQuery();
	System.out.println(rs+" <--rs");
	
	if(rs.next()){
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		System.out.println(dbid+" <-- dbid");
		System.out.println(dbpw+" <-- dbpw");
		System.out.println(dblevel+" <-- dblevel");
		System.out.println(dbname+" <-- dbname");
		request.getSession().setAttribute("S_NAME", dbname);
		request.getSession().setAttribute("S_LEVEL", dblevel);
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		
		if(id.equals(dbid)){
			System.out.println("01아이디일치");
			if(pw.equals(dbpw)){
				System.out.println("03로그인성공");
				session.setAttribute("S_NAME", dbname);
				session.setAttribute("S_LEVEL", dblevel);
				session.setAttribute("SID", dbid);
				//response.sendRedirect(request.getContextPath() +"/index.jsp");
	
%>
		<script language="javascript">
			alert("로그인성공");
			location.href = "<%= request.getContextPath() %>/index.jsp";
		</script>
<%			
			}else{
%>
		<script language="javascript">
			alert("비번불일치");
			location.href = "<%= request.getContextPath() %>/index.jsp";
		</script>
<%			
		}
		}else{
%>
		<script language="javascript">
			alert("아이디불일치");
			location.href = "<%= request.getContextPath() %>/index.jsp";
		</script>
<%		
	}}
%>

