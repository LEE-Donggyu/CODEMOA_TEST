<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 관리</title>
</head>
<body>

	Home > 멤버 관리
	<hr>
	<%
		String u_id = request.getParameter("userID");
		String u_pw = request.getParameter("userPW");
		String u_mail = request.getParameter("userMAIL");
		
		Statement sm = conn.createStatement();
		ResultSet rs = sm.executeQuery("SELECT ID, EMAIL, SIGNUPTIME FROM MEMBERS");
		
		String str = "";
		int count = 1;
		
		while(rs.next()){
			str += count + " : " + rs.getString("id") + " / " + rs.getString("email") + " / " + rs.getString("signuptime") + "<br>";
			count++;
		}
		
		out.println(str);
	%>

</body>
</html>