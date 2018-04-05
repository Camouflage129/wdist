package com.wdist.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wdist.biz.user.service.UserService;
import com.wdist.biz.user.vo.UserVO;

@Controller
public class UserController {
	
	@Resource(name="userService")
	UserService service;
	
	@RequestMapping("")
	public ModelAndView signUpDo(String id, String pw, String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		UserVO vo = new UserVO(id, pw, name, email);
		if(service.insertAccount(vo) == 1)
			map.put("result", "success");
		else
			map.put("result", "fail");		
		return new ModelAndView("jsonView", map);
	}
 
	
}
