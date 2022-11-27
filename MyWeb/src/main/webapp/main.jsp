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
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>메인 페이지</title>
    <script type="text/javascript">
    	function addToCart(a){
    		if(confirm("책을 장바구니에 담으시겠습니까?")){
    			location.href='addCart.jsp?id='+String(a);
    		}
    	}
    </script>

    <!-- Bootstrap core CSS -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./resources/css/album.css" rel="stylesheet">
   	<style>
   	#main_book{
		background: url("resources/image/book_1.png");
		background-position: 70% 50%;
		background-repeat: no-repeat;
		background-size : contain;
	}
   	</style> 
   
  </head>

  <body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron main_container_image" id="main_book" style="background-color:#AEBDCA">
		<div class="container">
			<h1 class="display-3">책방</h1>
		</div>
	</div>

    <main role="main">

      <div class="album py-5" style="background-color:#F5EFE6">
        <div class="container">

          <div class="row">
          <%
          	BookRepository bookRepository = new BookRepository();          	
          	ArrayList<Book> listOfBooks = bookRepository.getList();
          	
          	for (int i=0; i<listOfBooks.size(); i++) {
          		Book book = listOfBooks.get(i);
          %>
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top" src="resources/image/<%=book.getFilename() %>" alt="Book Image">
                <div class="card-body">
                  <p class="card-text"><%=book.getName() %></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" onclick="location.href='./Book.jsp?id=<%=book.getId() %>'" class="btn btn-sm btn-outline-secondary">상세보기</button>
                      <button type="button" onclick="addToCart('<%=book.getId()%>')" class="btn btn-sm btn-outline-secondary">장바구니담기</button>
                    </div>
                    <small class="text-muted"><%= book.getPrice() %>&nbsp;원</small>
                  </div>
                </div>
              </div>
            </div>
          <% } %>
          </div>
        </div>
      </div>
    </main>
    <jsp:include page="footer.jsp"/>
  </body>
</html>
