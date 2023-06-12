<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>비밀번호 변경</title>
</head>
<body>

	<%
		 String userID = (String) session.getAttribute("userID");
		 String currentPW = request.getParameter("userPW");
		 String newPW = request.getParameter("newpw");
		 String newPWCheck = request.getParameter("newpwcheck");
		
		 // 비밀번호 변경 로직 구현
		
		 if (currentPW == null || newPW == null || newPWCheck == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않는 사항이 있습니다.');");
				script.println("history.back();");
				script.println("</script>");
			}
		 else{
			 UserDAO userDAO = new UserDAO();
			 int result = userDAO.changePassword(userID, currentPW, newPW, newPWCheck);
			 if(result == -3){
					PrintWriter script = response.getWriter();
				    script.println("<script>");
				    script.println("alert('새로운 비밀번호는 영문자, 숫자, 특수문자를 각각 하나 이상 포함하여 최소 8자 이상이어야 합니다.')");
				    script.println("history.back()");
				    script.println("</script>");
			 }
			 if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 존재하지 않거나 세션이 완료되었습니다. 다시 시도해주세요.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			 }
			 if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호 변경에 성공했습니다. 개인정보창으로 넘어갑니다.')");
				script.println("location.href='myProfile2.jsp'");
				script.println("</script>");
			 }
			 if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다. 다시 시도해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			 }
			 if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('현재 비밀번호가 일치하지 않습니다. 다시 시도해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			 }
		 }
	%>
</body>

</html>