<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.h2.Driver" %>
<%@ include file="dbConn.jsp" %>    

<%
  String u_id = request.getParameter("userID");
  String u_pw = request.getParameter("userPW");
  String u_mail = request.getParameter("userMAIL");
  
  String sql = "INSERT INTO MEMBERS (ID, PASSWD, EMAIL) VALUES";
  sql += "('" + u_id + "', '" + u_pw + "', '" + u_mail + "')";
  
  Statement sm = conn.createStatement();
  
  int count = sm.executeUpdate(sql);
  
  if (count == 1) {
    out.println("회원가입 성공");
    response.sendRedirect("main.jsp");
  } else {
    out.println("회원가입 실패");
    response.sendRedirect("signup.jsp");
  }
  sm.close();
  conn.close();
%>
