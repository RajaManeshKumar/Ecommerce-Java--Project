<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
	<%@include file="componet/common_css_js.jsp"%>

</head>
<body>
			<%@include file="componet/navbar.jsp" %>
	
		<div class="container">
		  <div class="row">
		    <div class="col-md-6 offset-md-3">
		      <div class="card mt-3">
		      
		      	<div class="card-header custom-bg text-white">
		     		<h2 class="text-center"> Login </h2>
		      </div>
		      
		      <div class="card-body">
		      <%@ include file="componet/message.jsp" %>
		      <form action="LoginServlet" method="post">
	 		 	<div class="form-group">
   				<label for="exampleInputEmail1">Email address</label>
    			<input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
  	</div>
			 <div class="form-group">
   				 <label for="exampleInputPassword1">Password</label>
    			<input name="pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
 	 </div>
 	 				<a class="text-center d-block mb-4 btn btn-primary custom-bg" href="register.jsp">if not register click here</a>
  				<div class="container text-center">
  				<button type="submit" class="btn btn-primary border-0 custom-bg">Submit</button>
  				 <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
  				
  	</div>	
</form>
		      
		      </div>
		      
		      
		    </div>		
		  </div>
		</div>
		
</body>
</html>