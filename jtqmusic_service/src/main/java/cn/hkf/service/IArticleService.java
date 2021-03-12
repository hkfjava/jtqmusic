package cn.hkf.service;

import cn.hkf.domain.Article;
import cn.hkf.domain.Comment;

import java.util.List;

public interface IArticleService {
    Integer save(Article article) throws Exception;

    List<Article> findAll() throws Exception;

    Integer saveComment(Comment comment) throws Exception;

    List<Comment> findCommentBy_articleId(Integer article_id) throws Exception;
}
