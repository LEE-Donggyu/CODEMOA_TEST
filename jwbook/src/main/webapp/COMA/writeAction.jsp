<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="write.WriteDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbs" class="write.Write" scope="page" />
<jsp:setProperty name="bbs" property="title" />
<jsp:setProperty name="bbs" property="content" />
<jsp:setProperty name="bbs" property="author" />
<jsp:setProperty name="bbs" property="codeContent"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>글작성 액션</title>
</head>
<body>

	<%
	
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			//session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} else {
			if(bbs.getTitle() == null || bbs.getContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				WriteDAO writeDAO = new WriteDAO();
				int result = writeDAO.write(bbs.getTitle(), userID, bbs.getContent(), bbs.getCodeContent());
				if(result==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					//session.setAttribute("userID", user.getUserID());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='main.jsp'");
					script.println("</script>");
				}
			}
		}
	%>

</body>

</html>