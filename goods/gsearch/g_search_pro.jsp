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
		 
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "kr.or.ksmart.dao.Gdao" %>
<%@ page import = "kr.or.ksmart.dto.Goods" %>
<%@ page import = "java.util.ArrayList" %>

<%= request.getRequestURI() %> <br>
��ǰ�˻����<br>
	<form action="<%= request.getContextPath() %>/goods/glist/g_list.jsp">
	<input type="submit" value="��ü ��ǰ����Ʈ ���ư���"><br>
		<table width="100%" border="1">
			<tr>
				<td>��ǰ�ڵ�</td><td>���̵�</td><td>��ǰ��</td><td>ī�װ�</td><td>����</td><td>����</td><td>ũ��</td><td>��¥</td><td>������</td><td>����</td><td>����</td>
			</tr>
<%
	String search = request.getParameter("search");
	String searchprostartdate = request.getParameter("startdate");
	String searchproenddate = request.getParameter("enddate");
	int searchprostartprice = Integer.parseInt(request.getParameter("startprice"));
	int searchproendprice = Integer.parseInt(request.getParameter("endprice"));
	System.out.println(search+"<-- search g_search_pro.jsp");
	System.out.println(searchprostartdate+"<-- startdate");
	System.out.println(searchproenddate+"<-- enddate");
	System.out.println(searchprostartprice+"<-- startprice");
	System.out.println(searchproendprice+"<-- endprice");
	
	String dbgcode = null;
	String dbid = null;
	String dbgname = null;
	String dbcate = null;
	String dbprice = null;
	String dbcolor = null;
	String dbsize = null;
	String dbdate = null;
	String dbdetail = null;
	
	Gdao gdao = new Gdao();
	ArrayList<Goods> searchresult = gdao.gSearchSelect(search);
	
	for(int i = 0; i<searchresult.size(); i++){
		Goods g = searchresult.get(i);
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
	ArrayList<Goods> searchresult2 = gdao.gDateSearch(searchprostartdate, searchproenddate);
	for(int i = 0; i<searchresult2.size(); i++){
		Goods g = searchresult2.get(i);
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
	ArrayList<Goods> searchresult3 = gdao.gPriceSearch(searchprostartprice, searchproendprice);
	for(int i = 0; i<searchresult3.size(); i++){
		Goods g = searchresult3.get(i);
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
 </div>
		 <!-- End Right Column -->
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>