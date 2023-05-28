<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 성공</title>
</head>
<body>

	Home > 회원 탈퇴 성공
	<hr>
	회원 탈퇴에 성공했습니다.
	<table border="0">
		<tr>
		
			<td>
				<form action = "main.jsp" method="post">
				<input type="submit" value="메인 화면">
				</form>
			</td>
			
			<td>
				<form action = "login.jsp" method="post">
				<input type="submit" value="로그인 하기">
				</form>
			</td>
			
			<td>
				<form action = "signup.jsp" method="post">
				<input type="submit" value="회원 가입하기">
				</form>
			</td>
			
		</tr>
	</table>

</body>
</html>