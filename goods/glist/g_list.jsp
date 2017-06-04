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

if(S_LEVEL.equals("관리자")){	
	Gdao gdao = new Gdao();
	ArrayList<Goods> listadmg = gdao.gAllSelectadm();

	
	if(listadmg.isEmpty()){
		System.out.println(listadmg.isEmpty()+" <-- list boolean");
		out.println("리스트 검색결과가 없습니다.");
	}else{
		System.out.println(listadmg.isEmpty()+" <-- list boolean");
%>		
		<form action="<%= request.getContextPath() %>/goods/gsearch/g_search_pro.jsp"?gcode=<%= dbgcode %>&mid=<%= dbid %>&gname=<%= dbgname %>&gcate=<%= dbcate %>&gdate=<%= dbdate %>&startdate=<%= "" %>&enddate=<%= "" %>&startprice=<%= "" %>&endprice=<%= "" %> method="post">
		<center>
		<select>
			  <option value="g_code">상품코드</option>
			  <option value="g_name">상품명</option>
			  <option value="m_id">판매자아이디</option>
			  <option value="g_cate">상품카테고리</option>
		</select>
		<input type="text" name="search" size="30"><br>
		기간별검색 :<input type="date" name="startdate" value="">~
		<input type="date" name="enddate" value=""><br>
		가격대별검색(~300만원) :<input type="number" name="startprice" min="0" max="3000000" value="0" step="1000">~
			<input type="number" name="endprice" min="0" max="3000000" value="0" step="1000">
			<input type="submit" name="searchpro" value="검색하기" ><br>
		</center>
	</form>
	<br>
		상품 리스트 <br>
		<form action="">
		<table width="100%" border="1">	
			<tr>
				<td>상품코드</td><td>아이디</td><td>상품명</td><td>카테고리</td><td>가격</td><td>색상</td><td>크기</td><td>날짜</td><td>상세정보</td><td>수정</td><td>삭제</td>
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
				<a href="<%= request.getContextPath() %>/goods/gupdate/g_update_form.jsp?gcode=<%= dbgcode %>">수정하기</a>
			</td>
			<td>
				<a href="<%= request.getContextPath() %>/goods/gdelete/g_delete_pro.jsp?gcode=<%= dbgcode %>">삭제하기</a>
			</td>
		</tr>			
<%		
		}
%>
	</table>	
	</form>	
<%
	}
}else if(S_LEVEL.equals("판매자")){
	Gdao gdao = new Gdao();
	ArrayList<Goods> listsellg = gdao.gAllSelectSell(SID);

	if(listsellg.isEmpty()){
		System.out.println(listsellg.isEmpty()+" <-- listsellg boolean");
		out.println("리스트 검색결과가 없습니다.");
	}else{
		System.out.println(listsellg.isEmpty()+" <-- listsellg boolean");	
%>		
	<form action="<%= request.getContextPath() %>/goods/gsearch/g_search_pro.jsp"?gcode=<%= dbgcode %>&mid=<%= dbid %>&gname=<%= dbgname %>&gcate=<%= dbcate %>&gdate=<%= dbdate %>&startdate=<%= "" %>&enddate=<%= "" %>&startprice=<%= "" %>&endprice=<%= "" %> method="post">
		<center>
		<select>
			  <option value="g_code">상품코드</option>
			  <option value="g_name">상품명</option>
			  <option value="m_id">판매자아이디</option>
			  <option value="g_cate">상품카테고리</option>
		</select>
		<input type="text" name="search" size="30"><br>
		기간별검색 :<input type="date" name="startdate" value="">~
		<input type="date" name="enddate" value=""><br>
		가격대별검색 :<input type="number" name="startprice" placeholder="0원부터입력" min="0" max="3000000" value="" step="1000">~
		<input type="number" name="endprice" placeholder="300만원까지입력" min="0" max="3000000" value="" step="1000">
			<input type="submit" name="searchpro" value="검색하기" ><br>
		</center>
	</form>
	<br>
		상품 리스트 <br>
		<form action="">
		<table width="100%" border="1">	
			<tr>
				<td>상품코드</td><td>아이디</td><td>상품명</td><td>카테고리</td><td>가격</td><td>색상</td><td>크기</td><td>날짜</td><td>상세정보</td><td>수정</td><td>삭제</td>
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
					<a href="<%= request.getContextPath() %>/goods/gupdate/g_update_form.jsp?gcode=<%= dbgcode %>">수정하기</a>
				</td>
				<td>
					<a href="<%= request.getContextPath() %>/goods/gdelete/g_delete_pro.jsp?gcode=<%= dbgcode %>">삭제하기</a>
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