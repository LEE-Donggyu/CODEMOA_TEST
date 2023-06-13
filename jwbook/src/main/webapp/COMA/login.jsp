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

	<%-- <jsp:include page="header.jsp"></jsp:include> --%>

<!-- <a id="CodeMoa_button" href="main.jsp">코드모아</a>
	<nav class="navbar navbar-default">
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
				<li><a href="write.jsp">글쓰기</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="signup.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align:center">로그인 화면</h3>
					<div class="form-group">
						<b class="userGuide">아이디</b>
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<b class="userGuide">비밀번호</b>
						<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
		</div>
		<div class="col-lg-4"></div>
	</div>  -->
	
	
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