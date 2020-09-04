<%@page import="com.helper.Help"%>
<%@page import="com.cart.entity.Category"%>
<%@page import="com.user.dao.CategoryDao"%>
<%@page import="com.cart.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.user.dao.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>

<html>
<head>
	<title>Ecomerce_Shoping	</title>
	<%@include file="componet/common_css_js.jsp" %>
</head>

<body>
<%@include file="componet/navbar.jsp" %>
<!-- Demo  
<% //out.println(FactoryProvider.getFactory()); %>

 -->
 	<div class="container-fluid">
 		<div class="row mt-3 mx-2">
 		
 			<!-- fecting product from productDao  		-->
 			
 		<%
 		
 			String cat=request.getParameter("categ");
 		System.out.println(cat);
 			//out.println(c);
 			ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
 			 List<Product> list=null;
 			 
 			 
 			if(cat==null || cat.trim().equals("all")){
 				list=pdao.getAllProduct();  		
 					
 			}
 			else{
 			  int catId=Integer.parseInt(cat.trim());
 			  		list=pdao.getAllProductById(catId);
 			}
 		
 		//	List<Product> list=pdao.getAllProduct();
			CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist=cdao.getCategory(); 
 		
 		
 			
 		
 		%>
 		
 		
 	<!-- show category -->
 	<div class="col-md-2">
 							   <!--  <h1><%//=clist.size() %></h1>    -->	
 	    <div class="list-group mt-4">
 		   <a href="index.jsp?categ=all" class="list-group-item list-group-item-action active">
 			   All Products</a>
 		<%
 				for(Category category:clist){					
 						//	out.println(category.getCategoryTitle()+"<br>"); 							
 		%>
 				    <a href="index.jsp?categ=<%=category.getCategoryId()%>" class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>
 		<%
 				} // End of loop
 		%>
 		</div> <!--  end of list group -->
 					
 </div>
 				
 	<!-- show product -->
 			
 		<div class="col-md-10">
 				
 			<!-- row -->
 				<div class="row mt-4">				 
 							 <!-- column 12 grades -->
 						
 				<div class="col-md-12">				
					<div class="card-columns">	 							
 									<!--  traversing product -->
 		<%
 				for(Product p:list){
 		%>
 					<div class="card Product">
 						<div class="container text-center">
 							<img class="card-img-top m-2" style="max-height:120px;max-width:100%; width:auto;" src="image/product/<%=p.getpPhoto()%>" alt="Card image cap">
 						</div>
 				   				<div class="card-body">
 							    	<h5 class="card-title"><%=p.getpName()%></h5>
 									  <p class="card-text">
 										 <%=Help.get10Words(p.getpDesc())%></p>
 														
 								</div>   <!-- card-body -->
 						 <div class="card-footer">				
<button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%> ,'<%=p.getpName()%>' , <%=p.getPriceAfterApplyinDsicount() %>)"> Add To Cart</button>
 							<button class="btn btn-outline-success"><%=p.getPriceAfterApplyinDsicount()%>/-<span class="text-secondary Discount-lab"><%=p.getpPrice() %>,<%=p.getpDiscount()%> %  off </span> </button>
 									  			
 						</div>  <!-- card footer -->							
 				</div>  <!-- card -->
 			<% }
 			
 				if(list.size() == 0){
 					out.println("<h3>No item in this category</h3>");
 					
 				}		
 			
 			%>  <!-- End of Product loop -->
 									
 							</div> <!-- card-columns -->
					</div>  <!-- end of col-md-12 -->
  				</div>  	 <!-- end of row mt-4 -->
 			</div>  <!-- end of columns md-8 -->
 		
 		</div>
 </div> <!-- container -->
 
 		<%@include file="componet/Common_modal.jsp" %>
 
</body>


</html>
