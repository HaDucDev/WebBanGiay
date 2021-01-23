<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Trang user.index.jsp</title>
</head>
<body>
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
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="${productDetail.thumbnail }" alt="" />
								<h3>ZOOM</h3>
							</div>
							<div id="similar-product" class="carousel slide" data-ride="carousel">
								
								  
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="images/product-details/new.jpg" class="newarrival" alt="" />
								<h2>${productDetail.name}</h2>
								<p>ID Sản phẩm: ${productDetail.id}</p>
								<span>
									<span>Giá :  $ ${productDetail.price}</span>
								<!-- 	<label>Quantity:</label>
									<input type="text" value="3" /> -->
									<a href="<c:url value="/cart?action=add&&id=${productDetail.id}"/>">
									<button type="button" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Add to cart
									</button>
									</a>
								</span>
								<p><b>Đánh giá:</b> 4 sao</p>
								<p><b>Tên Shop:</b> STORE SHOES</p>
								<a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#details" data-toggle="tab">Details</a></li>
								<li><a href="#reviews" data-toggle="tab">Reivews</a></li>
							
							
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in	" id="details" active >
							<p>${productDetail.description}</p>
							</div>

							<div class="tab-pane fade " id="reviews" >
								<div class="col-sm-12">
									
									<p>Để lại bình luận để đánh giá sản phẩm</p>
									<p><b>Bình luận</b></p>
									
									<form action="#">
										<span>
											<input type="text" placeholder="Your Name"/>
											<input type="email" placeholder="Email Address"/>
										</span>
										<textarea name="" ></textarea>
										<b></b> <img src="images/product-details/rating.png" alt="" />
										<button type="button" class="btn btn-default pull-right">
											Submit
										</button>
									</form>
								</div>
							</div>
							
							
							
						</div>
					</div><!--/category-tab-->
					
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
									<c:forEach var="item" items="${newProducts}" >
								
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${item.thumbnail }" alt="" style="height: 312px !important"/>
													<h2>${item.price}</h2>
													<p><a href="<c:url value="/product-detail?id=${item.id}" />">${item.name}</a></p>
													
													<a href="<c:url value="/cart?action=add&&id=${item.id}"/>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								<div class="item">	
									<c:forEach var="item" items="${newProducts}" >
								
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${item.thumbnail 	 }" alt="" style="height: 312px !important"/>
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