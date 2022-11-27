<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("./main.jsp");
		return;
	}
	
	BookRepository dao = new BookRepository();
	Book book = dao.getBookById(id);
	if(book == null){
		response.sendRedirect("./exceptionNoBookId.jsp");
	}
	
	if(id.substring(14).equals(session.getAttribute("UserID"))){
		out.println("<script>alert('본인이 판매중인 책을 장바구니에 담을 수 없습니다.');</script>");
		out.println("<script>history.back()</script>");
		return;
	}
	
	ArrayList<Book> blist = (ArrayList<Book>) session.getAttribute("cartlist");
	if(blist == null){
		blist = new ArrayList<Book>();
		session.setAttribute("cartlist", blist);
	}
	
	Book nbook = new Book();
	for(int i=0; i<blist.size(); i++){
		nbook = blist.get(i);
		if(nbook.getId().equals(id)){
			out.println("<script>alert('이미 장바구니에 담긴 책입니다.');</script>");
			out.println("<script>history.back()</script>");
			return;
		}
	}
	blist.add(book);
	out.print(session.getAttribute("cartlist"));
	response.sendRedirect("./main.jsp");
%>