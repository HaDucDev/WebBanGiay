<%@ taglib prefix="shop" tagdir="/WEB-INF/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products | Admin</title>
</head>
<body>
<div class="row">
     <div class="col-lg-12">
         <!-- USER DATA-->
         <div class="user-data m-b-30">
             <h3 class="title-3 m-b-30">
                 <i class="zmdi zmdi-account-calendar"></i>Product Table</h3>
             <div class="filters m-b-45">
                 <div class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
                     <select class="js-select2" name="property">
                         <option selected="selected">All Category</option>
                         <c:forEach var="categoryOption" items="${categories}">
                             <option value="${categoryOption.id}"><c:out value="${categoryOption.name}" /></option>
                         </c:forEach>
                        
                     </select>
                     <div class="dropDownSelect2"></div>
                 </div>
                 <div class="rs-select2--dark rs-select2--sm rs-select2--border" >
                     <select class="js-select2 au-select-dark" name="time">
                         <option selected="selected">All Time</option>
                         <option value="">By Month</option>
                         <option value="">By Day</option>
                     </select>
                     <div class="dropDownSelect2"></div>
                 </div>
                
                 <div class="rs-select2--dark rs-select2--sm rs-select2--dark2" style="float: right">
                        <select class="js-select2" name="type">
                            <option selected="selected">Export</option>
                            <option value="">Option 1</option>
                            <option value="">Option 2</option>
                        </select>
                        <div class="dropDownSelect2"></div>
                    </div>
                     <a  href="#addEmployeeModal" class="" data-toggle="modal"  style="float: right; margin-right: 16px">
                  <div class="table-data__tool-right">
                     <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                        <i class="fa fa-plus"></i>add item</button>
                   
                </div>
                </a>
                    
             </div>
             <div class="table-responsive table-data">
                 <table class="table">
                     <thead>
                         <tr>
                             <td>
                                 <label class="au-checkbox">
                                     <input type="checkbox">
                                     <span class="au-checkmark"></span>
                                 </label>
                             </td>
                             <td>Name</td>
                             <td>Price</td>
                             <td>Thumbnail</td>
                             <td>Description</td>
                             <td>Promotion</td>
                             <td>Category</td>
                             <td>Create Date</td>
                             <td></td>
                         </tr>
                     </thead>
                     <tbody>
                 
                     <c:forEach var="item" items="${products}" >
                         <tr>
                             <td>
                                 <label class="au-checkbox">
                                     <input type="checkbox">
                                     <span class="au-checkmark"></span>
                                 </label>
                             </td>
                             <td>
                                 <div class="table-data__info">
                                     <h6>${item.name}</h6>
                                     
                                 </div>
                             </td>
                              <td>
                                 <span><shop:price value="${item.price}" /></span>
                             </td>
                             <td>
                                 <span >${item.thumbnail}</span>
                             </td>
                             <td>
                                 ${item.description}
                             </td>
                              <td>
                                 <span >${item.promotion}</span>
                             </td>
                               <td>
                                 <span >${item.category}</span>
                             </td>
                               <td>
                                 <span >${item.createdate}</span>
                             </td>
                             <td>
                                    <div class="table-data-feature">
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                       <a href="#" class="edit" data-toggle="modal"	
												data-id="${item.id}" data-name="${item.name}"
												data-price="${item.price}" data-thumbnail="${item.thumbnail}" 
												
												 data-description="${item.description}"
												 data-promotion="${item.promotion}"
												 data-category="${item.category}"
												  data-createdate="${item.createdate}"
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
         <!-- END USER DATA-->
     </div>
     
 </div>
 
 <div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/admin/product?action=add'/>" name="add">
				<div class="modal-header">						
					<h4 class="modal-title">Add Product</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" >		
				<div style="display: flex">
				   <div style="width: 50%; padding: 16px">	
				 
						<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="name">
						</div>
						<div class="form-group">
							<label>Price (USD)</label>
							<input type="text" class="form-control"  name="price">
						</div>
						<div class="form-group">
						<label>Image path</label>
                            <input type="text" name="thumbnail" class="form-control" placeholder="images/reference/userTu/images/pi.png">
                            <small>Use an existing image path relative to the web application. Leave empty for the placeholder.</small>
							</div>
							
							
						</div>	
					
				
					  <div style="width: 50%;padding: 16px">	
					
						<div class="form-group">
						<label>Description</label>
						
						<textarea rows="9" cols="70" class="form-control" name="description" style="font-size: 12px" > 
							Enter description...
							</textarea>
					</div>	
					
						
						<div class="form-group">
						<label>Promotion</label>
						<select class="" name="promotion">
                                <option value="0">No promotion</option>
                                <option value="10">10%</option>
                                <option value="20">20%</option>
                                <option value="30">30%</option>
                                <option value="40">40%</option>
                                <option value="50">50%</option>
                            </select>
                          
					   </div>	
						
					
						
						<div class="form-group">
						<label>Categories</label>
						<select class="form-control" name="category" required>
                                <option value="" disabled selected>Select a category</option>
                                <c:forEach var="categoryOption" items="${categories}">
                                    <option value="${categoryOption.id}"><c:out value="${categoryOption.name}" /></option>
                                </c:forEach>
                                
                            </select>
					   </div>	
					
						
					</div>		
							
					
				</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value='/admin/product?action=edit'/>" name="edit">
				<div class="modal-header">						
					<h4 class="modal-title">Edit Product</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" >		
				<div style="display: flex">
				   <div style="width: 50%; padding: 16px">	
				      <input type="hidden" name="id"/>
						<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="name">
						</div>
						<div class="form-group">
							<label>Price (USD)</label>
							<input type="text" class="form-control"  name="price">
						</div>
						<div class="form-group">
						<label>Image path</label>
                            <input type="text" name="thumbnail" class="form-control" placeholder="images/reference/userTu/images/pi.png">
                            <small>Use an existing image path relative to the web application. Leave empty for the placeholder.</small>
							</div>
							
							
						</div>	
					
				
					  <div style="width: 50%;padding: 16px">	
					
						<div class="form-group">
						<label>Description</label>
						
						<textarea rows="9" cols="70" class="form-control" name="description" style="font-size: 12px" > 
							Enter description...
							</textarea>
					</div>	
						<div class="form-group">
						<label>Promotion</label>
						<select class="" name="promotion">
                                <option value="0">No promotion</option>
                                <option value="10">10%</option>
                                <option value="20">20%</option>
                                <option value="30">30%</option>
                                <option value="40">40%</option>
                                <option value="50">50%</option>
                            </select>
                          
					   </div>	
						
					
						
						<div class="form-group">
						<label>Categories</label>
						<select class="form-control" name="category" required>
                                <option value="" disabled selected>Select a category</option>
                                <c:forEach var="categoryOption" items="${categories}">
                                    <option value="${categoryOption.id}"><c:out value="${categoryOption.name}" /></option>
                                </c:forEach>
                            </select>
					   </div>	
					</div>			
				</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Change">
				</div>
			</form>
		</div>
	</div>		
</div>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="delete" method="post" action="<c:url value='/admin/product?action=delete'/>">
				<div class="modal-header">						
					<h4 class="modal-title">Delete User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">		
			    	<span>ID:</span><input type="text" value="" name="id" />			
					<p>Are you sure you want to delete?</p>	
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>
 <script type="text/javascript">
		 $(document).ready(function(){
			 $("#editEmployeeModal").on('show.bs.modal', function(e) {
				 
				         
				   var id = $(e.relatedTarget).data('id');
				   var name = $(e.relatedTarget).data('name');
				   var price = $(e.relatedTarget).data('price');
				   var thumbnail = $(e.relatedTarget).data('thumbnail');
		
				   var description = $(e.relatedTarget).data('description');
				   var promotion = $(e.relatedTarget).data('promotion');
				    var category = $(e.relatedTarget).data('category');
				    var createdate = $(e.relatedTarget).data('createdate');
				

		
				  $(e.currentTarget).find('input[name="id"]').val(id);
				  $(e.currentTarget).find('input[name="name"]').val(name);
				  $(e.currentTarget).find('input[name="price"]').val(price);
			      $(e.currentTarget).find('input[name="thumbnail"]').val(thumbnail);
	
				  $(e.currentTarget).find('textarea[name="description"]').val(description);
                  $(e.currentTarget).find('select[name="promotion"]').val(promotion);
				  $(e.currentTarget).find('select[name="category"]').val(category);
				  $(e.currentTarget).find('input[name="createdate"]').val(createdate);

				  
				});
			 
			 $("#deleteEmployeeModal").on('show.bs.modal', function(e) {
				   var id = $(e.relatedTarget).data('id');
				  $(e.currentTarget).find('input[name="id"]').val(id);
				});
		 })
   </script>
<style>
.select2-container .select2-selection--single{
height: 38px;
}
.select2-container--default .select2-selection--single .select2-selection__rendered{
line-height: 38px}
.select2-container--default .select2-selection--single .select2-selection__arrow{
height: 38px;}
</style>
</body>
</html>
