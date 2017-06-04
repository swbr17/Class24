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
//화면에서 입력자료 받아서 콘솔창에 출력 시작
	String send_id = request.getParameter("send_id");
	System.out.println(send_id + "<-- send_id");
//화면에서 입력자료 받아서 콘솔창에 출력 끝	
	//JDBC 프로그램 순서
	
	try{
		DriverDB driverdb = new DriverDB();
		conn = driverdb.driverDBcon();
		System.out.println(conn+" <-- conn");
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작
		pstmt = conn.prepareStatement(
				"delete from tb_member where m_id=?");
		System.out.println(pstmt + "<-- pstmt 1 ");
//insert into tb_member values('id001','pw001','관리자','홍01','email01');
		pstmt.setString(1, send_id);
		System.out.println(pstmt + "<-- pstmt 2 ");
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 끝
//04단계 :Query실행 시작
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result ");
response.sendRedirect(request.getContextPath() + "/mlist/m_list.jsp");

	
//04단계 :Query실행 끝
//05단계 :Query실행결과 사용 (insert의 경우 생략 가능단계)

	}finally{
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		//07단계 :Connection 객체 종료(close())
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>