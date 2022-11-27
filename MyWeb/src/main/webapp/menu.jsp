<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/scripts.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
  <div class="container px-4 px-lg-5">
    <a class="navbar-brand" href="./main.jsp">책 방</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      메뉴
      <i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ms-auto py-4 py-lg-0">
        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" style="font-size: 13px" href="./mypage.jsp">마이페이지</a></li>
        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" style="font-size: 13px" href="./cart.jsp">장바구니</a></li>
        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" style="font-size: 13px" href="./addBook.jsp">판매하기</a></li>
        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" style="font-size: 13px" href="./logout.jsp">로그아웃</a></li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>