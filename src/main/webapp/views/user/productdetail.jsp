<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shop" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title><c:out value="${productDetail.name}" /> | E-Shopper</title></head>
<body>
<section class="catalog-shop">
    <div class="container">
        <div class="row">
            <div class="col-sm-3"><%@ include file="../../decorators/user/catalog-sidebar.jsp" %></div>
            <div class="col-sm-9 padding-right">
                <div class="product-details">
                    <div class="col-sm-5">
                        <div class="view-product"><shop:product-image thumbnail="${productDetail.thumbnail}" alt="${productDetail.name}" /></div>
                        <c:if test="${empty productDetail.thumbnail}"><p class="catalog-note text-center">Product photo coming soon.</p></c:if>
                    </div>
                    <div class="col-sm-7">
                        <div class="product-information">
                            <h2><c:out value="${productDetail.name}" /></h2>
                            <p>Product ID: ${productDetail.id}</p>
                            <p class="product-description"><c:out value="${productDetail.description}" /></p>
                            <p class="catalog-detail-price"><shop:price value="${productDetail.price}" /></p>
                            <c:url value="/cart" var="addToCartUrl"><c:param name="action" value="add" /><c:param name="id" value="${productDetail.id}" /></c:url>
                            <a href="${addToCartUrl}" class="btn btn-default cart"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                            <p class="catalog-note">Prices are in USD.</p>
                            <c:if test="${not empty selectedCategory}">
                                <c:url value="/category" var="backToCategory"><c:param name="action" value="${selectedCategory.code}" /></c:url>
                                <p><a href="${backToCategory}">Browse <c:out value="${selectedCategory.name}" /></a></p>
                            </c:if>
                        </div>
                    </div>
                </div>
                <section class="features_items">
                    <h2 class="title text-center">You May Also Like</h2>
                    <div class="row catalog-grid">
                        <c:forEach var="item" items="${relatedProducts}" end="5">
                            <c:if test="${item.id != productDetail.id}"><shop:product-card product="${item}" /></c:if>
                        </c:forEach>
                    </div>
                </section>
            </div>
        </div>
    </div>
</section>
</body>
</html>
