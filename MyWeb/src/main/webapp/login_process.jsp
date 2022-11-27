<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.UserRepository" %>
<%@ page import="dto.User" %>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");

	UserRepository userRepository=new UserRepository();//하나의 인스턴스
	int result = userRepository.login(id, pw);//페이지에 입력된 아이디와 비번을 login함수에 넣어줌
	if(result==1){
		String name = userRepository.geUserName(id);
		session.setAttribute("UserID", id);
		session.setAttribute("UserName", name);
		session.setMaxInactiveInterval(600);	//세션 유효시간 10분
		out.println("<script>alert('"+ session.getAttribute("UserName") +"님 환영합니다.');</script>");
		out.println("<script>location.href='main.jsp';</script>");
	}
	else if(result==0){
		out.println("<script>alert('비밀번호가 틀립니다.');</script>");
		out.println("<script>history.back()</script>");
	}
	else if(result==-1){
		out.println("<script>alert('존재하지 않는 아이디입니다.');</script>");
		out.println("<script>history.back()</script>");
	}
	else if(result==-2){
		out.println("<script>alert('db_error');</script>");
		out.println("<script>history.back()</script>");
	}
%>


