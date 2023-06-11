package write;

public class Write {
    private int id;
    private String title;
    private String author;
    private String content;
    private String codeContent;
    private String lang;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    public String getAuthor() {
    	return author;
    }
    
    public void setAuthor(String author) {
    	this.author = author;
    }
    
    public String getCodeContent() {
    	return codeContent;
    }
    
    public void setCodeContent(String codeContent) {
    	this.codeContent = codeContent;
    }
    
    public String getLang() {
    	return lang;
    }
    
    public void setLang(String lang) {
    	this.lang = lang;
    }
}

