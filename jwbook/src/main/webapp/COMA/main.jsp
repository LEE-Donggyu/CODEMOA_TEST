<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="write.WriteDAO" %>
<%@ page import="write.Write" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/COMA.css">

<title>CODEMOA MAIN</title>

<script>
    var basePath = "<%= request.getContextPath() %>";
    var defaultUrl = basePath + "/COMA/main.jsp?lang=";
    var currentUrl = window.location.href;
    if (currentUrl.indexOf("?") === -1) {
        // 쿼리 파라미터가 없는 경우
        var lang = "";
        window.location.href = defaultUrl + lang;
    } else {
        // 쿼리 파라미터가 있는 경우
        var params = currentUrl.split("?");
        var langParam = params[1];
        var langValue = langParam.split("=")[1];
        if (langValue === undefined || langValue === null) {
            // lang 파라미터 값이 없는 경우
            var lang = "";
            window.location.href = defaultUrl + lang;
        }
    }
</script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%
  String userID = null;
  if(session.getAttribute("userID") != null){
    userID = (String) session.getAttribute("userID");
  }
  int pageNumber = 1;
  if (request.getParameter("pageNumber") != null){
    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
  }
  
  WriteDAO writeDAO = new WriteDAO(); // WriteDAO 객체 생성
%>

<div class="container">
  <!-- 상단 제목 -->
  <div id="main_title">
    <img id="codemoa_logo" src="images/CODEMOA_logo.png">
    
    <div id="write-area">
		<a href="write.jsp" id="writebtn">글쓰기</a>
    </div>
    
    <div id="tag-area">
    <button class="tag-btn" onclick="filterPosts('')" id="allButton">전체</button>
    <% 
        ArrayList<String> langList = writeDAO.getLangList();
        for (String lang : langList) {
    %>
    <button class="tag-btn" onclick="filterPosts('<%= lang %>')"><%= lang %></button>
    <% } %>
</div>
    
  </div>
  
  <!-- 리스트 -->
  <hr class="hr">
  <br><br>
  
  <div class="list_start">
    <% 
        ArrayList<Write> list = writeDAO.getList(pageNumber, request.getParameter("lang"));
        for (int i = 0; i < list.size(); i++){
            String lang = list.get(i).getLang();
            String capitalizedLang = lang.substring(0, 1).toUpperCase() + lang.substring(1);
    %>
    <tr>
        <div class="list_detail" onclick="goToPost(<%= list.get(i).getId() %>)">
            <div id="title">
                <%= list.get(i).getTitle() %>
            </div>
            <div id="lang"><%= capitalizedLang %></div>
            <div id="author"><%= list.get(i).getAuthor() %></div>
        </div>
    </tr>
    <%
        }
    %>
</div>
  <hr class="hr">
  
<div class="paging_start">
    <%
      if (pageNumber != 1){
    %>
      <a href="main.jsp?pageNumber=<%= pageNumber - 1 %>&lang=<%= request.getParameter("lang") %>" class="btn btn-success btn-arraw-left" style="text-decoration: none; color: black;">이전</a>
    <%
      }
      if (writeDAO.nextPage(pageNumber + 1, request.getParameter("lang"))){
    %>
      <a href="main.jsp?pageNumber=<%= pageNumber + 1 %>&lang=<%= request.getParameter("lang") %>" class="btn btn-success btn-arraw-right" style="text-decoration: none; color: black;">다음</a>
    <%
      }
    %>
  </div>

</div>
<br><br>

<jsp:include page="footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<script>
    function goToPost(id) {
        window.location.href = "view.jsp?id=" + id;
    }

    function filterPosts(lang) {
        window.location.href = "main.jsp?lang=" + lang;
    }
    var selectedTag = '<%= request.getParameter("lang") %>'; // 선택된 태그 가져오기
    if (selectedTag === '') { // 전체 태그인 경우
        document.getElementById("allButton").classList.add("selected-tag"); // 버튼 스타일 변경
    } else { // 선택된 태그인 경우
        var tagButtons = document.getElementsByClassName("tag-btn");
        for (var i = 0; i < tagButtons.length; i++) {
            if (tagButtons[i].innerHTML === selectedTag) {
                tagButtons[i].classList.add("selected-tag"); // 버튼 스타일 변경
                break;
            }
        }
    }
    
    
</script>
</body>
</html>
