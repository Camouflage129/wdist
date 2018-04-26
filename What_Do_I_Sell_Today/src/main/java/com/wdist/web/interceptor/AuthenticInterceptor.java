package com.wdist.web.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) {
			return true;
		}
		else {
			System.out.println("interceptor");
			Map<String, String> map = new HashMap<String, String>();
			map.put("result", "fail");
			throw new ModelAndViewDefiningException(new ModelAndView("jsonView", map));
		}
	}
}