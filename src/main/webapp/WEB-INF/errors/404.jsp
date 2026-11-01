<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>404 - Page Not Found | E-Shopper</title>
<link href="<c:url value='/assets/user/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/assets/user/css/main.css'/>" rel="stylesheet">
<link href="<c:url value='/assets/user/css/responsive.css'/>" rel="stylesheet">
</head>
<body>
	<main id="not-found-page" class="container text-center">
		<div class="logo-404">
			<a href="<c:url value='/'/>"><img src="<c:url value='/assets/user/images/home/logo.png'/>" alt="E-Shopper home" /></a>
		</div>
		<div class="content-404">
			<img src="<c:url value='/assets/user/images/404/404.png'/>" class="img-responsive" alt="404 - Page not found" />
			<h1><b>Oops!</b> Page Not Found</h1>
			<p>The page or product you are looking for is unavailable.</p>
			<h2><a href="<c:url value='/'/>">Back to Home</a></h2>
		</div>
	</main>
</body>
</html>
