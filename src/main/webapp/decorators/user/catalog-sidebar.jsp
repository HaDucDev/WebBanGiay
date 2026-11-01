<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="left-sidebar">
    <h2>Categories</h2>
    <div class="panel-group category-products">
        <div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title">
            <a href="<c:url value='/category'/>">All Products</a>
        </h4></div></div>
        <c:forEach var="catalogCategory" items="${categories}">
            <c:url value="/category" var="categoryUrl"><c:param name="action" value="${catalogCategory.code}" /></c:url>
            <div class="panel panel-default"><div class="panel-heading"><h4 class="panel-title">
                <a href="${categoryUrl}" class="${selectedCategory.id == catalogCategory.id ? 'catalog-category-active' : ''}"><c:out value="${catalogCategory.name}" /></a>
            </h4></div></div>
        </c:forEach>
    </div>
    <p class="catalog-note">Prices are in USD. Browse clothing and footwear for everyday outfits.</p>
</aside>
