<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Startup consulting login</title>
</head>
<body>
	<div>
		<h1>Startup Consulting Login</h1>
	</div>
	<div>
		<form action="<%= request.getContextPath() %>/Login/Login_pro.jsp" method="post">
			<table>
				<tr>
					<td>
						투자자<input type="radio" name="level" value="investor">발행인<input type="radio" name="level" value="company">
					</td>
				</tr>
				<tr>
					<td>ID<input type="text" name="id"></td>
				</tr>
				<tr>
					<td>Password<input type="password" name = "pw"></td>
				</tr>	
			</table>
			<input type="submit" value="Login"?id=<%= "id" %>&pw=<%= "pw" %>&level=<%= "level" %>><br><br>
			<a href="<%= request.getContextPath() %>/Login/i_insert_form.jsp">회원가입</a>
			<a href="<%= request.getContextPath() %>/Login/FindIDPWForm.jsp">ID/PW찾기</a>
		</form>
	</div>
</body>
</html>