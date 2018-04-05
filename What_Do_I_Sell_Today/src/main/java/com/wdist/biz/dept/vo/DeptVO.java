package com.wdist.biz.dept.vo;

import java.io.Serializable;

public class DeptVO implements Serializable{
	int deptno;
	String dname;
	String dloc;
	
	public DeptVO() {
	}

	public DeptVO(int deptno, String dname, String dloc) {
		this.deptno = deptno;
		this.dname = dname;
		this.dloc = dloc;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDloc() {
		return dloc;
	}

	public void setDloc(String dloc) {
		this.dloc = dloc;
	}

	@Override
	public String toString() {
		return "DeptVO [deptno=" + deptno + ", dname=" + dname + ", dloc=" + dloc + "]";
	}
}
