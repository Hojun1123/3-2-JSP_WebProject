<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.BookRepository" %>
<%@ page import="dao.BookPageRepository" %>
<%@ page import="dto.Book" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");	

	String filename = "";
	String realFolder = "C:\\Users\\kkkhh\\OneDrive\\바탕 화면\\경기대3-2\\월678_지능웹설계_정경용\\eclipse\\MyWeb\\src\\main\\webapp\\resources\\image";
	int maxSize = 5 * 1024 * 1024 * 10; //50mb
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String id = multi.getParameter("id");
	String name = multi.getParameter("name");
	String author = multi.getParameter("author");
	String price = multi.getParameter("price");
	String description = multi.getParameter("description");
	String publisher = multi.getParameter("publisher");
	String releasedate = multi.getParameter("releaseDate");
	String condition = multi.getParameter("condition");
	if(condition==null){
		condition = "middle";
	}
	String seller = (String) session.getAttribute("UserID");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	if(fileName==null){
		fileName = "empty_image.png";
	}
	
	BookRepository bookRepository = new BookRepository();
	BookPageRepository bookPageRepository = new BookPageRepository();
	Book book = new Book();
	book.setId(id+"_"+seller);
	book.setName(name);
	book.setPrice(price);
	book.setAuthor(author);
	book.setDescription(description);
	book.setPublisher(publisher);
	book.setReleaseDate(releasedate);
	book.setCondition(condition);
	book.setFilename(fileName);
	book.setSeller(seller);
	
	int result = bookRepository.addBook(book);
	
	while(files.hasMoreElements()){
		fname = (String) files.nextElement();
		fileName = multi.getFilesystemName(fname);
		//만약 -1(실패)가 반환될경우 result는 음수값
		result += bookPageRepository.addBookPage(id+"_"+seller, fileName);
	}
	
	if(result==0){
		out.println("<script>alert('게시글이 등록되었습니다.');</script>");
		out.println("<script>location.href='main.jsp';</script>");
	}
	else {
		out.println("<script>alert('게시글 등록 에러');</script>");
		out.println("<script>history.back()</script>");
	}
	
%>
    