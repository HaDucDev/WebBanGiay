<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<title><decorator:title default="user"></decorator:title></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="<c:url value="/assets/user/css/bootstrap-3.1.1.min.css"/>" rel="stylesheet" media="all">
 <link href="<c:url value="/assets/user/css/bootstrap.min.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/assets/user/css/font-awesome.min.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/assets/user/css/prettyPhoto.css"/>" rel="stylesheet" media="all" >
<link href="<c:url value="/assets/user/css/price-range.css"/>" rel="stylesheet" media="all" >
<link href="<c:url value="/assets/user/css/animate.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/assets/user/css/main.css"/>" rel="stylesheet" media="all">
<link href="<c:url value="/assets/user/css/responsive.css"/>" rel="stylesheet" media="all">

<link rel="shortcut icon" href="<c:url value="/assets/user/images/ico/favicon.ico"/>" media="all">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<c:url value="/assets/user/images/ico/apple-touch-icon-144-precomposed.png"/>" media="all">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<c:url value="/assets/user/images/ico/apple-touch-icon-114-precomposed.png"/>" media="all">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<c:url value="/assets/user/images/ico/apple-touch-icon-72-precomposed.png"/>" media="all">
<link rel="apple-touch-icon-precomposed"
	href="<c:url value="/assets/user/images/ico/apple-touch-icon-57-precomposed.png"/>" media="all"> 

</head>
<body>

	<%@include file="./user/header.jsp"%>
		<decorator:body />
	<%@include file="./user/footer.jsp"%>

	  <script src="<c:url value="/assets/user/js/jquery.js"/>"></script>
	<script src="<c:url value="/assets/user/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/jquery.scrollUp.min.js"/>"></script>
	<script src="<c:url value="/assets/user/js/price-range.js"/>"></script>
	<script src="<c:url value="/assets/user/js/jquery.prettyPhoto.js"/>"></script>
	<script src="<c:url value="/assets/user/js/main.js"/>"></script>
	<style>
	
/*************************
*******Typography******
**************************/
@import url(http://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,700,100);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,800,300,600,700);
@import url(http://fonts.googleapis.com/css?family=Abel);

body {
  font-family: 'Roboto', sans-serif;
  
  position: relative;
  font-weight:400px;
}

ul li {
  list-style: none;
}

a:hover {
outline: none;
text-decoration:none;
}

a:focus {
  outline:none;
  outline-offset: 0;
}

a {
  -webkit-transition: 300ms;
  -moz-transition: 300ms;
    -o-transition: 300ms;
    transition: 300ms;
}

h1, h2, h3, h4, h5, h6 {
  font-family: 'Roboto', sans-serif;
}

.btn:hover, 
.btn:focus{
  outline: none;
  box-shadow: none;
}

.navbar-toggle {
  background-color: #000;
}

a#scrollUp {
  bottom: 0px;
  right: 10px;
  padding: 5px 10px;
  background: #FE980F;
  color: #FFF;
  -webkit-animation: bounce 2s ease infinite;
  animation: bounce 2s ease infinite;
}

a#scrollUp i{
  font-size: 30px;
}


/*************************
*******Header CSS******
**************************/

.header_top {
  background: none repeat scroll 0 0 #F0F0E9;
}

.contactinfo ul li:first-child{
    margin-left: -15px;
}

.contactinfo ul li a{
  font-size: 12px;
  color: #696763;
  font-family: 'Roboto', sans-serif;
}


.contactinfo ul li a:hover{
	background:inherit;
}


.social-icons ul li a {
  border: 0 none;
  border-radius: 0;
  color: #696763;
  padding:0px;
}


.social-icons ul li{
	display:inline-block;
}

.social-icons ul li a i {
  padding: 11px 15px;
   transition: all 0.9s ease 0s;
  -moz-transition: all 0.9s ease 0s;
  -webkit-transition: all 0.9s ease 0s;
  -o-transition: all 0.9s ease 0s;
}

.social-icons ul li a i:hover{
  color: #fff;
   transition: all 0.9s ease 0s;
  -moz-transition: all 0.9s ease 0s;
  -webkit-transition: all 0.9s ease 0s;
  -o-transition: all 0.9s ease 0s;
}


.fa-facebook:hover {
  background: #0083C9;
}

.fa-twitter:hover  {
	background:#5BBCEC;
}

.fa-linkedin:hover  {
	background:#FF4518;
}

.fa-dribbble:hover  {
	background:#90C9DC;
}

.fa-google-plus:hover  {
	background:#CE3C2D;
}

.header-middle .container .row {
  border-bottom: 1px solid #f5f5f5;
  margin-left: 0;
  margin-right: 0;
  padding-bottom: 20px;
  padding-top: 20px;
}

.header-middle .container .row .col-sm-4{
  padding-left: 0;
}

.header-middle .container .row .col-sm-8 {
	padding-right:0;
}

.usa {
  border-radius: 0;
  color: #B4B1AB;
  font-size: 12px;
  margin-right: 20px;
  padding: 2px 15px;
  margin-top: 10px;
}

.usa:hover {
	background:#FE980F;
	color:#fff;
	border-color:#FE980F;
}

.usa:active, .usa.active {
  background: none repeat scroll 0 0 #FE980F;
  box-shadow: inherit;
  outline: 0 none;
}

.btn-group.open .dropdown-toggle {
  background: rgba(0, 0, 0, 0);
  box-shadow: none;
}

.dropdown-menu  li  a:hover, .dropdown-menu  li  a:focus {
  background-color: #FE980F;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  text-decoration: none;
}


.shop-menu ul li {
	display:inline-block;
  padding-left: 15px;
  padding-right: 15px;
}

.shop-menu ul li:last-child {
  padding-right: 0;
}


.shop-menu ul li a {
  background: #FFFFFF;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300;
  padding:0;
  padding-right: 0;
  margin-top: 10px;
}


.shop-menu ul li a i{
	margin-right:3px;
}


.shop-menu ul li a:hover {
	color:#fe980f;
	background:#fff;
}


.header-bottom {
  padding-bottom: 30px;
  padding-top: 30px;
}

.navbar-collapse.collapse{
  padding-left: 0;
}

.mainmenu ul li{
  padding-right: 15px;
  padding-left: 15px;
}

.mainmenu ul li:first-child{
  padding-left: 0px;
}

.mainmenu ul li a {
	color: #696763;
	font-family: 'Roboto', sans-serif;
	font-size: 17px;
	font-weight: 300;
	padding: 0;
	padding-bottom: 10px;
}

.mainmenu ul li a:hover, .mainmenu ul li a.active,  .shop-menu ul li a.active{
	background:none;
	color:#fdb45e;
}

.search_box input {
  background: #F0F0E9;
  border: medium none;
  color: #B2B2B2;
  font-family: 'roboto';
  font-size: 12px;
  font-weight: 300;
  height: 35px;
  outline: medium none;
  padding-left: 10px;
  width: 155px;
  background-image: url(../images/home/searchicon.png);
  background-repeat: no-repeat;
  background-position: 130px;
}


/*  Dropdown menu*/

.navbar-header 
.navbar-toggle .icon-bar {
    background-color: #fff;
}


.nav.navbar-nav > li:hover > ul.sub-menu{
  display: block;
  -webkit-animation: fadeInUp 400ms;
  -moz-animation: fadeInUp 400ms;
  -ms-animation: fadeInUp 400ms;
  -o-animation: fadeInUp 400ms;
  animation: fadeInUp 400ms;
}

ul.sub-menu {
	position: absolute;
	top: 30px;
	left: 0;
	background: rgba(0, 0, 0, 0.6);
	list-style: none;
	padding: 0;
	margin: 0;
	width: 220px;
	-webkit-box-shadow: 0 3px 3px rgba(0, 0, 0, 0.1);
	box-shadow: 0 3px 3px rgba(0, 0, 0, 0.1);
	display: none;
	z-index: 999;
}

.dropdown ul.sub-menu li .active{
  color: #FDB45E;
  padding-left: 0;
}


.navbar-nav li ul.sub-menu li{
  padding: 10px 20px 0 ;
}

.navbar-nav li ul.sub-menu li:last-child{
  padding-bottom: 20px;
}

.navbar-nav li ul.sub-menu li a{
  color: #fff;
}

.navbar-nav li ul.sub-menu li a:hover{
    color: #FDB45E;
}

.fa-angle-down{
  padding-left: 5px; 
}

@-webkit-keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
}
  
/*************************
*******Footer CSS******
**************************/

#footer {
  background: #F0F0E9;
}


.footer-top .container {
  border-bottom: 1px solid #E0E0DA;
  padding-bottom: 20px;
}

.companyinfo {
  margin-top: 57px;
}

.companyinfo h2 {
  color: #B4B1AB;
  font-family: abel;
  font-size: 27px;
  text-transform: uppercase;
}

.companyinfo h2  span{
  color:#FE980F;
}

.companyinfo p {
  color: #B3B3AD;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  font-weight: 300;
}

.footer-top .col-sm-3{
  overflow: hidden;
}

.video-gallery {
  margin-top: 57px;
  position: inherit;
}

.video-gallery a img {
  height: 100%;
  width: 100%;
}

.iframe-img {
  position: relative;
  display: block;
  height: 61px;
  margin-bottom: 10px;
  border: 2px solid #CCCCC6;
  border-radius: 3px;
}

.overlay-icon {
  position: absolute;
  top: 0;
  width: 100%;
  height: 61px;
  background: #FE980F;
  border-radius: 3px;
  color: #FFF;
  font-size: 20px;
  line-height: 0;
  display: block;
  opacity: 0;
   -webkit-transition: 300ms;
  -moz-transition: 300ms;
    -o-transition: 300ms;
    transition: 300ms;
}

.overlay-icon i {
  position: relative;
  top: 50%;
  margin-top: -20px;
}

.video-gallery a:hover .overlay-icon{
  opacity: 1;
}

.video-gallery p {
  color: #8C8C88;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  font-weight: 500;
  margin-bottom:0px;
}

.video-gallery  h2 {
  color: #8c8c88;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  font-weight: 300;
  text-transform:uppercase;
  margin-top:0px;
}


.address {
  margin-top: 30px;
  position: relative;
  overflow: hidden;
}
.address  img {
	width:100%;
}

.address p {
  color: #666663;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300;
  left: 25px;
  position: absolute;
  top: 50px;
}

.footer-widget {
  margin-bottom: 68px;
}

.footer-widget .container {
  border-top: 1px solid #FFFFFF;
  padding-top: 15px;
}

.single-widget h2 {
  color: #666663;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  font-weight: 500;
  margin-bottom: 22px;
  text-transform: uppercase;
}

.single-widget h2 i{
	margin-right:15px;
}

.single-widget ul li a{
	color: #8C8C88;
	font-family: 'Roboto', sans-serif;
	font-size: 14px;
	font-weight: 300;
	padding: 5px 0;
}

.single-widget ul li a i {
  margin-right: 18px;
}

.single-widget ul li a:hover{
	background:none;
	color:#FE980F;
}


.searchform input {
  border: 1px solid #DDDDDD;
  color: #CCCCC6;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  margin-top: 0;
  outline: medium none;
  padding: 7px;
  width: 212px;
}


.searchform button {
  background: #FE980F;
  border: medium none;
  border-radius: 0;
  margin-left: -5px;
  margin-top: -3px;
  padding: 7px 17px;
}

.searchform button i {
  color: #FFFFFF;
  font-size: 20px;
}

.searchform  button:hover, 
.searchform  button:focus{
	background-color:#FE980F;
}

.searchform p {
  color: #8C8C88;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300;
  margin-top: 25px;
}

.footer-bottom {
  background: #D6D6D0;
  padding-top: 10px;
}

.footer-bottom p {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-weight: 300;
  margin-left: 15px;
}

.footer-bottom p span a {
  color: #FE980F;
  font-style: italic;
  text-decoration: underline;
}


/*************************
******* Home ******
**************************/


#slider {
  padding-bottom: 45px;
}

.carousel-indicators li {
  background: #C4C4BE;
}

.carousel-indicators li.active {
	  background: #FE980F;
}

.item {
  padding-left: 100px;
}


.pricing {
  position: absolute;
  right: 40%;
  top: 52%;
}

.girl {
  margin-left: 0;
}

.item h1 {
  color: #B4B1AB;
  font-family: abel;
  font-size: 48px;
  margin-top: 115px;
}

.item h1 span {
	color:#FE980F;
}

.item h2 {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-size: 28px;
  font-weight: 700;
  margin-bottom: 22px;
  margin-top: 10px;
}

.item  p {
	color:#363432;
	font-size:16px;
	font-weight:300;
	font-family: 'Roboto', sans-serif;
}

.get {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  font-weight: 300;
  margin-top: 23px;
}


.item button:hover {
  background: #FE980F;
}

.control-carousel {
  position: absolute;
  top: 50%;
  font-size: 60px;
  color: #C2C2C1;
}

.control-carousel:hover{
  color: #FE980F ;
}

.right {
  right: 0;
}

.category-products {
  border: 1px solid #F7F7F0;
  margin-bottom: 35px;
  padding-bottom: 20px;
  padding-top: 15px;
}
.left-sidebar h2, .brands_products h2 {
  color: #FE980F;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
  font-weight: 700;
  margin: 0 auto 30px;
  text-align: center;
  text-transform: uppercase;
  position: relative;
  z-index:3;
}

.left-sidebar h2:after, h2.title:after{
	content: " ";
	position: absolute;
	border: 1px solid #f5f5f5;
	bottom:8px;
	left: 0;
	width: 100%;
	height: 0;
	z-index: -2;
}

.left-sidebar h2:before{
	content: " ";
	position: absolute;
	background: #fff;
	bottom: -6px;
	width: 130px;
	height: 30px;
	z-index: -1;
	left: 50%;
	margin-left: -65px;
}

h2.title:before{
	content: " ";
	position: absolute;
	background: #fff;
	bottom: -6px;
	width: 220px;
	height: 30px;
	z-index: -1;
	left: 50%;
	margin-left: -110px;
}

.category-products .panel {
	background-color: #FFFFFF;
	border: 0px;
	border-radius: 0px;
	box-shadow:none;
	margin-bottom: 0px;
}

.category-products .panel-default .panel-heading {
  background-color: #FFFFFF;
  border: 0 none;
  color: #FFFFFF;
  padding: 5px 20px;
}

.category-products .panel-default .panel-heading .panel-title a {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  text-decoration: none;
  text-transform: uppercase;
}

.panel-group .panel-heading + .panel-collapse .panel-body {
  border-top: 0 none;
}

.category-products .badge {
  background:none;
  border-radius: 10px;
  color: #696763;
  display: inline-block;
  font-size: 12px;
  font-weight: bold;
  line-height: 1;
  min-width: 10px;
  padding: 3px 7px;
  text-align: center;
  vertical-align: baseline;
  white-space: nowrap;
}

.panel-body ul{
  padding-left: 20px;
}


.panel-body ul li a {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  text-transform: uppercase;
}

.brands-name {
  border: 1px solid #F7F7F0;
  padding-bottom: 20px;
  padding-top: 15px;
}


.brands-name .nav-stacked li a {
  background-color: #FFFFFF;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  padding: 5px 25px;
  text-decoration: none;
  text-transform: uppercase;
}

.brands-name .nav-stacked li a:hover{
  background-color: #fff;
  color: #696763;
}

.shipping {
  background-color: #F2F2F2;
  margin-top: 40px;
  overflow: hidden;
  padding-top: 20px;
  position: relative;
}


.price-range{
  margin-top:30px;
}

.well {
  background-color: #FFFFFF;
  border: 1px solid #F7F7F0;
  border-radius: 4px;
  box-shadow: none;
  margin-bottom: 20px;
  min-height: 20px;
  padding: 35px;
}


.tooltip-inner {
  background-color: #FE980F;
  border-radius: 4px;
  color: #FFFFFF;
  max-width: 200px;
  padding: 3px 8px;
  text-align: center;
  text-decoration: none;
}

.tooltip.top .tooltip-arrow {
  border-top-color: #FE980F;
  border-width: 5px 5px 0;
  bottom: 0;
  left: 50%;
  margin-left: -5px;
}


.padding-right {
  padding-right: 0;
}

.features_items{
	overflow:hidden;
}


h2.title {
  color: #FE980F;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
  font-weight: 700;
  margin: 0 15px;
  text-transform: uppercase;
  margin-bottom: 30px;
  position: relative;
}

.product-image-wrapper{
	border:1px solid #F7F7F5;
	overflow: hidden;
	margin-bottom:30px;
}

.single-products {
  position: relative;
}

.new, .sale {
  position: absolute;
  top: 0;
  right: 0;
}

.productinfo h2{
	color: #FE980F;
	font-family: 'Roboto', sans-serif;
	font-size: 24px;
	font-weight: 700;
}
.product-overlay h2{
	color: #fff;
	font-family: 'Roboto', sans-serif;
	font-size: 24px;
	font-weight: 700;
}


.productinfo p{
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 400;
  color: #696763;
}

.productinfo img{
  width: 100%;
}

.productinfo{
 position:relative;
}

.product-overlay {
  background:#FE980F;
  top: 0;
  display: none;
  height: 0;
  position: absolute;
  transition: height 500ms ease 0s;
  width: 100%;
  display: block;
  
}

.single-products:hover .product-overlay {
  display:block;
  height:100%;
}


.product-overlay .overlay-content {
  bottom: 0;
  position: absolute;
  bottom: 0;
  text-align: center;
  width: 100%;
}

.product-overlay .add-to-cart {
  background:#fff;
  border: 0 none;
  border-radius: 0;
  color: #FE980F;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 25px;
}

.product-overlay .add-to-cart:hover {
  background:#fff;
  color: #FE980F;
}


.product-overlay p{
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 400;
  color: #fff;
}



.add-to-cart {
  background:#F5F5ED;
  border: 0 none;
  border-radius: 0;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 25px;
}

.add-to-cart:hover {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
}

.add-to{
  margin-bottom: 10px;
}

.add-to-cart i{
	margin-right:5px;
}

.add-to-cart:hover {
  background: #FE980F;
  color: #FFFFFF;
}

.choose {
  border-top: 1px solid #F7F7F0;
}

.choose ul li a {
  color: #B3AFA8;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  padding-left: 0;
  padding-right: 0;
}

.choose ul li a i{
	margin-right:5px;
}

.choose ul li a:hover{
	background:none;
	color:#FE980F;
}

.category-tab {
  overflow: hidden;
}

.category-tab ul {
  background: #40403E;
  border-bottom: 1px solid #FE980F;
  list-style: none outside none;
  margin: 0 0 30px;
  padding: 0;
  width: 100%;
}

.category-tab ul li a {
  border: 0 none;
  border-radius: 0;
  color: #B3AFA8;
  display: block;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  text-transform: uppercase;
}

.category-tab ul  li  a:hover{
	background:#FE980F;
	color:#fff;
}

.nav-tabs  li.active  a, .nav-tabs  li.active  a:hover, .nav-tabs  li.active  a:focus {
  -moz-border-bottom-colors: none;
  -moz-border-left-colors: none;
  -moz-border-right-colors: none;
  -moz-border-top-colors: none;
  background-color: #FE980F;
  border:0px;
  color: #FFFFFF;
  cursor: default;
  margin-right:0;
  margin-left:0;
}

.nav-tabs  li  a {
  border: 1px solid rgba(0, 0, 0, 0);
  border-radius: 4px 4px 0 0;
  line-height: 1.42857;
  margin-right:0;
}

.recommended_items {
  overflow: hidden;
}

#recommended-item-carousel .carousel-inner .item {
  padding-left: 0;
}

.recommended-item-control {
  position: absolute;
  top: 41%;
}

.recommended-item-control i {
  background: none repeat scroll 0 0 #FE980F;
  color: #FFFFFF;
  font-size: 20px;
  padding: 4px 10px;
}

.recommended-item-control i:hover {
  background: #ccccc6;
}

.recommended_items  h2 {
}

.our_partners{
  overflow:hidden;
}

.our_partners ul {
  background: #F7F7F0;
  margin-bottom: 50px;
}


.our_partners ul li a:hover{
	background:none;
}

/*************************
*******Shop CSS******
**************************/


#advertisement {
  padding-bottom: 45px;
}

#advertisement img {
  width: 100%;
}

.pagination {
  display: inline-block;
  margin-bottom: 25px;
  margin-top: 0;
  padding-left: 15px;
}

.pagination  li:first-child  a, .pagination  li:first-child  span {
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
  margin-left: 0;
}

.pagination  li:last-child  a, .pagination  li:last-child  span {
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
}

.pagination  .active  a, .pagination  .active  span, .pagination  .active  a:hover, .pagination  .active  span:hover, .pagination  .active  a:focus, .pagination  .active  span:focus {
  background-color: #FE980F;
  border-color: #FE980F;
  color: #FFFFFF;
  cursor: default;
  z-index: 2;
}

.pagination  li  a, .pagination  li  span {
  background-color: #f0f0e9;
  border: 0;
  float: left;
  line-height: 1.42857;
  margin-left: -1px;
  padding: 6px 12px;
  position: relative;
  text-decoration: none;
  margin-right: 5px;
  color:#000;
}

.pagination  li  a:hover{
	background:#FE980F;
	color:#fff;
}



/*************************
*******Product Details CSS******
**************************/

.product-details{
	overflow:hidden;
}


#similar-product {
  margin-top: 40px;
}


#reviews {
  padding-left: 25px;
  padding-right: 25px;
}

.product-details {
  margin-bottom: 40px;
  overflow: hidden;
  margin-top: 10px;
}



.view-product {
  position: relative;
}

.view-product img {
  border: 1px solid #F7F7F0;
  height: 380px;
  width: 100%;
}

.view-product h3 {
  background: #FE980F;
  bottom: 0;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 700;
  margin-bottom: 0;
  padding: 8px 20px;
  position: absolute;
  right: 0;
}

#similar-product .carousel-inner .item{
	padding-left:0px;
}

#similar-product .carousel-inner .item img {
  display: inline-block;
  margin-left: 15px;
}

.item-control {
  position: absolute;
  top: 35%;
}
.item-control i {
  background: #FE980F;
  color: #FFFFFF;
  font-size: 20px;
  padding: 5px 10px;
}

.item-control i:hover{
	background:#ccccc6;
}

.product-information {
  border: 1px solid #F7F7F0;
  overflow: hidden;
  padding-bottom: 60px;
  padding-left: 60px;
  padding-top: 60px;
  position: relative;
}

.newarrival{
	position:absolute;
	top:0;
	left:0
}

.product-information h2 {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-size: 20px;
  margin-top: 0;
}

.product-information p {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  margin-bottom: 5px;
}

.product-information span {
  display: inline-block;
  margin-bottom: 8px;
  margin-top: 18px;
}

.product-information span span {
  color: #FE980F;
  float: left;
  font-family: 'Roboto', sans-serif;
  font-size: 30px;
  font-weight: 700;
  margin-right: 20px;
  margin-top: 0px;
}
.product-information span input {
  border: 1px solid #DEDEDC;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 20px;
  font-weight: 700;
  height: 33px;
  outline: medium none;
  text-align: center;
  width: 50px;
}

.product-information span label {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-weight: 700;
  margin-right: 5px;
}

.share {
  margin-top: 15px;
}


.cart {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 10px;
  margin-left: 20px;
}


.shop-details-tab {
  border: 1px solid #F7F7F0;
  margin-bottom: 75px;
  margin-left: 15px;
  margin-right: 15px;
  padding-bottom: 10px;
}
.shop-details-tab .col-sm-12 {
	padding-left: 0;
	padding-right: 0;
}


#reviews ul {
  background: #FFFFFF;
  border: 0 none;
  list-style: none outside none;
  margin: 0 0 20px;
  padding: 0;
}

#reviews  ul  li {
	display:inline-block;
}

#reviews ul li a {
  color: #696763;
  display: block;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  padding-right: 15px;
}

#reviews ul li a i{
	color:#FE980F;
	padding-right:8px;
}

#reviews ul li a:hover{
	background:#fff;
	color:#FE980F;
}

#reviews p{
	color:#363432;
}

#reviews  form span {
  display: block;
}

#reviews form span input {
  background:#F0F0E9;
  border: 0 none;
  color: #A6A6A1;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  outline: medium none;
  padding: 8px;
  width: 48%;
}
#reviews form span input:last-child {
  margin-left: 3%;
}

#reviews textarea {
  background: #F0F0E9;
  border: medium none;
  color: #A6A6A1;
  height: 195px;
  margin-bottom: 25px;
  margin-top: 15px;
  outline: medium none;
  padding-left: 10px;
  padding-top: 15px;
  resize: none;
  width: 99.5%;
}

#reviews button {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
}


/*************************
*******404 CSS******
**************************/

.logo-404 {
  margin-top: 60px;
}

.content-404 h1 {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-size: 41px;
  font-weight: 300;
}

.content-404 img {
 margin:0 auto;
}

.content-404 p {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
}

.content-404  h2 {
  margin-top:50px;
}

.content-404 h2 a {
  background: #FE980F;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 44px;
  font-weight: 300;
  padding: 8px 40px;
}


/*************************
*******login page CSS******
**************************/

#form {
  display: block;
  margin-bottom: 185px;
  margin-top: 185px;
  overflow: hidden;
}

.login-form {

}

.signup-form {

}

.login-form h2, .signup-form h2 {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 20px;
  font-weight: 300;
  margin-bottom: 30px;
}


.login-form form input, .signup-form form input {
  background: #F0F0E9;
  border: medium none;
  color: #696763;
  display: block;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300;
  height: 40px;
  margin-bottom: 10px;
  outline: medium none;
  padding-left: 10px;
  width: 100%;
}

.login-form form span{
  line-height: 25px;
}

.login-form form span input {
  width: 15px;
  float: left;
  height: 15px;
  margin-right: 5px;
}

.login-form form button {
  margin-top: 23px;
}

.login-form form button, .signup-form form button {
  background: #FE980F;
  border: medium none;
  border-radius: 0;
  color: #FFFFFF;
  display: block;
  font-family: 'Roboto', sans-serif;
  padding: 6px 25px;
}

.login-form label{

}


.login-form label input {
  border: medium none;
  display: inline-block;
  height: 0;
  margin-bottom: 0;
  outline: medium none;
  padding-left: 0;
}


.or{
	background: #FE980F;
	border-radius: 40px;
	color: #FFFFFF;
	font-family: 'Roboto', sans-serif;
	font-size: 16px;
	height: 50px;
	line-height: 50px;
	margin-top: 75px;
	text-align: center;
	width: 50px;
}


/*************************
*******Cart CSS******
**************************/

#do_action {
  margin-bottom: 50px;
}

.breadcrumbs {
  position: relative;
}

.breadcrumbs .breadcrumb {
  background:transparent;
  margin-bottom: 75px;
  padding-left: 0;
}

.breadcrumbs .breadcrumb li a {
  background:#FE980F;
  color: #FFFFFF;
  padding: 3px 7px;
}

.breadcrumbs .breadcrumb li a:after {
  content:"";
  height:auto;
  width: auto;
  border-width: 8px;
  border-style: solid;
  border-color:transparent transparent transparent #FE980F;
  position: absolute;
  top: 11px;
  left:48px;

}

.breadcrumbs .breadcrumb > li + li:before {
  content: " ";
}

#cart_items .cart_info {
  border: 1px solid #E6E4DF;
  margin-bottom: 50px
}


#cart_items .cart_info .cart_menu {
  background: #FE980F;
  color: #fff;
  font-size: 16px;
  font-family: 'Roboto', sans-serif;
  font-weight: normal;
}

#cart_items .cart_info .table.table-condensed thead tr {
  height: 51px;
}


#cart_items .cart_info .table.table-condensed tr {
  border-bottom: 1px solid#F7F7F0
}

#cart_items .cart_info .table.table-condensed tr:last-child {
  border-bottom: 0
}

.cart_info table tr td {
  border-top: 0 none;
  vertical-align: inherit;
}


#cart_items .cart_info .image {
  padding-left: 30px;
}


#cart_items .cart_info .cart_description h4 {
  margin-bottom: 0
}

#cart_items .cart_info .cart_description h4 a {
  color: #363432;
  font-family: 'Roboto',sans-serif;
  font-size: 20px;
  font-weight: normal;

}

#cart_items .cart_info .cart_description p {
  color:#696763
}


#cart_items .cart_info .cart_price p {
  color:#696763;
  font-size: 18px
}


#cart_items .cart_info .cart_total_price {
  color: #FE980F;
  font-size: 24px;
}

.cart_product {
  display: block;
  margin: 15px -70px 10px 25px;
}

.cart_quantity_button a {
  background:#F0F0E9;
  color: #696763;
  display: inline-block;
  font-size: 16px;
  height: 28px;
  overflow: hidden;
  text-align: center;
  width: 35px;
  float: left;
}


.cart_quantity_input {
  color: #696763;
  float: left;
  font-size: 16px;
  text-align: center;
  font-family: 'Roboto',sans-serif;
  
}


.cart_delete  {
  display: block;
  margin-right: -12px;
  overflow: hidden;
}


.cart_delete a {
  background:#F0F0E9;
  color: #FFFFFF;
  padding: 5px 7px;
  font-size: 16px
}

.cart_delete a:hover {
  background:#FE980F
}


.bg h2.title {
  margin-right:0;
  margin-left:0;
  margin-top: 0;
}

.heading h3 {
  color: #363432;
  font-size: 20px;
  font-family: 'Roboto', sans-serif;
}

.heading p {
  color: #434343;
  font-size: 16px;
  font-weight: 300;
}


#do_action .total_area {
  padding-bottom: 18px !important;
}

#do_action .total_area, #do_action .chose_area {
  border: 1px solid #E6E4DF;
  color: #696763;
  padding: 30px 25px 30px 0;
  margin-bottom: 80px;
}

.total_area span {
  float: right;
}

.total_area ul li {
  background:#E6E4DF;
  color: #696763;
  margin-top: 10px;
  padding: 7px 20px;
}


.user_option label {
  color: #696763;
  font-weight: normal;
  margin-left: 10px;
}


.user_info {
  display: block;
  margin-bottom: 15px;
  margin-top: 20px;
  overflow: hidden;
}

.user_info label {
  color: #696763;
  display: block;
  font-size: 15px;
  font-weight: normal;

}

.user_info .single_field {
  width: 31%
}

.user_info .single_field.zip-field input {
  background: transparent;
  border: 1px solid#F0F0E9
}

.user_info > li {
  float: left;
  margin-right: 10px
}

.user_info > li > span {
}

.user_info input, select, textarea {
  background: #F0F0E9;
  border:0;
  color: #696763;
  padding: 5px;
  width: 100%;
  border-radius: 0;
  resize: none
}

.user_info select:focus {
  border: 0
}


.chose_area .update {
  margin-left: 40px;
}

.update, .check_out {
  background: #FE980F;
  border-radius: 0;
  color: #FFFFFF;
  margin-top: 18px;
  border: none;
  padding: 5px 15px;
}
.update{
    margin-left: 40px;
}

.check_out {
  margin-left: 20px
}



/*************************
*******checkout CSS******
**************************/

.step-one {
  margin-bottom: -10px
}

.register-req, .step-one .heading {
  background: none repeat scroll 0 0 #F0F0E9;
  color: #363432;
  font-size: 20px;
  margin-bottom: 35px;
  padding: 10px 25px;
  font-family: 'Roboto', sans-serif;
}

.checkout-options {
  padding-left: 20px
}


.checkout-options h3 {
  color: #363432;
  font-size: 20px;
  margin-bottom: 0;
  font-weight: normal;
  font-family: 'Roboto', sans-serif;
}

.checkout-options p {
  color: #434343;
  font-weight: 300;
  margin-bottom: 25px;
}

.checkout-options .nav li {
  float: left;
  margin-right: 45px;
  color: #696763;
  font-size: 18px;
  font-family: 'Roboto', sans-serif;
  font-weight: normal;
}

.checkout-options .nav label {
  font-weight: normal;
}

.checkout-options .nav li a {
  color: #FE980F;
  font-size: 18px;
  font-weight: normal;
  padding: 0
}

.checkout-options .nav li a:hover {
  background: inherit;
}

.checkout-options .nav i {
  margin-right: 10px;
  border-radius: 50%;
  padding: 5px;
  background: #FE980F;
  color:#fff;
  font-size: 14px;
  padding: 2px 3px;
}


.register-req  {
  font-size: 14px;
  font-weight: 300;
  padding: 15px 20px;
  margin-top: 35px;

}

.register-req p {
  margin-bottom: 0
}



.shopper-info p, 
.bill-to p, 
.order-message p {
  color: #696763;
  font-size: 20px;
  font-weight: 300
}


.shopper-info .btn-primary {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  margin-right: 15px;
  margin-top: 20px;
}


.form-two, .form-one {
  float: left;
  width: 47%
}


.shopper-info > form > input, 
.form-two > form > select, 
.form-two > form > input, 
.form-one > form > input {
  background:#F0F0E9;
  border: 0 none;
  margin-bottom:10px;
  padding: 10px;
  width: 100%;
  font-weight: 300
}

.form-two > form > select {
  padding:10px 5px
}

.form-two {
  margin-left: 5%
}


.order-message textarea {
  font-size: 12px;
  height: 335px;
  margin-bottom: 20px;
  padding: 15px 20px;
}

.order-message label {
  font-weight:300;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  margin-left: 10px;
  font-size: 14px
}


.review-payment h2 {
  color: #696763;
  font-size: 20px;
  font-weight: 300;
  margin-top: 45px;
  margin-bottom: 20px
}

.payment-options {
  margin-bottom:125px;
  margin-top: -25px
}

.payment-options span label {
  color: #696763;
  font-size: 14px;
  font-weight: 300;
  margin-right: 30px;
}

#cart_items .cart_info 
.table.table-condensed.total-result {
  margin-bottom: 10px;
  margin-top: 35px;
  color: #696763
}

#cart_items .cart_info 
.table.table-condensed.total-result tr {
  border-bottom: 0
}

#cart_items .cart_info 
.table.table-condensed.total-result span {
  color: #FE980F;
  font-weight: 700;
  font-size: 16px
}

#cart_items .cart_info 
.table.table-condensed.total-result 
.shipping-cost {
  border-bottom: 1px solid #F7F7F0;
}




/*************************
*******Blog CSS******
**************************/



.blog-post-area 
.single-blog-post h3 {
  color: #696763;
  font-size: 16px;
  font-family: 'Roboto',sans-serif;
  text-transform: uppercase;
  font-weight: 500;
  margin-bottom: 17px;
}

.single-blog-post > a {
}

.blog-post-area 
.single-blog-post a img {
  border: 1px solid #F7F7F0;
  width: 100%;
  margin-bottom: 30px
}

.blog-post-area  
.single-blog-post p {
  color: #363432
}

.blog-post-area 
.post-meta {
  display: block;
  margin-bottom: 25px;
  overflow: hidden;
}

.blog-post-area 
.post-meta ul {
  padding:0;
  display: inline;
}

.blog-post-area 
.post-meta ul li {
  background:#F0F0E9;
  float: left;
  margin-right: 10px;
  padding: 0 5px;
  font-size: 11px;
  color: #393b3b;
  position: relative;
}

.blog-post-area 
.post-meta ul li i {
  background:#FE980F;
  color: #FFFFFF;
  margin-left: -4px;
  margin-right: 7px;
  padding: 4px 7px;
}

.sinlge-post-meta li i:after,
.blog-post-area 
.post-meta ul li i:after {
  content: "";
  position: absolute;
  width: auto;
  height: auto;
  border-color:transparent transparent transparent #FE980F;
  border-width:4px;
  border-style: solid;
  top:6px;
  left:24px
}

.blog-post-area 
.post-meta ul span {
  float: right;
  color: #FE980F
}

.post-meta span{
    float: right;
}

.post-meta span i{
  color: #FE980F
}


.blog-post-area  
.single-blog-post 
.btn-primary {
  background:#FE980F;
  border: medium none;
  border-radius: 0;
  color: #FFFFFF;
  margin-top: 17px;
}


.pagination-area {
  margin-bottom:45px;
  margin-top:45px
}

.pagination-area 
.pagination li a {
  background:#F0F0E9;
  border: 0 none;
  border-radius: 0;
  color: #696763;
  margin-right: 5px;
  padding: 4px 12px;
}

.pagination-area 
.pagination li a:hover,
.pagination-area 
.pagination li .active {
  background:#FE980F;
  color: #fff
}



/*************************
*******Blog Single CSS******
**************************/

.pager-area {
  overflow: hidden;
}

.pager-area .pager li a {
  background:#F0F0E9;
  border: 0 none;
  border-radius: 0;
  color: #696763;
  font-size: 12px;
  font-weight: 700;
  padding: 4px;
  text-transform: uppercase;
  width: 57px;
}

.pager-area 
.pager li a:hover {
  background: #FE980F;
  color: #fff
}

.rating-area {
  border: 1px solid #F7F7F0;
  direction: block;
  overflow: hidden;
}

.rating-area ul li {
  float: left;
  padding: 5px;
  font-size: 12px
}

.rating-area .ratings {
  float: left;
  padding-left: 0;
  margin-bottom: 0
}


.rating-area 
.ratings li i {
  color:#CCCCCC
}

.rating-area .rate-this {
  color: #363432;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
}

.rating-area 
.ratings .color, 
.rating-area .color {
  color: #FE980F
}


.rating-area .tag {
  float: right;
  margin-bottom: 0;
  margin-right: 10px;
}

.rating-area .tag li {
  padding: 5px 2px;
}
.rating-area .tag li span {
  color: #363432;
}


.socials-share {
  margin-bottom: 30px;
  margin-top: 18px;
}


.commnets 
.media-object {
  margin-right: 15px;
  width: 100%;
}

.commnets {
  border: 1px solid #F7F7F0;
  padding: 18px 18px 18px 0;
  margin-bottom: 50px
}

.commnets .pull-left {
  margin-right: 22px
}

.commnets p, 
.response-area p, 
.replay-box p {
  font-size: 12px
}

.media-heading {
  color: #363432;
  font-size: 14px;
  font-weight: 700;
  font-family: 'Roboto', sans-serif;
  margin-bottom: 15px
}

.blog-socials {
  margin-bottom: -9px;
  margin-top: 14px;
}

.blog-socials ul {
  padding-left: 0;
  overflow: hidden;
  float: left;
}

.blog-socials .btn.btn-primary{
  margin-top: 0;
}

.blog-socials ul li {
  
  float: left;
  height: 17px;
  margin-right: 5px;
  text-align: center;
  width: 17px;
}


.blog-socials ul li a {
  color: #393B3B;
  display: block;
  font-size: 10px;
  padding: 1px;
  background:#F0F0E9;
}

.blog-socials ul li a:hover {
  color: #fff;
  background:#FE980F
}


.media-list .btn-primary, 
.commnets .btn-primary {
  background:#FC9A11;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
  float: left;
  font-size: 10px;
  padding: 1px 7px;
  text-transform: uppercase;
}

.response-area h2 {
  color: #363432;
  font-size: 20px;
  font-weight: 700;
}

.response-area .media {
  border: 1px solid #F7F7F0;
  padding: 18px 18px 18px 0;
  margin-bottom: 27px
}

.response-area .media img{
  height: 102px;
  width: 100%;
}

.response-area .media .pull-left {
  margin-right: 25px
}

.response-area .second-media {
  margin-left: 5%;
  width: 95%;
}


.sinlge-post-meta {
  overflow: hidden;
  padding-left: 0;
  margin-bottom: 15px
}



.sinlge-post-meta li {
  background:#F0F0E9;
  color: #363432;
  float: left;
  font-size: 10px;
  font-weight: 700;
  margin-right: 10px;
  padding: 0 10px 0 0;
  position: relative;
  text-transform: uppercase;
}

.sinlge-post-meta li i {
  background:#FE980F;
  color: #FFFFFF;
  margin-right: 10px;
  padding: 8px 10px;
}

.sinlge-post-meta li i:after {
  top: 7px;
  border-width: 6px;
  left: 27px;
}


.replay-box {
  margin-bottom: 107px;
  margin-top: 55px;
}

.replay-box h2 {
  font-weight: 700;
  font-size: 20px;
  color: #363432;
  margin-top: 0;
  margin-bottom: 45px
}

.replay-box label {
  background:#FE980F;
  color: #FFFFFF;
  margin-bottom: 15px;
  padding: 3px 15px;
  float: left;
  font-weight: 400;
}

.replay-box span {
  color: #FE980F;
  float: right;
  font-weight: 700;
  margin-top: 21px;
}

.replay-box form input {
  border: 1px solid #F7F7F0;
  color: #ADB2B2;
  font-size: 12px;
  margin-bottom: 22px;
  padding: 8px;
  width: 100%;
}

.replay-box form input:hover, 
.text-area textarea:hover {
  border: 1px solid #FE980F;
}

.text-area {
  margin-top: 66px
}

.text-area textarea {
  background: transparent;
  border: 1px solid#F7F7F0
}

.btn.btn-primary {
  background:#FE980F;
  border: 0 none;
  border-radius: 0;
  margin-top: 16px;
}

.blank-arrow {
  position: relative;
}

.blank-arrow label:after {
  content: "";
  position: absolute;
  width: auto;
  height: auto;
  border-style: solid;
  border-width: 8px;
  border-color:#FE980F transparent transparent transparent;
  top: 25px;
  left: 5px
} 



/*************************
******* Contact CSS ********
**************************/

.contact-map {
  width: 100%;
  height: 385px;
  margin-bottom: 70px
}

.contact-info .heading, 
.contact-form .heading {
  text-transform: capitalize;
}

.contact-form .form-group {
  margin-bottom: 20px;
}

#contact-page 
.form-control::-moz-placeholder {
  color: #8D8D8D;
}

#contact-page .form-control {
  background-color: #fff;
  border: 1px solid #ddd;
  color: #696763;
  height: 46px;
  padding: 6px 12px;
  width: 100%;
  font-size: 16px;
  border-radius: 4px;
  box-shadow:inherit;
}

#contact-page #message {
  height:160px;
  resize:none;
}

#main-contact-form .btn-primary {
  margin-bottom: 15px;
  margin-top: 20px;
}


#contact-page .form-control:focus, 
#contact-page .form-control:hover {
  box-shadow: inherit;
  border-color: #FDB45E;
}

#contact-page .contact-info {
  padding: 0 20px;
}

#contact-page .contact-info address {
  margin-bottom: 40px;
  margin-top: -5px;
}

#contact-page .contact-info p {
  margin-bottom: 0;
  color: #696763;
  font-size: 16px;
  line-height: 25px;
}

.social-networks{
  overflow: hidden;
  text-align: center;
}

.social-networks ul {
  margin-top: -5px;
  padding: 0;
  display: inline-block;
}

.social-networks ul li {
  float: left;
  text-decoration: none;
  list-style: none;
  margin-right: 20px;
}

.social-networks ul li:last-child{
  margin-right: 0;
}

.social-networks ul li a {
  color: #999;
  font-size: 25px;
}

.contact-info .social-networks ul li a i{
  background: none;
}

.contact-info .social-networks ul li a:hover{
  color: #FE980F;
}
	div.pp_default .pp_top,div.pp_default .pp_top .pp_middle,div.pp_default .pp_top .pp_left,div.pp_default .pp_top .pp_right,div.pp_default .pp_bottom,div.pp_default .pp_bottom .pp_left,div.pp_default .pp_bottom .pp_middle,div.pp_default .pp_bottom .pp_right{height:13px}
div.pp_default .pp_top .pp_left{background:url(../images/prettyPhoto/default/sprite.png) -78px -93px no-repeat}
div.pp_default .pp_top .pp_middle{background:url(../images/prettyPhoto/default/sprite_x.png) top left repeat-x}
div.pp_default .pp_top .pp_right{background:url(../images/prettyPhoto/default/sprite.png) -112px -93px no-repeat}
div.pp_default .pp_content .ppt{color:#f8f8f8}
div.pp_default .pp_content_container .pp_left{background:url(../images/prettyPhoto/default/sprite_y.png) -7px 0 repeat-y;padding-left:13px}
div.pp_default .pp_content_container .pp_right{background:url(../images/prettyPhoto/default/sprite_y.png) top right repeat-y;padding-right:13px}
div.pp_default .pp_next:hover{background:url(../images/prettyPhoto/default/sprite_next.png) center right no-repeat;cursor:pointer}
div.pp_default .pp_previous:hover{background:url(../images/prettyPhoto/default/sprite_prev.png) center left no-repeat;cursor:pointer}
div.pp_default .pp_expand{background:url(../images/prettyPhoto/default/sprite.png) 0 -29px no-repeat;cursor:pointer;width:28px;height:28px}
div.pp_default .pp_expand:hover{background:url(../images/prettyPhoto/default/sprite.png) 0 -56px no-repeat;cursor:pointer}
div.pp_default .pp_contract{background:url(../images/prettyPhoto/default/sprite.png) 0 -84px no-repeat;cursor:pointer;width:28px;height:28px}
div.pp_default .pp_contract:hover{background:url(../images/prettyPhoto/default/sprite.png) 0 -113px no-repeat;cursor:pointer}
div.pp_default .pp_close{width:30px;height:30px;background:url(../images/prettyPhoto/default/sprite.png) 2px 1px no-repeat;cursor:pointer}
div.pp_default .pp_gallery ul li a{background:url(../images/prettyPhoto/default/default_thumb.png) center center #f8f8f8;border:1px solid #aaa}
div.pp_default .pp_social{margin-top:7px}
div.pp_default .pp_gallery a.pp_arrow_previous,div.pp_default .pp_gallery a.pp_arrow_next{position:static;left:auto}
div.pp_default .pp_nav .pp_play,div.pp_default .pp_nav .pp_pause{background:url(../images/prettyPhoto/default/sprite.png) -51px 1px no-repeat;height:30px;width:30px}
div.pp_default .pp_nav .pp_pause{background-position:-51px -29px}
div.pp_default a.pp_arrow_previous,div.pp_default a.pp_arrow_next{background:url(../images/prettyPhoto/default/sprite.png) -31px -3px no-repeat;height:20px;width:20px;margin:4px 0 0}
div.pp_default a.pp_arrow_next{left:52px;background-position:-82px -3px}
div.pp_default .pp_content_container .pp_details{margin-top:5px}
div.pp_default .pp_nav{clear:none;height:30px;width:110px;position:relative}
div.pp_default .pp_nav .currentTextHolder{font-family:Georgia;font-style:italic;color:#999;font-size:11px;left:75px;line-height:25px;position:absolute;top:2px;margin:0;padding:0 0 0 10px}
div.pp_default .pp_close:hover,div.pp_default .pp_nav .pp_play:hover,div.pp_default .pp_nav .pp_pause:hover,div.pp_default .pp_arrow_next:hover,div.pp_default .pp_arrow_previous:hover{opacity:0.7}
div.pp_default .pp_description{font-size:11px;font-weight:700;line-height:14px;margin:5px 50px 5px 0}
div.pp_default .pp_bottom .pp_left{background:url(../images/prettyPhoto/default/sprite.png) -78px -127px no-repeat}
div.pp_default .pp_bottom .pp_middle{background:url(../images/prettyPhoto/default/sprite_x.png) bottom left repeat-x}
div.pp_default .pp_bottom .pp_right{background:url(../images/prettyPhoto/default/sprite.png) -112px -127px no-repeat}
div.pp_default .pp_loaderIcon{background:url(../images/prettyPhoto/default/loader.gif) center center no-repeat}
div.light_rounded .pp_top .pp_left{background:url(../images/prettyPhoto/light_rounded/sprite.png) -88px -53px no-repeat}
div.light_rounded .pp_top .pp_right{background:url(../images/prettyPhoto/light_rounded/sprite.png) -110px -53px no-repeat}
div.light_rounded .pp_next:hover{background:url(../images/prettyPhoto/light_rounded/btnNext.png) center right no-repeat;cursor:pointer}
div.light_rounded .pp_previous:hover{background:url(../images/prettyPhoto/light_rounded/btnPrevious.png) center left no-repeat;cursor:pointer}
div.light_rounded .pp_expand{background:url(../images/prettyPhoto/light_rounded/sprite.png) -31px -26px no-repeat;cursor:pointer}
div.light_rounded .pp_expand:hover{background:url(../images/prettyPhoto/light_rounded/sprite.png) -31px -47px no-repeat;cursor:pointer}
div.light_rounded .pp_contract{background:url(../images/prettyPhoto/light_rounded/sprite.png) 0 -26px no-repeat;cursor:pointer}
div.light_rounded .pp_contract:hover{background:url(../images/prettyPhoto/light_rounded/sprite.png) 0 -47px no-repeat;cursor:pointer}
div.light_rounded .pp_close{width:75px;height:22px;background:url(../images/prettyPhoto/light_rounded/sprite.png) -1px -1px no-repeat;cursor:pointer}
div.light_rounded .pp_nav .pp_play{background:url(../images/prettyPhoto/light_rounded/sprite.png) -1px -100px no-repeat;height:15px;width:14px}
div.light_rounded .pp_nav .pp_pause{background:url(../images/prettyPhoto/light_rounded/sprite.png) -24px -100px no-repeat;height:15px;width:14px}
div.light_rounded .pp_arrow_previous{background:url(../images/prettyPhoto/light_rounded/sprite.png) 0 -71px no-repeat}
div.light_rounded .pp_arrow_next{background:url(../images/prettyPhoto/light_rounded/sprite.png) -22px -71px no-repeat}
div.light_rounded .pp_bottom .pp_left{background:url(../images/prettyPhoto/light_rounded/sprite.png) -88px -80px no-repeat}
div.light_rounded .pp_bottom .pp_right{background:url(../images/prettyPhoto/light_rounded/sprite.png) -110px -80px no-repeat}
div.dark_rounded .pp_top .pp_left{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -88px -53px no-repeat}
div.dark_rounded .pp_top .pp_right{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -110px -53px no-repeat}
div.dark_rounded .pp_content_container .pp_left{background:url(../images/prettyPhoto/dark_rounded/contentPattern.png) top left repeat-y}
div.dark_rounded .pp_content_container .pp_right{background:url(../images/prettyPhoto/dark_rounded/contentPattern.png) top right repeat-y}
div.dark_rounded .pp_next:hover{background:url(../images/prettyPhoto/dark_rounded/btnNext.png) center right no-repeat;cursor:pointer}
div.dark_rounded .pp_previous:hover{background:url(../images/prettyPhoto/dark_rounded/btnPrevious.png) center left no-repeat;cursor:pointer}
div.dark_rounded .pp_expand{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -31px -26px no-repeat;cursor:pointer}
div.dark_rounded .pp_expand:hover{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -31px -47px no-repeat;cursor:pointer}
div.dark_rounded .pp_contract{background:url(../images/prettyPhoto/dark_rounded/sprite.png) 0 -26px no-repeat;cursor:pointer}
div.dark_rounded .pp_contract:hover{background:url(../images/prettyPhoto/dark_rounded/sprite.png) 0 -47px no-repeat;cursor:pointer}
div.dark_rounded .pp_close{width:75px;height:22px;background:url(../images/prettyPhoto/dark_rounded/sprite.png) -1px -1px no-repeat;cursor:pointer}
div.dark_rounded .pp_description{margin-right:85px;color:#fff}
div.dark_rounded .pp_nav .pp_play{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -1px -100px no-repeat;height:15px;width:14px}
div.dark_rounded .pp_nav .pp_pause{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -24px -100px no-repeat;height:15px;width:14px}
div.dark_rounded .pp_arrow_previous{background:url(../images/prettyPhoto/dark_rounded/sprite.png) 0 -71px no-repeat}
div.dark_rounded .pp_arrow_next{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -22px -71px no-repeat}
div.dark_rounded .pp_bottom .pp_left{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -88px -80px no-repeat}
div.dark_rounded .pp_bottom .pp_right{background:url(../images/prettyPhoto/dark_rounded/sprite.png) -110px -80px no-repeat}
div.dark_rounded .pp_loaderIcon{background:url(../images/prettyPhoto/dark_rounded/loader.gif) center center no-repeat}
div.dark_square .pp_left,div.dark_square .pp_middle,div.dark_square .pp_right,div.dark_square .pp_content{background:#000}
div.dark_square .pp_description{color:#fff;margin:0 85px 0 0}
div.dark_square .pp_loaderIcon{background:url(../images/prettyPhoto/dark_square/loader.gif) center center no-repeat}
div.dark_square .pp_expand{background:url(../images/prettyPhoto/dark_square/sprite.png) -31px -26px no-repeat;cursor:pointer}
div.dark_square .pp_expand:hover{background:url(../images/prettyPhoto/dark_square/sprite.png) -31px -47px no-repeat;cursor:pointer}
div.dark_square .pp_contract{background:url(../images/prettyPhoto/dark_square/sprite.png) 0 -26px no-repeat;cursor:pointer}
div.dark_square .pp_contract:hover{background:url(../images/prettyPhoto/dark_square/sprite.png) 0 -47px no-repeat;cursor:pointer}
div.dark_square .pp_close{width:75px;height:22px;background:url(../images/prettyPhoto/dark_square/sprite.png) -1px -1px no-repeat;cursor:pointer}
div.dark_square .pp_nav{clear:none}
div.dark_square .pp_nav .pp_play{background:url(../images/prettyPhoto/dark_square/sprite.png) -1px -100px no-repeat;height:15px;width:14px}
div.dark_square .pp_nav .pp_pause{background:url(../images/prettyPhoto/dark_square/sprite.png) -24px -100px no-repeat;height:15px;width:14px}
div.dark_square .pp_arrow_previous{background:url(../images/prettyPhoto/dark_square/sprite.png) 0 -71px no-repeat}
div.dark_square .pp_arrow_next{background:url(../images/prettyPhoto/dark_square/sprite.png) -22px -71px no-repeat}
div.dark_square .pp_next:hover{background:url(../images/prettyPhoto/dark_square/btnNext.png) center right no-repeat;cursor:pointer}
div.dark_square .pp_previous:hover{background:url(../images/prettyPhoto/dark_square/btnPrevious.png) center left no-repeat;cursor:pointer}
div.light_square .pp_expand{background:url(../images/prettyPhoto/light_square/sprite.png) -31px -26px no-repeat;cursor:pointer}
div.light_square .pp_expand:hover{background:url(../images/prettyPhoto/light_square/sprite.png) -31px -47px no-repeat;cursor:pointer}
div.light_square .pp_contract{background:url(../images/prettyPhoto/light_square/sprite.png) 0 -26px no-repeat;cursor:pointer}
div.light_square .pp_contract:hover{background:url(../images/prettyPhoto/light_square/sprite.png) 0 -47px no-repeat;cursor:pointer}
div.light_square .pp_close{width:75px;height:22px;background:url(../images/prettyPhoto/light_square/sprite.png) -1px -1px no-repeat;cursor:pointer}
div.light_square .pp_nav .pp_play{background:url(../images/prettyPhoto/light_square/sprite.png) -1px -100px no-repeat;height:15px;width:14px}
div.light_square .pp_nav .pp_pause{background:url(../images/prettyPhoto/light_square/sprite.png) -24px -100px no-repeat;height:15px;width:14px}
div.light_square .pp_arrow_previous{background:url(../images/prettyPhoto/light_square/sprite.png) 0 -71px no-repeat}
div.light_square .pp_arrow_next{background:url(../images/prettyPhoto/light_square/sprite.png) -22px -71px no-repeat}
div.light_square .pp_next:hover{background:url(../images/prettyPhoto/light_square/btnNext.png) center right no-repeat;cursor:pointer}
div.light_square .pp_previous:hover{background:url(../images/prettyPhoto/light_square/btnPrevious.png) center left no-repeat;cursor:pointer}
div.facebook .pp_top .pp_left{background:url(../images/prettyPhoto/facebook/sprite.png) -88px -53px no-repeat}
div.facebook .pp_top .pp_middle{background:url(../images/prettyPhoto/facebook/contentPatternTop.png) top left repeat-x}
div.facebook .pp_top .pp_right{background:url(../images/prettyPhoto/facebook/sprite.png) -110px -53px no-repeat}
div.facebook .pp_content_container .pp_left{background:url(../images/prettyPhoto/facebook/contentPatternLeft.png) top left repeat-y}
div.facebook .pp_content_container .pp_right{background:url(../images/prettyPhoto/facebook/contentPatternRight.png) top right repeat-y}
div.facebook .pp_expand{background:url(../images/prettyPhoto/facebook/sprite.png) -31px -26px no-repeat;cursor:pointer}
div.facebook .pp_expand:hover{background:url(../images/prettyPhoto/facebook/sprite.png) -31px -47px no-repeat;cursor:pointer}
div.facebook .pp_contract{background:url(../images/prettyPhoto/facebook/sprite.png) 0 -26px no-repeat;cursor:pointer}
div.facebook .pp_contract:hover{background:url(../images/prettyPhoto/facebook/sprite.png) 0 -47px no-repeat;cursor:pointer}
div.facebook .pp_close{width:22px;height:22px;background:url(../images/prettyPhoto/facebook/sprite.png) -1px -1px no-repeat;cursor:pointer}
div.facebook .pp_description{margin:0 37px 0 0}
div.facebook .pp_loaderIcon{background:url(../images/prettyPhoto/facebook/loader.gif) center center no-repeat}
div.facebook .pp_arrow_previous{background:url(../images/prettyPhoto/facebook/sprite.png) 0 -71px no-repeat;height:22px;margin-top:0;width:22px}
div.facebook .pp_arrow_previous.disabled{background-position:0 -96px;cursor:default}
div.facebook .pp_arrow_next{background:url(../images/prettyPhoto/facebook/sprite.png) -32px -71px no-repeat;height:22px;margin-top:0;width:22px}
div.facebook .pp_arrow_next.disabled{background-position:-32px -96px;cursor:default}
div.facebook .pp_nav{margin-top:0}
div.facebook .pp_nav p{font-size:15px;padding:0 3px 0 4px}
div.facebook .pp_nav .pp_play{background:url(../images/prettyPhoto/facebook/sprite.png) -1px -123px no-repeat;height:22px;width:22px}
div.facebook .pp_nav .pp_pause{background:url(../images/prettyPhoto/facebook/sprite.png) -32px -123px no-repeat;height:22px;width:22px}
div.facebook .pp_next:hover{background:url(../images/prettyPhoto/facebook/btnNext.png) center right no-repeat;cursor:pointer}
div.facebook .pp_previous:hover{background:url(../images/prettyPhoto/facebook/btnPrevious.png) center left no-repeat;cursor:pointer}
div.facebook .pp_bottom .pp_left{background:url(../images/prettyPhoto/facebook/sprite.png) -88px -80px no-repeat}
div.facebook .pp_bottom .pp_middle{background:url(../images/prettyPhoto/facebook/contentPatternBottom.png) top left repeat-x}
div.facebook .pp_bottom .pp_right{background:url(../images/prettyPhoto/facebook/sprite.png) -110px -80px no-repeat}
div.pp_pic_holder a:focus{outline:none}
div.pp_overlay{background:#000;display:none;left:0;position:absolute;top:0;width:100%;z-index:9500}
div.pp_pic_holder{display:none;position:absolute;width:100px;z-index:10000}
.pp_content{height:40px;min-width:40px}
* html .pp_content{width:40px}
.pp_content_container{position:relative;text-align:left;width:100%}
.pp_content_container .pp_left{padding-left:20px}
.pp_content_container .pp_right{padding-right:20px}
.pp_content_container .pp_details{float:left;margin:10px 0 2px}
.pp_description{display:none;margin:0}
.pp_social{float:left;margin:0}
.pp_social .facebook{float:left;margin-left:5px;width:55px;overflow:hidden}
.pp_social .twitter{float:left}
.pp_nav{clear:right;float:left;margin:3px 10px 0 0}
.pp_nav p{float:left;white-space:nowrap;margin:2px 4px}
.pp_nav .pp_play,.pp_nav .pp_pause{float:left;margin-right:4px;text-indent:-10000px}
a.pp_arrow_previous,a.pp_arrow_next{display:block;float:left;height:15px;margin-top:3px;overflow:hidden;text-indent:-10000px;width:14px}
.pp_hoverContainer{position:absolute;top:0;width:100%;z-index:2000}
.pp_gallery{display:none;left:50%;margin-top:-50px;position:absolute;z-index:10000}
.pp_gallery div{float:left;overflow:hidden;position:relative}
.pp_gallery ul{float:left;height:35px;position:relative;white-space:nowrap;margin:0 0 0 5px;padding:0}
.pp_gallery ul a{border:1px rgba(0,0,0,0.5) solid;display:block;float:left;height:33px;overflow:hidden}
.pp_gallery ul a img{border:0}
.pp_gallery li{display:block;float:left;margin:0 5px 0 0;padding:0}
.pp_gallery li.default a{background:url(../images/prettyPhoto/facebook/default_thumbnail.gif) 0 0 no-repeat;display:block;height:33px;width:50px}
.pp_gallery .pp_arrow_previous,.pp_gallery .pp_arrow_next{margin-top:7px!important}
a.pp_next{background:url(../images/prettyPhoto/light_rounded/btnNext.png) 10000px 10000px no-repeat;display:block;float:right;height:100%;text-indent:-10000px;width:49%}
a.pp_previous{background:url(../images/prettyPhoto/light_rounded/btnNext.png) 10000px 10000px no-repeat;display:block;float:left;height:100%;text-indent:-10000px;width:49%}
a.pp_expand,a.pp_contract{cursor:pointer;display:none;height:20px;position:absolute;right:30px;text-indent:-10000px;top:10px;width:20px;z-index:20000}
a.pp_close{position:absolute;right:0;top:0;display:block;line-height:22px;text-indent:-10000px}
.pp_loaderIcon{display:block;height:24px;left:50%;position:absolute;top:50%;width:24px;margin:-12px 0 0 -12px}
#pp_full_res{line-height:1!important}
#pp_full_res .pp_inline{text-align:left}
#pp_full_res .pp_inline p{margin:0 0 15px}
div.ppt{color:#fff;display:none;font-size:17px;z-index:9999;margin:0 0 5px 15px}
div.pp_default .pp_content,div.light_rounded .pp_content{background-color:#fff}
div.pp_default #pp_full_res .pp_inline,div.light_rounded .pp_content .ppt,div.light_rounded #pp_full_res .pp_inline,div.light_square .pp_content .ppt,div.light_square #pp_full_res .pp_inline,div.facebook .pp_content .ppt,div.facebook #pp_full_res .pp_inline{color:#000}
div.pp_default .pp_gallery ul li a:hover,div.pp_default .pp_gallery ul li.selected a,.pp_gallery ul a:hover,.pp_gallery li.selected a{border-color:#fff}
div.pp_default .pp_details,div.light_rounded .pp_details,div.dark_rounded .pp_details,div.dark_square .pp_details,div.light_square .pp_details,div.facebook .pp_details{position:relative}
div.light_rounded .pp_top .pp_middle,div.light_rounded .pp_content_container .pp_left,div.light_rounded .pp_content_container .pp_right,div.light_rounded .pp_bottom .pp_middle,div.light_square .pp_left,div.light_square .pp_middle,div.light_square .pp_right,div.light_square .pp_content,div.facebook .pp_content{background:#fff}
div.light_rounded .pp_description,div.light_square .pp_description{margin-right:85px}
div.light_rounded .pp_gallery a.pp_arrow_previous,div.light_rounded .pp_gallery a.pp_arrow_next,div.dark_rounded .pp_gallery a.pp_arrow_previous,div.dark_rounded .pp_gallery a.pp_arrow_next,div.dark_square .pp_gallery a.pp_arrow_previous,div.dark_square .pp_gallery a.pp_arrow_next,div.light_square .pp_gallery a.pp_arrow_previous,div.light_square .pp_gallery a.pp_arrow_next{margin-top:12px!important}
div.light_rounded .pp_arrow_previous.disabled,div.dark_rounded .pp_arrow_previous.disabled,div.dark_square .pp_arrow_previous.disabled,div.light_square .pp_arrow_previous.disabled{background-position:0 -87px;cursor:default}
div.light_rounded .pp_arrow_next.disabled,div.dark_rounded .pp_arrow_next.disabled,div.dark_square .pp_arrow_next.disabled,div.light_square .pp_arrow_next.disabled{background-position:-22px -87px;cursor:default}
div.light_rounded .pp_loaderIcon,div.light_square .pp_loaderIcon{background:url(../images/prettyPhoto/light_rounded/loader.gif) center center no-repeat}
div.dark_rounded .pp_top .pp_middle,div.dark_rounded .pp_content,div.dark_rounded .pp_bottom .pp_middle{background:url(../images/prettyPhoto/dark_rounded/contentPattern.png) top left repeat}
div.dark_rounded .currentTextHolder,div.dark_square .currentTextHolder{color:#c4c4c4}
div.dark_rounded #pp_full_res .pp_inline,div.dark_square #pp_full_res .pp_inline{color:#fff}
.pp_top,.pp_bottom{height:20px;position:relative}
* html .pp_top,* html .pp_bottom{padding:0 20px}
.pp_top .pp_left,.pp_bottom .pp_left{height:20px;left:0;position:absolute;width:20px}
.pp_top .pp_middle,.pp_bottom .pp_middle{height:20px;left:20px;position:absolute;right:20px}
* html .pp_top .pp_middle,* html .pp_bottom .pp_middle{left:0;position:static}
.pp_top .pp_right,.pp_bottom .pp_right{height:20px;left:auto;position:absolute;right:0;top:0;width:20px}
.pp_fade,.pp_gallery li.default a img{display:none}

/*!
 * Slider for Bootstrap
 *
 * Copyright 2012 Stefan Petre
 * Licensed under the Apache License v2.0
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 */
.slider {
  display: inline-block;
  vertical-align: middle;
  position: relative;
}
.slider.slider-horizontal {
  width: 210px;
  height: 20px;
}
.slider.slider-horizontal .slider-track {
  height: 15px;
  left: 0;
  margin-top: -5px;
  top: 50%;
  width: 100%;
}
.slider.slider-horizontal .slider-selection {
  height: 100%;
  top: 0;
  bottom: 0;
}
.slider.slider-horizontal .slider-handle {
  margin-left: -12px;
  margin-top: 2px;
}

.left-round{
  margin-left:2px !important;
}

.slider.slider-horizontal .slider-handle.triangle {
  border-width: 0 10px 10px 10px;
  width: 0;
  height: 0;
  border-bottom-color: #0480be;
  margin-top: 0;
}
.slider.slider-vertical {
  height: 210px;
  width: 20px;
}
.slider.slider-vertical .slider-track {
  width: 10px;
  height: 100%;
  margin-left: -5px;
  left: 50%;
  top: 0;
}
.slider.slider-vertical .slider-selection {
  width: 100%;
  left: 0;
  top: 0;
  bottom: 0;
}
.slider.slider-vertical .slider-handle {
  margin-left: -5px;
  margin-top: -10px;
}
.slider.slider-vertical .slider-handle.triangle {
  border-width: 10px 0 10px 10px;
  width: 1px;
  height: 1px;
  border-left-color: #0480be;
  margin-left: 0;
}
.slider input {
  display: none;
}
.slider .tooltip-inner {
  white-space: nowrap;
}
.slider-track {
  position: absolute;
  cursor: pointer;
  background-color: #f7f7f7;
  background-image: -moz-linear-gradient(top, #f5f5f5, #f9f9f9);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f5f5f5), to(#f9f9f9));
  background-image: -webkit-linear-gradient(top, #f5f5f5, #f9f9f9);
  background-image: -o-linear-gradient(top, #f5f5f5, #f9f9f9);
  background-image: linear-gradient(to bottom, #f5f5f5, #f9f9f9);
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff5f5f5', endColorstr='#fff9f9f9', GradientType=0);
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
  -webkit-border-radius: 15px;
  -moz-border-radius: 15px;
  border-radius: 15px;
}

.slider-selection {
  -moz-box-sizing: border-box;
  background: none repeat scroll 0 0 #FE980F;
  border-radius: 15px;
  box-shadow: 0 -1px 0 rgba(0, 0, 0, 0.15) inset;
  position: absolute;
}

.slider-handle {
  background: #fff;
  box-shadow:none;
  height: 10px;
  opacity: 1;
  position: absolute;
  width: 10px;
}

.slider-handle.round {
  -webkit-border-radius: 20px;
  -moz-border-radius: 20px;
  border-radius: 20px;
}
.slider-handle.triangle {
  background: transparent none;
}


/*************************
*******Typography******
**************************/
@import url(http://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,700,100);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,800,300,600,700);
@import url(http://fonts.googleapis.com/css?family=Abel);

body {
  font-family: 'Roboto', sans-serif;
  
  position: relative;
  font-weight:400px;
}

ul li {
  list-style: none;
}

a:hover {
outline: none;
text-decoration:none;
}

a:focus {
  outline:none;
  outline-offset: 0;
}

a {
  -webkit-transition: 300ms;
  -moz-transition: 300ms;
    -o-transition: 300ms;
    transition: 300ms;
}

h1, h2, h3, h4, h5, h6 {
  font-family: 'Roboto', sans-serif;
}

.btn:hover, 
.btn:focus{
  outline: none;
  box-shadow: none;
}

.navbar-toggle {
  background-color: #000;
}

a#scrollUp {
  bottom: 0px;
  right: 10px;
  padding: 5px 10px;
  background: #FE980F;
  color: #FFF;
  -webkit-animation: bounce 2s ease infinite;
  animation: bounce 2s ease infinite;
}

a#scrollUp i{
  font-size: 30px;
}


/*************************
*******Header CSS******
**************************/

.header_top {
  background: none repeat scroll 0 0 #F0F0E9;
}

.contactinfo ul li:first-child{
    margin-left: -15px;
}

.contactinfo ul li a{
  font-size: 12px;
  color: #696763;
  font-family: 'Roboto', sans-serif;
}


.contactinfo ul li a:hover{
	background:inherit;
}


.social-icons ul li a {
  border: 0 none;
  border-radius: 0;
  color: #696763;
  padding:0px;
}


.social-icons ul li{
	display:inline-block;
}

.social-icons ul li a i {
  padding: 11px 15px;
   transition: all 0.9s ease 0s;
  -moz-transition: all 0.9s ease 0s;
  -webkit-transition: all 0.9s ease 0s;
  -o-transition: all 0.9s ease 0s;
}

.social-icons ul li a i:hover{
  color: #fff;
   transition: all 0.9s ease 0s;
  -moz-transition: all 0.9s ease 0s;
  -webkit-transition: all 0.9s ease 0s;
  -o-transition: all 0.9s ease 0s;
}


.fa-facebook:hover {
  background: #0083C9;
}

.fa-twitter:hover  {
	background:#5BBCEC;
}

.fa-linkedin:hover  {
	background:#FF4518;
}

.fa-dribbble:hover  {
	background:#90C9DC;
}

.fa-google-plus:hover  {
	background:#CE3C2D;
}

.header-middle .container .row {
  border-bottom: 1px solid #f5f5f5;
  margin-left: 0;
  margin-right: 0;
  padding-bottom: 20px;
  padding-top: 20px;
}

.header-middle .container .row .col-sm-4{
  padding-left: 0;
}

.header-middle .container .row .col-sm-8 {
	padding-right:0;
}

.usa {
  border-radius: 0;
  color: #B4B1AB;
  font-size: 12px;
  margin-right: 20px;
  padding: 2px 15px;
  margin-top: 10px;
}

.usa:hover {
	background:#FE980F;
	color:#fff;
	border-color:#FE980F;
}

.usa:active, .usa.active {
  background: none repeat scroll 0 0 #FE980F;
  box-shadow: inherit;
  outline: 0 none;
}

.btn-group.open .dropdown-toggle {
  background: rgba(0, 0, 0, 0);
  box-shadow: none;
}

.dropdown-menu  li  a:hover, .dropdown-menu  li  a:focus {
  background-color: #FE980F;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  text-decoration: none;
}


.shop-menu ul li {
	display:inline-block;
  padding-left: 15px;
  padding-right: 15px;
}

.shop-menu ul li:last-child {
  padding-right: 0;
}


.shop-menu ul li a {
  background: #FFFFFF;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300;
  padding:0;
  padding-right: 0;
  margin-top: 10px;
}


.shop-menu ul li a i{
	margin-right:3px;
}


.shop-menu ul li a:hover {
	color:#fe980f;
	background:#fff;
}


.header-bottom {
  padding-bottom: 30px;
  padding-top: 30px;
}

.navbar-collapse.collapse{
  padding-left: 0;
}

.mainmenu ul li{
  padding-right: 15px;
  padding-left: 15px;
}

.mainmenu ul li:first-child{
  padding-left: 0px;
}

.mainmenu ul li a {
	color: #696763;
	font-family: 'Roboto', sans-serif;
	font-size: 17px;
	font-weight: 300;
	padding: 0;
	padding-bottom: 10px;
}

.mainmenu ul li a:hover, .mainmenu ul li a.active,  .shop-menu ul li a.active{
	background:none;
	color:#fdb45e;
}

.search_box input {
  background: #F0F0E9;
  border: medium none;
  color: #B2B2B2;
  font-family: 'roboto';
  font-size: 12px;
  font-weight: 300;
  height: 35px;
  outline: medium none;
  padding-left: 10px;
  width: 155px;
  background-image: url(../images/home/searchicon.png);
  background-repeat: no-repeat;
  background-position: 130px;
}


/*  Dropdown menu*/

.navbar-header 
.navbar-toggle .icon-bar {
    background-color: #fff;
}


.nav.navbar-nav > li:hover > ul.sub-menu{
  display: block;
  -webkit-animation: fadeInUp 400ms;
  -moz-animation: fadeInUp 400ms;
  -ms-animation: fadeInUp 400ms;
  -o-animation: fadeInUp 400ms;
  animation: fadeInUp 400ms;
}

ul.sub-menu {
	position: absolute;
	top: 30px;
	left: 0;
	background: rgba(0, 0, 0, 0.6);
	list-style: none;
	padding: 0;
	margin: 0;
	width: 220px;
	-webkit-box-shadow: 0 3px 3px rgba(0, 0, 0, 0.1);
	box-shadow: 0 3px 3px rgba(0, 0, 0, 0.1);
	display: none;
	z-index: 999;
}

.dropdown ul.sub-menu li .active{
  color: #FDB45E;
  padding-left: 0;
}


.navbar-nav li ul.sub-menu li{
  padding: 10px 20px 0 ;
}

.navbar-nav li ul.sub-menu li:last-child{
  padding-bottom: 20px;
}

.navbar-nav li ul.sub-menu li a{
  color: #fff;
}

.navbar-nav li ul.sub-menu li a:hover{
    color: #FDB45E;
}

.fa-angle-down{
  padding-left: 5px; 
}

@-webkit-keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
}
  
/*************************
*******Footer CSS******
**************************/

#footer {
  background: #F0F0E9;
}


.footer-top .container {
  border-bottom: 1px solid #E0E0DA;
  padding-bottom: 20px;
}

.companyinfo {
  margin-top: 57px;
}

.companyinfo h2 {
  color: #B4B1AB;
  font-family: abel;
  font-size: 27px;
  text-transform: uppercase;
}

.companyinfo h2  span{
  color:#FE980F;
}

.companyinfo p {
  color: #B3B3AD;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  font-weight: 300;
}

.footer-top .col-sm-3{
  overflow: hidden;
}

.video-gallery {
  margin-top: 57px;
  position: inherit;
}

.video-gallery a img {
  height: 100%;
  width: 100%;
}

.iframe-img {
  position: relative;
  display: block;
  height: 61px;
  margin-bottom: 10px;
  border: 2px solid #CCCCC6;
  border-radius: 3px;
}

.overlay-icon {
  position: absolute;
  top: 0;
  width: 100%;
  height: 61px;
  background: #FE980F;
  border-radius: 3px;
  color: #FFF;
  font-size: 20px;
  line-height: 0;
  display: block;
  opacity: 0;
   -webkit-transition: 300ms;
  -moz-transition: 300ms;
    -o-transition: 300ms;
    transition: 300ms;
}

.overlay-icon i {
  position: relative;
  top: 50%;
  margin-top: -20px;
}

.video-gallery a:hover .overlay-icon{
  opacity: 1;
}

.video-gallery p {
  color: #8C8C88;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  font-weight: 500;
  margin-bottom:0px;
}

.video-gallery  h2 {
  color: #8c8c88;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  font-weight: 300;
  text-transform:uppercase;
  margin-top:0px;
}


.address {
  margin-top: 30px;
  position: relative;
  overflow: hidden;
}
.address  img {
	width:100%;
}

.address p {
  color: #666663;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300;
  left: 25px;
  position: absolute;
  top: 50px;
}

.footer-widget {
  margin-bottom: 68px;
}

.footer-widget .container {
  border-top: 1px solid #FFFFFF;
  padding-top: 15px;
}

.single-widget h2 {
  color: #666663;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  font-weight: 500;
  margin-bottom: 22px;
  text-transform: uppercase;
}

.single-widget h2 i{
	margin-right:15px;
}

.single-widget ul li a{
	color: #8C8C88;
	font-family: 'Roboto', sans-serif;
	font-size: 14px;
	font-weight: 300;
	padding: 5px 0;
}

.single-widget ul li a i {
  margin-right: 18px;
}

.single-widget ul li a:hover{
	background:none;
	color:#FE980F;
}


.searchform input {
  border: 1px solid #DDDDDD;
  color: #CCCCC6;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  margin-top: 0;
  outline: medium none;
  padding: 7px;
  width: 212px;
}


.searchform button {
  background: #FE980F;
  border: medium none;
  border-radius: 0;
  margin-left: -5px;
  margin-top: -3px;
  padding: 7px 17px;
}

.searchform button i {
  color: #FFFFFF;
  font-size: 20px;
}

.searchform  button:hover, 
.searchform  button:focus{
	background-color:#FE980F;
}

.searchform p {
  color: #8C8C88;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300;
  margin-top: 25px;
}

.footer-bottom {
  background: #D6D6D0;
  padding-top: 10px;
}

.footer-bottom p {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-weight: 300;
  margin-left: 15px;
}

.footer-bottom p span a {
  color: #FE980F;
  font-style: italic;
  text-decoration: underline;
}


/*************************
******* Home ******
**************************/


#slider {
  padding-bottom: 45px;
}

.carousel-indicators li {
  background: #C4C4BE;
}

.carousel-indicators li.active {
	  background: #FE980F;
}

.item {
  padding-left: 100px;
}


.pricing {
  position: absolute;
  right: 40%;
  top: 52%;
}

.girl {
  margin-left: 0;
}

.item h1 {
  color: #B4B1AB;
  font-family: abel;
  font-size: 48px;
  margin-top: 115px;
}

.item h1 span {
	color:#FE980F;
}

.item h2 {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-size: 28px;
  font-weight: 700;
  margin-bottom: 22px;
  margin-top: 10px;
}

.item  p {
	color:#363432;
	font-size:16px;
	font-weight:300;
	font-family: 'Roboto', sans-serif;
}

.get {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  font-weight: 300;
  margin-top: 23px;
}


.item button:hover {
  background: #FE980F;
}

.control-carousel {
  position: absolute;
  top: 50%;
  font-size: 60px;
  color: #C2C2C1;
}

.control-carousel:hover{
  color: #FE980F ;
}

.right {
  right: 0;
}

.category-products {
  border: 1px solid #F7F7F0;
  margin-bottom: 35px;
  padding-bottom: 20px;
  padding-top: 15px;
}
.left-sidebar h2, .brands_products h2 {
  color: #FE980F;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
  font-weight: 700;
  margin: 0 auto 30px;
  text-align: center;
  text-transform: uppercase;
  position: relative;
  z-index:3;
}

.left-sidebar h2:after, h2.title:after{
	content: " ";
	position: absolute;
	border: 1px solid #f5f5f5;
	bottom:8px;
	left: 0;
	width: 100%;
	height: 0;
	z-index: -2;
}

.left-sidebar h2:before{
	content: " ";
	position: absolute;
	background: #fff;
	bottom: -6px;
	width: 130px;
	height: 30px;
	z-index: -1;
	left: 50%;
	margin-left: -65px;
}

h2.title:before{
	content: " ";
	position: absolute;
	background: #fff;
	bottom: -6px;
	width: 220px;
	height: 30px;
	z-index: -1;
	left: 50%;
	margin-left: -110px;
}

.category-products .panel {
	background-color: #FFFFFF;
	border: 0px;
	border-radius: 0px;
	box-shadow:none;
	margin-bottom: 0px;
}

.category-products .panel-default .panel-heading {
  background-color: #FFFFFF;
  border: 0 none;
  color: #FFFFFF;
  padding: 5px 20px;
}

.category-products .panel-default .panel-heading .panel-title a {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  text-decoration: none;
  text-transform: uppercase;
}

.panel-group .panel-heading + .panel-collapse .panel-body {
  border-top: 0 none;
}

.category-products .badge {
  background:none;
  border-radius: 10px;
  color: #696763;
  display: inline-block;
  font-size: 12px;
  font-weight: bold;
  line-height: 1;
  min-width: 10px;
  padding: 3px 7px;
  text-align: center;
  vertical-align: baseline;
  white-space: nowrap;
}

.panel-body ul{
  padding-left: 20px;
}


.panel-body ul li a {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 12px;
  text-transform: uppercase;
}

.brands-name {
  border: 1px solid #F7F7F0;
  padding-bottom: 20px;
  padding-top: 15px;
}


.brands-name .nav-stacked li a {
  background-color: #FFFFFF;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  padding: 5px 25px;
  text-decoration: none;
  text-transform: uppercase;
}

.brands-name .nav-stacked li a:hover{
  background-color: #fff;
  color: #696763;
}

.shipping {
  background-color: #F2F2F2;
  margin-top: 40px;
  overflow: hidden;
  padding-top: 20px;
  position: relative;
}


.price-range{
  margin-top:30px;
}

.well {
  background-color: #FFFFFF;
  border: 1px solid #F7F7F0;
  border-radius: 4px;
  box-shadow: none;
  margin-bottom: 20px;
  min-height: 20px;
  padding: 35px;
}


.tooltip-inner {
  background-color: #FE980F;
  border-radius: 4px;
  color: #FFFFFF;
  max-width: 200px;
  padding: 3px 8px;
  text-align: center;
  text-decoration: none;
}

.tooltip.top .tooltip-arrow {
  border-top-color: #FE980F;
  border-width: 5px 5px 0;
  bottom: 0;
  left: 50%;
  margin-left: -5px;
}


.padding-right {
  padding-right: 0;
}

.features_items{
	overflow:hidden;
}


h2.title {
  color: #FE980F;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
  font-weight: 700;
  margin: 0 15px;
  text-transform: uppercase;
  margin-bottom: 30px;
  position: relative;
}

.product-image-wrapper{
	border:1px solid #F7F7F5;
	overflow: hidden;
	margin-bottom:30px;
}

.single-products {
  position: relative;
}

.new, .sale {
  position: absolute;
  top: 0;
  right: 0;
}

.productinfo h2{
	color: #FE980F;
	font-family: 'Roboto', sans-serif;
	font-size: 24px;
	font-weight: 700;
}
.product-overlay h2{
	color: #fff;
	font-family: 'Roboto', sans-serif;
	font-size: 24px;
	font-weight: 700;
}


.productinfo p{
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 400;
  color: #696763;
}

.productinfo img{
  width: 100%;
}

.productinfo{
 position:relative;
}

.product-overlay {
  background:#FE980F;
  top: 0;
  display: none;
  height: 0;
  position: absolute;
  transition: height 500ms ease 0s;
  width: 100%;
  display: block;
  
}

.single-products:hover .product-overlay {
  display:block;
  height:100%;
}


.product-overlay .overlay-content {
  bottom: 0;
  position: absolute;
  bottom: 0;
  text-align: center;
  width: 100%;
}

.product-overlay .add-to-cart {
  background:#fff;
  border: 0 none;
  border-radius: 0;
  color: #FE980F;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 25px;
}

.product-overlay .add-to-cart:hover {
  background:#fff;
  color: #FE980F;
}


.product-overlay p{
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 400;
  color: #fff;
}



.add-to-cart {
  background:#F5F5ED;
  border: 0 none;
  border-radius: 0;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 25px;
}

.add-to-cart:hover {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
}

.add-to{
  margin-bottom: 10px;
}

.add-to-cart i{
	margin-right:5px;
}

.add-to-cart:hover {
  background: #FE980F;
  color: #FFFFFF;
}

.choose {
  border-top: 1px solid #F7F7F0;
}

.choose ul li a {
  color: #B3AFA8;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  padding-left: 0;
  padding-right: 0;
}

.choose ul li a i{
	margin-right:5px;
}

.choose ul li a:hover{
	background:none;
	color:#FE980F;
}

.category-tab {
  overflow: hidden;
}

.category-tab ul {
  background: #40403E;
  border-bottom: 1px solid #FE980F;
  list-style: none outside none;
  margin: 0 0 30px;
  padding: 0;
  width: 100%;
}

.category-tab ul li a {
  border: 0 none;
  border-radius: 0;
  color: #B3AFA8;
  display: block;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  text-transform: uppercase;
}

.category-tab ul  li  a:hover{
	background:#FE980F;
	color:#fff;
}

.nav-tabs  li.active  a, .nav-tabs  li.active  a:hover, .nav-tabs  li.active  a:focus {
  -moz-border-bottom-colors: none;
  -moz-border-left-colors: none;
  -moz-border-right-colors: none;
  -moz-border-top-colors: none;
  background-color: #FE980F;
  border:0px;
  color: #FFFFFF;
  cursor: default;
  margin-right:0;
  margin-left:0;
}

.nav-tabs  li  a {
  border: 1px solid rgba(0, 0, 0, 0);
  border-radius: 4px 4px 0 0;
  line-height: 1.42857;
  margin-right:0;
}

.recommended_items {
  overflow: hidden;
}

#recommended-item-carousel .carousel-inner .item {
  padding-left: 0;
}

.recommended-item-control {
  position: absolute;
  top: 41%;
}

.recommended-item-control i {
  background: none repeat scroll 0 0 #FE980F;
  color: #FFFFFF;
  font-size: 20px;
  padding: 4px 10px;
}

.recommended-item-control i:hover {
  background: #ccccc6;
}

.recommended_items  h2 {
}

.our_partners{
  overflow:hidden;
}

.our_partners ul {
  background: #F7F7F0;
  margin-bottom: 50px;
}


.our_partners ul li a:hover{
	background:none;
}

/*************************
*******Shop CSS******
**************************/


#advertisement {
  padding-bottom: 45px;
}

#advertisement img {
  width: 100%;
}

.pagination {
  display: inline-block;
  margin-bottom: 25px;
  margin-top: 0;
  padding-left: 15px;
}

.pagination  li:first-child  a, .pagination  li:first-child  span {
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
  margin-left: 0;
}

.pagination  li:last-child  a, .pagination  li:last-child  span {
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
}

.pagination  .active  a, .pagination  .active  span, .pagination  .active  a:hover, .pagination  .active  span:hover, .pagination  .active  a:focus, .pagination  .active  span:focus {
  background-color: #FE980F;
  border-color: #FE980F;
  color: #FFFFFF;
  cursor: default;
  z-index: 2;
}

.pagination  li  a, .pagination  li  span {
  background-color: #f0f0e9;
  border: 0;
  float: left;
  line-height: 1.42857;
  margin-left: -1px;
  padding: 6px 12px;
  position: relative;
  text-decoration: none;
  margin-right: 5px;
  color:#000;
}

.pagination  li  a:hover{
	background:#FE980F;
	color:#fff;
}



/*************************
*******Product Details CSS******
**************************/

.product-details{
	overflow:hidden;
}


#similar-product {
  margin-top: 40px;
}


#reviews {
  padding-left: 25px;
  padding-right: 25px;
}

.product-details {
  margin-bottom: 40px;
  overflow: hidden;
  margin-top: 10px;
}



.view-product {
  position: relative;
}

.view-product img {
  border: 1px solid #F7F7F0;
  height: 380px;
  width: 100%;
}

.view-product h3 {
  background: #FE980F;
  bottom: 0;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 700;
  margin-bottom: 0;
  padding: 8px 20px;
  position: absolute;
  right: 0;
}

#similar-product .carousel-inner .item{
	padding-left:0px;
}

#similar-product .carousel-inner .item img {
  display: inline-block;
  margin-left: 15px;
}

.item-control {
  position: absolute;
  top: 35%;
}
.item-control i {
  background: #FE980F;
  color: #FFFFFF;
  font-size: 20px;
  padding: 5px 10px;
}

.item-control i:hover{
	background:#ccccc6;
}

.product-information {
  border: 1px solid #F7F7F0;
  overflow: hidden;
  padding-bottom: 60px;
  padding-left: 60px;
  padding-top: 60px;
  position: relative;
}

.newarrival{
	position:absolute;
	top:0;
	left:0
}

.product-information h2 {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-size: 20px;
  margin-top: 0;
}

.product-information p {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  margin-bottom: 5px;
}

.product-information span {
  display: inline-block;
  margin-bottom: 8px;
  margin-top: 18px;
}

.product-information span span {
  color: #FE980F;
  float: left;
  font-family: 'Roboto', sans-serif;
  font-size: 30px;
  font-weight: 700;
  margin-right: 20px;
  margin-top: 0px;
}
.product-information span input {
  border: 1px solid #DEDEDC;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 20px;
  font-weight: 700;
  height: 33px;
  outline: medium none;
  text-align: center;
  width: 50px;
}

.product-information span label {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-weight: 700;
  margin-right: 5px;
}

.share {
  margin-top: 15px;
}


.cart {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  margin-bottom: 10px;
  margin-left: 20px;
}


.shop-details-tab {
  border: 1px solid #F7F7F0;
  margin-bottom: 75px;
  margin-left: 15px;
  margin-right: 15px;
  padding-bottom: 10px;
}
.shop-details-tab .col-sm-12 {
	padding-left: 0;
	padding-right: 0;
}


#reviews ul {
  background: #FFFFFF;
  border: 0 none;
  list-style: none outside none;
  margin: 0 0 20px;
  padding: 0;
}

#reviews  ul  li {
	display:inline-block;
}

#reviews ul li a {
  color: #696763;
  display: block;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  padding-right: 15px;
}

#reviews ul li a i{
	color:#FE980F;
	padding-right:8px;
}

#reviews ul li a:hover{
	background:#fff;
	color:#FE980F;
}

#reviews p{
	color:#363432;
}

#reviews  form span {
  display: block;
}

#reviews form span input {
  background:#F0F0E9;
  border: 0 none;
  color: #A6A6A1;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  outline: medium none;
  padding: 8px;
  width: 48%;
}
#reviews form span input:last-child {
  margin-left: 3%;
}

#reviews textarea {
  background: #F0F0E9;
  border: medium none;
  color: #A6A6A1;
  height: 195px;
  margin-bottom: 25px;
  margin-top: 15px;
  outline: medium none;
  padding-left: 10px;
  padding-top: 15px;
  resize: none;
  width: 99.5%;
}

#reviews button {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
}


/*************************
*******404 CSS******
**************************/

.logo-404 {
  margin-top: 60px;
}

.content-404 h1 {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-size: 41px;
  font-weight: 300;
}

.content-404 img {
 margin:0 auto;
}

.content-404 p {
  color: #363432;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
}

.content-404  h2 {
  margin-top:50px;
}

.content-404 h2 a {
  background: #FE980F;
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  font-size: 44px;
  font-weight: 300;
  padding: 8px 40px;
}


/*************************
*******login page CSS******
**************************/

#form {
  display: block;
  margin-bottom: 185px;
  margin-top: 185px;
  overflow: hidden;
}

.login-form {

}

.signup-form {

}

.login-form h2, .signup-form h2 {
  color: #696763;
  font-family: 'Roboto', sans-serif;
  font-size: 20px;
  font-weight: 300;
  margin-bottom: 30px;
}


.login-form form input, .signup-form form input {
  background: #F0F0E9;
  border: medium none;
  color: #696763;
  display: block;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 300;
  height: 40px;
  margin-bottom: 10px;
  outline: medium none;
  padding-left: 10px;
  width: 100%;
}

.login-form form span{
  line-height: 25px;
}

.login-form form span input {
  width: 15px;
  float: left;
  height: 15px;
  margin-right: 5px;
}

.login-form form button {
  margin-top: 23px;
}

.login-form form button, .signup-form form button {
  background: #FE980F;
  border: medium none;
  border-radius: 0;
  color: #FFFFFF;
  display: block;
  font-family: 'Roboto', sans-serif;
  padding: 6px 25px;
}

.login-form label{

}


.login-form label input {
  border: medium none;
  display: inline-block;
  height: 0;
  margin-bottom: 0;
  outline: medium none;
  padding-left: 0;
}


.or{
	background: #FE980F;
	border-radius: 40px;
	color: #FFFFFF;
	font-family: 'Roboto', sans-serif;
	font-size: 16px;
	height: 50px;
	line-height: 50px;
	margin-top: 75px;
	text-align: center;
	width: 50px;
}


/*************************
*******Cart CSS******
**************************/

#do_action {
  margin-bottom: 50px;
}

.breadcrumbs {
  position: relative;
}

.breadcrumbs .breadcrumb {
  background:transparent;
  margin-bottom: 75px;
  padding-left: 0;
}

.breadcrumbs .breadcrumb li a {
  background:#FE980F;
  color: #FFFFFF;
  padding: 3px 7px;
}

.breadcrumbs .breadcrumb li a:after {
  content:"";
  height:auto;
  width: auto;
  border-width: 8px;
  border-style: solid;
  border-color:transparent transparent transparent #FE980F;
  position: absolute;
  top: 11px;
  left:48px;

}

.breadcrumbs .breadcrumb > li + li:before {
  content: " ";
}

#cart_items .cart_info {
  border: 1px solid #E6E4DF;
  margin-bottom: 50px
}


#cart_items .cart_info .cart_menu {
  background: #FE980F;
  color: #fff;
  font-size: 16px;
  font-family: 'Roboto', sans-serif;
  font-weight: normal;
}

#cart_items .cart_info .table.table-condensed thead tr {
  height: 51px;
}


#cart_items .cart_info .table.table-condensed tr {
  border-bottom: 1px solid#F7F7F0
}

#cart_items .cart_info .table.table-condensed tr:last-child {
  border-bottom: 0
}

.cart_info table tr td {
  border-top: 0 none;
  vertical-align: inherit;
}


#cart_items .cart_info .image {
  padding-left: 30px;
}


#cart_items .cart_info .cart_description h4 {
  margin-bottom: 0
}

#cart_items .cart_info .cart_description h4 a {
  color: #363432;
  font-family: 'Roboto',sans-serif;
  font-size: 20px;
  font-weight: normal;

}

#cart_items .cart_info .cart_description p {
  color:#696763
}


#cart_items .cart_info .cart_price p {
  color:#696763;
  font-size: 18px
}


#cart_items .cart_info .cart_total_price {
  color: #FE980F;
  font-size: 24px;
}

.cart_product {
  display: block;
  margin: 15px -70px 10px 25px;
}

.cart_quantity_button a {
  background:#F0F0E9;
  color: #696763;
  display: inline-block;
  font-size: 16px;
  height: 28px;
  overflow: hidden;
  text-align: center;
  width: 35px;
  float: left;
}


.cart_quantity_input {
  color: #696763;
  float: left;
  font-size: 16px;
  text-align: center;
  font-family: 'Roboto',sans-serif;
  
}


.cart_delete  {
  display: block;
  margin-right: -12px;
  overflow: hidden;
}


.cart_delete a {
  background:#F0F0E9;
  color: #FFFFFF;
  padding: 5px 7px;
  font-size: 16px
}

.cart_delete a:hover {
  background:#FE980F
}


.bg h2.title {
  margin-right:0;
  margin-left:0;
  margin-top: 0;
}

.heading h3 {
  color: #363432;
  font-size: 20px;
  font-family: 'Roboto', sans-serif;
}

.heading p {
  color: #434343;
  font-size: 16px;
  font-weight: 300;
}


#do_action .total_area {
  padding-bottom: 18px !important;
}

#do_action .total_area, #do_action .chose_area {
  border: 1px solid #E6E4DF;
  color: #696763;
  padding: 30px 25px 30px 0;
  margin-bottom: 80px;
}

.total_area span {
  float: right;
}

.total_area ul li {
  background:#E6E4DF;
  color: #696763;
  margin-top: 10px;
  padding: 7px 20px;
}


.user_option label {
  color: #696763;
  font-weight: normal;
  margin-left: 10px;
}


.user_info {
  display: block;
  margin-bottom: 15px;
  margin-top: 20px;
  overflow: hidden;
}

.user_info label {
  color: #696763;
  display: block;
  font-size: 15px;
  font-weight: normal;

}

.user_info .single_field {
  width: 31%
}

.user_info .single_field.zip-field input {
  background: transparent;
  border: 1px solid#F0F0E9
}

.user_info > li {
  float: left;
  margin-right: 10px
}

.user_info > li > span {
}

.user_info input, select, textarea {
  background: #F0F0E9;
  border:0;
  color: #696763;
  padding: 5px;
  width: 100%;
  border-radius: 0;
  resize: none
}

.user_info select:focus {
  border: 0
}


.chose_area .update {
  margin-left: 40px;
}

.update, .check_out {
  background: #FE980F;
  border-radius: 0;
  color: #FFFFFF;
  margin-top: 18px;
  border: none;
  padding: 5px 15px;
}
.update{
    margin-left: 40px;
}

.check_out {
  margin-left: 20px
}



/*************************
*******checkout CSS******
**************************/

.step-one {
  margin-bottom: -10px
}

.register-req, .step-one .heading {
  background: none repeat scroll 0 0 #F0F0E9;
  color: #363432;
  font-size: 20px;
  margin-bottom: 35px;
  padding: 10px 25px;
  font-family: 'Roboto', sans-serif;
}

.checkout-options {
  padding-left: 20px
}


.checkout-options h3 {
  color: #363432;
  font-size: 20px;
  margin-bottom: 0;
  font-weight: normal;
  font-family: 'Roboto', sans-serif;
}

.checkout-options p {
  color: #434343;
  font-weight: 300;
  margin-bottom: 25px;
}

.checkout-options .nav li {
  float: left;
  margin-right: 45px;
  color: #696763;
  font-size: 18px;
  font-family: 'Roboto', sans-serif;
  font-weight: normal;
}

.checkout-options .nav label {
  font-weight: normal;
}

.checkout-options .nav li a {
  color: #FE980F;
  font-size: 18px;
  font-weight: normal;
  padding: 0
}

.checkout-options .nav li a:hover {
  background: inherit;
}

.checkout-options .nav i {
  margin-right: 10px;
  border-radius: 50%;
  padding: 5px;
  background: #FE980F;
  color:#fff;
  font-size: 14px;
  padding: 2px 3px;
}


.register-req  {
  font-size: 14px;
  font-weight: 300;
  padding: 15px 20px;
  margin-top: 35px;

}

.register-req p {
  margin-bottom: 0
}



.shopper-info p, 
.bill-to p, 
.order-message p {
  color: #696763;
  font-size: 20px;
  font-weight: 300
}


.shopper-info .btn-primary {
  background: #FE980F;
  border: 0 none;
  border-radius: 0;
  margin-right: 15px;
  margin-top: 20px;
}


.form-two, .form-one {
  float: left;
  width: 47%
}


.shopper-info > form > input, 
.form-two > form > select, 
.form-two > form > input, 
.form-one > form > input {
  background:#F0F0E9;
  border: 0 none;
  margin-bottom:10px;
  padding: 10px;
  width: 100%;
  font-weight: 300
}

.form-two > form > select {
  padding:10px 5px
}

.form-two {
  margin-left: 5%
}


.order-message textarea {
  font-size: 12px;
  height: 335px;
  margin-bottom: 20px;
  padding: 15px 20px;
}

.order-message label {
  font-weight:300;
  color: #696763;
  font-family: 'Roboto', sans-serif;
  margin-left: 10px;
  font-size: 14px
}


.review-payment h2 {
  color: #696763;
  font-size: 20px;
  font-weight: 300;
  margin-top: 45px;
  margin-bottom: 20px
}

.payment-options {
  margin-bottom:125px;
  margin-top: -25px
}

.payment-options span label {
  color: #696763;
  font-size: 14px;
  font-weight: 300;
  margin-right: 30px;
}

#cart_items .cart_info 
.table.table-condensed.total-result {
  margin-bottom: 10px;
  margin-top: 35px;
  color: #696763
}

#cart_items .cart_info 
.table.table-condensed.total-result tr {
  border-bottom: 0
}

#cart_items .cart_info 
.table.table-condensed.total-result span {
  color: #FE980F;
  font-weight: 700;
  font-size: 16px
}

#cart_items .cart_info 
.table.table-condensed.total-result 
.shipping-cost {
  border-bottom: 1px solid #F7F7F0;
}




/*************************
*******Blog CSS******
**************************/



.blog-post-area 
.single-blog-post h3 {
  color: #696763;
  font-size: 16px;
  font-family: 'Roboto',sans-serif;
  text-transform: uppercase;
  font-weight: 500;
  margin-bottom: 17px;
}

.single-blog-post > a {
}

.blog-post-area 
.single-blog-post a img {
  border: 1px solid #F7F7F0;
  width: 100%;
  margin-bottom: 30px
}

.blog-post-area  
.single-blog-post p {
  color: #363432
}

.blog-post-area 
.post-meta {
  display: block;
  margin-bottom: 25px;
  overflow: hidden;
}

.blog-post-area 
.post-meta ul {
  padding:0;
  display: inline;
}

.blog-post-area 
.post-meta ul li {
  background:#F0F0E9;
  float: left;
  margin-right: 10px;
  padding: 0 5px;
  font-size: 11px;
  color: #393b3b;
  position: relative;
}

.blog-post-area 
.post-meta ul li i {
  background:#FE980F;
  color: #FFFFFF;
  margin-left: -4px;
  margin-right: 7px;
  padding: 4px 7px;
}

.sinlge-post-meta li i:after,
.blog-post-area 
.post-meta ul li i:after {
  content: "";
  position: absolute;
  width: auto;
  height: auto;
  border-color:transparent transparent transparent #FE980F;
  border-width:4px;
  border-style: solid;
  top:6px;
  left:24px
}

.blog-post-area 
.post-meta ul span {
  float: right;
  color: #FE980F
}

.post-meta span{
    float: right;
}

.post-meta span i{
  color: #FE980F
}


.blog-post-area  
.single-blog-post 
.btn-primary {
  background:#FE980F;
  border: medium none;
  border-radius: 0;
  color: #FFFFFF;
  margin-top: 17px;
}


.pagination-area {
  margin-bottom:45px;
  margin-top:45px
}

.pagination-area 
.pagination li a {
  background:#F0F0E9;
  border: 0 none;
  border-radius: 0;
  color: #696763;
  margin-right: 5px;
  padding: 4px 12px;
}

.pagination-area 
.pagination li a:hover,
.pagination-area 
.pagination li .active {
  background:#FE980F;
  color: #fff
}



/*************************
*******Blog Single CSS******
**************************/

.pager-area {
  overflow: hidden;
}

.pager-area .pager li a {
  background:#F0F0E9;
  border: 0 none;
  border-radius: 0;
  color: #696763;
  font-size: 12px;
  font-weight: 700;
  padding: 4px;
  text-transform: uppercase;
  width: 57px;
}

.pager-area 
.pager li a:hover {
  background: #FE980F;
  color: #fff
}

.rating-area {
  border: 1px solid #F7F7F0;
  direction: block;
  overflow: hidden;
}

.rating-area ul li {
  float: left;
  padding: 5px;
  font-size: 12px
}

.rating-area .ratings {
  float: left;
  padding-left: 0;
  margin-bottom: 0
}


.rating-area 
.ratings li i {
  color:#CCCCCC
}

.rating-area .rate-this {
  color: #363432;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
}

.rating-area 
.ratings .color, 
.rating-area .color {
  color: #FE980F
}


.rating-area .tag {
  float: right;
  margin-bottom: 0;
  margin-right: 10px;
}

.rating-area .tag li {
  padding: 5px 2px;
}
.rating-area .tag li span {
  color: #363432;
}


.socials-share {
  margin-bottom: 30px;
  margin-top: 18px;
}


.commnets 
.media-object {
  margin-right: 15px;
  width: 100%;
}

.commnets {
  border: 1px solid #F7F7F0;
  padding: 18px 18px 18px 0;
  margin-bottom: 50px
}

.commnets .pull-left {
  margin-right: 22px
}

.commnets p, 
.response-area p, 
.replay-box p {
  font-size: 12px
}

.media-heading {
  color: #363432;
  font-size: 14px;
  font-weight: 700;
  font-family: 'Roboto', sans-serif;
  margin-bottom: 15px
}

.blog-socials {
  margin-bottom: -9px;
  margin-top: 14px;
}

.blog-socials ul {
  padding-left: 0;
  overflow: hidden;
  float: left;
}

.blog-socials .btn.btn-primary{
  margin-top: 0;
}

.blog-socials ul li {
  
  float: left;
  height: 17px;
  margin-right: 5px;
  text-align: center;
  width: 17px;
}


.blog-socials ul li a {
  color: #393B3B;
  display: block;
  font-size: 10px;
  padding: 1px;
  background:#F0F0E9;
}

.blog-socials ul li a:hover {
  color: #fff;
  background:#FE980F
}


.media-list .btn-primary, 
.commnets .btn-primary {
  background:#FC9A11;
  border: 0 none;
  border-radius: 0;
  color: #FFFFFF;
  float: left;
  font-size: 10px;
  padding: 1px 7px;
  text-transform: uppercase;
}

.response-area h2 {
  color: #363432;
  font-size: 20px;
  font-weight: 700;
}

.response-area .media {
  border: 1px solid #F7F7F0;
  padding: 18px 18px 18px 0;
  margin-bottom: 27px
}

.response-area .media img{
  height: 102px;
  width: 100%;
}

.response-area .media .pull-left {
  margin-right: 25px
}

.response-area .second-media {
  margin-left: 5%;
  width: 95%;
}


.sinlge-post-meta {
  overflow: hidden;
  padding-left: 0;
  margin-bottom: 15px
}



.sinlge-post-meta li {
  background:#F0F0E9;
  color: #363432;
  float: left;
  font-size: 10px;
  font-weight: 700;
  margin-right: 10px;
  padding: 0 10px 0 0;
  position: relative;
  text-transform: uppercase;
}

.sinlge-post-meta li i {
  background:#FE980F;
  color: #FFFFFF;
  margin-right: 10px;
  padding: 8px 10px;
}

.sinlge-post-meta li i:after {
  top: 7px;
  border-width: 6px;
  left: 27px;
}


.replay-box {
  margin-bottom: 107px;
  margin-top: 55px;
}

.replay-box h2 {
  font-weight: 700;
  font-size: 20px;
  color: #363432;
  margin-top: 0;
  margin-bottom: 45px
}

.replay-box label {
  background:#FE980F;
  color: #FFFFFF;
  margin-bottom: 15px;
  padding: 3px 15px;
  float: left;
  font-weight: 400;
}

.replay-box span {
  color: #FE980F;
  float: right;
  font-weight: 700;
  margin-top: 21px;
}

.replay-box form input {
  border: 1px solid #F7F7F0;
  color: #ADB2B2;
  font-size: 12px;
  margin-bottom: 22px;
  padding: 8px;
  width: 100%;
}

.replay-box form input:hover, 
.text-area textarea:hover {
  border: 1px solid #FE980F;
}

.text-area {
  margin-top: 66px
}

.text-area textarea {
  background: transparent;
  border: 1px solid#F7F7F0
}

.btn.btn-primary {
  background:#FE980F;
  border: 0 none;
  border-radius: 0;
  margin-top: 16px;
}

.blank-arrow {
  position: relative;
}

.blank-arrow label:after {
  content: "";
  position: absolute;
  width: auto;
  height: auto;
  border-style: solid;
  border-width: 8px;
  border-color:#FE980F transparent transparent transparent;
  top: 25px;
  left: 5px
} 



/*************************
******* Contact CSS ********
**************************/

.contact-map {
  width: 100%;
  height: 385px;
  margin-bottom: 70px
}

.contact-info .heading, 
.contact-form .heading {
  text-transform: capitalize;
}

.contact-form .form-group {
  margin-bottom: 20px;
}

#contact-page 
.form-control::-moz-placeholder {
  color: #8D8D8D;
}

#contact-page .form-control {
  background-color: #fff;
  border: 1px solid #ddd;
  color: #696763;
  height: 46px;
  padding: 6px 12px;
  width: 100%;
  font-size: 16px;
  border-radius: 4px;
  box-shadow:inherit;
}

#contact-page #message {
  height:160px;
  resize:none;
}

#main-contact-form .btn-primary {
  margin-bottom: 15px;
  margin-top: 20px;
}


#contact-page .form-control:focus, 
#contact-page .form-control:hover {
  box-shadow: inherit;
  border-color: #FDB45E;
}

#contact-page .contact-info {
  padding: 0 20px;
}

#contact-page .contact-info address {
  margin-bottom: 40px;
  margin-top: -5px;
}

#contact-page .contact-info p {
  margin-bottom: 0;
  color: #696763;
  font-size: 16px;
  line-height: 25px;
}

.social-networks{
  overflow: hidden;
  text-align: center;
}

.social-networks ul {
  margin-top: -5px;
  padding: 0;
  display: inline-block;
}

.social-networks ul li {
  float: left;
  text-decoration: none;
  list-style: none;
  margin-right: 20px;
}

.social-networks ul li:last-child{
  margin-right: 0;
}

.social-networks ul li a {
  color: #999;
  font-size: 25px;
}

.contact-info .social-networks ul li a i{
  background: none;
}

.contact-info .social-networks ul li a:hover{
  color: #FE980F;
}
	
	</style>
</body>


</html>