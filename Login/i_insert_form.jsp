<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%= request.getRequestURI() %> <br>
<html>
<head>
		<title>ȸ������ ȭ��</title>

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
	
		// ȸ������ ȭ���� �Է°����� �˻��Ѵ�.
		function checkValue()
		{
			var form = document.userInfo;
		
			if(!form.id.value){
				alert("���̵� �Է��ϼ���.");
				return false;
			}
			
			if(form.idDuplication.value != "idCheck"){
				alert("���̵� �ߺ�üũ�� ���ּ���.");
				return false;
			}
			
			if(!form.pw.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			
			// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
			if(form.pw.value != form.pwcheck.value ){
				alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
				return false;
			}	
			
			if(!form.name.value){
				alert("�̸��� �Է��ϼ���.");
				return false;
			}
			
			if(!form.level.value){
				alert("������ üũ�ϼ���.");
				return false;
			}

			if(!form.email1.value){
				alert("���� �ּҸ� �Է��ϼ���.");
				return false;
			}
			
			if(!form.birth.value){
				alert("������ �Է��ϼ���.");
				return false;
			}
			
			if(!form.field.value){
				alert("���ɺо�(����о�)�� �Է��ϼ���.");
				return false;
			}
			
			if(!form.phone.value){
				alert("��ȭ��ȣ�� �Է��ϼ���.");
				return false;
			}
			
			if(isNaN(form.phone.value)){
				alert("��ȭ��ȣ�� - ������ ���ڸ� �Է����ּ���.");
				return false;
			}
			
			if(!form.address.value){
				alert("�ּҸ� �Է��ϼ���.");
				return false;
			}
		}
		
		// ��� ��ư Ŭ���� ùȭ������ �̵�
		function goFirstForm() {
			location.href="./startupproject/startupmain_0501.jsp";
		}	
		
		// ���̵� �ߺ�üũ ȭ��open
		function openIdChk(){
		
			window.name = "parentForm";
			window.open("./IdCheckForm.jsp",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
		}

		// ���̵� �Է�â�� �� �Է½� hidden�� idUncheck�� �����Ѵ�.
		// �̷��� �ϴ� ������ �ߺ�üũ �� �ٽ� ���̵� â�� ���ο� ���̵� �Է����� ��
		// �ٽ� �ߺ�üũ�� �ϵ��� �Ѵ�.
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
		<td id="title">���̵�</td>
		<td>
			<input type="text" name="id" maxlength="50" onkeydown="inputIdChk()">
			<input type="button" value="�ߺ�Ȯ��" onclick="openIdChk()">	
			<input type="hidden" name="idDuplication" value="idUncheck" >
		</td>
	</tr>
	<tr>
		<td id="title">��й�ȣ</td>
		<td><input type="text" name="pw" size="20"></td>
	<tr>
	<tr>
		<td id="title">��й�ȣ Ȯ��</td>
		<td><input type="text" name="pwcheck" size="20"></td>
	<tr>
	<tr>
		<td id="title">����</td>
		<td>������<input type="radio" value="investor" name="level" size="20">������<input type="radio" value="company" name="level" size="20"></td>
	<tr>
	<tr>
		<td id="title">�̸�</td>
		<td><input type="text" name="name" size="20"></td>
	<tr>
	<tr>
		<td id="title">��ȭ��ȣ(-���� �Է�)</td>
		<td><input type="phone" name="phone" size="20"></td>
	<tr>
	<tr>
		<td id="title">�������</td>
		<td><input type="date" name="birth" size="30"></td>
	<tr>
	<tr>
		<td id="title">�ּ�</td>
		<td><input type="text" name="address" size="50"></td>
	<tr>
	<tr>
		<td id="title">�̸���</td>
		<td>
			<input type="email" name="email1" size="30">
			<select name="email2">
				<option type="text">�����Է�</option>
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
				<option>nate.com</option>						
			</select>
		</td>
	<tr>
	<tr>
		<td id="title">���ɺо�(����о�)</td>
		<td><input type="text" name="field" size="100"></td>
	<tr>
	</table>
		<input type="submit" value="����"/>  
		<input type="button" value="���" onclick="goFirstForm()">
	</form>
	</center>
</body>
</html>