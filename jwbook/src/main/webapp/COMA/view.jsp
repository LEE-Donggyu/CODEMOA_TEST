<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="write.Write" %>
<%@ page import="write.WriteDAO" %>
<%@ page import="write.Comment" %>
<%@ page import="write.CommentDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="admin.Admin" %>
<%@ page import="admin.AdminDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/COMA.css">
<!-- highlight.js -->


<link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/styles/default.min.css"> <!-- 구문 강조 CSS호출 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script> <!-- 구문강조 js호출 -->
<script>hljs.highlightAll();</script>

<!-- highlight.js -->
<title>로그인 화면</title>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
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
		String lang = viewPost.getLang();
		
		if (viewPost.getCodeContent() == null){
			viewPost.setCodeContent("null");
		}
	%>
<%-- 
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
	 --%>
	
	
	
	
	
	
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
			<a onclick="location.href='reportAction.jsp?postId=<%= viewPost.getId() %>&content=<%= viewPost.getContent() %>'" class="btn btn-danger">게시글 신고</a>
			<%
				if(userID != null && (userID. equals (viewPost.getAuthor()) || userID.equals("COMA"))) {
			%>
				<a href="update.jsp?id=<%= id %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?id=<%= id %>" class="btn btnbtn-primary">삭제</a>
			<%
				}
			%>
	</div>
	<div class="container">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<tbody>
							<tr>
								<td align="left" bgcolor="skyblue">댓글</td>
							</tr>
							<tr>
								<%
									CommentDAO commentDAO = new CommentDAO();
									ArrayList<Comment> list = commentDAO.getList(id);
									for (int i = 0; i < list.size(); i++) {
								%>
								<div class="container">
									<div class="row">
										<table class="table table-striped"
											style="text-align: center; border: 1px solid #dddddd">
											<tbody>
												<tr>
													<td align="left"><%=list.get(i).getUserID()%></td>
												</tr>
												<tr>
													<td align="left"><%=list.get(i).getCommentContent()%></td>
													<td align="right">
													<a onclick="location.href='reportAction.jsp?postId=<%= viewPost.getId() %>&commentId=<%=list.get(i).getUserID()%>&commentContent=<%=list.get(i).getCommentContent() %>'" class="btn btn-danger">댓글 신고</a>
													<%
                            							if (userID != null && (userID.equals(viewPost.getAuthor()) || userID.equals("COMA"))) {
                            						%>
													
													<a
														href="commentUpdate.jsp?writeid=<%=id%>&commentID=<%=list.get(i).getCommentID()%>"
														class="btn btn-warning">수정</a> <a
														onclick="return confirm('정말로 삭제하시겠습니까?')"
														href="commentDeleteAction.jsp?writeID=<%=id%>&commentID=<%=list.get(i).getCommentID()%>"
														class="btn btn-danger">삭제</a>
													<%
                            							}													
													%>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<%
									}
								%>
							</tr>
					</table>
				</div>
			</div>
			<br>
			<div class="container">
				<div class="row">
					<form method="post" action="submitAction.jsp?writeID=<%=id%>">
						<table class="table table-bordered"
							style="text-align: center; border: 1px solid #dddddd">
							<tbody>
								<tr>
									<td align="left"><%=userID%></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control"
										placeholder="댓글 쓰기" name="commentContent" maxlength="300"></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="btn btn-success pull-right"
							value="댓글 쓰기">
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>