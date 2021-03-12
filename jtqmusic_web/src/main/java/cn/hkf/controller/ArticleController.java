package cn.hkf.controller;

import cn.hkf.domain.Article;
import cn.hkf.domain.Comment;
import cn.hkf.domain.Songs;
import cn.hkf.domain.User;
import cn.hkf.service.IArticleService;
import cn.hkf.service.ISingerService;
import cn.hkf.service.IUserService;
import cn.hkf.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {


    @Autowired
    private IArticleService articleService;

    @Autowired
    private IUserService userService;

    /**
     * 获取所有文章
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        String patt = "yyyy-MM-dd HH:mm:ss";
        List<Article> articles = articleService.findAll();
        for (Article article : articles) {
            article.setArticle_time_str(DateUtils.date2String(article.getArticle_time(), patt));
            User user = userService.findById(article.getUser_id());
            article.setUser(user);
            List<Comment> comments = articleService.findCommentBy_articleId(article.getArticle_id());
            for (Comment comment : comments) {
                comment.setUser(userService.findById(comment.getUser_id()));
                comment.setComment_time_str(DateUtils.date2String(comment.getComment_time(), patt));
            }
            article.setComments(comments);

        }
        mv.addObject("articles", articles);
        mv.setViewName("blog");
        return mv;
    }

    /**
     * 保存 文章
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/save.do", method = RequestMethod.POST)
    public String save(Article article, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("loginUser");
        int res = 0;
        if (user == null) { //用户未登录
            return "102";
        }
        article.setUser_id(user.getUser_id());
        res = articleService.save(article);

        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }


    /**
     * 保存评论
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/saveComment.do", method = RequestMethod.POST)
    public String saveComment(Comment comment, Integer article_id, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("loginUser");
        int res = 0;
        if (user == null) { //用户未登录
            return "102";
        }
        comment.setUser_id(user.getUser_id());
        comment.setArticle_id(article_id);
        comment.setComment_time(new Date());
        res = articleService.saveComment(comment);

        if (res == 1) {
            return "101";
        } else {
            return "100";
        }
    }


}
