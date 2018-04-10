package com.wdist.biz.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdist.biz.user.dao.UserDAO;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;

	@Override
	public String login(String id, String pw) {
		return dao.login(id,pw);
	}
	
	
	
}
