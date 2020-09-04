package com.helper;


import java.util.HashMap;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.mapping.Map;

public class Help {
	public static String get10Words(String des) {	
		//System.out.println("Helo Des::"+des);
	String str[]=des.split(" ");
	if(str.length > 10) {

		  String res="";
			   for(int i=0; i<10; i++){
				 //  System.out.println(str[i]);
				   		res=res+str[i]+" ";	
	

			   }
			   System.out.println("Hi manesh:"+res);

			   return (res+"...");
			
			}else{
				
				return (des+"...");		
		}
	}
	
	
	public  static HashMap<String, Long> getCounts(SessionFactory factory) {
		
		Session session=factory.openSession();
		String q="Select count(*) from User";
		String q1="Select count(*) from Product";
		Query query=session.createQuery(q);
		Query query1=session.createQuery(q1);

		Long userCount= (Long) query.list().get(0);
		Long productCount= (Long) query1.list().get(0);

		HashMap<String, Long> map=new HashMap<String, Long>(); 
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		System.out.println(" counts  ::"+productCount);

		session.close();
		return map;
	}
		
}
