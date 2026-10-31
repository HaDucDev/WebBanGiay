<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>Insert title here</title>
</head>
<body>

   <h1>
 

    </h1>
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items="${sessionScope.cart}">
						<tr>
							<td class="cart_product">
							<a href=""><img src="${item.value.product.thumbnail}" alt=""></a> 
							</td>
							<td class="cart_description">
								<h4><a href="">${item.value.product.name}</a></h4>
								<p>Product id: ${item.value.product.id}</p>
							</td>
							<td class="cart_price">
								<p>${item.value.product.price}</p>
								
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href="<c:url value="/cart?action=add&&id=${item.value.product.id}"/>"> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="${item.value.quantity }" autocomplete="off" size="2">
									<a class="cart_quantity_down" href="<c:url value="/cart?action=sub&&id=${item.value.product.id}"/>"> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">${item.value.quantity * item.value.product.price }.0 $</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="<c:url value="/cart?action=remove&&id=${item.value.product.id}"/>"><i class="fa fa-times">X</i></a>
							</td>
						</tr>
                       </c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
		
		<div class="step-one">
				<h2 class="heading">Thông tin đặt hàng </h2>
			</div>
			
		
			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-6">
						<div class="shopper-info">
							<p>Shopper Information</p>
							<form>
								<input type="text" placeholder="Tên khách hàng" name="name" value="${USERMODEL.username}" >
								<input type="text" placeholder="Số điện thoại" " name="phone" value="${USERMODEL.phone}">
								<input type="text" placeholder="địa chỉ" name="address" value="${USERMODEL.address}">
							</form>	
						</div>
					</div>
								
				</div>
			</div>
			<div style="display: flex; flex-direction: column;     align-items: flex-end">  
			           <table class="table table-condensed total-result" style="width: 300px">
									<tr>
										<td>Tổng cộng</td>
										
										<c:set var="ageTotal" value="${0}" /> 
											<c:forEach var="item" items="${sessionScope.cart}">
										    <c:set var="ageTotal" value="${ ageTotal  + item.value.quantity * item.value.product.price }" /> 
											  
											</c:forEach>
											<td>${ageTotal} </td>
											
									</tr>
									
									<tr class="shipping-cost">
										<td>Phí vận chuyển</td>
										<td>Free</td>										
									</tr>
									<tr>
										<td>Số tiền cần thanh toán</td>
											<td>${ageTotal} </td>
									</tr>
								</table>
								<a class="btn btn-primary" href="<c:url value="/checkout"/>">Đặt hàng</a>
			</div>
			
			
			
			
				
		
		</div>
	</section><!--/#do_action-->
</body>
</html>