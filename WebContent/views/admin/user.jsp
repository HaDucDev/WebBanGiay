<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
     <div class="col-lg-12">
         <!-- USER DATA-->
         <div class="user-data m-b-30">
             <h2 class="title-3 m-b-30"  style="font-weight: bold">
                 <i class="zmdi zmdi-account-calendar"></i>Người dùng</h2>
             <div class="filters m-b-45">
                 <div class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
                    
                 </div>
                 <div class="rs-select2--dark rs-select2--sm rs-select2--border">
                    
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
                             <td>Password</td>
                             <td>Role</td>
                             <td>Address</td>
                             <td>Phone</td>
                             <td>Create Date</td>
                             <td></td>
                         </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="item" items="${users}" >
                         <tr>
                             <td>
                                 <label class="au-checkbox">
                                     <input type="checkbox">
                                     <span class="au-checkmark"></span>
                                 </label>
                             </td>
                             <td>
                                 <div class="table-data__info">
                                     <h6>${item.fullname}</h6>
                                     <span>
                                         <a href="#">${item.username}</a>
                                     </span>
                                 </div>
                             </td>
                           
                             <td>
                                 <span >${item.password}</span>
                             </td>
                             
                             <td>
                                 <c:if test = "${item.role == 'admin'}">
							          <span class="role admin">${item.role}</span>

							      </c:if>
							      <c:if test = "${item.role == 'user'}">
							          <span class="role user">${item.role}</span>

							      </c:if>
							     
							      
                             </td>
                              <td>
                                 <span >${item.address}</span>
                             </td>
                               <td>
                                 <span >${item.phone}</span>
                             </td>
                               <td>
                                 <span >${item.createdate}</span>
                             </td>
                             <td>
                                   <div class="table-data-feature">
                                       
                                       <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                       <a href="#" class="edit" data-toggle="modal"	
												data-id="${item.id}"
												data-name="${item.fullname}" data-username="${item.username}" 
												data-password="${item.password}" data-role="${item.role}"
												data-address="${item.address}" 
												 data-phone="${item.phone}"  data-createdate="${item.createdate}"
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
 <div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value="/admin/user?action=add "/> " name="add" anctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">Add User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" >		
				<div style="display: flex">
				   <div style="width: 50%; padding: 16px">	
				  
						<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="fullname">
						</div>
						<div class="form-group">
							<label>Username</label>
							<input type="text" class="form-control"  name="username">
						</div>	
						<div class="form-group">
							<label>Password</label>
							<input type="text" class="form-control"  name="password">
						</div>	
						
							
							
						
						
					
					</div>	
					  <div style="width: 50%;padding: 16px">	
					  
						<div class="form-group">
						<label>Address</label>
						<input type="text" class="form-control"  name="address">
					</div>		
						<div class="form-group">
						<label>Phone</label>
						<input type="text" class="form-control"  name="phone">
					</div>		
						<div class="form-group">
						<label>Role</label>
						<select class="" name="role">
                                <option value="user" selected="selected">User</option>
                                <option value="admin">Admin</option>
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

<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="<c:url value="/admin/user?action=edit"/> " name="add" anctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">Edit User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body" >		
				<div style="display: flex">
				   <div style="width: 50%; padding: 16px">	
				      <input type="hidden" name="id"/>
						<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control"  name="fullname">
						</div>
						<div class="form-group">
							<label>Username</label>
							<input type="text" class="form-control"  name="username">
						</div>	
						<div class="form-group">
							<label>Password</label>
							<input type="text" class="form-control"  name="password">
						</div>	
						
						
						
					
					</div>	
					  <div style="width: 50%;padding: 16px">	
					  
						<div class="form-group">
						<label>Address</label>
						<input type="text" class="form-control"  name="address">
					</div>		
						<div class="form-group">
						<label>Phone</label>
						<input type="text" class="form-control"  name="phone">
					</div>		
						<div class="form-group">
						<label>Role</label>
						<select class="" name="role">
                                <option selected="" value="user">User</option>
                                <option  selected=""  value="admin">Admin</option>
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
<style>
.section-avatar{
width:100%;
height: 400px;
border: 1px solid gray;
}
</style>
<!-- Delete Modal HTML -->
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="delete" method="post" action ="<c:url value="/admin/user?action=delete " />  ">
				<div class="modal-header">						
					<h4 class="modal-title">Delete User</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">		
			    	<span>ID:</span><input type="text" value="" name="id" />			
					<p>Are you sure you want to delete ?</p>
					
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
			   var avatar = $(e.relatedTarget).data('avatar');
			   var fullname = $(e.relatedTarget).data('name');
			   var username = $(e.relatedTarget).data('username');
			   var password = $(e.relatedTarget).data('password');
			   var role = $(e.relatedTarget).data('role');
			    var address = $(e.relatedTarget).data('address');
			    var phone = $(e.relatedTarget).data('phone');
			    var createdate = $(e.relatedTarget).data('createdate');
			

	
			  $(e.currentTarget).find('input[name="id"]').val(id);
			  $(e.currentTarget).find('input[name="fullname"]').val(fullname);
			 $(e.currentTarget).find('input[name="avatar"]').val(avatar);
		    	$(e.currentTarget).find('input[name="username"]').val(username);
	    	  $(e.currentTarget).find('input[name="password"]').val(password);
			  $(e.currentTarget).find('option[selected="role"]').val(role);


			  
			  $(e.currentTarget).find('input[name="address"]').val(address);
			  $(e.currentTarget).find('input[name="phone"]').val(phone);
			  $(e.currentTarget).find('input[name="createdate"]').val(createdate);		
			  	  
			});
		 
		 $("#deleteEmployeeModal").on('show.bs.modal', function(e) {
			   var id = $(e.relatedTarget).data('id');
			    console.log(id, 'test');
			  $(e.currentTarget).find('input[name="id"]').val(id);
			});
	 })
	 
	 
	 $(document).ready(function(){
  $('#fileInput').on('change', function() {
    var files = $(this)[0].files;

    for(var i = 0; i < files.length; i++) {
      var file = files[i];
      var fileReader = new FileReader();
      fileReader.onload = (function(fileParams) {
        return function(event) {
          var str = '<div class="">' +
            '<img class="img-thumbnail js-file-image" style="width: 100%; height: 100%">' +
            '<input name="avatar" type="file" class="avatar-input" value=""/>'+
          '</div>';
          $('.js-file-list').append(str);

          var imageSrc = event.target.result;
          var fileName = fileParams.name;
          var fileSize = fileParams.size;


          
          $('.js-file-image').last().attr('src', imageSrc);
          $('.avatar-input').last().attr('value', fileName);

        };
      })(file);  
      fileReader.readAsDataURL(file);
    }  
  });
});
  </script>
  
</body>
</html>