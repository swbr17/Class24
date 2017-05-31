<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체회원리스트</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/main.css" />
												<!-- /layout02/main.css -->
</head>
<body>

<%@ include file="../oramodule/top.jsp" %>
<%@ include file="../oramodule/left.jsp" %>
		 <!-- Begin Right Column -->
		 <div id="rightcolumn">
	 <form action="<%= request.getContextPath() %>/oramsearch/ora_m_search_list.jsp" method="post">
		<select name="sk">
			<option value="m_id">아이디</option>
			<option value="m_level">권한</option>
			<option value="m_name">이름</option>
			<option value="m_email">이메일</option>
		</select>
		<input type="text" name="search">
		<input type="submit" value="검색">
	</form>
회원 리스트 <br>
<table width="100%" border="1">
	<tr>
		<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
	</tr>

<%
	request.setCharacterEncoding("euc-kr");
	Mdao mdao = new Mdao();
	ArrayList<Member> list = mdao.mAllSelect();
	for(Member m : list){
%>
		<tr>
			<td><%= m.getOra_id() %></td>
			<td><%= m.getOra_pw() %></td>
			<td><%= m.getOra_level() %></td>
			<td><%= m.getOra_name() %></td>
			<td><%= m.getOra_email() %></td>
			<td><a href="../oramupdate/ora_m_update_form.jsp?send_id=<%= m.getOra_id() %>">수정</a></td>
			<td><a href="../oramdelete/ora_m_delete_pro.jsp?send_id=<%= m.getOra_id() %>">삭제</a></td>
		</tr>
<%		
	}
%>
	</table>
</div>
</body>
</html>