package com.funcolon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.funcolon.dao.UserDao;
import com.funcolon.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute User user) {
		ModelAndView model = new ModelAndView("index");
		System.out.println("LoginController.addUser() executed.");
		userDao.addUser(user);
		model.addObject("message", "User added successfully.");	
		model.setViewName("redirect:/user/users");
		return model;
	}
	
	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute User user) {
		ModelAndView model = new ModelAndView("index");
		System.out.println("LoginController.updateUser() executed.");
		userDao.updateUser(user);
		model.addObject("message", "User updated successfully.");
		model.setViewName("redirect:/user/users");
		return model;
	}
	
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable int id) {
		ModelAndView model = new ModelAndView("index");
		System.out.println("LoginController.deleteUser() executed.");
		userDao.deleteUser(id);
		model.setViewName("redirect:/login");
		//model.addObject("message", "User deleted successfully.");		
		return model;
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public ModelAndView getUsers() {
		ModelAndView model = new ModelAndView("index");
		System.out.println("LoginController.getUsers() executed.");
		List<User> users=userDao.getUsers();
		//model.addObject("message", "User deleted successfully.");	
		model.addObject("users", users);
		model.addObject("noUsers",users.size());
		model.setViewName("redirect:/login");
		return model;
	}
}
