<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>

<%
	
	String u_id = request.getParameter("userID");
	String sql="DELETE FROM MEMBERS WHERE ID = ?";
	
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_id);
	
	int count = sm.executeUpdate();
	
	if(count==1){
		response.sendRedirect("drawSuccess.jsp");
	}
	else{		
	%>
	<script>
		alert('회원 탈퇴 실패! 다시 입력해주세요.');
		location.href = "withdraw.jsp";
	</script>
	<%
	}
	sm.close();
	conn.close();

%>
