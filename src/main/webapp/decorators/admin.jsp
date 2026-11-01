<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><decorator:title default="Quản trị"/></title>
    <link href="<c:url value="/assets/admin/css/font-face.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/font-awesome-4.7/css/font-awesome.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/font-awesome-5/css/fontawesome-all.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/mdi-font/css/material-design-iconic-font.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/bootstrap-4.1/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/animsition/animsition.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/wow/animate.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/css-hamburgers/hamburgers.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/slick/slick.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/select2/select2.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/vendor/perfect-scrollbar/perfect-scrollbar.css"/>" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="<c:url value="/assets/admin/css/theme.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/css/admin-ui.css"/>" rel="stylesheet">

    <%-- Views contain inline modal/chart handlers, so core libraries load first. --%>
    <script src="<c:url value="/assets/admin/vendor/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/bootstrap-4.1/popper.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/bootstrap-4.1/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/chartjs/Chart.bundle.min.js"/>"></script>
    <decorator:head />
</head>
<body class="animsition" style="animation-duration: 900ms; opacity: 1;">
    <div class="page-wrapper">
        <%@ include file="./admin/navigation.jsp"%>
        <div class="page-container">
            <%@ include file="./admin/header.jsp"%>
            <main class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <decorator:body/>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="<c:url value="/assets/admin/vendor/slick/slick.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/wow/wow.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/animsition/animsition.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/counter-up/jquery.waypoints.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/counter-up/jquery.counterup.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/circle-progress/circle-progress.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/perfect-scrollbar/perfect-scrollbar.js"/>"></script>
    <script src="<c:url value="/assets/admin/vendor/select2/select2.min.js"/>"></script>
    <script src="<c:url value="/assets/admin/js/main.js"/>"></script>
    <script src="<c:url value="/assets/admin/js/admin-ui.js"/>"></script>
</body>
</html>



