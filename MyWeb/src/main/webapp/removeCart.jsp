<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.BookRepository"%>

<%
String id = request.getParameter("id");
if(id == null || id.trim().equals("")){
	response.sendRedirect("./main.jsp");
	return;
}

BookRepository dao = new BookRepository();

Book book = dao.getBookById(id);
if(book==null){
	response.sendRedirect("./exceptionNoBookId.jsp");
}

ArrayList<Book> cartlist = (ArrayList<Book>) session.getAttribute("cartlist");
Book b = new Book();
for(int i=0; i<cartlist.size(); i++){
	b = cartlist.get(i);
	if(b.getId().equals(id)){
		cartlist.remove(b);
	}
}

response.sendRedirect("./cart.jsp");
%>
