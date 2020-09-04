<!-- aunthection if user is login then he can able to go this checkout page -->
<% 
User user = (User) session.getAttribute("current-user");
		if(user==null){
			session.setAttribute("message","you are not login in fist to access checkout page");
			response.sendRedirect("login.jsp");
			return;
			
		}
		%>









<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<%@include file="componet/common_css_js.jsp" %>

</head>
<body>
	<%@include file="componet/navbar.jsp"%>
	 		<%@include file="componet/Common_modal.jsp" %>
	 		
	 		
	 		<div class="container">
	 			<div class="row mt-5">
	 				<div class="col-md-6">
	 					<!-- card details -->
	 					<div class="card">
	 					<div class=card-body>
	 				<h3 class="text-center mb-5"> Your  Selected Items</h3>		
	 					<div class="cart-body">
	 				</div>
	 			</div>
	 			</div>
	 		</div> <!-- end of col-md-6 -->
	 				
	 			<div class="col-md-6">
	 				<!-- form details -->
	 			<div class="card">
	 			<div class="card-body">
	 		<h3 class="text-center mb-5"> Your Details for Order</h3>	
	 		<form>
  				<div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input value="<%=user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				  </div>
				  
			<div class="form-group">
				    <label for="exampleInputEmail1">Your Name</label>
				    <input value="<%=user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
			</div>	
			
  			
  			<div class="form-group">
				    <label for="exampleInputEmail1">Address</label>
				    <input value="<%=user.getUserAddress() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Address">
			</div>	
  			
  			
  			
	
			<div class="container text-center">
				<button class="btn btn-outline-success"> Order Now</button>
				<button class="btn btn-outline-success"> Continue Shopping</button>
				
			</div>
			  
			</form>			
	 		</div>	
	 	</div>	 				
	 	</div>  <!-- end of col-md-6 -->
	 </div>
</div>
	 		
	 </body>		
</html>