package com.wdist.web.controller;

import java.security.PrivateKey;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wdist.biz.user.service.UserService;
import com.wdist.biz.user.vo.UserVO;
import com.wdist.encryption.RSA;
import com.wdist.encryption.RSAUtil;

@Controller
public class UserController {
	
	RSAUtil rsaUtil = new RSAUtil();
	
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
    

    // 로그인 페이지 진입
       @RequestMapping(value = "/TestLogin.do", method = RequestMethod.GET)
       public String loginForm(HttpSession session, Model model) {
           // RSA 키 생성
           PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
           if (key != null) { // 기존 key 파기
               session.removeAttribute("RSAprivateKey");
           }
           RSA rsa = rsaUtil.createRSA();
           model.addAttribute("modulus", rsa.getModulus());
           model.addAttribute("exponent", rsa.getExponent());
           session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
           return "redirect:/index";
       }
    // 로그인 처리
       @RequestMapping(value = "/TestLogin.do", method = RequestMethod.POST)
       public String login(UserVO vo, HttpSession session, RedirectAttributes ra) {
           // 개인키 취득
           PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
           if (key == null) {
               ra.addFlashAttribute("resultMsg", "비정상 적인 접근 입니다.");
               return "redirect:/login";
           }
        
           // session에 저장된 개인키 초기화
           session.removeAttribute("RSAprivateKey");
        
           // 아이디/비밀번호 복호화
           try {
           	System.out.println("복호화전");
           	System.out.println(vo.getEmail());
           	System.out.println(vo.getPw());
           	
            String email = rsaUtil.getDecryptText(key, vo.getEmail());
            String pw = rsaUtil.getDecryptText(key, vo.getPw());
        
               // 복호화된 평문을 재설정
            vo.setEmail(email);
            vo.setPw(pw);
            System.out.println("복호화 후");
           	System.out.println(vo.getEmail());
           	System.out.println(vo.getPw());
           } catch (Exception e) {
               ra.addFlashAttribute("resultMsg", "비정상 적인 접근 입니다.");
               return "redirect:/index.jsp";
           }
   		return null;
        
           // 로그인 로직 실행
           // userService.login(user);
       }


    
    @RequestMapping(value="/userview.do", method=RequestMethod.GET)
    public String userview(@RequestParam("id") String uid, Model model) {
        UserVO user = service.getUser(uid);
        model.addAttribute("user",user);
        return "user/user_view";
    }
	
}
