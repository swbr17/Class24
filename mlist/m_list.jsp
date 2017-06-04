<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import = "java.util.*" %>

<%= request.getRequestURI() %>

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
<%
	Mdao mdao = new Mdao();
	String id = (String)session.getAttribute("SID");
	
%>
	<select>
		<option name="searchoption" value="아이디">아이디</option>
		<option name="searchoption" value="이름">이름</option>
		<option name="searchoption" value="권한">권한</option>
		<option name="searchoption" value="이메일">이메일</option>
	</select>
	<form action="./m_searchpro.jsp" method="post">
		<input type="text" name="search">
		<input type="submit" name="submit" value="검색">
	</form>
	<table width="100%" border="1">	
		<tr>
			<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
		</tr>

<%
	if(S_LEVEL.equals("관리자")){
	ArrayList<Member> list = mdao.mAllSelect();
	if(list.isEmpty()){
		System.out.println(list.isEmpty()+" <-- list boolean");
		out.println("리스트 검색결과가 없습니다.");
	}else{
		System.out.println(list.isEmpty()+" <-- list boolean");			
		for(int i = 0; i < list.size() ; i++){
			Member m = list.get(i);
%>	
		
		<tr>
			<td><%= m.getM_id() %></td>
			<td><%= m.getM_pw() %></td>
			<td><%= m.getM_level() %></td>
			<td><%= m.getM_name() %></td>
			<td><%= m.getM_email() %></td>
			<td>
			<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?id=<%= m.getM_id() %>">
				수정하기
			</a>			
			</td>
			<td>
			<a href="<%= request.getContextPath() %>/mdelete/m_delete.jsp?id=<%= m.getM_id() %>">
				삭제하기
			</a>			
			</td>
		</tr>
		

<%		
		}
%>
	</table>
<%
	}
	} else {
		ArrayList<Member> resultlist = mdao.mAllSelectLevel(id);
		if(resultlist.isEmpty()){
			System.out.println(resultlist.isEmpty()+" <-- list boolean");
			out.println("리스트 검색결과가 없습니다.");
		} else{
		for(int i = 0; i<resultlist.size(); i++){
			Member m = resultlist.get(i);
%>
	<tr>
				<td><%= m.getM_id() %></td>
				<td><%= m.getM_pw() %></td>
				<td><%= m.getM_level() %></td>
				<td><%= m.getM_name() %></td>
				<td><%= m.getM_email() %></td>
				<td>
				<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?id=<%= m.getM_id() %>">
					수정하기
				</a>			
				</td>
				<td>
				<a href="<%= request.getContextPath() %>/mdelete/m_delete.jsp?id=<%= m.getM_id() %>">
					삭제하기
				</a>			
				</td>
			</tr>
		</table>
<%			
		}
	}
	}
%>

 </div>
		 <!-- End Right Column -->
<%@ include file="/module/hadan.jsp" %>		 
</body>
</html>
