package cn.hkf.dao;

import cn.hkf.domain.Article;
import cn.hkf.domain.Comment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IArticleDao {

    @Insert("insert into article(article_title,article_content, article_time, article_praiseNumber, article_collNumber, user_id,  article_theme )" +
            " values(#{article_title}, #{article_content}, #{article_time}, #{article_praiseNumber}, #{article_collNumber}, #{user_id}, #{article_theme})")
    Integer save(Article article) throws Exception;

    @Select("select * from article")
    List<Article> findAll() throws Exception;

    @Insert("insert into comment(comment_content, comment_time, user_id, article_id)" +
            " values(#{comment_content}, #{comment_time}, #{user_id}, #{article_id})")
    Integer saveComment(Comment comment) throws Exception;

    @Select("select * from comment where article_id = #{id}")
    List<Comment> findCommentBy_articleId(Integer article_id) throws Exception;
}
