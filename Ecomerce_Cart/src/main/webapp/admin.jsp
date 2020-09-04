<%@page import="java.util.HashMap"%>
<%@page import="com.helper.Help"%>
<%@page import="com.cart.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.user.dao.CategoryDao"%>
<%@page import="com.cart.entity.User"%>
<%
	User user = (User) session.getAttribute("current-user");
		if(user==null){
			session.setAttribute("message","you are not login in");
			response.sendRedirect("login.jsp");
			return;
			
		}
		else{
					
			if(user.getUserType().equals("normal")){
				session.setAttribute("message","you are not Admin ! do not access this page");	
				response.sendRedirect("login.jsp");
				return;
			}
		}

%>


<%
CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
	List <Category> list=categoryDao.getCategory();
	// getting count
	
	HashMap<String, Long> m=Help.getCounts(FactoryProvider.getFactory());
	

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
	<%@include file="componet/common_css_js.jsp" %>

</head>
<body>
	<%@include file="componet/navbar.jsp"%>
	
		<div class="container Admincss">
		<!-- Message -->
			<div class="container-fluid mt-3">
			<%@ include file="componet/message.jsp" %>
			</div>
			<!-- Message End -->
		
			<div class="row mt-3">
				<!-- Fist Columns -->
				<div class="col-md-4">
					<div class="card">
						<div class="card-body text-center">
							<div class="container">
								<img style="max-width:100px;"  class="img-fluid rounded-circle" src="image/bussiness-man.png">						
								</div>
							<h1><%=m.get("userCount") %></h1>		
							<h1 class="text-uppercase text-muted">User</h1>
						</div>
					</div>
				</div>
				<!-- Second Columns -->
				
				<div class="col-md-4">
					
					<div class="card">
						<div class="card-body text-center">
							<div class="container">
								<img style="max-width:100px;"  class="img-fluid rounded-circle" src="image/list.png">						
							</div>
						   <h1><%=list.size() %></h1>		
							<h1 class="text-uppercase text-muted">Categories</h1>
						</div>
					</div>
				
				</div>
				
				<!-- Third Columns -->
				
				<div class="col-md-4">
						<div class="card">
						  <div class="card-body text-center">
							<div class="container">
								<img style="max-width:100px;" class="img-fluid rounded-circle" src="image/shopping-cart.png">						
							</div>		  
							<h1><%=m.get("productCount") %></h1>							
							<h1 class="text-uppercase text-muted">Product</h1>
						</div>
						
					</div>
				
				</div>
			
			</div>
			
			<!-- second row -->
			
				<div class="row mt-3">
					<div class="col-md-6">
						<div class="card" data-toggle="modal" data-target="#add-category-modal">
						<div class="card-body text-center">
							<div class="container">
								<img style="max-width:100px;" class="img-fluid rounded-circle" src="image/calculator.png">						
								</div>
								<p class="mt-2">Click here to add new categories</p>	
							<h1 class="text-uppercase text-muted">Add Categories</h1>
						</div>
					</div>
					
					
					</div>
					
			
				<div class="col-md-6">
						
				  <div class="card" data-toggle="modal" data-target="#add-product-modal">
						<div class="card-body text-center">
							<div class="container">
								<img style="max-width:100px;" class="img-fluid rounded-circle" src="image/add.png">						
								</div>
								<p class="mt-2">Click here to add new product</p>	
							<h1 class="text-uppercase text-muted">Add Product</h1>
						</div>
					</div>
					
					</div>
						
				</div>
		
		</div>	
	
	
	
	<!-- Add category modal -->
						<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      			
      			<form action="ProductOperationServlet" method="post">
      				<input type="hidden" name="operation" value="addCategory">
      			
      				<div class="form-group">
      					<input type="text" class="form-control" name="catTittle" placeholder="Enter Category Tittle" required/>      				
      				</div>
      				<div class="form-group">
      					<textarea style="height:200px;" class="form-control" name="catDescription" rows="10" cols="20" placeholder="Enter Category Description"></textarea>      					      				      				
      				</div>
      				<div class="container text-center">
      				<button class="btn btn-outline-success">Add</button>
      		       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 				
      				</div>
      			</form>
           </div>
    </div>
  </div>
</div>
	
	
	<!--End category modal  -->
	
	
	
	
	
	<!-- Add Product modal  -->
						<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      			
      			<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
      			 <input type="hidden" name="operation" value="addProduct">
      				
      			
      				<div class="form-group">
      					<input type="text" class="form-control" name="productTittle" placeholder="Enter Product Tittle" required/>      				
      				</div>
      				<div class="form-group">
      					<textarea style="height:100px;" class="form-control" name="productDescription" rows="10" cols="20" placeholder="Enter product Details"></textarea>      					
      				</div>
      				
      				<div class="form-group">
      					<input type="number" class="form-control" name="productPrice" placeholder="Enter Price of Product" required/>      				
      				</div>
      				
      				<div class="form-group">
      					<input type="number" class="form-control" name="pDsicount" placeholder="Enter Discount of Product" required/>      				
      				</div>
      				
      				<div class="form-group">
      					<input type="number" class="form-control" name="pQunatity" placeholder="Enter Product Quantity" required/>      				
      				</div>
      				
      				<!-- Product category it comes from DataBase -->
      				<!-- Data comes from CategoryDao -->
      				
      			<% 
      		//	CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
      	//		List <Category> list=categoryDao.getCategory();
      			%>	
      				
      			<div class="form-group">
					
						<select name="catId" class="form-control" id="">
						<% for(Category c:list){
						
						 %>
							<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %></option>							
							<% }
						
							%>
						</select>	
      				</div>
      				
      				<!-- product File-->
      				
      				<div class="form-group">
      					<label for="pPic"> Select Picture of Product</label>
      					<br>
      					<input type="file" id="pPic" name="pPic" required/>      				
      				</div>
      				
      				
      				<div class="container text-center">
      				<button class="btn btn-outline-success">Add</button>
      		     	  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 				
      				</div>
      				
      				
      				
      			</form>
           </div>
    </div>
  </div>
</div>
		
	<!-- End  of  Product modal  -->
	
	
	
	
	<!-- when you click from the admin page at that time card is not opening so that we including the  this modals-->
	
	<%@include file="componet/Common_modal.jsp" %>
	
	
</body>
</html>