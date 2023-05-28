<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>

	Home > 로그인 성공
	<hr>
	<%
	
		String u_id = request.getParameter("uID");
		String u_pw = request.getParameter("uPW");
		
		if(u_id.equals("space") && u_pw.equals("123456")){
			session.setAttribute("memberID", u_id);
			session.setAttribute("memberPW", u_pw);
			
			out.println("새로운 세션 생성 성공!<br>");
			out.println("["+ u_id +"]님 입니다. <p>");
		}
		else{%>
			<script>
			alert('아이디와 비밀번호를 다시 확인해주세요.');
			location.href = "login.jsp";
			</script><%
		}
	
	%>
	<table border="0">
		<tr>
		
			<td>
				<form action="memberList.jsp" method="post">
					<input type="submit" value="등록 회원 관리">
				</form>
			</td>
			
			<td>
				<form action="logout.jsp" method="post">
					<input type="submit" value="로그아웃">
				</form>
			</td>
			
		</tr>
	</table>

</body>
</html>