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

<%= request.getRequestURI() %> <br>

<%
	String g_code = request.getParameter("gcode");
	System.out.println(g_code + "<-- g_code g_update_form.jsp");
	
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
	Goods result = gdao.gSelectforUpdate(g_code);
	dbgcode = result.getG_code();
	dbid = result.getM_id();
	dbgname = result.getG_name();
	dbcate = result.getG_cate();
	dbprice = result.getG_price();
	dbcolor = result.getG_color();
	dbsize = result.getG_size();
	dbdate = result.getG_date();
	dbdetail = result.getG_detail();
	
%>
		<form action="<%= request.getContextPath() %>/goods/gupdate/g_update_pro.jsp" method="post">
			<table border="1">
			<tr>
				<td>상품코드</td>
				<td><input type="text" name="g_code" size="20" value="<%= dbgcode %>" readonly></td>
			<tr>
			<tr>
				<td>판매자아이디</td>
				<td><input type="text" name="m_id" size="20" value="<%= dbid %>"></td>
			<tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="g_name" size="20" value="<%= dbgname %>"></td>
			<tr>
			<tr>
				<td>상품카테고리</td>
				<td><input type="text" name="g_cate" size="20" value="<%= dbcate %>"></td>
			<tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="g_price" size="20" value="<%= dbprice %>"></td>
			<tr>
			<tr>
				<td>상품색상</td>
				<td><input type="text" name="g_color" size="20" value="<%= dbcolor %>"></td>
			<tr>
			<tr>
				<td>상품크기</td>
				<td><input type="text" name="g_size" size="20" value="<%= dbsize %>"></td>
			<tr>
			<tr>
				<td>상품날짜</td>
				<td><input type="text" name="g_date" size="20" value="<%= dbdate %>"></td>
			<tr>
			<tr>
				<td>상품상세정보</td>
				<td><input type="text" name="g_detail" size="20" value="<%= dbdetail %>"></td>
			<tr>
			<tr>
				<td colspan="4"><input type="submit" value="상품수정버튼"></td>
			</tr>
			</table>
		</form>
		
		
 </div>
		 <!-- End Right Column -->
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>
		