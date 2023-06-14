<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="admin.AdminDAO" %>

<%
    // 게시글 또는 댓글 신고 처리 로직을 작성합니다.
    int postId = Integer.parseInt(request.getParameter("postId")); // 게시글 또는 댓글 ID
    String content = request.getParameter("content"); // 신고 내용

    // 여기서부터는 신고 처리를 위한 추가적인 로직을 작성합니다.
    // 신고 내용을 데이터베이스에 저장하거나 관리자에게 알림을 보내는 등의 작업을 수행할 수 있습니다.

    AdminDAO adminDAO = new AdminDAO();
    int result = -1;

    // 게시글 신고인 경우
    if (request.getParameter("commentId") == null) {
        result = adminDAO.saveReportedWrite(postId, content);
    }
    // 댓글 신고인 경우
    else {
        String commentId = request.getParameter("commentId");
        String commentContent = request.getParameter("commentContent");
        result = adminDAO.saveReportedComment(postId, commentId, commentContent);
    }

    if (result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('신고에 실패했습니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('신고가 접수되었습니다. 내용: " + content + "')");
        script.println("history.back()");
        script.println("</script>");
    }
%>
