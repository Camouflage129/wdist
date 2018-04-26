package com.wdist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SuccessController {
	
	@RequestMapping(value="/successPage.do")
	public String succsesspage() {
		return "index.jsp?content=/WEB-INF/views/success/success";
	}
}
