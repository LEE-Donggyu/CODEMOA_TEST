<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userMail" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		if(user.getUserName() == null|| user.getUserMail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않는 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			if (!user.getUserMail().matches("\\S+@\\S+\\.\\S+")) {
			    PrintWriter script = response.getWriter();
			    script.println("<script>");
			    script.println("alert('올바른 이메일 형식이 아닙니다.')");
			    script.println("history.back()");
			    script.println("</script>");
			}
			else{
				UserDAO userDAO = new UserDAO();
				String userID = userDAO.findid(user);
				if (userID == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('일치하는 정보가 없습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('아이디: " + userID + "')");
					script.println("location.href='main.jsp'");
					script.println("</script>");
					// 아이디가 일치할 때 수행할 코드를 작성합니다.
				}				
			}
			
		}
	%>

</body>
</html>