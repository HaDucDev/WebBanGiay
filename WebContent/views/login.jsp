<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<head>
<!-- Required meta tags-->

<!-- Title Page-->
<title>Login</title>

<!-- Fontfaces CSS-->


</head>
<%  
     String resultLogin = (String)request.getAttribute("result");
    if(resultLogin == null){
    	resultLogin = "";
    }
  %>
<body class="animsition">
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						<form  action="<c:url value="/login?action=login"  />" method="post" name="login">
							<input type="text" placeholder="Username" name="username" value="admin" />
							<input type="password" placeholder="Password" name="password" value="123456" />
							<c:if test="${not empty message}" >
					                  <div>
											      <!--   <p class="text-success" style="color: #28a745">.text-success</p> -->
											        <p class="text-danger" style="color: #dc3545"><c:out value = "Vui lòng kiểm tra lại"/> </p>
										 </div>
					      </c:if>
						   <div>
						      <!--   <p class="text-success" style="color: #28a745">.text-success</p> -->
						       
						   </div>
							<span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span>
							
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="<c:url value="/register?action=register"  />" method="post" name="register">
							<input type="text" placeholder="Name" name="name" required/>
							<input type="email" placeholder="Email " name="username" required/>
							<input type="password" placeholder="Password" name="password" required/>
							<input type="text" placeholder="Address" name="address" required/>
							<input type="text" placeholder="Phone" name="phone" required/>
							<h6>${resultregister}</h6>
							<button type="submit" class="btn btn-default">Đăng kí</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->


</body>

</html>
<!-- end document-->