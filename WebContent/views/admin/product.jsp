<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">

   function changeFunc() {
    var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    alert(selectedValue);
   }

   function click(){
	   console.log("asdf");
	   asd
	   }

   $("#selectBox").change(function(){

	    alert('Selected value: ' + $(this).val());
	});

  </script>
</head>
<body>
<div class="row">
     <div class="col-lg-12">
         <!-- USER DATA-->
         <div class="user-data m-b-30">
             <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1" style="margin-bottom: 24px; font-weight: bold; margin-left: 50px">Sản phẩm</h2>
                                
                                </div>
                            </div>
                        </div>
             <div class="filters m-b-45">
                <!-- 
                 <form style="display: flex" method="post" action="<c:url value="/admin/product?action=category"/>" >
                     <select  class="js-select2" name="category"   >
                         <option selected="selected"  id="selectBox"  >All Category</option> 
                         <option  value="giaynam" > Giày Nam   </a> </option>
                         <option value="giaynu">Giày nữ</option>
                         <option value="giaytreem">Giày trẻ em</option>
                     </select>
             
                     <div class="dropDownSelect2"></div>
                     <input type="submit" class="btn btn-success" value="Apply" style="margin-left: 8px">
                     </form>
                      -->
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
                                 <span >${item.price}</span>
                             </td>
                             <td>
                                 <span ><img src="${item.thumbnail }"/></span>
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
			<form method="post" action="  <c:url value="/admin/product?action=add" /> " name="add" enctype='multipart/form-data'>
				<div class="modal-header">						
					<h4 class="modal-title">Add User</h4>
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
							<label>Price</label>
							<input type="text" class="form-control"  name="price">
						</div>
						<div class="form-group">
						<label>Thumbnail</label>
							<div class="container">
							    <div class="avatar-upload">
							        <div class="avatar-edit">
							            <input type='file' id="imageUpload" class="imageUpload" accept=".png, .jpg, .jpeg" />
							            <label for="imageUpload" class="label-image"></label>
							        </div>
							        <div class="avatar-preview">
							            <div id="imagePreview" class="imagePreview" style="background-image: url(https://blog.teechip.com/wp-content/uploads/2016/05/placeholder.png)">
							            </div>
							              <input id="path" type="hidden" value="" name="thumbnail"/>
							        </div>
							    </div>
							</div>
							</div>
							<script>
							function readURL(input) {
							    if (input.files && input.files[0]) {
							    	console.log("change")
							        var reader = new FileReader();
							        reader.onload = function(e) {
							            $('#imagePreview').css('background-image', 'url('+e.target.result +')');
							            $('#imagePreview').hide();
							            $('#imagePreview').fadeIn(650);
							            $('#path').value(e.target.result);
							            
							        }
							        reader.readAsDataURL(input.files[0]);
							    }
							}
							$("#imageUpload").change(function() {
							    readURL(this);
							    
							});
							</script>
							<style>
							body {
								    background: whitesmoke;
								    font-family: 'Open Sans', sans-serif;
								}
								
								.container {
								    max-width: 960px;
								    margin: 0px auto;
								    padding: 0px;
								}
								
								h1 {
								    font-size: 20px;
								    text-align: center;
								    margin: 20px 0 20px;
								    small {
								        display: block;
								        font-size: 15px;
								        padding-top: 8px;
								        color: gray;
								    }
								}
								
								.avatar-upload {
								    position: relative;
								    max-width: 205px;
								    margin: 0px auto;
								    }
								    .avatar-edit {
								        position: absolute;
								        right: 12px;
								        z-index: 1;
								        top: 10px;
								        }
								        .imageUpload {
								            display: none;
								            }
								             .label-image {
								                display: inline-block;
								                width: 34px;
								                height: 34px;
								                margin-bottom: 0;
								                border-radius: 100%;
								                background: #FFFFFF;
								                border: 1px solid transparent;
								                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
								                cursor: pointer;
								                font-weight: normal;
								                transition: all .2s ease-in-out;
								                &:hover {
								                    background: #f1f1f1;
								                    border-color: #d6d6d6;
								                }
								                &:after {
								                    content: "\f040";
								                    font-family: 'FontAwesome';
								                    color: #757575;
								                    position: absolute;
								                    top: 10px;
								                    left: 0;
								                    right: 0;
								                    text-align: center;
								                    margin: auto;
								                }
								            }
								        
								    
								    .avatar-preview {
								        width: 192px !important;
								        height: 192px  !important;
								        position: relative;
								        border-radius: 100%;
								        border: 6px solid #F8F8F8;
								        box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
								        
								    }
								    .imagePreview{
								           width: 200px !important;
								            height: 200px !important;
								            border-radius: 3px;
								            background-size: cover;
								            background-repeat: no-repeat;
								            background-position: center;
								    }
								}
							</style>
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
                                <option selected="selected" name="promotion" >Promotion</option>
                                <option value="10%">Promotion 1</option>
                                <option value="20%">Promotion 2</option>
                                  <option value="30%">Promotion 3</option>
                                <option value="40%">Promotion 4</option>
                                  <option value="50%">Promotion 5</option>
                            </select>
                          
					   </div>	
						
					
						
						<div class="form-group">
						<label>Categories</label>
						<select class="" name="category">
                                <option selected="selected" name="category">Categories</option>
                                <option value="1">Giày nam</option>
                                <option value="2">Giày nữ¯</option>
                                <option value="3">Giày trẻ em</option>
                                
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
			<form method="post" action="  <c:url value="/admin/product?action=edit" />" name="edit" anctype="multipart/form-data">
				<div class="modal-header">						
					<h4 class="modal-title">Add User</h4>
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
							<label>Price</label>
							<input type="text" class="form-control"  name="price">
						</div>
						<div class="form-group">
						<label>Thumbnail</label>
							<div class="container">
							    <div class="avatar-upload">
							        <div class="avatar-edit">
							            <input type='file' id="imageUpload" class="imageUpload" accept=".png, .jpg, .jpeg" />
							            <label for="imageUpload" class="label-image"></label>
							        </div>
							        <div class="avatar-preview">
							            <div id="imagePreview" class="imagePreview" style="background-image: url(https://blog.teechip.com/wp-content/uploads/2016/05/placeholder.png)">
							            </div>
							              <input id="path" type="hidden" value="" name="thumbnail"/>
							        </div>
							    </div>
							</div>
							</div>
							<script>
							function readURL(input) {
							    if (input.files && input.files[0]) {
							    	console.log("change")
							        var reader = new FileReader();
							        reader.onload = function(e) {
							            $('#imagePreview').css('background-image', 'url('+e.target.result +')');
							            $('#imagePreview').hide();
							            $('#imagePreview').fadeIn(650);
							            $('#path').value(e.target.result);
							            
							        }
							        reader.readAsDataURL(input.files[0]);
							    }
							}
							$("#imageUpload").change(function() {
							    readURL(this);
							    
							});
							</script>
							<style>
							body {
								    background: whitesmoke;
								    font-family: 'Open Sans', sans-serif;
								}
								
								.container {
								    max-width: 960px;
								    margin: 0px auto;
								    padding: 0px;
								}
								
								h1 {
								    font-size: 20px;
								    text-align: center;
								    margin: 20px 0 20px;
								    small {
								        display: block;
								        font-size: 15px;
								        padding-top: 8px;
								        color: gray;
								    }
								}
								
								.avatar-upload {
								    position: relative;
								    max-width: 205px;
								    margin: 0px auto;
								    }
								    .avatar-edit {
								        position: absolute;
								        right: 12px;
								        z-index: 1;
								        top: 10px;
								        }
								        .imageUpload {
								            display: none;
								            }
								             .label-image {
								                display: inline-block;
								                width: 34px;
								                height: 34px;
								                margin-bottom: 0;
								                border-radius: 100%;
								                background: #FFFFFF;
								                border: 1px solid transparent;
								                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
								                cursor: pointer;
								                font-weight: normal;
								                transition: all .2s ease-in-out;
								                &:hover {
								                    background: #f1f1f1;
								                    border-color: #d6d6d6;
								                }
								                &:after {
								                    content: "\f040";
								                    font-family: 'FontAwesome';
								                    color: #757575;
								                    position: absolute;
								                    top: 10px;
								                    left: 0;
								                    right: 0;
								                    text-align: center;
								                    margin: auto;
								                }
								            }
								        
								    
								    .avatar-preview {
								        width: 192px !important;
								        height: 192px  !important;
								        position: relative;
								        border-radius: 100%;
								        border: 6px solid #F8F8F8;
								        box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
								        
								    }
								    .imagePreview{
								           width: 200px !important;
								            height: 200px !important;
								            border-radius: 3px;
								            background-size: cover;
								            background-repeat: no-repeat;
								            background-position: center;
								    }
								}
							</style>
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
                                <option selected="selected" name="promotion" >Promotion</option>
                                <option value="10%">Promotion 1</option>
                                <option value="20%">Promotion 2</option>
                                  <option value="30%">Promotion 3</option>
                                <option value="40%">Promotion 4</option>
                                  <option value="50%">Promotion 5</option>
                            </select>
                          
					   </div>	
						
					
						
						<div class="form-group">
						<label>Categories</label>
						<select class="" name="category">
                                <option selected="selected" name="category">Categories</option>
                                <option value="1">Giày nam</option>
                                <option value="2">Giày nữ¯</option>
                                <option value="3">Giày trẻ em</option>             
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
			<form name="delete" method="post" action =" <c:url value="/admin/product?action=delete " />  ">
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
				   var promotion = $(e.relatedTarget).data('description');
				    var category = $(e.relatedTarget).data('category');
				    var createdate = $(e.relatedTarget).data('createdate');
				

		
				  $(e.currentTarget).find('input[name="id"]').val(id);
				  $(e.currentTarget).find('input[name="name"]').val(name);
				  $(e.currentTarget).find('input[name="price"]').val(price);
			      $(e.currentTarget).find('input[name="thumbnail"]').val(thumbnail);
	
				  $(e.currentTarget).find('textarea[name="description"]').val(description);
				  $(e.currentTarget).find('input[name="category"]').val(category);
				  $(e.currentTarget).find('input[name="createdate"]').val(createdate);

				  
				});
			 
			 $("#deleteEmployeeModal").on('show.bs.modal', function(e) {
				   var id = $(e.relatedTarget).data('id');
				  $(e.currentTarget).find('input[name="id"]').val(id);
				});
		 })
   </script>
<style>
td{
  font-size: 14px;
  height: 50px !important;
  overflow: hidden;
}
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