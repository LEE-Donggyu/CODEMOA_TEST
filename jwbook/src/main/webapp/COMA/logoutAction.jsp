<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인 액션</title>
</head>
<body>

	<%
		
		session.invalidate();
		
	%>
	<script>
		location.href="main.jsp";
	</script>

</body>

</html>