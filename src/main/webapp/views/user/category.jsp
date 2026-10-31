<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <title>Insert title here</title>
</head>
<body>
<section id="advertisement">
		<div class="container">
			<img src="images/shop/advertisement.jpg" alt="" />
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Danh mục</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a  href="<c:url value="/category?action=giay-nam" /> ">
											Giày nam
										</a>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a  href="<c:url value="/category?action=giay-nu" /> ">
											Giày nữ
										</a>
									</h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a  href="<c:url value="/category?action=giay-tre-em" /> ">
											Giày trẻ em
										</a>
									</h4>
								</div>
							</div>
						</div><!--/category-products-->				
						<div class="shipping text-center"><!--shipping-->
							<img src="images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
					
					</div>
				</div>
				 	
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Sản phẩm</h2>
				
						<c:forEach var="item" items="${products}">
							<div class="col-sm-4">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="${item.thumbnail}"alt="" style="height: 312px !important"/>
											<h2>${item.price}</h2>
												<p><a href="<c:url value="/product-detail?id=${item.id}" />">${item.name}</a></p>
											<a href="<c:url value="/cart?action=add&&id=${item.id}"/>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2>${item.price}</h2>
												<p><a href="<c:url value="/product-detail?id=${item.id}" />">${item.name}</a></p>
												<a href="<c:url value="/cart?action=add&&id=${item.id}"/>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
								
								</div>
							</div>
						</c:forEach>
						<!-- 
						<ul class="pagination">
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul>
						 -->
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
</body>
</html>