<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>

<%= request.getRequestURI() %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
 <!-- Begin Right Column -->
		 <div id="rightcolumn">

<%
	String id = request.getParameter("id");
	System.out.println(id + "<-- id m_update_form.jsp");
	
	String dbid = null;
	String dbpw = null;
	String dblevel = null;
	String dbname = null;
	String dbemail = null;
	
	Mdao mdao = new Mdao();
	Member result = mdao.mSelectforUpdate(id);
	dbid = result.getM_id();
	dbpw = result.getM_pw();
	dblevel = result.getM_level();
	dbname = result.getM_name();
	dbemail = result.getM_email();
%>
		<form action="<%= request.getContextPath() %>/mupdate/m_update_pro.jsp" method="post">
		<table border="1">
		<tr>
			<td>���̵�</td>
			<td><input type="text" name="m_id" size="20" value="<%= dbid %>" readonly></td>
		<tr>
		<tr>
			<td>��ȣ</td>
			<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
		<tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="m_level" size="20" value="<%= dblevel %>"></td>
		<tr>
		<tr>
			<td>�̸�</td>
			<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
		<tr>
		<tr>
			<td>�̸���</td>
			<td><input type="text" name="m_email" size="20" value="<%= dbemail %>"></td>
		<tr>
		<tr>
			<td colspan="4"><input type="submit" value="ȸ��������ư"></td>
		</tr>
		</table>
		</form>
		
		
 </div>
		 <!-- End Right Column -->
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>
		