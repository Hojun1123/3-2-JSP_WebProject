<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.BookRepository" %>
<%@ page import="dto.Book" %>
<%
		

	String UserID = (String) session.getAttribute("UserID");
	if(UserID == null) {
		out.println("<script>alert('로그인 후 이용해주시길 바랍니다.')</script>");
		out.println("<script>location.href='login.jsp';</script>");	
		return;
	}
	String id = request.getParameter("id");
	BookRepository bookRepository = new BookRepository();
	Book book = new Book();
	book = bookRepository.getBookById(id);
	if(!book.getSeller().equals(UserID)){
		//사용자 본인만 삭제 가능
		out.println("<script>alert('권한이 없습니다.')</script>");
		out.println("<script>location.href='./login.jsp';</script>");
		return;
	}
	
	int result = bookRepository.deleteBook(id);
	if(result == 0){
		out.println("<script>alert('성공적으로 삭제했습니다.')</script>");
	}
	else{
		out.println("<script>alert('삭제 실패!')</script>");
	}
	response.sendRedirect("./mypage.jsp");
%>