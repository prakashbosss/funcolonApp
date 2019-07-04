package com.funcolon.dao;

import java.util.List;

import com.funcolon.model.User;

public interface UserDao {
	
	public List<User> getUsers();
	public User getUser(User user);
	public void addUser(User u);
	public void updateUser(User u);
	public void deleteUser(int id);
	
	
}
