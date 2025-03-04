<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ReciPICK</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon/recipick-favicon-orange.svg">

<!-- External Libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap"
	rel="stylesheet">

<!-- Slick Slider CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/libs/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/libs/slick-carousel/slick/slick-theme.css">

<!-- Bootstrap & Icons -->
<link
	href="${pageContext.request.contextPath}/libs/bootstrap-icons/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/feather-webfont/dist/feather-icons.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.min.css">

<!-- Font CSS -->
<link
	href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT@2/fonts/variable/woff2/SUIT-Variable.css"
	rel="stylesheet">

<style>
body {
	font-family: 'SUIT Variable', sans-serif;
}
</style>
</head>

<body>
	<!-- 헤더 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/header.jsp" />

	<!-- 내브바 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/navbar-ing.jsp" />

	<!-- 메인 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/main-ing.jsp" />

	<!-- 푸터 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/footer-ing.jsp" />

	<!-- JavaScript -->
	<!-- jQuery는 Bootstrap과 Slick의 의존성이므로 먼저 로드 -->
	<script
		src="${pageContext.request.contextPath}/js/vendors/jquery.min.js"></script>

	<!-- Bootstrap 핵심 기능 -->
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Slick Slider 관련 (carousel 기능에 사용) -->
	<script
		src="${pageContext.request.contextPath}/libs/slick-carousel/slick/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/vendors/slick-slider.js"></script>

	<script
		src="${pageContext.request.contextPath}/js/components/ingredient-component.js"></script>
</body>

</html>