<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<link rel="stylesheet" href="css/COMA.css">
<link rel="stylesheet" href="css/login.css">
<title>로그인 화면</title>
</head>
<body>
	
	
	<div id = login_section>
		  <section class = "login-form">

		    <h1 id="login_title">COMA</h1>
		
		    <form method="post" action="loginAction.jsp">
		
		      <!-- 아이디 공간 -->
		      <div class="int-area">
		        <input type="text" name="userID" id="id" autocomplete="off" maxlength="20" required>
		        <label for="id">아이디</label>
		      </div>
		 
		      <!-- 비밀번호 공간 -->
		      <div class="int-area">
		        <input type="password" name="userPW" id="pw" autocomplete="off" maxlength="20" required>
		        <label for="pw">비밀번호</label>
		      </div>
		
		      <!-- 로그인 버튼 공간 -->
		      <div class="btn-area">
		        <button type="submit" href="loginAction.jsp">로그인</button>
		      </div>
		
		    </form>
		    <!-- 회원가입, 아이디, 비밀번호 찾기 공간 -->
		    <div class="caption">
		      <a href="signup.jsp">회원가입</a>
		    </div>
		    
		    <div class="caption">
		      <a href="findid.jsp">아이디 찾기</a>
		    </div>
		    
		    <div class="caption">
		      <a href="findpw.jsp">비밀번호 찾기</a>
		    </div>
		
		  </section>
	</div>

	
	<jsp:include page="footer.jsp"></jsp:include>
<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script> -->
</body>
</html>