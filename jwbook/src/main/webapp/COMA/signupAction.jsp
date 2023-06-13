<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userMail" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>회원가입 액션</title>
</head>
<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null){
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}	
		if(user.getUserID() == null || user.getUserPW() == null || user.getUserName() == null || user.getUserMail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않는 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			if (user.getUserID().length() < 6) {
			    PrintWriter script = response.getWriter();
			    script.println("<script>");
			    script.println("alert('아이디는 최소 6글자 이상이어야 합니다.')");
			    script.println("history.back()");
			    script.println("</script>");
			}
			String userPW = user.getUserPW();
			if (!userPW.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$")) {
			    PrintWriter script = response.getWriter();
			    script.println("<script>");
			    script.println("alert('비밀번호는 영문자, 숫자, 특수문자를 각각 하나 이상 포함하여 최소 8자 이상이어야 합니다.')");
			    script.println("history.back()");
			    script.println("</script>");
			}
			if (!user.getUserMail().matches("\\S+@\\S+\\.\\S+")) {
			    PrintWriter script = response.getWriter();
			    script.println("<script>");
			    script.println("alert('올바른 이메일 형식이 아닙니다.')");
			    script.println("history.back()");
			    script.println("</script>");
			}
			else {
			    UserDAO userDAO = new UserDAO();
			    int result = userDAO.signup(user);
			
			    if(result==-1){
			        PrintWriter script = response.getWriter();
			        script.println("<script>");
			        script.println("alert('이미 존재하는 아이디입니다.')");
			        script.println("history.back()");
			        script.println("</script>");
			    }
			    else{
			        PrintWriter script = response.getWriter();
			        script.println("<script>");
			        script.println("location.href='main.jsp'");
			        script.println("alert('회원가입에 성공했습니다.')");
			        script.println("</script>");
			    }
			}
		}
	
	%>

</body>

</html>