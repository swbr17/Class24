<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
//ȭ�鿡�� �Է��ڷ� �޾Ƽ� �ܼ�â�� ��� ����
	String send_id = request.getParameter("send_id");
	System.out.println(send_id + "<-- send_id");
//ȭ�鿡�� �Է��ڷ� �޾Ƽ� �ܼ�â�� ��� ��	
	//JDBC ���α׷� ����
	
	try{
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
//03�ܰ� :Query������ ���� statement �Ǵ� prepareStatement��ü���� ����
		pstmt = conn.prepareStatement(
				"delete from tb_member where m_id=?");
		System.out.println(pstmt + "<-- pstmt 1 ");
//insert into tb_member values('id001','pw001','������','ȫ01','email01');
		pstmt.setString(1, send_id);
		System.out.println(pstmt + "<-- pstmt 2 ");
//03�ܰ� :Query������ ���� statement �Ǵ� prepareStatement��ü���� ��
//04�ܰ� :Query���� ����
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result ");
response.sendRedirect(request.getContextPath() + "/mlist/m_list.jsp");

	
//04�ܰ� :Query���� ��
//05�ܰ� :Query������ ��� (insert�� ��� ���� ���ɴܰ�)

	}finally{
		//06�ܰ� :statement �Ǵ� prepareStatement��ü ����(close())
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		//07�ܰ� :Connection ��ü ����(close())
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>