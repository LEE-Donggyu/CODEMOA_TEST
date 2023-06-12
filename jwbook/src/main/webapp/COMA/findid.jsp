<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="css/COMA.css">
<link rel="stylesheet" href="css/signup.css">
</head>
<body>

	<div id = "login_section">
		  <section class = "login-form">

		    <h1 id="login_title">COMA</h1>
		
		    <form method="post" action="findidAction.jsp">
		      
		      <div class="int-area">
		        <input type="text" name="userName" id="name" autocomplete="off" maxlength="20" required>
		        <label for="name">이름</label>
		      </div>
		      
		      <div class="int-area">
		        <input type="text" name="userMail" id="email" autocomplete="off" maxlength="20" required>
		        <label for="email">이메일</label>
		      </div>
		      		
		      <!-- 로그인 버튼 공간 -->
		      <div class="btn-area">
		        <button type="submit" href="findidAction.jsp">찾기</button>
		      </div>
		      
		    </form>
		    
		  </section>
		  
	</div>

</body>
</html>