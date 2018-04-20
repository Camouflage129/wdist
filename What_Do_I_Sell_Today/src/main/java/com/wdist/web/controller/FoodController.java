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
import com.wdist.biz.food.vo.AreaFoodVO;
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
	
	
	
	
	
	
	/////////////////AreaFood
	
	
	
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
		
		food = service.getAreaFoodTitle(areatitle);
		System.out.println(food);
		
		if(food != null) {
			arr.add(food.getFstFood());
			arr.add(food.getSndFood());
			arr.add(food.getThdFood());
			arr.add(food.getFthFood());
			arr.add(food.getFthFood());
			
			try {
				res.getWriter().write(arr.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			return;
		}
	}
	
	@RequestMapping(value="/menuDesc.do")
	public String menudesc(HttpServletRequest request) {
		String food = request.getParameter("food");
		System.out.println(food);
		return "index.jsp?content=/WEB-INF/views/area/menu_desc";
	}
	
}	
