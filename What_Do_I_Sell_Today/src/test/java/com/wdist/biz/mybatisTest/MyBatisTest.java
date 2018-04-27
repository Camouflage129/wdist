package com.wdist.biz.mybatisTest;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wdist.biz.dept.service.DeptService;
import com.wdist.biz.dept.vo.DeptVO;
import com.wdist.biz.food.service.FoodService;
import com.wdist.biz.food.vo.FoodAreaVO;
import com.wdist.biz.user.service.UserService;
import com.wdist.biz.user.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MyBatisTest {
	@Resource(name="deptService")
	DeptService service;
	
	@Autowired
	UserService userservice;
	
	//@Autowired
	@Resource(name="FoodService")
	FoodService foodservice;
	
	@After
	public void tearDown() throws Exception {
		service = null;
	}
	
	@Test
	public void login() {
	//	UserVO vo = new UserVO("java01", "1234");
		System.out.println("dscsd");
		UserVO tmp=userservice.login("java01", "1234");
		System.out.println("결과"+tmp);
		
	}
	
	
	//@Test
	public void test() {
		System.out.println(service.getDept());
		List<DeptVO> table = service.getDept();
		Iterator<DeptVO> it = table.iterator();
		while(it.hasNext()) {
			DeptVO data = it.next();
			System.out.println(data);
		}
	}
	
	//@Test
	public void getNumTest() {
		System.out.println(service.getNum());
	}
	
	/*@Test
	public void getfoodVO() {
		System.out.println(foodservice.getFoodAreaTitle("한식"));
	}*/
}
