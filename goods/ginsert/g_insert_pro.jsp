<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Gdao" %>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="g" class="kr.or.ksmart.dto.Goods"/>
<jsp:setProperty name="g" property="*"/>

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
		 
	    상품등록완료	<br><br>
<%
	Gdao gdao = new Gdao();
	gdao.gInsert(g);

	response.sendRedirect(request.getContextPath()+"/goods/glist/g_list.jsp");
%>
		 </div>
		 <!-- End Right Column -->
		 
<%@ include file="/module/hadan.jsp" %>
</body>
</html>