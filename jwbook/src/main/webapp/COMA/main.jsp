<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="write.WriteDAO" %>
<%@ page import="write.Write" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인 화면</title>
<style>
.main_title{
	text-align: center;
}

.container {
    width: 700px;
    margin: 0 auto;
}

.list_start {
    text-align: center;
}

.list_detail {
    display: inline-block;
    width: 220px;
    height: 260px;
	border: 1px solid;
    margin-bottom: 5px;
}

.paging_start{
	text-align: center;
}
  </style>
</head>
<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="write.jsp" class="btn btn-second">글쓰기</a></li>
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
	<div class="container">
		<!-- 상단 제목 -->
		<div class="main_title">
			<p>코드모아</p>
		</div>
		<!-- 리스트 -->
			<div class="list_start">
					<%
						WriteDAO writeDAO = new WriteDAO();
						ArrayList<Write> list = writeDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++){
					%>
					<tr>
						<div class="list_detail"><%= list.get(i).getId() %>
						<a href="view.jsp?id=<%= list.get(i).getId()%>"><%= list.get(i).getTitle() %></a>
						<%= list.get(i).getContent() %>
						</div>
					</tr>
					<%
						}
					%>
			</div>
			
			<%
				if(pageNumber != 1){
			%>
				<a href="main.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(writeDAO.nextPage(pageNumber + 1)){
			%>
				<a href="main.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-right">다음</a>
			<%
				}
			%>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>