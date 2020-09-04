package com.cart.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException
;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.cart.entity.Category;
import com.cart.entity.Product;
import com.helper.FactoryProvider;
import com.user.dao.CategoryDao;
import com.user.dao.ProductDao;

/**
 * Servlet implementation class ProductOperationServlet
 */

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try {
		String op=request.getParameter("operation");	
			if(op.trim().equals("addCategory")) {

				// fetching category details
				String tittle=request.getParameter("catTittle");
				String description=request.getParameter("catDescription");
				
				// category database save

				Category category=new Category();
				category.setCategoryTitle(tittle);
				category.setCategoryDescription(description);
				
				CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
				int id=categoryDao.saveCategory(category);
			//	out.println("category saved :: "+id);
				// 
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message","category added succesfully :"+ id);
				response.sendRedirect("admin.jsp");
				
			}
			else if(op.trim().equals("addProduct")) {
				
			
				// fetching product details
				
				String pTitle=request.getParameter("productTittle");
				String pDescription=request.getParameter("productDescription");
				int productPrice=Integer.parseInt(request.getParameter("productPrice"));
				int pDsicount=Integer.parseInt(request.getParameter("pDsicount"));
				int pQuantity=Integer.parseInt(request.getParameter("pQunatity"));
				int catId=Integer.parseInt(request.getParameter("catId"));
				Part part=request.getPart("pPic");
				
				
				
				Product p=new Product();
				p.setpName(pTitle);
				p.setpDesc(pDescription);
				p.setpPrice(productPrice);
				p.setpDiscount(pDsicount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
				
				// get categroy by id

				CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
				Category category=cdao.getCategoryByid(catId);
				p.setCategory(category);
				// prodcut save
				
				ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
				
				// Find the out the path to upload photo
				String path=request.getRealPath("image") + File.separator + "product" + File.separator + part.getSubmittedFileName();
				System.out.println(path);

				//uploding code
			try {
				FileOutputStream fout=new FileOutputStream(path);// and write  here
				InputStream is= part.getInputStream(); // read data
				
				// reading data
				
				byte []data=new byte[is.available()];
				is.read(data);
				
				// writting data
				
				fout.write(data);
				fout.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
				//out.print("product Save succesfully");
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message","Product added succesfully :"+ catId);
				response.sendRedirect("admin.jsp");
				
			}
			
		} // end of try
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
