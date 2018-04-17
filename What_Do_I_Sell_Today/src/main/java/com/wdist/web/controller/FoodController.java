package com.wdist.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonArray;
import com.wdist.biz.dept.vo.FoodAreaVO;

@Controller
public class FoodController {
	
	@RequestMapping(value="/foodArea.do")
	public String foodarea() {
		return "index.jsp?content=/WEB-INF/views/food/food";
		//return "food/food";
	}
	
	
	@RequestMapping(value="/foodAreaTitle.do")
	public void foodareatitle(String foodtitle, HttpServletRequest req,HttpServletResponse res){
		res.setContentType("application/json;charset=UTF-8");		
		
		System.out.println("foodAreaTitle.do controller진입");
		System.out.println(foodtitle);
			JsonArray arr = new JsonArray();
			
			
			FoodAreaVO areas = new FoodAreaVO();
			areas.setFstArea("강서");
			areas.setSndArea("강북");
			areas.setThdArea("강남");
			areas.setFrthArea("노원");
			areas.setFthArea("마포");
			
			arr.add(areas.getFstArea());
			arr.add(areas.getSndArea());
			arr.add(areas.getThdArea());
			arr.add(areas.getFrthArea());
			arr.add(areas.getFthArea());
			
		
			try {
				res.getWriter().write(arr.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
}	
