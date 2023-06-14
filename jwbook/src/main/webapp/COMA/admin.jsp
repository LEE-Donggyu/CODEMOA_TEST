<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="admin.AdminDAO" %>
<%@ page import="admin.Admin" %>
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
<title>관리자 화면</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>


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
	if (!userID.equals("COMA")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
%>

	<div class="container">
		<!-- 상단 제목 -->
		<div class="main_title">
			<p>관리자님 환영합니다.</p>
			<p>신고 내역</p>
		</div>
		<!-- 리스트 -->
			<div class="reportlist">
    			<%    
    			AdminDAO adminDAO = new AdminDAO();
    			ArrayList<Admin> list = adminDAO.getList();
    			for (int i = 0; i < list.size(); i++) {
        			String content = list.get(i).getContent();
        			String commentID = list.get(i).getCommentID();
        			String commentContent = list.get(i).getCommentContent();
    			%>
    			<tr>
        			<div class="list_report">
            			<%= list.get(i).getId() %>
            			<div class="title">
                			<a href="view.jsp?id=<%= list.get(i).getWriteID()%>"><%= list.get(i).getWriteID() %></a>
            			</div>
            			<div class="content">
                			<% 
                			if (commentContent != null && !commentContent.equals("")) {
                    			out.print("댓글 신고: ");
                			} else {
                    			out.print("게시글 신고: ");
                			}
                			out.print(content);
                			%>
            			</div>
        			</div>
    			</tr>
    			<%
    			}
    			%>
			</div>

	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>