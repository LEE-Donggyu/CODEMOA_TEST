<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="write.Write" %>
<%@ page import="write.WriteDAO" %><%--데이터베이스 접근 객체 가져오기 --%>
<%@ page import="write.Comment" %>
<%@ page import="write.CommentDAO" %><%--데이터베이스 접근 객체 가져오기 --%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		int writeID=0;
		if(request.getParameter("writeID")!=null)
			writeID=Integer.parseInt(request.getParameter("writeID"));
		if(writeID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		Write viewPost = new WriteDAO().getWrite(writeID);
		
		int commentID = 0;
		if(request.getParameter("commentID")!=null)
			commentID=Integer.parseInt(request.getParameter("commentID"));
		Comment comment = new CommentDAO().getComment(commentID);
		
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
						<td colspan="2" style="min-height: 200px; text-align: left;"><pre><code class="<%= viewPost.getLang() %>"> <%=viewPost.getCodeContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;")%> </code></pre></td>
					</tr>
				</tbody>
			</table>
			<a href="main.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID. equals (viewPost.getAuthor())) {
			%>
				<a href="update.jsp?id=<%= writeID %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?id=<%= writeID %>" class="btn btnbtn-primary">삭제</a>
			<%
				}
			%>
	</div>
				<br><br>
	<div class="container">
         <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
               <tbody>
               <tr>
                  <td align="left" bgcolor="skyblue">댓글</td>
               </tr>
        
     <div class="container">
		<div class="row">
			<form method="post" action="commentUpdateAction.jsp?writeID=<%=writeID%>&commentID=<%=commentID%>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="댓글 쓰기" name="commentContent" maxlength="300" value=<%=comment.getCommentContent() %>></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-success pull-right" value="댓글수정">
		</form>
		</div>
	</div>
                  
               
            </table>
	</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>