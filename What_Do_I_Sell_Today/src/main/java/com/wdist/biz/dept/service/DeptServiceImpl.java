package com.wdist.biz.dept.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wdist.biz.dept.dao.DeptDAO;
import com.wdist.biz.dept.vo.DeptVO;

@Service("deptService")
public class DeptServiceImpl implements DeptService{
	@Resource(name="deptDAO")
	DeptDAO dao;
	
	@Override
	public List<DeptVO> getDept() {
		return dao.getDept();
	}

	@Override
	public int getNum() {
		return dao.getNum();
	}
}
