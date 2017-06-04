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
상단메뉴 <br><br>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원 가입</a>		     
<br><br>
<form action="<%= request.getContextPath() %>/Login/Login_pro4.jsp" method="post">
	아이디 : <input type="text" name="id">
	비번 : <input type="password" name="pw">
	<input type="submit" value="로그인">
</form>
<%
}else{
	if(S_LEVEL.equals("구매자")){
%>	     
<a href="<%= request.getContextPath() %>/mlist/m_list.jsp">01 회원정보</a>
<a href="<%= request.getContextPath() %>/goods/glist/g_list.jsp">02상품검색</a>
<%
	}else if(S_LEVEL.equals("판매자")){
%>	     
<a href="<%= request.getContextPath() %>/mlist/m_list.jsp">01 회원정보</a>
<a href="<%= request.getContextPath() %>/goods/ginsert/g_insert_form.jsp">02상품 등록</a>			
<a href="<%= request.getContextPath() %>/goods/glist/g_list.jsp">03상품검색/수정/삭제</a>
<%
	}else if(S_LEVEL.equals("관리자")){
%>	     
<a href="<%= request.getContextPath() %>/goods/ginsert/g_insert_form.jsp">01상품등록</a>
<a href="<%= request.getContextPath() %>/mlist/m_list.jsp">02 전체회원리스트</a>
<a href="<%= request.getContextPath() %>/goods/glist/g_list.jsp">03상품검색 및 수정</a>
<%
	}
%>
<br><br>
<%= S_NAME %>님 <%= S_LEVEL %> 권한 로그인중
<a href="<%= request.getContextPath() %>/Login/logout.jsp">로그아웃</a>
<%
} 
%>

	 </div>




