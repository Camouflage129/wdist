package com.wdist.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.wdist.biz.dept.vo.AreaFoodVO;

@Controller
public class AreaController {
	
	@RequestMapping(value="/areaFood.do")
	public String areafood() {
		return "index.jsp?content=/WEB-INF/views/area/area";	
	}
	
	@RequestMapping(value="/areaFoodTitle.do")
	public void areafoodtitle(String areatitle, HttpServletRequest req, HttpServletResponse res) {
		res.setContentType("application/json;charset=UTF-8");
		
		System.out.println("areaFoodTitle.do controller진입");
		System.out.println(areatitle);
		
		JsonArray arr = new JsonArray();
		AreaFoodVO food = new AreaFoodVO();		
		
		food.setFood1("한식");
		food.setFood2("일식");
		food.setFood3("중식");
		food.setFood4("카페");
		food.setFood5("양식");
		
		arr.add(food.getFood1());
		arr.add(food.getFood2());
		arr.add(food.getFood3());
		arr.add(food.getFood4());
		arr.add(food.getFood5());
		
		try {
			res.getWriter().write(arr.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/menuDesc.do")
	public String menudesc(HttpServletRequest request) {
		String food = request.getParameter("food");
		System.out.println(food);
		return "index.jsp?content=/WEB-INF/views/area/menu_desc";
	}
}
