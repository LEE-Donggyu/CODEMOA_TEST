<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="write.Write" %>
<%@ page import="write.WriteDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인 화면</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int id = 0;
		if (request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		if (id == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		Write viewPost = new WriteDAO().getWrite(id);
	%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">코드모아</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="write.jsp">글쓰기</a></li>
			</ul>
			
			<%
				if(userID == null){
			%>		
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="signup.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
				else{
			%>
			 
			 <ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li><a href="myProfile.jsp">내 정보</a><li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			 
			<%		
				}
			 %>

		</div>
	</nav>
	<h2 style="text-align: center;"> 게시글 보기 </h2>
	<div class="container">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;"><%= viewPost.getTitle() %></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">작성자</td>
						<td colspan="2"><%= viewPost.getAuthor() %></td>
					</tr>
					<tr>
						<td style="width: 20%;">내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= viewPost.getContent() %></td>
					</tr>
					<tr>
						<td style="width: 20%;">코드</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= viewPost.getCodeContent() %></td>
					</tr>
				</tbody>
			</table>
			<a href="main.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID. equals (viewPost.getAuthor())) {
			%>
				<a href="update.jsp?id=<%= id %>" class="btn btn-primary">수정</a>
				<a href="deleteAction.jsp?bbsID=<%= id %>" class="btnbtn-primary">삭제</a>
			<%
				}
			%>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>