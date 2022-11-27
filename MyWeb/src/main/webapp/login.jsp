<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>로그인</title>
</head>
<% 
	if(session.getAttribute("UserID") != null) {
		out.println("<script>location.href='main.jsp';</script>");	
	}  
%>

<body>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<form class="form-signin" action="login_process.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name='id' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name='password' required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
			<button class="btn btn btn-lg btn-success btn-block" style="background-color:#00A072;" onclick="location.href='./register.jsp'">회원가입</button>
		</div>
	</div>
	<br/>
</body>
</html>
