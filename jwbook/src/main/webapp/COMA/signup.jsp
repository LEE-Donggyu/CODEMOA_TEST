<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<link rel="stylesheet" href="css/COMA.css">
<link rel="stylesheet" href="css/signup.css">
<title>COMA</title>
</head>
<body>
	<div id = "login_section">
		  <section class = "login-form">

		    <h1 id="login_title">COMA</h1>
		
		    <form method="post" action="signupAction.jsp">
		
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
		        <button type="submit" href="signupAction.jsp">회원가입</button>
		      </div>
		      
		    </form>
		
		  </section>
	</div>
<!-- 	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">글쓰기</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="signup.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px">
				<form method="post" action="signupAction.jsp">
					<h3 style="text-align:center">회원가입 화면</h3>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userMail" maxlength="20">
					</div>
					
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
		</div>
		<div class="col-lg-4"></div>
	</div> -->
	
	
	
	
<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script> -->
</body>
</html>