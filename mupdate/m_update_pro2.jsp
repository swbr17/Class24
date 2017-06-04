<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>

<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_level = request.getParameter("m_level");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	System.out.println(m_id + "<-- m_id /minsert/m_insert_pro.jsp");
	System.out.println(m_pw + "<-- m_pw /minsert/m_insert_pro.jsp");
	System.out.println(m_level + "<-- m_level /minsert/m_insert_pro.jsp");
	System.out.println(m_name + "<-- m_name /minsert/m_insert_pro.jsp");
	System.out.println(m_email + "<-- m_email /minsert/m_insert_pro.jsp");
	
	Member m = new Member();
	m.setM_id("id0017");
	m.setM_pw("pw0017");
	m.setM_level("판매자");
	m.setM_name("이보라라라");
	m.setM_email("email17");

	try{
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
		
		pstmt = conn.prepareStatement("UPDATE tb_member SET m_id=?, m_pw=?, m_level=?, m_name=?, m_email=? WHERE m_id=?");
		System.out.println(pstmt +"<-- pstmt1");
		
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		pstmt.setString(6, m.getM_id());
		System.out.println(pstmt +"<-- pstmt2");
		

		int result = pstmt.executeUpdate();
		System.out.println(result +"<-- result");
		response.sendRedirect(request.getContextPath()+ "/mlist/m_list.jsp");

	}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>