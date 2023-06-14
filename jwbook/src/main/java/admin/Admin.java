package admin;

public class Admin {
    private int id;
    private int writeID;
    private String content;
    private String commentID;
    private String commentContent;
    private int reportID;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getWriteID() {
        return writeID;
    }

    public void setWriteID(int writeID) {
        this.writeID = writeID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
    
    public int getReportID() {
    	return reportID;
    }
    
    public void setReportID(int reportID) {
    	this.reportID = reportID;
    }
}
