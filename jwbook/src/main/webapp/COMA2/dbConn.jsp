<%@ page import="java.sql.*" %>

<%
  Connection conn = null;
  String url = "jdbc:h2:tcp://localhost/~/jwbookdb";
  String user = "jwbook";
  String passwd = "1234";
  
  Class.forName("org.h2.Driver");
  conn = DriverManager.getConnection(url, user, passwd);
%>