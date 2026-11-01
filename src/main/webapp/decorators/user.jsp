<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title><decorator:title default="user"></decorator:title></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
 <link href="<c:url value="/assets/user/css/bootstrap.min.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/assets/user/css/font-awesome.min.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/assets/user/css/price-range.css"/>" rel="stylesheet" media="all" >
<link href="<c:url value="/assets/user/css/animate.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/assets/user/css/main.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/assets/user/css/responsive.css"/>" rel="stylesheet" media="all">
<script src="<c:url value="/assets/user/js/jquery.js"/>"></script>
<decorator:head />

</head>
<body>

	<%@include file="./user/header.jsp"%>
		<decorator:body />
	<%@include file="./user/footer.jsp"%>

	<script src="<c:url value="/assets/user/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/jquery.scrollUp.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/price-range.js"/>"></script>
	<script src="<c:url value="/assets/user/js/main.js"/>"></script>
</body>


</html>
