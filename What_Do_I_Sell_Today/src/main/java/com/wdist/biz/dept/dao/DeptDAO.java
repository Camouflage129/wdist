package com.wdist.biz.dept.dao;

import java.util.List;

import com.wdist.biz.dept.vo.DeptVO;

public interface DeptDAO {
	public List<DeptVO> getDept();
	public int getNum();
}
