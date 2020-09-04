function add_to_cart(pid,pname,price) 
	{
	
	let cart = localStorage.getItem("cart");	
	if(cart == null){
		
		// no cart
		
		let products=[];
        let product = {productId:pid , productName:pname , productQuantiy:1 , productPrice:price}// making object
		products.push(product);
		localStorage.setItem("cart" , JSON.stringify(products));
		console.log("product added for fst time ")
	}
	
else {
		// cart is available
		
		let pcart=JSON.parse(cart); 
		let oldprodcut=pcart.find((item) => item.productId == pid)                // call back function
			if(oldprodcut){
				oldprodcut.productQuantiy=oldprodcut.productQuantiy+1
				
				pcart.map((item)=>{
					if (item.productId == oldprodcut.productId) {
						item.productQuantiy=oldprodcut.productQuantiy;
		}
					
		})
			
	localStorage.setItem("cart",JSON.stringify(pcart));
				
	console.log("product qunatiy is increased ")

				
				// only we have to increase the quantity
				
			}
			else{
//				we have to add the product
				let product={productId:pid,productName:pname,productQuantiy:1,productPrice:price }// making object
					pcart.push(product);
		localStorage.setItem("cart",JSON.stringify(pcart));
				console.log("product  is added ")

			}
		
	}
	
	updateCart();

	}
		// update cart

		function updateCart(){
			
			
			let cartString=localStorage.getItem("cart")
			let cart=JSON.parse(cartString) // getting object
			if(cart==null || cart.length==0){
				console.log("cart is empty !!")
				$(".card-items").html("( 0 )"); // class
				$(".cart-body").html("<h1>Cart doses not has any items</h1>");
				$(".checkout-btn").attr('disabled',true);
			}
			
			else {
			
				// there is show some thing in cart
				console.log(cart)
				
				
				$(".card-items").html(`( ${cart.length} )`); 
				
				let table = `
					
					<table class='table'>
					<thead class='thread-light'>
					<tr>
					<th>items name</th>
					<th>Price</th>
					<th>Quantiy</th>
					<th>Total Price</th>
					<th>Action</th>

					</tr>
				</thead>
				
							
				
							`;
				
				let totalPrice=0;
				cart.map((item)=>{
					table += `
					
					<tr>
					<td>${item.productName}</td>
					<td>${item.productPrice}</td>
					<td>${item.productQuantiy}</td>
					<td>${item.productQuantiy*item.productPrice}</td>
					<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>


					</tr>
										
					`
					totalPrice+=item.productPrice*item.productQuantiy;
					
				})

			table=table + `
			
			<tr><td colspan ='5' class='text-right font-weight-bold'>Total Price : ${totalPrice}</td></tr>
			
			</table>`	
			$(".cart-body").html(table);
				$(".checkout-btn").attr('disabled',false);
				console.log("removed");

				
			}
			
			
		}
		
		
		// deleting item
function deleteItemFromCart(pid){
	let cart=JSON.parse(localStorage.getItem('cart'))
	let newcart=cart.filter((item)=>item.productId !=pid)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
} 		
		
$(document).ready(function(){
		
	updateCart();

})


function goToCheckout(){
	
	window.location="checkout.jsp"
	
}