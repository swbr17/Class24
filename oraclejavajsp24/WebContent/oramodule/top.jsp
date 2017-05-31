<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

   <!-- Begin Wrapper -->
   <div id="wrapper">
   
         <!-- Begin Header -->
         <div id="header">

<%
	String SNAME = (String)session.getAttribute("SNAME");
	String SLEVEL = (String)session.getAttribute("SLEVEL");
	System.out.println(SNAME + "<-- SNAME top.jsp");
	System.out.println(SLEVEL + "<-- SLEVEL top.jsp");
	
	if(SLEVEL == null){
%>
		로그인전 메뉴<br>
<a href="<%= request.getContextPath() %>/oraminsert/ora_m_insert_form.jsp">01회원가입</a><br>
		
	<form action="<%= request.getContextPath() %>/oralogin/ora_login_pro.jsp" method="post">
		아이디 : <input type="text" name="id">
		비번 :  <input type="password" name="pw">
		<input type="submit" value="로그인버튼">
	</form>
	
<%		
	}else{
		if(SLEVEL.equals("관리자")){
%>			
		관리자 메뉴	<br>
	<a href="<%= request.getContextPath() %>/oraminsert/ora_m_insert_form.jsp">01회원가입</a>
	<a href="<%= request.getContextPath() %>/oramlist/ora_m_list.jsp">02회원리스트</a>
	<a href="<%= request.getContextPath() %>/oragoods/ora_goods_insert_form.jsp">03상품등록</a>
	<a href="<%= request.getContextPath() %>/oragoods/ora_goods_list01.jsp">04상품리스트</a>		
<%			
		}else if(SLEVEL.equals("판매자")){
%>			
		판매자 메뉴<br>
	<a href="<%= request.getContextPath() %>/oraminsert/ora_m_insert_form.jsp">01회원가입</a>
	<a href="<%= request.getContextPath() %>/oragoods/ora_goods_insert_form.jsp">03상품등록</a>
	<a href="<%= request.getContextPath() %>/oragoods/ora_goods_list01.jsp">04상품리스트</a>		
<%			
		}else if(SLEVEL.equals("구매자")){
%>			
		구매자 메뉴	<br>
	<a href="<%= request.getContextPath() %>/oraminsert/ora_m_insert_form.jsp">01회원가입</a>
	<a href="<%= request.getContextPath() %>/oragoods/ora_goods_list01.jsp">04상품리스트</a>		
<%			
		}
%>		
<br><br>
		<%= SNAME %> 님 <%= SLEVEL %> 권한 로그인중
		<a href="<%= request.getContextPath() %>/oralogin/ora_logout.jsp">
		로그아웃
		</a>
<%		
	}
%>

  
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		       		 
			   
		 </div>
		 <!-- End Header -->