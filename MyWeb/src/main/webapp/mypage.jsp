<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.BookRepository" %>
<%@ page import="dto.Book" %>
<%@ page import="java.util.ArrayList" %>
<% 
	if(session.getAttribute("UserID") == null) {
		out.println("<script>alert('로그인 후 이용해주시길 바랍니다.')</script>");
		out.println("<script>location.href='login.jsp';</script>");	
	}  
%>
<html>
  <head>
    <title>마이페이지</title>
    <!-- Bootstrap core CSS -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
  </head>
  <body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron main_container_image" id="main_book">
		<div class="container">
			<h1 class="display-3">판매 중인 책 목록</h1>
		</div>
	</div>
	<div class="container">
		<div style="padding-top:50px">
			<table class="table table-hover">
				<tr>
					<th>도서명</th>
					<th>지은이</th>
					<th>출판사</th>
					<th>등록가격</th>
				</tr>
				<%
					String UserID = (String) session.getAttribute("UserID");
					BookRepository bookRepository = new BookRepository();          	
	          		ArrayList<Book> blist = bookRepository.getListByUserID(UserID);
	          		Book book = new Book();
	          		for(int i=0; i<blist.size(); i++){
	          			book = blist.get(i);
				%>
				<tr>
					<td><%=book.getName() %></td>
					<td><%=book.getAuthor() %></td>
					<td><%=book.getPublisher() %></td>
					<td><%=book.getPrice() %>&nbsp;<a href="./removeBook.jsp?id=<%=book.getId() %>" class="badge badge-danger">등록 취소</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<hr>
	</div>
    <jsp:include page="footer.jsp"/>
  </body>
</html>
