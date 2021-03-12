package cn.hkf.utils;




import cn.hkf.domain.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PowerInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // TODO Auto-generated method stub

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loginUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath()+"/signin.jsp");
            return false;
        }

        return super.preHandle(request, response, handler);
    }

}