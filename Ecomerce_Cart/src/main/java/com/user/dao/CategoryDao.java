package com.user.dao;

import org.hibernate.Transaction;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cart.entity.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	public int saveCategory(Category cat){  // return id
		Session session=this.factory.openSession();// hibernate seesion
		Transaction tx=session.beginTransaction();
		int catId=(Integer)session.save(cat);
		tx.commit();
		session.close();	
		return catId;
	}
	
	// here we are creating method of list it will gives us list of category
	
	public List<Category> getCategory(){
	Session s=this.factory.openSession();
		Query query=s.createQuery("from Category");
		List<Category> list=query.list();
		return list;
		
		
		
	}
	
	// for id of catefory it return single category
	
	public Category getCategoryByid(int cid) {
		Category cat=null;
		try {
		Session session=this.factory.openSession();
		cat=session.get(Category.class,cid);	
		session.close();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return cat;
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
}
