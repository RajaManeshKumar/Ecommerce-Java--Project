<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Form</title>

	<%@include file="componet/common_css_js.jsp"%>

</head>
<body>
		<%@include file="componet/navbar.jsp" %>
      <div class="container-fluid">		
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
			   <div class="card">
			   <%@include file="componet/message.jsp" %>
				 <div class="card-body px-5">
					  
				<img class="rounded mx-auto d-block" src="image/human.png" width="80px" height="80px">		  
				<h2 class="text-center my-3" >Sign Up</h2>
				<form action="RegisterServlet" method="post">
					<div class="form-group">
    					<label for="name">User Name</label>
    					<input name="names" type="text" class="form-control" id="name" placeholder="your name" aria-describedby="emailHelp" placeholder="Enter email">
  					</div>
  					<div class="form-group">
    					<label for="email">User Email</label>
    					<input name="email" type="email" class="form-control" id="email" placeholder="your email" aria-describedby="emailHelp" placeholder="Enter email">
  					</div>
  					<div class="form-group">
    					<label for="password">User Password</label>
    					<input name="pass" type="password" class="form-control" id="password" placeholder="your password" aria-describedby="emailHelp" placeholder="Enter email">
  					</div>
  					<div class="form-group">
	    				<label for="phone">User Phone</label>
	    				<input name="phoneNo" type="number" class="form-control" id="phone" placeholder="your number" aria-describedby="emailHelp" placeholder="Enter email">
  					</div>
					<div class="form-group">
	    				<label for="address">User Address</label>
						<textarea name="address" style="height:100px" class="form-control" placeholder="your address"></textarea>
	  				</div>
  						<div class="cotainer text-center ">
  						<button class="btn btn-outline-success">Register</button>
  						<button type="reset" class="btn btn-outline-warning">Reset</button>
  					</div>
  					
				</form>
						
				</div>  <!-- End of card body -->
			 </div> <!-- End of card -->
			</div> <!--   End of col-->
		</div>  <!--  End of row-->
	</div> <!-- End of fluit it is using for removing the horizontal fluid -->	
		
</body>
</html>