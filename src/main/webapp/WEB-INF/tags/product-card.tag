<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="product" required="true" type="Model.ProductModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shop" tagdir="/WEB-INF/tags" %>
<c:url value="/product-detail" var="detailUrl"><c:param name="id" value="${product.id}" /></c:url>
<c:url value="/cart" var="cartUrl"><c:param name="action" value="add" /><c:param name="id" value="${product.id}" /></c:url>
<article class="col-sm-6 col-md-4 catalog-product">
    <div class="product-image-wrapper">
        <div class="single-products">
            <div class="productinfo text-center">
                <a href="${detailUrl}"><shop:product-image thumbnail="${product.thumbnail}" alt="${product.name}" /></a>
                <h2><shop:price value="${product.price}" /></h2>
                <p class="catalog-product-name"><a href="${detailUrl}"><c:out value="${product.name}" /></a></p>
                <a href="${cartUrl}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i> Add to cart</a>
            </div>
        </div>
    </div>
</article>
