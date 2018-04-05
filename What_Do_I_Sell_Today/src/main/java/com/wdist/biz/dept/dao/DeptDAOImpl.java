package com.wdist.biz.dept.dao;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wdist.biz.dept.vo.DeptVO;
import com.wdist.biz.mybatis.mapper.DeptMapper;

@Component
public class DeptDAOImpl implements DeptDAO{
	@Resource(name="sqlSessionTemplateLinux")
	SqlSession mybatis;
	DeptMapper mapper;
	
	@PostConstruct
	public void init() {
		mapper = (DeptMapper) mybatis.getMapper(DeptMapper.class);
	}
	
	@Override
	public List<DeptVO> getDept() {
		return mapper.getDept();
	}

	@Override
	public int getNum() {
		return mapper.getNum();
	}
}
