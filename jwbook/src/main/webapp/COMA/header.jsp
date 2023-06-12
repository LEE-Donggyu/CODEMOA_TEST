<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<link rel="stylesheet" href="css/header.css">

<%
    String userID = null;
    if(session.getAttribute("userID") != null){
        userID = (String) session.getAttribute("userID");
    }
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserByID(userID);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	
	<div id="header_div">
	
	    <h1 id="COMA"><a id="move_main" href="main.jsp">COMA</a></h1>
	
	    <% if (userID == null) { %>
	        <a id="move_login" href="login.jsp">로그인</a>
	    <% } else { %>
	        <a id="move_profile" href="myProfile2.jsp">내 정보</a>
	    <% } %>
	
	</div>

</body>
</html>