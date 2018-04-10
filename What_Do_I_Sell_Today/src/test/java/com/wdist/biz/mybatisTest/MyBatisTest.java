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
import com.wdist.biz.user.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MyBatisTest {
	@Resource(name="deptService")
	DeptService service;

	@Autowired
	UserService userservice;
	
	@After
	public void tearDown() throws Exception {
		service = null;
	}
	
	@Test
	public void login() {
		String id = "ididid";
		String pw = "wpwpwpwpwp";
		System.out.println("����");
		String tmp=userservice.login(id, pw);
		System.out.println(tmp);
		
	}

	@Test
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
}
