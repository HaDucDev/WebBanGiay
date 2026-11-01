<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><title>Product Categories</title></head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="user-data m-b-30">
                <h3 class="title-3 m-b-30"><i class="fas fa-table"></i>Product Categories</h3>
                <div class="table-responsive table-data">
                    <table class="table">
                        <thead><tr><th scope="col">Category ID</th><th scope="col">Category Name</th></tr></thead>
                        <tbody>
                            <c:forEach var="item" items="${categories}">
                                <tr><td><c:out value="${item.id}" /></td><td><c:out value="${item.name}" /></td></tr>
                            </c:forEach>
                            <c:if test="${empty categories}">
                                <tr><td colspan="2">No product categories found.</td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
