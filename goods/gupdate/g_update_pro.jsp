<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Gdao" %>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="g" class="kr.or.ksmart.dto.Goods"/>
<jsp:setProperty name="g" property="*"/>

<%
	String gcode = request.getParameter("g_code");
	System.out.println(gcode + " <-- g_code g_update_pro.jsp");
	
	Gdao gdao = new Gdao();
	gdao.gUpdate(g);

	response.sendRedirect(request.getContextPath()+ "/goods/glist/g_list.jsp");
%>