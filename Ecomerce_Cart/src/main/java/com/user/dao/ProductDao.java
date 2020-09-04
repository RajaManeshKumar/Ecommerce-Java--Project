package com.user.dao;

import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.util.List;
import com.cart.entity.Product;
import com.helper.FactoryProvider;

public class ProductDao {


	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) {
		boolean f=false;
		try {
		Session session=this.factory.openSession();
		Transaction tx=session.beginTransaction();
		session.save(product);
		tx.commit();
		session.close();
		f=true;
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}	
	
	//get all product
	public List<Product> getAllProduct(){
				
		Session session=this.factory.openSession();
		Query query=session.createQuery("from Product");
		List<Product> list=query.list();
		return list;

		
	}	
		// get All product of given event category
	//public static int id;
	public List<Product> getAllProductById(int cid){
		//id=cid;
		 Session session=this.factory.openSession();
		Query query=session.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id",cid);
		List<Product> list=query.list();
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+list+":"+cid);
		return list;

		
	}	
	
		
	
}
