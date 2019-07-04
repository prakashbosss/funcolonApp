package com.funcolon.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funcolon.model.User;


@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<User> getUsers() {
		Session session=this.sessionFactory.getCurrentSession();
		session.beginTransaction();
		List<User> listUsers=session.createCriteria(User.class,"FROM User").list();
		session.getTransaction().commit();
		return listUsers;
	}

	@Override
	public User getUser(User u) {
		String hql="FROM User U WHERE U.userName=:userName AND U.userPwd=:userPwd";
		Session session=this.sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query=session.createQuery(hql);
		query.setParameter("userName", u.getUserName());
		query.setParameter("userPwd", u.getUserPwd());
		List<User> listUser=query.list();
		session.getTransaction().commit();
		if(listUser.size()==1)
			return listUser.get(0);
		else
			return null;
	}

	@Override
	public void addUser(User u) {
		
		Session session=this.sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.save(u);
		session.getTransaction().commit();
		
	}

	@Override
	public void updateUser(User u) {
		
		Session session=this.sessionFactory.getCurrentSession();
		session.beginTransaction();
		session.saveOrUpdate(u);
		session.getTransaction().commit();
		
	}

	@Override
	public void deleteUser(int id) {
		
		Session session=this.sessionFactory.getCurrentSession();
		session.beginTransaction();
		User u=(User) session.load(User.class, id);
		session.delete(u);;
		session.getTransaction().commit();
		
	}

}
