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
	
	@RequestMapping(value="/areaDesc.do")
	public String areadesc(HttpServletRequest request) {
		String area = request.getParameter("area");
		System.out.println(area);
		//service돌려서 해당지역 데이터 받아오는 컨트롤러
		return "index.jsp?content=/WEB-INF/views/food/area_desc";
	}
}	
