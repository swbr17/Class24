<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="kr.or.ksmart.dao.Mdao" %>
<%@ page import="kr.or.ksmart.dto.Member" %>
<%@ page import="java.util.*" %>
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
		 
<% request.setCharacterEncoding("euc-kr"); %>
<%= request.getRequestURI() %>
<%
	if(S_LEVEL.equals("관리자")){
%>
회원검색결과<br><br>
<form action="./m_list.jsp">
	<input type="submit" value="전체 회원리스트 돌아가기"><br>
</form>
	<table width="100%" border="1">
		<tr>
			<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
		</tr>
<%
	String search = request.getParameter("search");
	System.out.println(search+"<-- serach searchpro.jsp");
	
	Mdao mdao = new Mdao();
	ArrayList<Member> resultlist = mdao.mSearchSelect(search);
	if(resultlist.isEmpty()){
		System.out.println("다시 검색해주시기 바랍니다.");
	} else {
		for(int i=0; i<resultlist.size(); i++){
			Member m = resultlist.get(i);
%>
		<tr>
			<td><%= m.getM_id() %></td>
			<td><%= m.getM_pw() %></td>
			<td><%= m.getM_level() %></td>
			<td><%= m.getM_name() %></td>
			<td><%= m.getM_email() %></td>
			<td><a href="<%= request.getContextPath() %>/goods/gupdate/g_update_form.jsp">수정</a></td>
			<td><a href="<%= request.getContextPath() %>/goods/gdelete/g_delete_pro.jsp">삭제</a></td>
		</tr>
<%			
		}
%>
	</table>
	</div>
<%		
	}
	} else {
%>
	<script language="javascript">
		alert("회원검색권한이 없습니다. 이전 화면으로 이동합니다.");
		location.href = "<%= request.getContextPath() %>/mlist/m_list.jsp";
	</script>
<%
	}
%>
