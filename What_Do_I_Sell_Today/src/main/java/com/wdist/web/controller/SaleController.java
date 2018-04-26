package com.wdist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SaleController {
	
	@RequestMapping(value="/salePage.do")
	public String salepage() {
		return "index.jsp?content=/WEB-INF/views/sale/sale";
	}
}
