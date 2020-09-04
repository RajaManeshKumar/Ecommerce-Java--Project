package com.user.dao;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cart.entity.User;

public class UserDao {
	

	private SessionFactory factory;
   
	
	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
		
	
	public User getUserbyEmailAndPassword(String email,String password) {
		// this reutrn null 
		
		User user=null;
		try {
				String query="from User where userEmail =: e and userPassword =: p";
				Session session=this.factory.openSession();
				Query q=session.createQuery(query);
				q.setParameter("e",email);
				q.setParameter("p",password);
	     		user=(User) q.uniqueResult(); // this will return object of user
				//System.out.println("............."+ user);
				session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return user;
	}
		
	}


	