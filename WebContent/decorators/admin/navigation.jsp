<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
</head>
<body>
	<aside class="menu-sidebar d-none d-lg-block">
		<div class="logo">
			<a href="#"> <img
				src="https://png.pngtree.com/png-clipart/20200225/original/pngtree-beautiful-admin-roles-line-vector-icon-png-image_5256998.jpg"
				alt="Quản lý"  style="width: 70px; height: 70px"/>
			</a>
		</div>
		<div class="menu-sidebar__content js-scrollbar1">
			<nav class="navbar-sidebar">
				<ul class="list-unstyled navbar__list">
					<li class="active has-sub">
					<a
						href="<c:url value="/admin"/>">Thống kê
					</a>
					<li><a href="<c:url value="/admin/order"/>">Đơn hàng
					</a></li>
					<li><a href="<c:url value="/admin/product"/>">Sản phẩm
					</a></li>
					<li><a href="<c:url value="/admin/user"/>">Người dùng
					</a></li>
				    <li><a href="<c:url value="/logout?action=logout"/>">Đăng xuất</a></li> 		
				</ul>
			</nav>
		</div>
	</aside>
</body>
</html>