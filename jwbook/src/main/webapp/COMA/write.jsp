<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="write.Lang" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/COMA.css">
<link rel="stylesheet" href="css/write.css">

<title>로그인 화면</title>
</head>
<body>

    <%
        String userID = null;
        if(session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
        }
    %>
    
    <jsp:include page="header.jsp"></jsp:include>

    <h2 style="text-align: center;">게시글 작성</h2>
    <div class="write_container">
        <form action="writeAction.jsp" method="post">
            <div class="write-group">
                <label class="write_label" for="title">제목</label>
                <br>
                <input type="text" class="form-control" id="write_title" name="title" placeholder="제목을 입력하세요.">
            </div>
            <div class="write-group">
                <label class="write_label" for="content">내용</label>
                <br>
                <textarea class="form-control" id="write_content" name="content" rows="3"></textarea>
            </div>
            <div class="write-group">
                <label class="write_label" for="language">언어</label>
                <br>
                <select class="form-control" id="write_language" name="lang">
                    <%
                        for (Lang lang : Lang.values()) {
                    %>
                    <option value="<%= lang.getLanguage() %>"><%= lang.name() %></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="write-group">
                <label class="write_label" for="codeContent">코드 작성</label>
                <br>
                <textarea class="form-control" id="write_codeContent" name="codeContent" rows="3"></textarea>
            </div>
            <button id="write-btn" type="submit" class="btn btn-primary">작성</button>
        </form>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    
    <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>
