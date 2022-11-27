<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.UserRepository" %>
<%@ page import="dto.User" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String spec = "Empty";
	String major =request.getParameter("major");
	String mail1 = request.getParameter("email1");
	String mail2 = request.getParameterValues("email2")[0];
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String description = "Empty";

	UserRepository userRepository=new UserRepository();
	User user = new User();
	
	user.setId(id);
	user.setPassword(password);
	user.setName(name);
	user.setSpec(spec);
	user.setMajor(major);
	user.setMail(mail);
	user.setPhone(phone);
	user.setDescription(description);
	
	int result = userRepository.register(user);
	
	if(result==0){
		out.println("<script>alert('회원가입을 축하합니다.');</script>");
		out.println("<script>location.href='login.jsp';</script>");
	}
	else if(result==-1){
		out.println("<script>alert('이미 존재하는 아이디입니다.');</script>");
		out.println("<script>history.back()</script>");
	}
	else if(result==-2){
		out.println("<script>alert('db_error');</script>");
		out.println("<script>history.back()</script>");
	}
	
%>