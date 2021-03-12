package cn.hkf.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Article {

    private Integer article_id;
    private String article_title;
    private String article_content;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date article_time;
    private String article_time_str;
    private Integer article_praiseNumber;
    private Integer article_collNumber;
    private Integer user_id;
    private String article_theme;
    private User user;
    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getArticle_time_str() {
        return article_time_str;
    }

    public void setArticle_time_str(String article_time_str) {
        this.article_time_str = article_time_str;
    }

    public String getArticle_theme() {
        return article_theme;
    }

    public void setArticle_theme(String article_theme) {
        this.article_theme = article_theme;
    }

    public Integer getArticle_id() {
        return article_id;
    }

    public void setArticle_id(Integer article_id) {
        this.article_id = article_id;
    }

    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public String getArticle_content() {
        return article_content;
    }

    public void setArticle_content(String article_content) {
        this.article_content = article_content;
    }

    public Date getArticle_time() {
        return article_time;
    }

    public void setArticle_time(Date article_time) {
        this.article_time = article_time;
    }

    public Integer getArticle_praiseNumber() {
        return article_praiseNumber;
    }

    public void setArticle_praiseNumber(Integer article_praiseNumber) {
        this.article_praiseNumber = article_praiseNumber;
    }

    public Integer getArticle_collNumber() {
        return article_collNumber;
    }

    public void setArticle_collNumber(Integer article_collNumber) {
        this.article_collNumber = article_collNumber;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }
}
