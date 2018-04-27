package com.wdist.biz.mybatisTest;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wdist.biz.food.service.FoodService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MyBatisTest {
	
	//@Autowired
	@Resource(name="FoodService")
	FoodService foodservice;
	
	@After
	public void tearDown() throws Exception {
		foodservice = null;
	}
		
	@Test
	public void getfoodVO() {
		System.out.println(foodservice.getFoodAreaTitle("한식"));
	}
}
