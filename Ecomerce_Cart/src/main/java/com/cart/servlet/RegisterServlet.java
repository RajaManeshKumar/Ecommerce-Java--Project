package com.cart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;
import org.hibernate.Session;

import com.cart.entity.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
 try {
	String name=request.getParameter("names");
	String email=request.getParameter("email");
	String pass=request.getParameter("pass");
	String phoneNo=request.getParameter("phoneNo");
	String address=request.getParameter("address");
	
	
	//creating user object to store the user data
	 User user=new User(name, email, pass, phoneNo, "default.jpg", address,"normal");
	
	 Session hibernatesession =FactoryProvider.getFactory().openSession();
	 Transaction tx=hibernatesession.beginTransaction();
	 int id=  (Integer) hibernatesession.save(user);
	 tx.commit();
	 hibernatesession.close();
	 // we are using httptsession for storing message session is a object which store value for some time
	// out.println("Succesfully saved !");
	// out.println("<br> user id ! "+id);
	 
	 // we are getting session
	 HttpSession sesssion=request.getSession();
	 // if we have send more value then we have make the object of message
	 // we have only one so that we are making 
	 sesssion.setAttribute("message","Registred Succesfully ! "+ id);
	 response.sendRedirect("register.jsp");
	 return; // nothing executed after this so that we have write the return

	}
	catch (Exception e) {
		e.printStackTrace();
	}
		// TODO: handle exception
	
	
	
	
	
	
	}
}
