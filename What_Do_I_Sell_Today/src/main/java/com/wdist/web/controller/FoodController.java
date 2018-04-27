package com.wdist.web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.wdist.biz.food.service.FoodService;
import com.wdist.biz.food.vo.SaleAvgVO;
import com.wdist.biz.rserve.RServe;

@Controller
public class FoodController {
	
	
	@Resource(name="FoodService")
	FoodService service;
		
	@RequestMapping(value="/foodArea.do")
	public String foodarea() {
		return "index.jsp?content=/WEB-INF/views/food/food";
	}
	
	
	@RequestMapping(value="/foodAreaTitle.do", method = RequestMethod.POST)
	public ModelAndView foodareatitle(String foodtitle, HttpServletRequest request){
		HashMap<String, Object> map = new HashMap<>();
		System.out.println(foodtitle);
		new RServe().getWordCloud(foodtitle);
		map.put("result", "success");
		request.setAttribute("list", "");
		request.setAttribute("wordcloud", foodtitle);
		map.put("list","");
		map.put("wordcloud",foodtitle);
		return new ModelAndView("jsonView", map);
	}
	
	@RequestMapping(value="/areaDesc.do",method = RequestMethod.POST)
	public void areadesc(String area, HttpServletRequest request, HttpServletResponse res) {
		System.out.println("areaDescController진입");
		
		res.setContentType("application/json;charset=UTF-8");
		//String area = request.getParameter("area");
		System.out.println(area);
		
		JsonArray arr = new JsonArray();
		arr.add("ajax결과 분석 값");
		
		try {
			res.getWriter().write(arr.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
		SaleAvgVO vo = new SaleAvgVO();
		
		/*food = service.getAreaFoodTitle(areatitle);
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
		}*/
	}
	
	@RequestMapping(value="/menuDesc.do")
	public String menudesc(HttpServletRequest request) {
		String food = request.getParameter("food");
		System.out.println(food);
		return "index.jsp?content=/WEB-INF/views/area/menu_desc";
	}
	
}	
