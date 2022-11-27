<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="dao.BookPageRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="./exceptionNoBookId.jsp" %>
<% 
	if(session.getAttribute("UserID") == null) {
		out.println("<script>alert('로그인 후 이용해주시길 바랍니다.')</script>");
		out.println("<script>location.href='login.jsp';</script>");	
	}  
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/book.css">
<script type="text/javascript" src="./resources/js/book.js"></script>

<script type="text/javascript">
var imageList = ["book_1.png"];
var numberOfPages;
</script>
<%
	String bid = request.getParameter("id");
	Book book = new Book();
	BookRepository bookRepository = new BookRepository();
	book = bookRepository.getBookById(bid);
	String condition = book.getCondition();
	if(condition.equals("best"))
		condition = "최상";
	else if(condition.equals("top"))
		condition = "상";
	else if(condition.equals("middle"))
		condition = "중";
	else
		condition = "하";

	BookPageRepository bookPageRepository = new BookPageRepository();
  	ArrayList<String> flist = new ArrayList<String>();
  	flist = bookPageRepository.getList(bid);
  	String temp;
  	int i;
  	for(i=0; i<flist.size(); i++) {
  		temp = flist.get(i);
%>
<script>imageList.push("<%=temp%>");</script>
<%
	}
%>

<meta name="viewport" content="width=device-width,initial-scale=1">
<div class="container">
<p style="text-align:center;"> <b>도서 미리보기 페이지입니다.</b>
<div id="book">
  <div class="cover">
  	<h3><%=book.getName() %></h3>
  	<p> &nbsp;&nbsp;&nbsp;&nbsp;<%=book.getAuthor() %>&nbsp;|&nbsp;<%=book.getPublisher() %>&nbsp;|&nbsp;<%=book.getReleaseDate() %>
  	<p>&nbsp;&nbsp;&nbsp;&nbsp;<div style="margin:20px"><font size="4" color="gray"> &nbsp;&nbsp;&nbsp;&nbsp;<%= book.getDescription() %></font></div>
  	<br/>
  	<p> &nbsp;&nbsp;&nbsp;&nbsp;▶ <%=book.getSeller() %>님이 판매중인 책입니다.
  	<p> &nbsp;&nbsp;&nbsp;&nbsp; 도서 상태 : <%=condition %>
  	<p> &nbsp;&nbsp;&nbsp;&nbsp; 판매 가격 : <%=book.getPrice() %>원
  </div>
</div>

<div id="controls">
  <label for="page-number">Page:</label> <input type="text" size="3" id="page-number"> of <span id="number-pages"></span>
</div>

<script>
numberOfPages = imageList.length;
  // Adds the pages that the book will need
  function addPage(page, book) {
    //  First check if the page is already in the book
    if (!book.turn('hasPage', page)) {
      // Create an element for this page
      var element = $('<div />', {'class': 'page '+((page%2==0) ? 'odd' : 'even'), 'id': 'page-'+page}).html('<i class="loader"></i>');
      // If not then add the page
      book.turn('addPage', element, page);
      // Let's assum that the data is comming from the server and the request takes 1s.
      setTimeout(function(){
    	  var sourceimg = imageList[page-1];
          element.html('<div class="data">'+'<img style="position: absolute; top:0; left: 0;width:100%;height:100%;" src="./resources/image/'+ imageList[page-1] +'"/>'+'</div>');
      }, 1000);
    }
  }

  $(window).ready(function(){
    $('#book').turn({acceleration: true,
              pages: numberOfPages,
              elevation: 50,
              gradients: !$.isTouch,
              when: {
                turning: function(e, page, view) {

                  // Gets the range of pages that the book needs right now
                  var range = $(this).turn('range', page);

                  // Check if each page is within the book
                  for (page = range[0]; page<=range[1]; page++) 
                    addPage(page, $(this));

                },

                turned: function(e, page) {
                  $('#page-number').val(page);
                }
              }
            });

    $('#number-pages').html(numberOfPages);

    $('#page-number').keydown(function(e){

      if (e.keyCode==13)
        $('#book').turn('page', $('#page-number').val());
        
    });
  });

  $(window).bind('keydown', function(e){

    if (e.target && e.target.tagName.toLowerCase()!='input')
      if (e.keyCode==37)
        $('#book').turn('previous');
      else if (e.keyCode==39)
        $('#book').turn('next');

  });

</script>
</div>