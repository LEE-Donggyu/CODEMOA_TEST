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
<link rel="stylesheet" href="css/COMA.css">
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<style>
.main_title{
	text-align: center;
}

.container {
    width: 800px;
    margin: 0 auto;
}

.list_start {
    text-align: center;
    width: 800px;
}

.list_detail {
    display: inline-block;
    width: 220px;
    height: 260px;
	border: 1px solid;
	margin-top: 20px;
    margin-bottom: 20px;
    margin-left: 5px;
    margin-right: 5px;
}

.list_detail .title {
	margin-bottom : 10px;
	text-align: center;
	text-decoration:none;
	color: black;
}

.paging_start{
	text-align: center;
}
.writebtn{
	text-align: right;
}
  </style>
<title>로그인 화면</title>
</head>
<body>

	
<!-- <header>
	<h1 style="cursor: pointer;" onclick="window.location.href='main.jsp'">COMA</h1>
	
	<a id="move_login" href="login.jsp">로그인</a>

	<div class="dropdown">
		<button class="dropdown-btn">로그인기능</button>
		<div class="dropdown-menu">
			<a href="#none">로그인</a>
			<a href="#none">회원가입</a>
		</div>
	</div>

</header> -->

	<jsp:include page="header.jsp"></jsp:include>


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

	<div class="container">
		<!-- 상단 제목 -->
		<div class="main_title">
			<p>코드모아</p>
			<a href="write.jsp" class="writebtn">글쓰기</a>
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
							<div class="title">
							<a href="view.jsp?id=<%= list.get(i).getId()%>"><%= list.get(i).getTitle() %></a>
							</div>
							<div class="content"><%= list.get(i).getContent() %></div>
						
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
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>