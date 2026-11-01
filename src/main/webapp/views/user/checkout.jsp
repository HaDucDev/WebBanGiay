<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shop" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><title>Order Confirmation | E-Shopper</title></head>
<body>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs"><ol class="breadcrumb">
            <li><a href="<c:url value='/'/>">Home</a></li><li class="active">Order Confirmation</li>
        </ol></div>
        <h2 class="title text-center">Thank you for your order</h2>
        <p>Order #<c:out value="${order.id}" /> has been recorded. All amounts are in USD.</p>
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead><tr class="cart_menu"><th>Item</th><th>Product</th><th>Unit Price</th><th>Quantity</th><th>Total</th></tr></thead>
                <tbody>
                    <c:forEach var="item" items="${orderItems}">
                        <tr>
                            <td class="cart_product"><shop:product-image thumbnail="${item.product.thumbnail}" alt="${item.product.name}" /></td>
                            <td class="cart_description"><h4><c:out value="${item.product.name}" /></h4></td>
                            <td class="cart_price"><p><shop:price value="${item.product.price}" /></p></td>
                            <td><c:out value="${item.quantity}" /></td>
                            <td class="cart_total"><p class="cart_total_price"><shop:price value="${item.totalPrice}" /></p></td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot><tr><td colspan="4" class="text-right"><strong>Order Total</strong></td>
                    <td class="cart_total"><p class="cart_total_price"><shop:price value="${orderTotal}" /></p></td>
                </tr></tfoot>
            </table>
        </div>
        <p><a class="btn btn-default check_out" href="<c:url value='/category'/>">Continue Shopping</a></p>
    </div>
</section>
</body>
</html>
