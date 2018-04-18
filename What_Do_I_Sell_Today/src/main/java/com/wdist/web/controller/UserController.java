package com.wdist.web.controller;

import java.io.IOException;
import java.security.PrivateKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.wdist.encryption.SHAUtil;
import com.wdist.encryption.VerifyRecaptcha;

import io.netty.handler.codec.http.HttpRequest;

@Controller
public class UserController {

	RSAUtil rsaUtil = new RSAUtil();
	SHAUtil sha = new SHAUtil();

	@Resource(name = "UserService")
	UserService service;

	@RequestMapping(value = "/recapcha.do", method = RequestMethod.POST)
	public ModelAndView reCapcha(HttpServletRequest req) {
		VerifyRecaptcha.setSecretKey("6Ldj51MUAAAAAD1gMJ_ZZhOtpW4xTbNNiCsvgQGW"); // secretKey 세팅
		String gRecaptchaResponse = req.getParameter("recaptcha"); // recapcha 파라미터 가져오기
		System.out.println("리캡차 요청");
		boolean verify = false;
		try {
			verify = VerifyRecaptcha.verify(gRecaptchaResponse);
		} catch (IOException e) {
			e.printStackTrace();
		} // 리캡챠 인증 true,false 설공 실패 리턴
		System.out.println(verify);
		String result = "fail";
		if (verify) {
			result = "success";
		}

		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}

	// 처음 로그인 페이지 접속시 암호화 키를 심어줌
	@RequestMapping(value = "/signUp.do", method = RequestMethod.GET)
	public String signForm(HttpSession session, Model model) {
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key != null) { // 기존 key 파기
			session.removeAttribute("RSAprivateKey");
		}
		RSA rsa = rsaUtil.createRSA();
		model.addAttribute("modulus", rsa.getModulus());
		model.addAttribute("exponent", rsa.getExponent());
		session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
		System.out.println("회원가입 키심어줌");
		return "user/signUp";
	}

	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String signUpDo(HttpSession session, RedirectAttributes ra, UserVO vo) {
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");

		if (key == null) {
			ra.addFlashAttribute("resultMsg", "비정상 적인 접근 입니다.");
			return "index";
		}
		session.removeAttribute("RSAprivateKey");

		try {
			vo.setEmail(rsaUtil.getDecryptText(key, vo.getEmail().trim()));
			vo.setId(rsaUtil.getDecryptText(key, vo.getId()));
			vo.setPw(sha.encryptSHA(rsaUtil.getDecryptText(key, vo.getPw())));
			vo.setName(rsaUtil.getDecryptText(key, vo.getName()));
		} catch (Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("result", "fail");
		}
		if (service.insertAccount(vo) == 1)
			ra.addFlashAttribute("result", "success");
		else
			ra.addFlashAttribute("result", "fail");
		return "redirect:/login.do"; //성공했을경우 어디로 보낼지 적어주세요
	}

	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public ModelAndView checkIdDo(String id, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		if (service.checkId(id))
			map.put("result", "success");
		else
			map.put("result", "fail");
		session.setAttribute("checkId", id);
		return new ModelAndView("jsonView", map);
	}

	@RequestMapping(value = "/removeuser.do")
	public String userRemove(String id) {
		service.deleteAccount(id);
		return "redirect:index.jsp";
	}

	@RequestMapping(value = "/updateuser.do")
	public String updateuser(UserVO vo) {
		System.out.println(vo);
		service.modifyAccount(vo);
		return "redirect:index.jsp";
	}

	// 로그인
	/*
	 * @RequestMapping(value="/login.do") public String loginDo(String id, String
	 * pw) { return "user/login"; }
	 */

	// 로그인 페이지 진입
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) {
		// RSA 키 생성
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key != null) { // 기존 key 파기
			session.removeAttribute("RSAprivateKey");
		}
		RSA rsa = rsaUtil.createRSA();
		model.addAttribute("modulus", rsa.getModulus());
		model.addAttribute("exponent", rsa.getExponent());
		model.addAttribute("siteKey", "6Ldj51MUAAAAAMI70zqitVW0e9J9P3ZDdGZ6138Z"); // recap
		session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
		// System.out.println("키받아 갔어요");
		return "user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, RedirectAttributes ra, HttpServletRequest req) {
		// 개인키 취득
		// System.out.println("post요청 왔어요");
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key == null) {
			ra.addFlashAttribute("resultMsg", "비정상적인 접근입니다.");
			return "user/login";
		}

		// session에 저장된 개인키 초기화
		session.removeAttribute("RSAprivateKey");
		// System.out.println("전 "+vo);
		// 아이디/비밀번호 복호화
		try {
			vo.setId(rsaUtil.getDecryptText(key, vo.getId()));
			vo.setPw(sha.encryptSHA(rsaUtil.getDecryptText(key, vo.getPw())));
		} catch (Exception e) {
			ra.addFlashAttribute("resultMsg", "비정상적인 접근입니다.");
			e.printStackTrace();
			return "user/login";
		}

		// 로그인 로직 실행
		UserVO user = service.login(vo.getId(), vo.getPw());
		// System.out.println("후 "+vo);
		if (user.getId() == null) {
			ra.addFlashAttribute("status", "아이디 혹은 비밀번호를 확인해주세요.");
			return "user/login";
		} else {
			req.getSession().setAttribute("userid", user.getId());
			return "redirect:main.do";
		}

	}

    // 로그아웃
    @RequestMapping("/logout.do")
    public String logoutProcess(HttpSession session) {
         session.invalidate();
         return "redirect:main.do";
    }
	
	@RequestMapping(value = "/userview.do", method = RequestMethod.GET)
	public String userview(@RequestParam("id") String uid, Model model) {
		UserVO user = service.getUser(uid);
		model.addAttribute("user", user);
		return "user/user_view";
	}

}