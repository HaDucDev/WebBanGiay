<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shop" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Home | E-Shopper</title></head>
<body>
<section id="slider">
    <div class="container">
        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                <li data-target="#slider-carousel" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <div class="col-sm-6">
                        <h1><span>E</span>-SHOPPER</h1>
                        <h2>Style for Every Day</h2>
                        <p>Discover dresses, tops, trousers and footwear. Find your next outfit in our latest collection.</p>
                        <a href="<c:url value='/category'/>" class="btn btn-default get">Shop All Products</a>
                    </div>
                    <div class="col-sm-6">
                        <img src="<c:url value='/assets/user/images/home/girl1.jpg'/>" class="catalog-hero-image img-responsive" alt="Fashion collection" />
                    </div>
                </div>
                <div class="item">
                    <div class="col-sm-6">
                        <h1><span>E</span>-SHOPPER</h1>
                        <h2>Find Your Fit</h2>
                        <p>From printed wide-leg trousers to relaxed joggers and classic jeans.</p>
                        <a href="<c:url value='/category?action=womens-trousers'/>" class="btn btn-default get">Explore Trousers</a>
                    </div>
                    <div class="col-sm-6">
                        <img src="<c:url value='/images/reference/userTu/images/si1.jpg'/>" class="catalog-hero-image img-responsive" alt="Plum joggers styled with a white top" />
                    </div>
                </div>
            </div>
            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev" aria-label="Previous slide"><i class="fa fa-angle-left"></i></a>
            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next" aria-label="Next slide"><i class="fa fa-angle-right"></i></a>
        </div>
    </div>
</section>
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3"><%@ include file="../../decorators/user/catalog-sidebar.jsp" %></div>
            <div class="col-sm-9 padding-right">
                <section class="features_items">
                    <h2 class="title text-center">Featured Products</h2>
                    <div class="row catalog-grid">
                        <c:forEach var="item" items="${topProducts}" end="8"><shop:product-card product="${item}" /></c:forEach>
                    </div>
                </section>
                <section class="features_items">
                    <h2 class="title text-center">New Arrivals</h2>
                    <div class="row catalog-grid">
                        <c:forEach var="item" items="${newProducts}" end="5"><shop:product-card product="${item}" /></c:forEach>
                    </div>
                </section>
                <p class="text-center"><a href="<c:url value='/category'/>" class="btn btn-default get">View All Products</a></p>
            </div>
        </div>
    </div>
</section>
</body>
</html>
