<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id + "<-- id");
	System.out.println(pw + "<-- pw");
	
	Mdao mdao = new Mdao();
	String loginresult = mdao.mLoginCheck(id, pw);
	
	if(loginresult.equals("로그인성공")){
		Member sessionresult = mdao.mGetSession(id);
		request.getSession();
		session.setAttribute("S_NAME", sessionresult.getM_name());
		session.setAttribute("S_LEVEL", sessionresult.getM_level());
		session.setAttribute("SID", sessionresult.getM_id());
		
%>
		<script language="javascript">
			alert("로그인성공");
			location.href = "<%= request.getContextPath() %>/index.jsp";
		</script>
<%			
	}else{
%>
		<script language="javascript">
			alert("로그인을 다시 시도해주시기 바랍니다.");
			location.href = "<%= request.getContextPath() %>/index.jsp";
		</script>
<%
	}
%>
