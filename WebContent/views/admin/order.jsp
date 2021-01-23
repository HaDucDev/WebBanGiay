<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="main-content" style="padding-top: 50px !important">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                    <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1" style="margin-bottom: 24px; font-weight: bold">Đơn hàng</h2>
                                
                                </div>
                            </div>
                        </div>
                        
<div class="row">
      <div class="col-lg-6 	">
          <div class="table-responsive table--no-card m-b-30">
              <table class="table table-borderless table-striped table-earning">
                  <thead>
                  
                      <tr>
                          <th>Username</th>
                          <th>Create Date</th>
                          <th>Detail</th>
                         
                      </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="item" items="${carts}" >
                      <tr>
                          <td>${item.u_id}</td>
                          <td>${item.buydate}</td>
                          <td><a href="<c:url value="/admin/order?action=cart-detail&id=${item.id}"/> "><input type="submit" class="btn btn-info" value=">"></a></td>
                      </tr>         
                      </c:forEach>
                  </tbody>
              </table>
          </div>
      </div>
      <div class="col-lg-12	" style="padding-top: 24px">
          <div class="table-responsive table--no-card m-b-30">
              <table class="table table-borderless table-striped table-earning">
                  <thead>
                      <tr>
                          <th>Name Product</th>
                          <th>Price</th>
                          <th>Quantity</th>
                          <th >Category</th> 
                          <th></th>
                      </tr>
                  </thead>
                  <tbody>
                  <h1></h1>
                       <c:forEach var="item" items="${cartitems}" >
                  
                      <tr>
                          <td>${item.pro_id}</td>
                          <td>${item.price}</td>
                          <td>${item.quantity}</td>
                          <td>${item.cart_id}</td>
                          <td>
                              <div class="table-data-feature">
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                     <a href="#" class="edit" data-toggle="modal"	
										data-id="${item.id}" data-proid="${item.pro_id}" data-cartid="${item.cart_id}" data-quantity="${item.quantity}" data-price="${item.price}"
										 data-target="#editEmployeeModal"
									>
                                       <i class="fa fa-edit"></i>
                                        </a>
                                    </button>
                                    <button class="item" data-toggle="tooltip" data-placement="top" title="Delete">
                                        <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"  data-id="${item.id}"><i class="fa fa-trash"></i></a>
                                    </button>
                                  </div>
                          </td>
                      </tr>
                      </c:forEach>
                  </tbody>
              </table>
          </div>
      </div>
      
  </div>
  </div>
  </div>
  </div>
  
  <div id="detail" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="edit" method="post" action="<c:url value="/admin/order?action=add" /> " >
				<div class="modal-header">						
					<h4 class="modal-title">Edit User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				
				<div class="modal-body" >		
				    	<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="cartid">
						</div>
						<div class="form-group">
							<label>Price</label>
							<input type="text" class="form-control"  name="proid">
						</div>
						
						<div class="form-group">
							<label>Quantity</label>
							<input type="text" class="form-control"  name="quantity">
						</div>	
						<div class="form-group">
							<label>Password</label>
							<input type="text" class="form-control"  name="price">
						</div>	
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Update">
				</div>
			</form>
		</div>
    </div>		
</div>
  <div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="edit" method="post" action="<c:url value="/admin/order?action=add" />" >
				<div class="modal-header">						
					<h4 class="modal-title">Edit User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				
				<div class="modal-body" >		
				    	<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="cartid">
						</div>
						<div class="form-group">
							<label>Price</label>
							<input type="text" class="form-control"  name="proid">
						</div>
						
						<div class="form-group">
							<label>Quantity</label>
							<input type="text" class="form-control"  name="quantity">
						</div>	
						<div class="form-group">
							<label>Password</label>
							<input type="text" class="form-control"  name="price">
						</div>	
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Update">
				</div>
			</form>
		</div>
    </div>		
</div>
  <!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="edit" method="post" action=" <c:url value="/admin/order?action=edit-cart-item" />  " >
				<div class="modal-header">						
					<h4 class="modal-title">Edit User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				
				<div class="modal-body" >	
				      <input type="hidden" name="id"/>	
				    	<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="cartid">
						</div>
						<div class="form-group">
							<label>Pro id</label>
							<input type="text" class="form-control"  name="proid">
						</div>
						
						<div class="form-group">
							<label>Quantity</label>
							<input type="text" class="form-control"  name="quantity">
						</div>	
						<div class="form-group">
							<label>Password</label>
							<input type="text" class="form-control"  name="price">
						</div>	
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Update">
				</div>
			</form>
		</div>
    </div>		
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="delete" method="post" action ="  <c:url value="/admin/order?action=delete-cart-item" />   ">
				<div class="modal-header">						
					<h4 class="modal-title">Delete User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">		
			    	<input type="text" value="" name="id" />			
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</div>
</div>
 <script type="text/javascript">
									 $(document).ready(function(){
										 $("#editEmployeeModal").on('show.bs.modal', function(e) {
											  
											   var id = $(e.relatedTarget).data('id');
											   var price = $(e.relatedTarget).data('price');
											   var proid = $(e.relatedTarget).data('proid');
											   var cartid = $(e.relatedTarget).data('cartid');
											   var quantity = $(e.relatedTarget).data('quantity');
											 
											  $(e.currentTarget).find('input[name="id"]').val(id);
											  $(e.currentTarget).find('input[name="price"]').val(price);
											  $(e.currentTarget).find('input[name="proid"]').val(proid);
										      $(e.currentTarget).find('input[name="cartid"]').val(cartid);
									    	  $(e.currentTarget).find('input[name="quantity"]').val(quantity);
											  
											});
										 
										 $("#deleteEmployeeModal").on('show.bs.modal', function(e) {
											   var id = $(e.relatedTarget).data('id');
											  $(e.currentTarget).find('input[name="id"]').val(id);
											});
									 })
   					 </script>


</body>
</html>