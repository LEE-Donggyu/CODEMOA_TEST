<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="write.WriteDAO" %>
<%@ page import="write.Write" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>


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
		} else {
			if(request.getParameter("title") == null || request.getParameter("content") == null || request.getParameter("codeContent") == null || request.getParameter("lang") == null
				    || request.getParameter("title").equals("") || request.getParameter("content").equals("") || request.getParameter("codeContent").equals("") || request.getParameter("lang").equals(""))
				{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				WriteDAO writeDAO = new WriteDAO();
				int result = writeDAO.update(id, request.getParameter("title"), request.getParameter("content"), request.getParameter("codeContent"), request.getParameter("lang"));
				if(result==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패했습니다.')");
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