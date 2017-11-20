package com.delip.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// 사용자가 로그인을 했다면...
		// Model안에 member이름으로 값이 뭔가 있을 것이다.
		Object obj = modelAndView.getModel().get("member");
		Object obj2 = modelAndView.getModel().get("nickname");
		if(obj == null) {	
			response.sendRedirect("/member/login");
			return;
		}				
		HttpSession session =  request.getSession();
		log.info("session : "  + session);
		
		session.setAttribute("login", obj);
		session.setAttribute("nickname", obj2);
		log.info("session set후 : "  + session.getAttribute("login"));
		log.info("정상적으로 로그인 된 사용자: " + obj);
		
		
	try { // tryCatch 안해주면 remember없이 로그인시 500에러뜸
			Boolean remember = (Boolean) modelAndView.getModel().get("remember");
			
			log.info("remember : " + remember);
			if (remember) {
				log.info("쿠키 만들러옴 ");
				Cookie loginCookie = new Cookie("login", obj.toString()); // 쿠키에는 문자열만 가능
				loginCookie.setMaxAge(60 * 60 * 24 * 7); // 일주일
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
				log.info("쿠키 만듬! ");
			}
		} catch (Exception e) {

		}
		
	}

}
