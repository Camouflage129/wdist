package com.wdist.biz.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.wdist.biz.dept.vo.DeptVO;

public interface DeptMapper {
	@Select("select deptno, dname, dloc from dept")
	public List<DeptVO> getDept();
	
	@Select("select deptno from dept where deptno = 10")
	public int getNum();
}
