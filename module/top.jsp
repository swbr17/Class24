<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		 
<%
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	System.out.println(S_NAME + "<-- S_NAME top.jsp");
	System.out.println(S_LEVEL + "<-- S_LEVEL top.jsp");
%>

   <!-- Begin Wrapper -->
   <div id="wrapper">
   
<!-- Begin Header -->
         <div id="header">
<%
if(S_LEVEL == null){	
%>         
��ܸ޴� <br><br>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ�� ����</a>		     
<br><br>
<form action="<%= request.getContextPath() %>/Login/Login_pro4.jsp" method="post">
	���̵� : <input type="text" name="id">
	��� : <input type="password" name="pw">
	<input type="submit" value="�α���">
</form>
<%
}else{
	if(S_LEVEL.equals("������")){
%>	     
<a href="<%= request.getContextPath() %>/mlist/m_list.jsp">01 ȸ������</a>
<a href="<%= request.getContextPath() %>/goods/glist/g_list.jsp">02��ǰ�˻�</a>
<%
	}else if(S_LEVEL.equals("�Ǹ���")){
%>	     
<a href="<%= request.getContextPath() %>/mlist/m_list.jsp">01 ȸ������</a>
<a href="<%= request.getContextPath() %>/goods/ginsert/g_insert_form.jsp">02��ǰ ���</a>			
<a href="<%= request.getContextPath() %>/goods/glist/g_list.jsp">03��ǰ�˻�/����/����</a>
<%
	}else if(S_LEVEL.equals("������")){
%>	     
<a href="<%= request.getContextPath() %>/goods/ginsert/g_insert_form.jsp">01��ǰ���</a>
<a href="<%= request.getContextPath() %>/mlist/m_list.jsp">02 ��üȸ������Ʈ</a>
<a href="<%= request.getContextPath() %>/goods/glist/g_list.jsp">03��ǰ�˻� �� ����</a>
<%
	}
%>
<br><br>
<%= S_NAME %>�� <%= S_LEVEL %> ���� �α�����
<a href="<%= request.getContextPath() %>/Login/logout.jsp">�α׾ƿ�</a>
<%
} 
%>

	 </div>




