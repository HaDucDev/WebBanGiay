<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="menu-sidebar d-none d-lg-block">
		<div class="logo">
			<a href="#"> <img
				src="<c:url value="/assets/admin/images/icon/logo.png"/>"
				alt="Cool Admin" />
			</a>
		</div>
		<div class="menu-sidebar__content js-scrollbar1">
			<nav class="navbar-sidebar">
				<ul class="list-unstyled navbar__list">
					<li class="active has-sub">
					<a
						href="<c:url value="/admin"/>"> <i
							class="fas fa-tachometer-alt"></i>Dashboard
					</a>
					</li>
					<li><a href="<c:url value="/admin/order"/>"> <i
							class="far fa-check-square"></i>Orders
					</a></li>
					<li><a href="<c:url value="/admin/product"/>"> <i
							class="fas fa-chart-bar"></i>Product
					</a></li>
					<li><a href="<c:url value="/admin/user"/>"> <i
							class="far fa-check-square"></i>User
					</a></li>
					<li><a href="<c:url value="/admin/category"/>"> <i
							class="fas fa-table"></i>Category
					</a></li>
			
						
				</ul>
			</nav>
		</div>
	</aside>
