<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
    // 현재 세션을 가져옵니다.
    HttpSession ses = request.getSession(false);

    if (ses != null) {
        // 세션을 무효화하여 로그아웃 처리합니다.
        ses.invalidate();
    }
%>
<script>
    alert("로그아웃 되었습니다.");
    location.href = "login.jsp"; // 로그아웃 후 이동할 페이지의 URL을 설정하세요.
</script>
</body>
</html>
