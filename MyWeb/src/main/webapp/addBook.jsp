<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dto.Book" %>
<% 
	if(session.getAttribute("UserID") == null) {
		out.println("<script>alert('로그인 후 이용해주시길 바랍니다.')</script>");
		out.println("<script>location.href='login.jsp';</script>");	
	}  
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<script language="javascript">
	var fcount = 0;
	
	function addInput(){
		if(fcount > 9)
			return;
		fcount += 1;
		var a = document.getElementById("dynamic_input_tag");
		a.innerHTML += '<input type="file" name="bookImage'+ fcount +'" class="form-control">';
	}
	
	function removeInput(){
		if(fcount < 1)
			return;
		var a = document.getElementsByName("bookImage"+fcount);
		a[0].remove();
		fcount -= 1;
	}
</script>
<meta charset="UTF-8">
<title>도서등록페이지</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">도서 등록</h1>
		</div>
	</div>
	<div class = "container">
	<form name="newBook" action="./addBook_process.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2">도서명</label>
			<div class="col-sm-3">
				<input type="text" id="name" name="name" class="form-control" placeholder="도서명">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">ISBN</label>
			<div class="col-sm-3">
				<input type="text" id="id" name="id" class="form-control" placeholder="ISBN 13자리를 입력해주세요.">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="col-sm-3">
				<input type="text" id="price" name="price" class="form-control" placeholder="ex)7000">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">지은이</label>
			<div class="col-sm-3">
				<input type="text" id="author" name="author" class="form-control" placeholder="지은이">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">출판사</label>
			<div class="col-sm-3">
				<input type="text" id="publisher" name="publisher" class="form-control" placeholder="출판사">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">출판일</label>
			<div class="col-sm-3">
				<input type="text" id="releaseDate" name="releaseDate" class="form-control" placeholder="2022-11-19">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">설명</label>
			<div class="col-sm-5">
				<textarea name="description" cols="50" rows="2" class="form-control" placeholder="판매하려는 책에 대해 설명해주세요."></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상태</label>
			<div class="col-sm-5">
				<input type="radio" name="condition" value="best">최상&nbsp;
				<input type="radio" name="condition" value="top">상&nbsp;
				<input type="radio" name="condition" value="middle" checked>중&nbsp;
				<input type="radio" name="condition" value="low">하
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">책 사진</label>
			<div class="col-sm-5">
				<input type="file" name="bookImage" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">책 상태 사진</label>
			<div id="dynamic_input_tag" class="col-sm-5">
				<input type="button" value="파일 추가" onclick="addInput();">
				<input type="button" value="파일 삭제" onclick="removeInput();">
				<span> 판매하실 책의 사진을 추가해보세요.!</span>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-primary" value='등록' onclick="CheckAddBook()">
			</div>
		</div>
	</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
