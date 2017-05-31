<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.*" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정화면</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/main.css" />
												<!-- /layout02/main.css -->
</head>
<body>

<%@ include file="../oramodule/top.jsp" %>
<%@ include file="../oramodule/left.jsp" %>
		 <!-- Begin Right Column -->
		 <div id="rightcolumn">

<%
	request.setCharacterEncoding("euc-kr");
	String send_id = request.getParameter("send_id");
	System.out.println(send_id + "<-- send_id");
	
	String dbid = null;
	String dbpw = null;
	String dblevel = null;
	String dbname = null;
	String dbemail = null;

	Mdao mdao = new Mdao();
	Member m = mdao.mSelectforUpdate(send_id);
	
	dbid = m.getOra_id();
	dbpw = m.getOra_pw();
	dblevel = m.getOra_level();
	dbname = m.getOra_name();
	dbemail = m.getOra_email();
%>
<form action="<%= request.getContextPath() %>/oramupdate/ora_m_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="ora_id" size="20" value="<%= dbid %>" readonly></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="ora_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="ora_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="ora_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="ora_email" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원수정버튼"></td>
</tr>
</table>
</form>

</div>
</body>
</html>