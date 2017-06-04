<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%@ page import = "kr.or.ksmart.dao.Gdao" %>
<%@ page import = "kr.or.ksmart.dto.Goods" %>
<%@ page import = "java.util.*" %>

<%= request.getRequestURI() %> <br>

<%
	String SID = (String)session.getAttribute("SID");
	System.out.println(SID+" <--SID g_list");
		
	String dbgcode = null;
	String dbid = null;
	String dbgname = null;
	String dbcate = null;
	String dbprice = null;
	String dbcolor = null;
	String dbsize = null;
	String dbdate = null;
	String dbdetail = null;

if(S_LEVEL.equals("������")){	
	Gdao gdao = new Gdao();
	ArrayList<Goods> listadmg = gdao.gAllSelectadm();

	
	if(listadmg.isEmpty()){
		System.out.println(listadmg.isEmpty()+" <-- list boolean");
		out.println("����Ʈ �˻������ �����ϴ�.");
	}else{
		System.out.println(listadmg.isEmpty()+" <-- list boolean");
%>		
		<form action="<%= request.getContextPath() %>/goods/gsearch/g_search_pro.jsp"?gcode=<%= dbgcode %>&mid=<%= dbid %>&gname=<%= dbgname %>&gcate=<%= dbcate %>&gdate=<%= dbdate %>&startdate=<%= "" %>&enddate=<%= "" %>&startprice=<%= "" %>&endprice=<%= "" %> method="post">
		<center>
		<select>
			  <option value="g_code">��ǰ�ڵ�</option>
			  <option value="g_name">��ǰ��</option>
			  <option value="m_id">�Ǹ��ھ��̵�</option>
			  <option value="g_cate">��ǰī�װ�</option>
		</select>
		<input type="text" name="search" size="30"><br>
		�Ⱓ���˻� :<input type="date" name="startdate" value="">~
		<input type="date" name="enddate" value=""><br>
		���ݴ뺰�˻�(~300����) :<input type="number" name="startprice" min="0" max="3000000" value="0" step="1000">~
			<input type="number" name="endprice" min="0" max="3000000" value="0" step="1000">
			<input type="submit" name="searchpro" value="�˻��ϱ�" ><br>
		</center>
	</form>
	<br>
		��ǰ ����Ʈ <br>
		<form action="">
		<table width="100%" border="1">	
			<tr>
				<td>��ǰ�ڵ�</td><td>���̵�</td><td>��ǰ��</td><td>ī�װ�</td><td>����</td><td>����</td><td>ũ��</td><td>��¥</td><td>������</td><td>����</td><td>����</td>
			</tr>			
<%			
		for(int i = 0; i<listadmg.size(); i++){
			Goods g = listadmg.get(i);
			dbgcode = g.getG_code();
			dbid = g.getM_id();
			dbgname = g.getG_name();
			dbcate = g.getG_cate();
			dbprice = g.getG_price();
			dbcolor = g.getG_color();
			dbsize = g.getG_size();
			dbdate = g.getG_date();
			dbdetail = g.getG_detail();
%>		
		<tr>
			<td><%= dbgcode %></td>
			<td><%= dbid %></td>
			<td><%= dbgname %></td>
			<td><%= dbcate %></td>
			<td><%= dbprice %></td>
			<td><%= dbcolor %></td>
			<td><%= dbsize %></td>
			<td><%= dbdate %></td>
			<td><%= dbdetail %></td>
			<td>
				<a href="<%= request.getContextPath() %>/goods/gupdate/g_update_form.jsp?gcode=<%= dbgcode %>">�����ϱ�</a>
			</td>
			<td>
				<a href="<%= request.getContextPath() %>/goods/gdelete/g_delete_pro.jsp?gcode=<%= dbgcode %>">�����ϱ�</a>
			</td>
		</tr>			
<%		
		}
%>
	</table>	
	</form>	
<%
	}
}else if(S_LEVEL.equals("�Ǹ���")){
	Gdao gdao = new Gdao();
	ArrayList<Goods> listsellg = gdao.gAllSelectSell(SID);

	if(listsellg.isEmpty()){
		System.out.println(listsellg.isEmpty()+" <-- listsellg boolean");
		out.println("����Ʈ �˻������ �����ϴ�.");
	}else{
		System.out.println(listsellg.isEmpty()+" <-- listsellg boolean");	
%>		
	<form action="<%= request.getContextPath() %>/goods/gsearch/g_search_pro.jsp"?gcode=<%= dbgcode %>&mid=<%= dbid %>&gname=<%= dbgname %>&gcate=<%= dbcate %>&gdate=<%= dbdate %>&startdate=<%= "" %>&enddate=<%= "" %>&startprice=<%= "" %>&endprice=<%= "" %> method="post">
		<center>
		<select>
			  <option value="g_code">��ǰ�ڵ�</option>
			  <option value="g_name">��ǰ��</option>
			  <option value="m_id">�Ǹ��ھ��̵�</option>
			  <option value="g_cate">��ǰī�װ�</option>
		</select>
		<input type="text" name="search" size="30"><br>
		�Ⱓ���˻� :<input type="date" name="startdate" value="">~
		<input type="date" name="enddate" value=""><br>
		���ݴ뺰�˻� :<input type="number" name="startprice" placeholder="0�������Է�" min="0" max="3000000" value="" step="1000">~
		<input type="number" name="endprice" placeholder="300���������Է�" min="0" max="3000000" value="" step="1000">
			<input type="submit" name="searchpro" value="�˻��ϱ�" ><br>
		</center>
	</form>
	<br>
		��ǰ ����Ʈ <br>
		<form action="">
		<table width="100%" border="1">	
			<tr>
				<td>��ǰ�ڵ�</td><td>���̵�</td><td>��ǰ��</td><td>ī�װ�</td><td>����</td><td>����</td><td>ũ��</td><td>��¥</td><td>������</td><td>����</td><td>����</td>
			</tr>			
<%
	for(int i = 0; i<listsellg.size();i++){
		Goods g = listsellg.get(i);
		dbgcode = g.getG_code();
		dbid = g.getM_id();
		dbgname = g.getG_name();
		dbcate = g.getG_cate();
		dbprice = g.getG_price();
		dbcolor = g.getG_color();
		dbsize = g.getG_size();
		dbdate = g.getG_date();
		dbdetail = g.getG_detail();
%>
			<tr>
				<td><%= dbgcode %></td>
				<td><%= dbid %></td>
				<td><%= dbgname %></td>
				<td><%= dbcate %></td>
				<td><%= dbprice %></td>
				<td><%= dbcolor %></td>
				<td><%= dbsize %></td>
				<td><%= dbdate %></td>
				<td><%= dbdetail %></td>
				<td>
					<a href="<%= request.getContextPath() %>/goods/gupdate/g_update_form.jsp?gcode=<%= dbgcode %>">�����ϱ�</a>
				</td>
				<td>
					<a href="<%= request.getContextPath() %>/goods/gdelete/g_delete_pro.jsp?gcode=<%= dbgcode %>">�����ϱ�</a>
				</td>
			</tr>			
<%
	}
%>
		</table>	
	</form>
<%
	}
}
%>	
 </div>
		 <!-- End Right Column -->
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>