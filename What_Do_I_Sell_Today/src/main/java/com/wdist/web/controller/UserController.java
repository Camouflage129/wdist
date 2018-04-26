package com.wdist.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.PrivateKey;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wdist.biz.user.service.UserService;
import com.wdist.biz.user.vo.UserVO;
import com.wdist.encryption.RSA;
import com.wdist.encryption.RSAUtil;
import com.wdist.encryption.SHAUtil;
import com.wdist.encryption.VerifyRecaptcha;

@Controller
public class UserController {
	
	SHAUtil sha = new SHAUtil();
	RSAUtil rsaUtil = new RSAUtil();

	@Resource(name = "UserService")
	UserService service;

	@RequestMapping(value="/interceptor.do")
	public String interceptor() {
		return "interceptor";
	}
	
	@RequestMapping(value = "/recapcha.do", method = RequestMethod.POST)
	public ModelAndView reCapcha(HttpServletRequest req) {
		VerifyRecaptcha.setSecretKey("6Ldj51MUAAAAAD1gMJ_ZZhOtpW4xTbNNiCsvgQGW"); // secretKey 세팅
		String gRecaptchaResponse = req.getParameter("recaptcha"); // recapcha 파라미터 가져오기
		boolean verify = false;
		try {
			verify = VerifyRecaptcha.verify(gRecaptchaResponse);
		} catch (IOException e) {
			e.printStackTrace();
		} // 리캡챠 인증 true,false 설공 실패 리턴
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
	public void signUpDo(HttpSession session, RedirectAttributes ra, UserVO vo, HttpServletResponse response) {
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		if (key == null) {
			ra.addFlashAttribute("resultMsg", "비정상 적인 접근 입니다.");
		}
		session.removeAttribute("RSAprivateKey");

		try {
			vo.setEmail(rsaUtil.getDecryptText(key, vo.getEmail().trim()));
			vo.setId(rsaUtil.getDecryptText(key, vo.getId()));
			vo.setPw(rsaUtil.getDecryptText(key, vo.getPw()));
			vo.setName(rsaUtil.getDecryptText(key, vo.getName()));
			vo.setPwdhint(rsaUtil.getDecryptText(key, vo.getPwdhint()));
			vo.setPwdans(rsaUtil.getDecryptText(key, vo.getPwdans()));

		} catch (Exception e) {
			e.printStackTrace();
			out.print("fail");
		}
		if (service.insertAccount(vo) == 1) {
			out.print("success");
		}
		else
			out.print("fail");
	}

	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public void checkIdDo(String id,HttpServletResponse response) {
		boolean boo = service.checkId(id);
		PrintWriter out;
		try {
			out = response.getWriter();
	//	System.out.println("ID 중복확인 결과" + boo);
		if (boo)
			out.print("true");
		else
			out.print("false");
		out.flush();
		out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
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
			vo.setPw(rsaUtil.getDecryptText(key, vo.getPw()));
		} catch (Exception e) {
			ra.addFlashAttribute("resultMsg", "비정상적인 접근입니다.");
			e.printStackTrace();
			return "user/login";
		}
		// 로그인 로직 실행
		UserVO user = service.login(vo.getId(), vo.getPw());
		// System.out.println("후 "+vo);
		if (user == null) {
			ra.addFlashAttribute("status", "아이디 혹은 비밀번호를 확인해주세요.");
			return "redirect:login.do";
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

	// 회원 정보 보기
	@RequestMapping(value = "/userview.do", method = RequestMethod.GET)
	// public String userview(@RequestParam("id") String uid, Model model) {
	public String userview(HttpSession session, Model model) {
		// RSA 키 생성
		
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key != null) { // 기존 key 파기
			session.removeAttribute("RSAprivateKey");
		}
		RSA rsa = rsaUtil.createRSA();
		model.addAttribute("modulus", rsa.getModulus());
		model.addAttribute("exponent", rsa.getExponent());
		session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
		// UserVO user = service.getUser(uid);
		UserVO user = service.getUser((String) session.getAttribute("userid"));
		
		///////UserVO 확인
		System.out.println("userVO : "+user);
		
		model.addAttribute("user", user);
		return "user/userView";
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/removeuser.do")
	public String userRemove(HttpSession session) {
		String id = (String) session.getAttribute("userid");
		System.out.println(service.deleteAccount(id));
	
		session.invalidate();
		return "redirect:main.do";
	}
	
	//회원정보수정
	@RequestMapping(value = "/updateuser.do", method = RequestMethod.POST)
	public String updateuser(UserVO vo, RedirectAttributes ra, HttpSession session) {
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");

		if (key == null) {
			ra.addFlashAttribute("resultMsg", "비정상적인 접근 입니다.");
			return "index";
		}
		session.removeAttribute("RSAprivateKey");

		try {
			System.out.println(vo.getEmail().trim());
			
			vo.setEmail(rsaUtil.getDecryptText(key, vo.getEmail().trim())); 
			vo.setId(rsaUtil.getDecryptText(key, vo.getId()));
			if (vo.getPw().length() != 0) {
				vo.setPw(rsaUtil.getDecryptText(key, vo.getPw()));
			}
			vo.setName(rsaUtil.getDecryptText(key, vo.getName()));
			vo.setPwdhint(rsaUtil.getDecryptText(key, vo.getPwdhint()));
			vo.setPwdans(rsaUtil.getDecryptText(key, vo.getPwdans()));
		} catch (Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("result", "fail");
		}
		int result = 0;
		if (vo.getPw().length() == 0) {
			result = service.updateUserPwNull(vo);
			System.out.println("비밀번호 없는 녀석이 변경함");
		}else {
			result = service.modifyAccount(vo);
			System.out.println("비밀번호 있는 녀석이 변경함");
		}
		 
		if (result == 1) {
			ra.addFlashAttribute("result", "success");
			return "redirect:userview.do";
		}/* else if(vo.get == "" ) {
			
		}*/ else {
			ra.addFlashAttribute("result", "fail");
			return "redirect:main.do";
		}

	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping(value="/searchPwd.do", method=RequestMethod.GET)
	public String searchPwdForm(HttpSession session, Model model) {
		
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key != null) { // 기존 key 파기
			session.removeAttribute("RSAprivateKey");
		}
		RSA rsa = rsaUtil.createRSA();
		model.addAttribute("modulus", rsa.getModulus());
		model.addAttribute("exponent", rsa.getExponent());
		session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
		
		return "user/pwdSearch";
	}
	
	// ID, Name, Email, PwAns, PwHint 체크
	@RequestMapping(value="/searchPwd.do", method=RequestMethod.POST)
	public String infoCheck(HttpSession session, RedirectAttributes ra , UserVO vo, HttpServletRequest req) {
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");

		if (key == null) {
			ra.addFlashAttribute("resultMsg", "비정상 적인 접근 입니다.");
			return "index";
		}
		session.removeAttribute("RSAprivateKey");

		try {
			vo.setId(rsaUtil.getDecryptText(key, vo.getId()));
			vo.setName(rsaUtil.getDecryptText(key, vo.getName()));
			vo.setEmail(rsaUtil.getDecryptText(key, vo.getEmail()));
			vo.setPwdhint(rsaUtil.getDecryptText(key, vo.getPwdhint()));
			vo.setPwdans(rsaUtil.getDecryptText(key, vo.getPwdans()));
		} catch (Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("result", "fail");
		}
		if (service.pwSearchUser(vo) != null) {		
			req.getSession().setAttribute("id", vo.getId());
			req.getSession().setAttribute("info", sha.encryptSHA(vo.getPwdans()+vo.getPwdhint()));
			ra.addFlashAttribute("result", "success");
		}
		else
			ra.addFlashAttribute("result", "fail");
		return "redirect:/signUpNewPwd.do"; // 성공했을 경우 어디로 보낼지 적어주세요
	}
	
	
	
	// 새로운 비밀번호 설정
	@RequestMapping(value="/signUpNewPwd.do", method=RequestMethod.GET)
	public String modifyNewPwd(HttpSession session, Model model) {
		
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key != null) { // 기존 key 파기
			session.removeAttribute("RSAprivateKey");
		}
		RSA rsa = rsaUtil.createRSA();
		model.addAttribute("modulus", rsa.getModulus());
		model.addAttribute("exponent", rsa.getExponent());
		session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
		
		return "user/pwdModify";
	}
	
	@RequestMapping(value="/signUpNewPwd.do", method=RequestMethod.POST)
	public String modifyNewPwd(HttpSession session, RedirectAttributes ra, UserVO vo) {
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");

		if (key == null) {
			ra.addFlashAttribute("resultMsg", "비정상적인 접근 입니다.");
			return "index";
		}
		String pw = vo.getPw();
		session.removeAttribute("RSAprivateKey");
		vo.setId((String)session.getAttribute("id"));
		System.out.println(vo.getId());
		String info = (String)session.getAttribute("info");
		System.out.println(info);
		vo = service.getUser(vo.getId());
		System.out.println(vo);
		System.out.println(vo.getPwdhint());
		System.out.println(vo.getPwdans());
		if(info.equals(sha.encryptSHA(vo.getPwdans()+vo.getPwdhint()))) {
			try {
				vo.setPw(rsaUtil.getDecryptText(key, pw));
				service.modifyNewPwd(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			ra.addFlashAttribute("resultMsg", "비정상적인 접근 입니다.");
		}
			session.removeAttribute("info");
			session.removeAttribute("id");
			
		return "redirect:main.do";

	}
	
	
	// ID 찾기 폼으로 이동
	@RequestMapping(value="/searchId.do", method=RequestMethod.GET)
	public String searchIdForm(HttpSession session, Model model) {
		
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key != null) { // 기존 key 파기
			session.removeAttribute("RSAprivateKey");
		}
		RSA rsa = rsaUtil.createRSA();
		model.addAttribute("modulus", rsa.getModulus());
		model.addAttribute("exponent", rsa.getExponent());
		session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
		
		return "user/searchId";
		
	}
	
	// ID 찾기
	@RequestMapping(value="/searchId.do", method=RequestMethod.POST)
	public void searchId(UserVO vo, HttpServletResponse response) {
//		System.out.println("요청 name"+vo.getName()+" 메일 "+vo.getEmail());
		JSONObject json = new JSONObject();
		UserVO uvo = service.searchId(vo);
		if (uvo != null) {
			json.put("result", uvo.getId());
		}
		else
			json.put("result", "fail");
		try {
			response.getWriter().print(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	
	
	
	
	
	
	
}