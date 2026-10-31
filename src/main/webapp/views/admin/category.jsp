<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row">
     <div class="col-lg-12">
         <!-- USER DATA-->
         <div class="user-data m-b-30">
             <h3 class="title-3 m-b-30">
                 <i class="zmdi zmdi-account-calendar"></i>Category Table</h3>
                 <button onClick="click()">click</button>
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
                             <td>ID</td>
                             <td>Name</td>
                             <td></td>
                         </tr>
                     </thead>
                     <tbody>
                 
                     <c:forEach var="item" items="${categorys}" >
                         <tr>
                             <td>
                                 <label class="au-checkbox">
                                     <input type="checkbox">
                                     <span class="au-checkmark"></span>
                                 </label>
                             </td>
                             <td>
                                 <div class="table-data__info">
                                     <h6>${item.id}</h6>
                                     
                                 </div>
                             </td>
                              <td>
                                 <span >${item.name}</span>
                             </td>
                          
                             <td>
                                    <div class="table-data-feature">
                                        <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                       <a href="#" class="edit" data-toggle="modal"	
												data-id="${item.id}" data-name="${item.name}"
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
			<form method="post" action="/Icommerceshoes/admin/product?action=add" name="add" anctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">Add User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" >		
				<div style="display: flex">
				   
				 
						<div class="form-group">
							<label>ID</label>
							<input type="text" class="form-control"  name="id">
						</div>
						<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="name">
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

 <div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="/Icommerceshoes/admin/product?action=add" name="add" anctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">Add User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" >		
				<div style="display: flex">
				   
				 
						<div class="form-group">
							<label>ID</label>
							<input type="text" class="form-control"  name="id">
						</div>
						<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="name">
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
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="delete" method="post" action ="/Icommerceshoes/admin/product?action=delete ">
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
				 
				

		
				  $(e.currentTarget).find('input[name="id"]').val(id);
				  $(e.currentTarget).find('input[name="name"]').val(name);
			
				  
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