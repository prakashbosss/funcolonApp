package com.funcolon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funcolon.dao.UserDao;
import com.funcolon.model.User;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public User validateUser(User u) {
		
		System.out.println(u.getUserId());
		User user=userDao.getUser(u);
		System.out.println(user.getUserName());
		if(user.getUserName().equals(u.getUserName()) && user.getUserPwd().equals(u.getUserPwd()))
			return user;
		else
			return null;
		
		
	}

}
