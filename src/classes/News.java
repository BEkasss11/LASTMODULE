package classes;

import java.sql.Timestamp;

public class News {
    private  Long id;
    private Timestamp post_date;
    private  Category category;
    private String title;
    private String content;


    public News(Long id, Timestamp post_date, Category category, String title, String content) {
        this.id = id;
        this.post_date = post_date;
        this.category = category;
        this.title = title;
        this.content = content;
    }

    public News() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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
}

