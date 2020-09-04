package com.cart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.entity.User;
import com.helper.FactoryProvider;
import com.user.dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try {
			String email=request.getParameter("email");
			String pass=request.getParameter("pass");
			
			UserDao userdao=new UserDao(FactoryProvider.getFactory());
			User user=userdao.getUserbyEmailAndPassword(email, pass);
			//System.out.println(user); 
			 HttpSession httpsession=request.getSession();
			
			
			if(user==null) {
				httpsession.setAttribute("message","Invalid detials");
				 response.sendRedirect("login.jsp");
				 return;
				 
				//out.println("<h1>Invalid detials</h1>");	
			}
			else{
				out.println("<h1>Welocm"+user.getUserName()+"</h1>");
				
				httpsession.setAttribute("current-user", user);
				
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}
				else if (user.getUserType().equals("normal")) {
				   response.sendRedirect("normal.jsp");	
				}
				else {
					out.println("we have not identified userType");
				}
				
			}
			//autheticantion 
			// for this we make authentication layer it mean dao layer and for thsi we make seprate pakage for it
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	
	}

}
