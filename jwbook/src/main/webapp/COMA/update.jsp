<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="write.Write" %>
<%@ page import="write.WriteDAO" %>
<%@ page import="write.Lang" %>
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
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
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
		if (!userID.equals(viewPost.getAuthor())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
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
		</div>
	</nav>
	<h2 style="text-align: center;"> 게시글 수정 </h2>
	<div class="container">
		<form action="updateAction.jsp?id=<%= id %>" method="post">
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" class="form-control" id="title" name="title" value="<%= viewPost.getTitle() %>">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" rows="3"><%= viewPost.getContent() %></textarea>
			</div>
			<div class="form-group">
    			<label for="language">언어</label>
    			<select class="form-control" id="language" name="lang">
        		<%
            		for (Lang lang : Lang.values()) {
        		%>
            	<option value="<%= lang.getLanguage() %>"><%= lang.name() %></option>
        		<%
            		}
        		%>
    			</select>
			</div>
			<div class="form-group">
				<label for="content">코드작성</label>
				<textarea class="form-control" id="codeContent" name="codeContent" rows="3"><%=viewPost.getCodeContent() %></textarea>
			</div>
			<button type="submit" class="btn btn-primary">작성</button>
		</form>
	
	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>