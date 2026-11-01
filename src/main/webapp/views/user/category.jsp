<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shop" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title><c:out value="${categoryTitle}" /> | E-Shopper</title></head>
<body>
<section class="catalog-shop">
    <div class="container">
        <div class="row">
            <div class="col-sm-3"><%@ include file="../../decorators/user/catalog-sidebar.jsp" %></div>
            <div class="col-sm-9 padding-right">
                <div class="features_items">
                    <h2 class="title text-center"><c:out value="${categoryTitle}" /></h2>
                    <p class="catalog-note"><c:out value="${productCount}" /> products &middot; Prices in USD</p>
                    <div class="row catalog-grid">
                        <c:forEach var="item" items="${products}"><shop:product-card product="${item}" /></c:forEach>
                    </div>
                    <c:if test="${empty products}"><p>No products in this category yet.</p></c:if>
                    <c:if test="${pageCount > 1}">
                        <nav aria-label="Product pages">
                            <ul class="pagination">
                                <c:forEach var="pageNumber" begin="1" end="${pageCount}">
                                    <c:url value="/category" var="pageUrl">
                                        <c:if test="${not empty selectedCategory}"><c:param name="action" value="${selectedCategory.code}" /></c:if>
                                        <c:param name="page" value="${pageNumber}" />
                                    </c:url>
                                    <c:choose>
                                        <c:when test="${currentPage == pageNumber}"><li class="active"><span aria-current="page">${pageNumber}</span></li></c:when>
                                        <c:otherwise><li><a href="${pageUrl}">${pageNumber}</a></li></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </nav>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
