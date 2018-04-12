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
    

    // �α��� ������ ����
       @RequestMapping(value = "/TestLogin.do", method = RequestMethod.GET)
       public String loginForm(HttpSession session, Model model) {
           // RSA Ű ����
           PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
           if (key != null) { // ���� key �ı�
               session.removeAttribute("RSAprivateKey");
           }
           RSA rsa = rsaUtil.createRSA();
           model.addAttribute("modulus", rsa.getModulus());
           model.addAttribute("exponent", rsa.getExponent());
           session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
           return "redirect:/index";
       }
    // �α��� ó��
       @RequestMapping(value = "/TestLogin.do", method = RequestMethod.POST)
       public String login(UserVO vo, HttpSession session, RedirectAttributes ra) {
           // ����Ű ���
           PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
           if (key == null) {
               ra.addFlashAttribute("resultMsg", "������ ���� ���� �Դϴ�.");
               return "redirect:/login";
           }
        
           // session�� ����� ����Ű �ʱ�ȭ
           session.removeAttribute("RSAprivateKey");
        
           // ���̵�/��й�ȣ ��ȣȭ
           try {
           	System.out.println("��ȣȭ��");
           	System.out.println(vo.getEmail());
           	System.out.println(vo.getPw());
           	
            String email = rsaUtil.getDecryptText(key, vo.getEmail());
            String pw = rsaUtil.getDecryptText(key, vo.getPw());
        
               // ��ȣȭ�� ���� �缳��
            vo.setEmail(email);
            vo.setPw(pw);
            System.out.println("��ȣȭ ��");
           	System.out.println(vo.getEmail());
           	System.out.println(vo.getPw());
           } catch (Exception e) {
               ra.addFlashAttribute("resultMsg", "������ ���� ���� �Դϴ�.");
               return "redirect:/index.jsp";
           }
   		return null;
        
           // �α��� ���� ����
           // userService.login(user);
       }


    
    @RequestMapping(value="/userview.do", method=RequestMethod.GET)
    public String userview(@RequestParam("id") String uid, Model model) {
        UserVO user = service.getUser(uid);
        model.addAttribute("user",user);
        return "user/user_view";
    }
	
}
