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
	
	<div id="login_section">
		<section class="login-form">
			<h1 id="login_title">나의 정보</h1>
			
			<div id="myprofile">
				<table>
					<%
						String userID = (String) session.getAttribute("userID");
						UserDAO userDAO = new UserDAO();
						User user = userDAO.getUserByID(userID);

						if (user != null) {
					%>
					<div class="int-area">
					  <input type="text" name="userID" id="id" autocomplete="off" maxlength="20" required readonly value="<%= user.getUserID() %>">
					  <label for="id" class="input-label">아이디</label>
					</div>
					
					<div class="int-area">
					<input type="password" name="userPW" id="pw" autocomplete="off" maxlength="20" required readonly value="<%= user.getUserPW() %>">
					  <label for="pw" class="input-label">비밀번호</label>
					</div>
					
					<div class="int-area">
					  <input type="text" name="userName" id="name" autocomplete="off" maxlength="20" require dreadonly value="<%= user.getUserName() %>">
					  <label for="id" class="input-label">이름</label>
					</div>
					
					<div class="int-area">
					<input type="text" name="userMail" id="email" autocomplete="off" maxlength="20" required readonly value="<%= user.getUserMail() %>">
					  <label for="id" class="input-label">이메일</label>
					</div>
					<%
						}
					%>
				</table>
			</div>
		    
			<div class="caption">
				<a href="changepw.jsp">비밀번호 변경</a>
			</div>
			
			<div class="caption">
				<a href="logoutAction.jsp">로그아웃</a>
			</div>
		
		</section>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
