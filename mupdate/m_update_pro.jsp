<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="m" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="m" property="*"/>

<%
	String m_id = request.getParameter("m_id");
	System.out.println(m_id+" <-- m_id update_pro.jsp");
	
	Mdao mdao = new Mdao();
	mdao.mUpdate(m);
	
	if(mdao != null){
		response.sendRedirect("../mlist/m_list.jsp");
	}
%>