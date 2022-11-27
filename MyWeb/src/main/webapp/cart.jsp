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
    <title>장바구니</title>
    <!-- Bootstrap core CSS -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
  </head>
<%
	String cartId = session.getId();
%>
  <body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron main_container_image" id="main_book">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a><td>
					<td align="right"><a href="#" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top:50px">
			<table class="table table-hover">
				<tr>
					<th>도서명</th>
					<th>지은이</th>
					<th>출판사</th>
					<th>판매자</th>
					<th>가격</th>
				</tr>
				<%
					ArrayList<Book> cartlist = (ArrayList<Book>) session.getAttribute("cartlist");
					int sum = 0;
					if(cartlist==null)
						cartlist = new ArrayList<Book>();
					for(int i=0; i<cartlist.size(); i++){
						Book book = cartlist.get(i);
						sum = sum + Integer.parseInt(book.getPrice());
				%>
				<tr>
					<td><%=book.getName() %></td>
					<td><%=book.getAuthor() %></td>
					<td><%=book.getPublisher() %></td>
					<td><%=book.getSeller() %></td>
					<td><%=book.getPrice() %>&nbsp;<a href="./removeCart.jsp?id=<%=book.getId() %>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum %></th>
				</tr>
			</table>
		</div>
		<hr>
	</div>
    <jsp:include page="footer.jsp"/>
  </body>
</html>
