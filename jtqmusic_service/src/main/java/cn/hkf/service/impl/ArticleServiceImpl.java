package cn.hkf.service.impl;

import cn.hkf.dao.IArticleDao;
import cn.hkf.domain.Article;
import cn.hkf.domain.Comment;
import cn.hkf.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ArticleServiceImpl implements IArticleService {

    @Autowired
    private IArticleDao articleDao;


    @Override
    public Integer save(Article article) throws Exception {

        article.setArticle_collNumber(0);
        article.setArticle_praiseNumber(0);
        article.setArticle_time(new Date());
        return articleDao.save(article);
    }

    @Override
    public List<Article> findAll() throws Exception {
        return articleDao.findAll();
    }

    @Override
    public Integer saveComment(Comment comment) throws Exception {
        return articleDao.saveComment(comment);
    }

    @Override
    public List<Comment> findCommentBy_articleId(Integer article_id) throws Exception {
        return articleDao.findCommentBy_articleId(article_id);
    }
}
