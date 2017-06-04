<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String SID = (String)session.getAttribute("SID");
	System.out.println(SID+" <-- SID");
%>	
	
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
		 
		 상품등록화면 <br><br>	 
		 
	         <form action="<%= request.getContextPath() %>/goods/ginsert/g_insert_pro.jsp" method="post">
	         	<input type="hidden" name="g_code">
	         	<input type="hidden" name="m_id" value="<%= SID %>">
	         	상품명 : <input type="text" name="g_name"><br>
	         	카테고리 : <input type="text" name="g_cate"><br>
	         	가격 : <input type="text" name="g_price"><br>
	         	색상 : <input type="text" name="g_color"><br>
	         	사이즈 : <input type="text" name="g_size"><br>
	         	상세설명 : <input type="text" name="g_detail"><br>
	         	
	         	<input type="submit" value="상품등록버튼">
	         </form>
		 </div>
		 <!-- End Right Column -->
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>