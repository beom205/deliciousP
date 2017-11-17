package com.delip.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

//서블릿 필터와 유사  파라미터가 한두개씩 더 붙어있는 형태
@Log
public class CheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		log.info(modelAndView.getViewName());
		log.info("" + modelAndView.getModel());
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.info("preHandle");
		log.info("" + handler);

		// 만일 HttpSession에 login 이름의 값이 없다면 "/login" 으로 튕겨냄
		Object value = request.getSession().getAttribute("login");

		if (value != null) {
			log.info("이미 세션에 값이 존재한 사용자" + value);
			return true;
		}

		if (value == null) {
			log.info("세션에 없음 쿠키 확인");
			Cookie loginCookie = WebUtils.getCookie(request, "login");
			
			log.info("쿠키: " + loginCookie.toString());

			if (loginCookie != null) {
				log.info("쿠키는 존재하므로 세션에 담자");
				request.getSession().setAttribute("login", loginCookie.getValue());
				return true;
			}
		}
		log.info("세션에도 없고, 쿠키도 없다");
		response.sendRedirect("/member/login");
		return false;
		/*
		 * if(loginCookie == null) { response.sendRedirect("/login"); return false; }
		 * return true;
		 */
	}

}