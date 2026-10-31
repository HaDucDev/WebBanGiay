<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang user.index.jsp</title>
</head>
<body>
<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>STORE</span>-SHOES</h1>
									<h2>Miễn phí ship trong tháng 1</h2>
									<p>Nhanh chóng nhận hàng, giá cả hợp lý </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img style="width: 500px ; height: 300px" src="https://bizweb.dktcdn.net/100/060/439/files/poster-quang-cao-giay-6-copy-0fd3b2d1-9cf6-4536-8734-7ae1b02b0267.jpg?v=1470047263761" class="girl img-responsive" alt="" />
									<img src="/images/home/pricing.png"  class="pricing" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>STORE</span>-SHOES</h1>
									<h2>Các loại giày mới và hot nhất năm nay</h2>
									<p>Cung cấp sản phẩm và chất liệu đạt chuẩn và an toàn cho sức khỏe </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img style="width: 500px; height: 300px"src="https://intphcm.com/data/upload/poster-giay-bitis.jpg" class="girl img-responsive" alt="" />
									<img src="images/home/pricing.png"  class="pricing" alt="" />
								</div>
							</div>
							<style >
							  	.item h1{
							  	margin-top: 0px !importan;
							  	}
							
							</style>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>STORE</span>-SHOES</h1>
									<h2>Giày nam, giày nữ, giày trẻ em</h2>
									<p>Đặt hàng nhanh , nhận hàng ngay !</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img style="width: 500px; height: 300px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpR6Y0ThGiGIz2YS_gqVbmA0lTm6AN57rVhg&usqp=CAU" class="girl img-responsive" alt="" />
									<img src="images/home/pricing.png" class="pricing" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
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
						<h2 class="title text-center">Top Product</h2>
						<c:forEach var="item" items="${topProducts}" >
							<div class="col-sm-4">
								<div class="product-image-wrapper">
									<div class="single-products">
											<div class="productinfo text-center">
												<img src="${item.thumbnail}"  alt="" />
												<h2>${item.price}</h2>
												<p><a href="<c:url value="/product-detail?id=${item.id}" />">${item.name}</a></p>
												<a href="<c:url value="/cart?action=add&&id=${item.id}"/>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
											<div class="product-overlay">
												<div class="overlay-content">
													<h2>$ ${item.price }</h2>
											   	<p><a href="<c:url value="/product-detail?id=${item.id}" />">${item.name}</a></p>
													<a href="<c:url value="/cart?action=add&&id=${item.id}"/>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
											</div>
									</div>
									<!--  
									<div class="choose">
										<ul class="nav nav-pills nav-justified">
											<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
											<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
										</ul>
									</div>
									-->
								</div>
							</div>
						</c:forEach>
						</div>
						</div>
				
						<div class="col-sm-9 padding-right"  style="float: right">
				
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">Sản phẩm đề xuất </h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
								<c:forEach var="item" items="${newProducts}" >
								
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${item.thumbnail}"  alt="" />
													<h2>${item.price}</h2>
													<p>${item.name}</p>
													<a href="<c:url value="/cart?action=add&&id=${item.id}"/>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									</c:forEach>
									
									
								</div>
								<div class="item">	
									<c:forEach var="item" items="${topProducts}" >
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${item.thumbnail}"  alt="" />
													<h2>${item.price}</h2>
													<p>${item.name}</p>
													<a href="<c:url value="/cart?action=add&&id=${item.id}"/>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>											
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					
				</div>
			</div>
		</div>
	</section>
</body>
</html>