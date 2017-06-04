<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Gdao" %>

<% 
	String g_code = request.getParameter("gcode");
	System.out.println(g_code + "<-- g_code g_delete_pro.jsp");
	
	Gdao gdao = new Gdao();
	gdao.gDelete(g_code);
	
	response.sendRedirect(request.getContextPath()+ "/goods/glist/g_list.jsp");
%>