<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%= request.getRequestURI() %> <br>
<html>
<head>
		<title>회원가입 화면</title>

	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
	</style>

	<script type="text/javascript">
	
		// 회원가입 화면의 입력값들을 검사한다.
		function checkValue()
		{
			var form = document.userInfo;
		
			if(!form.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(form.idDuplication.value != "idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(!form.pw.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(form.pw.value != form.pwcheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}	
			
			if(!form.name.value){
				alert("이름을 입력하세요.");
				return false;
			}
			
			if(!form.level.value){
				alert("권한을 체크하세요.");
				return false;
			}

			if(!form.email1.value){
				alert("메일 주소를 입력하세요.");
				return false;
			}
			
			if(!form.birth.value){
				alert("생일을 입력하세요.");
				return false;
			}
			
			if(!form.field.value){
				alert("관심분야(사업분야)를 입력하세요.");
				return false;
			}
			
			if(!form.phone.value){
				alert("전화번호를 입력하세요.");
				return false;
			}
			
			if(isNaN(form.phone.value)){
				alert("전화번호는 - 제외한 숫자만 입력해주세요.");
				return false;
			}
			
			if(!form.address.value){
				alert("주소를 입력하세요.");
				return false;
			}
		}
		
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm() {
			location.href="./startupproject/startupmain_0501.jsp";
		}	
		
		// 아이디 중복체크 화면open
		function openIdChk(){
		
			window.name = "parentForm";
			window.open("./IdCheckForm.jsp",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
		}

		// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUncheck";
		}
		
	</script>
</head>

<body>
<br><br>
	<center>
	<form action="<%= request.getContextPath() %>/Insert/i_insert_pro.jsp" method="post" 
	name="userInfo" onsubmit="return checkValue()">
	
	<table border="1">
	
	<tr>
		<td id="title">아이디</td>
		<td>
			<input type="text" name="id" maxlength="50" onkeydown="inputIdChk()">
			<input type="button" value="중복확인" onclick="openIdChk()">	
			<input type="hidden" name="idDuplication" value="idUncheck" >
		</td>
	</tr>
	<tr>
		<td id="title">비밀번호</td>
		<td><input type="text" name="pw" size="20"></td>
	<tr>
	<tr>
		<td id="title">비밀번호 확인</td>
		<td><input type="text" name="pwcheck" size="20"></td>
	<tr>
	<tr>
		<td id="title">권한</td>
		<td>투자자<input type="radio" value="investor" name="level" size="20">발행인<input type="radio" value="company" name="level" size="20"></td>
	<tr>
	<tr>
		<td id="title">이름</td>
		<td><input type="text" name="name" size="20"></td>
	<tr>
	<tr>
		<td id="title">전화번호(-없이 입력)</td>
		<td><input type="phone" name="phone" size="20"></td>
	<tr>
	<tr>
		<td id="title">생년월일</td>
		<td><input type="date" name="birth" size="30"></td>
	<tr>
	<tr>
		<td id="title">주소</td>
		<td><input type="text" name="address" size="50"></td>
	<tr>
	<tr>
		<td id="title">이메일</td>
		<td>
			<input type="email" name="email1" size="30">
			<select name="email2">
				<option type="text">직접입력</option>
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
				<option>nate.com</option>						
			</select>
		</td>
	<tr>
	<tr>
		<td id="title">관심분야(사업분야)</td>
		<td><input type="text" name="field" size="100"></td>
	<tr>
	</table>
		<input type="submit" value="가입"/>  
		<input type="button" value="취소" onclick="goFirstForm()">
	</form>
	</center>
</body>
</html>