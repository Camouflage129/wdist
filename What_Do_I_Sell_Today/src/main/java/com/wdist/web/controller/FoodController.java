package com.wdist.web.controller;


import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonArray;
import com.wdist.biz.food.service.FoodService;
import com.wdist.biz.food.vo.FoodAreaVO;

@Controller
public class FoodController {
	
	
	@Resource(name="FoodService")
	FoodService service;
		
	@RequestMapping(value="/foodArea.do")
	public String foodarea() {
		return "index.jsp?content=/WEB-INF/views/food/food";
		//return "food/food";
	}
	
	
	@RequestMapping(value="/foodAreaTitle.do", method = RequestMethod.POST)
	public void foodareatitle(String foodtitle, HttpServletRequest req, HttpServletResponse res){
		res.setContentType("application/json;charset=UTF-8");		
		
		System.out.println("foodAreaTitle.do controller진입");
		System.out.println(foodtitle);
		
		JsonArray arr = new JsonArray();
		System.out.println("service : "+service.getFoodAreaTitle(foodtitle));
		FoodAreaVO area = service.getFoodAreaTitle(foodtitle);
		System.out.println("area : "+area);
		
		if(area != null) {
			arr.add(area.getFrthArea());
			arr.add(area.getSndArea());
			arr.add(area.getThdArea());
			arr.add(area.getFrthArea());
			arr.add(area.getFthArea());
			
			try {
				res.getWriter().write(arr.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			return;
		}
	}
	
	@RequestMapping(value="/areaDesc.do")
	public String areadesc(HttpServletRequest request) {
		String area = request.getParameter("area");
		System.out.println(area);
		
		
		//service돌려서 해당지역 상세 데이터 받아오는 컨트롤러
		return "index.jsp?content=/WEB-INF/views/food/area_desc";
	}
}	
