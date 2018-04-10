package com.wdist.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wdist.biz.user.service.UserService;
import com.wdist.biz.user.vo.UserVO;

@Controller
public class UserController {
	
	@Resource(name="UserService")
	UserService service;
	
	@RequestMapping(value="/signUp.do", method=RequestMethod.POST)
	public ModelAndView signUpDo(String id, String pw, String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		UserVO vo = new UserVO(id, pw, name, email);
		if(service.insertAccount(vo) == 1)
			map.put("result", "success");
		else
			map.put("result", "fail");		
		return new ModelAndView("jsonView", map);
	}	
	
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)	
	public ModelAndView checkIdDo(String id, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		if(service.checkId(id))
			map.put("result", "success");
		else
			map.put("result", "fail");
		session.setAttribute("checkId", id);		
		return new ModelAndView("jsonView", map);
	} 

    @RequestMapping(value="/removeuser.do")
    public String userRemove(String id) {
        service.deleteAccount(id);
        return "redirect:index.jsp";
    }

    
    @RequestMapping(value="/modifyuser.do")
    public String userModify(String id, HttpServletRequest req) {
        UserVO vo = service.getUser(id);
        req.setAttribute("user", vo);
        return "user/user_modify";
    }
    
    @RequestMapping(value="/updateuser.do")
    public String updateuser(UserVO vo) {
        System.out.println(vo);
        service.modifyAccount(vo);
        return "redirect:index.jsp";
    }
    
    
    @RequestMapping(value="/userview.do", method=RequestMethod.GET)
    public String userview(@RequestParam("id") String uid, Model model) {
        UserVO user = service.getUser(uid);
        model.addAttribute("user",user);
        return "user/user_view";
    }
	
}
