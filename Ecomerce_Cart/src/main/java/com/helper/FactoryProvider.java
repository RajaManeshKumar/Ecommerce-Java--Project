package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {




    private static SessionFactory factory; // this come from org.hibernate
    
    
    
   public static SessionFactory getFactory(){  // this method return session factory
   
       try {
       if(factory==null){

                     

       factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

       }

//     factory=new Configuration().configure().buildSessionFactory();
           
       } catch (Exception e) {
           e.printStackTrace();
       }
       
      return factory;
}
}