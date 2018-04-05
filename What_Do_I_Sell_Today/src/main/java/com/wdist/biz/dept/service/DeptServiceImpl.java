package com.wdist.biz.dept.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdist.biz.dept.dao.DeptDAO;
import com.wdist.biz.dept.vo.DeptVO;

@Service
public class DeptServiceImpl implements DeptService{
	@Autowired
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
