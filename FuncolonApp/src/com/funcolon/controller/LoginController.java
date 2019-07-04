package com.funcolon.controller;

import java.awt.PageAttributes.MediaType;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funcolon.dao.UserDao;
import com.funcolon.model.User;
import com.funcolon.service.LoginService;

@Controller

public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	private HttpSession session;

	@Autowired
	private UserDao userDao;

	/*
	 * @ModelAttribute("user") public User setUpUserForm() { return new User(); }
	 */

	@RequestMapping("/")
	public ModelAndView welcome() {
		ModelAndView model = new ModelAndView("index");
		System.out.println("LoginController.welcome() executed.");
		// System.out.println(userDao.getUsers().toString());
		// userDao.getUsers().forEach(s->System.out.println(s.getUserName()));
		model.addObject("message", "Welcome, Guest!");

		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("index");
		System.out.println("LoginController.loginForm() executed.");
		if (request.getSession().getAttribute("user") != null) {
			User u = (User) session.getAttribute("user");
			List<User> users = userDao.getUsers();
			model.addObject("message", "Welcome, " + u.getUserName().toUpperCase());
			model.addObject("users", users);
			System.out.println("No. Users-->" + users.size());
			model.addObject("noUsers", users.size());
		} else
			model.addObject("message", "Welcome, Guest");
		return model;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("index");
		System.out.println("LoginController.logout() executed.");

		// model.addObject("message", "Successfully logged out.");
		// model.addObject("user", new User());
		session.removeAttribute("user");
		model.setViewName("redirect:/");
		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user") User user) {
		System.out.println("User----->" + user.toString());
		ModelAndView model = new ModelAndView("index");
		System.out.println("LoginController.login() executed.");
		// System.out.println("User Name form Request Param--->"+userName);

		User validUser = loginService.validateUser(user);
		if (validUser != null) {
			System.out.println("User is valid.");
			model.addObject("user", validUser);
			List<User> users = userDao.getUsers();
			model.addObject("users", users);
			model.addObject("noUsers",users.size());
			session.setAttribute("user", validUser);
			model.addObject("message", "Welcome, " + validUser.getUserName().toUpperCase() + "!");

		} else {
			System.out.println("User is invalid.");
			model.setViewName("index");
			model.addObject("user", new User());
			session.setAttribute("user", new User());
			model.addObject("message", "Welcome, Guest ");
		}

		return model;
	}

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public
	 * ModelAndView logintest(@ModelAttribute("user") User user) {
	 * System.out.println("From login method, User----->"+user.toString());
	 * //System.out.println("From login method, User name----->"+userName);
	 * ModelAndView model = new ModelAndView("index"); return model; }
	 */

}
