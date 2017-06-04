<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<% request.setCharacterEncoding("euc-kr"); %>

<% 
	String m_id = request.getParameter("id");
	System.out.println(m_id + "<-- m_id delete.jsp");
	
	Mdao mdao = new Mdao();
	mdao.mDelete(m_id);
	
	response.sendRedirect("../mlist/m_list.jsp");
%>