package com.wdist.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String requestUrl = request.getRequestURL().toString();
		if(requestUrl.equals("http://localhost:9000/") || requestUrl.contains("/login.do") || requestUrl.contains("/logout.do") 
				|| requestUrl.contains("/searchPwd.do") || requestUrl.contains("/main.do") || requestUrl.contains("/signUpNewPwd.do")
				|| requestUrl.contains("/checkId.do") || requestUrl.contains("/searchId.do") || requestUrl.contains("/interceptor.do") 
				|| requestUrl.contains("/signUp.do") || requestUrl.contains("/recapcha.do") || requestUrl.contains("/signUpNewPwd.do") 
				|| requestUrl.contains("/userview.do") || session.getAttribute("userid") != null ){
			return true;
		}
		else {
			response.sendRedirect("/interceptor.do");
			return false;
		}
	}
}
