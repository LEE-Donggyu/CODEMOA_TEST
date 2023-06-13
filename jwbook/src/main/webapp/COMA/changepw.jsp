<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/COMA.css">
<link rel="stylesheet" href="css/myprofile.css">
<title>내 정보</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<%
		String userID = (String) session.getAttribute("userID");
		UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserByID(userID);
		if (user != null) {
	%>
	
	<div id = "login_section">
		  <section class = "login-form">

		    <h1 id="login_title">비밀번호 변경</h1>
		
		    <form method="post" action="changepwAction.jsp">
		    
		      <!-- 아이디 공간 -->
				<div class="int-area">
				  <input type="text" name="userID" id="id" autocomplete="off" maxlength="20" required readonly value="<%= user.getUserID() %>">
				  <label for="id" class="input-label">아이디</label>
				</div>
	<% }
		
		%>
		 
		      <!-- 비밀번호 공간 -->
		      <div class="int-area">
		        <input type="password" name="userPW" id="pw" autocomplete="off" maxlength="20" required>
		        <label for="pw">현재 비밀번호</label>
		      </div>
		      
		      <div class="int-area">
		        <input type="password" name="newpw" id="newpw" autocomplete="off" maxlength="20" required>
		        <label for="newpw">새 비밀번호</label>
		      </div>
		      
		      <div class="int-area">
		        <input type="password" name="newpwcheck" id="newpwcheck" autocomplete="off" maxlength="20" required>
		        <label for="newpwcheck">새 비밀번호 확인</label>
		      </div>
		      		
		      <!-- 로그인 버튼 공간 -->
		      <div class="btn-area">
		        <button type="submit" href=changepwAction.jsp>변경</button>
		      </div>
		      
		    </form>
		
		  </section>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
