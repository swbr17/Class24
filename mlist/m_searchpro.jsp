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
	if(S_LEVEL.equals("������")){
%>
ȸ���˻����<br><br>
<form action="./m_list.jsp">
	<input type="submit" value="��ü ȸ������Ʈ ���ư���"><br>
</form>
	<table width="100%" border="1">
		<tr>
			<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
		</tr>
<%
	String search = request.getParameter("search");
	System.out.println(search+"<-- serach searchpro.jsp");
	
	Mdao mdao = new Mdao();
	ArrayList<Member> resultlist = mdao.mSearchSelect(search);
	if(resultlist.isEmpty()){
		System.out.println("�ٽ� �˻����ֽñ� �ٶ��ϴ�.");
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
			<td><a href="<%= request.getContextPath() %>/goods/gupdate/g_update_form.jsp">����</a></td>
			<td><a href="<%= request.getContextPath() %>/goods/gdelete/g_delete_pro.jsp">����</a></td>
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
		alert("ȸ���˻������� �����ϴ�. ���� ȭ������ �̵��մϴ�.");
		location.href = "<%= request.getContextPath() %>/mlist/m_list.jsp";
	</script>
<%
	}
%>
