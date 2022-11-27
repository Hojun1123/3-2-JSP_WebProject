<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function checkForm() {
		var regExpId = /^\d{9}$/;
		var regExpName = /^[가-힣]*$/;
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;

		var form = document.Member;

		var id = form.id.value;
		var name = form.name.value;
		var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;	

		if (!regExpId.test(id)) {
			alert("학번(숫자9자리)를 입력해 주세요!");
			form.id.select();
			return;
		}
		if (!document.Member.password.value) {
			alert("비밀번호를 입력하세요.");
			return;
		}
		if (document.Member.password.value != document.Member.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return;
		}
		if (!regExpName.test(name) || !name) {
			alert("이름은 한글만으로 입력해 주세요!");
			return;
		}
		if (!regExpPhone.test(phone)) {
			alert("연락처 입력을 확인해 주세요!");
			return;
		}
		if (!document.Member.major.value) {
			alert("전공을 입력하세요.");
			return;
		}
		if (!document.Member.email1.value || !document.Member.email2.value) {
			alert("이메일을 입력하세요.");
			return;
		}
		form.submit();
	}
</script>
<title>회원 가입</title>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>

	<div class="container">
		<div class="text-right">
			<a href="?language=ko" >한글</a>|<a href="?language=en">English</a>
		</div>
		<form name="Member" class="form-horizontal"  action="register_process.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 "><fmt:message key="id"/></label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="201810761" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2"><fmt:message key="pw"/></label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control" placeholder="password" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2"><fmt:message key="pw2"/></label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control" placeholder="confirm_password" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="홍길동" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2"><fmt:message key="major"/></label>
				<div class="col-sm-3">
					<input name="major" type="text" class="form-control" placeholder="컴퓨터공학부" >
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2"><fmt:message key="email"/></label>
				<div class="col-sm-10">
					<input type="text" name="email1" maxlength="32"> @
					<select name="email2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>kyonggi.ac.kr</option>
					</select>
				</div>				
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="phone"/></label>
				<div class="col-sm-10">
					<input maxlength="4" size="4" name="phone1" type="text" placeholder="010" > - 
					<input maxlength="4" size="4" name="phone2" type="text" placeholder="1234" > - 
					<input maxlength="4" size="4" name="phone3" type="text" placeholder="2345" >
				</div>	
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary " value="<fmt:message key='submit'/>" onclick="checkForm()"> 
					<input type="reset" class="btn btn-primary " value="<fmt:message key='reset'/>" onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
</body>
</html>