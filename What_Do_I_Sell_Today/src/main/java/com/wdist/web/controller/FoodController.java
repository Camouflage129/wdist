package com.wdist.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.wdist.biz.food.service.FoodService;
import com.wdist.biz.food.vo.DangerVO;
import com.wdist.biz.food.vo.SaleAvgVO;
import com.wdist.biz.rserve.RServe;

@Controller
public class FoodController {
	
	
	@Resource(name="FoodService")
	FoodService service;
		
	@RequestMapping(value="/foodArea.do")
	public String foodarea() {
		return "food/food";
/*		return "index.jsp?content=/WEB-INF/views/food/food";
*/		//return "food/food";
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
		return "area/area";	
/*		return "index.jsp?content=/WEB-INF/views/area/area";	
*/	}
	
	@RequestMapping(value="/areaFoodTitle.do")
	public void areafoodtitle(String areatitle, HttpServletRequest req, HttpServletResponse res) {
		res.setContentType("application/json;charset=UTF-8");
		Gson gson = new Gson();
		System.out.println("areaFoodTitle.do controller진입");
		System.out.println(areatitle);
		
		JsonArray arr1 = new JsonArray();
		JsonArray arr2 = new JsonArray();
		JsonArray arr3 = new JsonArray();
		JsonArray arr4 = new JsonArray();
		JsonArray arr5 = new JsonArray();
		
		JsonObject obj = new JsonObject();
		List<SaleAvgVO> list1 = new ArrayList<SaleAvgVO>();
		List<SaleAvgVO> list2 = new ArrayList<SaleAvgVO>();
		List<SaleAvgVO> list3 = new ArrayList<SaleAvgVO>();
		List<SaleAvgVO> list4= new ArrayList<SaleAvgVO>();
		DangerVO da = new DangerVO();
		
		list1 = service.fstSaleAvg(areatitle);
		list2 = service.sndSaleAvg(areatitle);
		list3 = service.thrdSaleAvg(areatitle);
		list4 = service.frthSaleAvg(areatitle);
		System.out.println("list : "+list1);
		JsonArray jsona = new JsonArray();
		JsonObject jsono = new JsonObject();
		JsonObject jsono2 = new JsonObject();
		
		JsonArray jaA = new Gson().toJsonTree(list1).getAsJsonArray();
		JsonArray jaB = new Gson().toJsonTree(list2).getAsJsonArray();
		JsonArray jaC = new Gson().toJsonTree(list3).getAsJsonArray();
		JsonArray jaD = new Gson().toJsonTree(list4).getAsJsonArray();
		System.out.println("jaA : "+jaA);
		da = service.warninglever(areatitle);
		
		String json = gson.toJson(da);
		System.out.println("dda : "+json);
		//System.out.println("da : "+jsona.toString());
		jsono.add("list1", jaA);
		jsono.add("list2", jaB);
		jsono.add("list3", jaC);
		jsono.add("list4", jaD);
		jsono.addProperty("danger",json);
		
		
		/*
		if(list1 != null && da != null) {
			for(SaleAvgVO vo: list1) {
				arr1.add(vo.getSale_species());
				arr1.add(vo.getAsale());
			}
			
			for(SaleAvgVO vo: list2) {
				arr2.add(vo.getSale_species());
				arr2.add(vo.getAsale());
			}
			
			for(SaleAvgVO vo: list3) {
				arr3.add(vo.getSale_species());
				arr3.add(vo.getAsale());
			}
			
			for(SaleAvgVO vo: list4) {
				arr4.add(vo.getSale_species());
				arr4.add(vo.getAsale());
			}
			da = service.warninglever(areatitle);
			arr5.add(da.getArea());
			arr5.add(da.getLevel());
			arr5.add(da.getFail());
			
			obj.add("list1",arr1);
			obj.add("list2",arr1);
			obj.add("list3",arr1);
			obj.add("list4",arr1);
			obj.add("danger",arr5);
			
*/			System.out.println(jsono.toString());
			
			try {
				res.getWriter().write(jsono.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		/*}else {
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
