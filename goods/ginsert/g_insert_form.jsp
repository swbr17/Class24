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
		 
		 ��ǰ���ȭ�� <br><br>	 
		 
	         <form action="<%= request.getContextPath() %>/goods/ginsert/g_insert_pro.jsp" method="post">
	         	<input type="hidden" name="g_code">
	         	<input type="hidden" name="m_id" value="<%= SID %>">
	         	��ǰ�� : <input type="text" name="g_name"><br>
	         	ī�װ� : <input type="text" name="g_cate"><br>
	         	���� : <input type="text" name="g_price"><br>
	         	���� : <input type="text" name="g_color"><br>
	         	������ : <input type="text" name="g_size"><br>
	         	�󼼼��� : <input type="text" name="g_detail"><br>
	         	
	         	<input type="submit" value="��ǰ��Ϲ�ư">
	         </form>
		 </div>
		 <!-- End Right Column -->
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>