<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ReciPICK</title>

<!-- External Libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- CSS Libraries -->
<link
	href="${pageContext.request.contextPath}/libs/tiny-slider/dist/tiny-slider.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/bootstrap-icons/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/feather-webfont/dist/feather-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.css"
	rel="stylesheet">

<!-- NoUISlider 라이브러리 추가 -->
<link
	href="https://cdn.jsdelivr.net/npm/nouislider@14.6.3/distribute/nouislider.min.css"
	rel="stylesheet">

<!-- Custom Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/components/ingredient-component.css">

<!-- Font CSS -->
<link
	href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT@2/fonts/variable/woff2/SUIT-Variable.css"
	rel="stylesheet">

</head>


<body>
	<!-- 헤더 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/header.jsp" />

	<!-- 내브바 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/navbar-ing.jsp" />

	<main>
		<div class="mt-8 mb-lg-14 mb-8">
			<div class="container">
				<!-- 페이지 제목 -->
				<div
					class="card mb-4 border-0 position-relative overflow-hidden title-card">
					<div class="card-body py-7 px-9 text-center position-relative">
						<h2 class="title-heading mb-2">
							<a href="" id="page-title" class="text-decoration-none"> 제목 </a>
						</h2>
					</div>
				</div>

				<div class="row g-4">
					<!-- 필터바 영역: 일반 페이지에만 표시 -->
					<c:if test="${viewType ne 'best' and viewType ne 'discount'}">
						<div class="col-lg-3">
							<!-- 필터바 포함 -->
							<jsp:include page="/WEB-INF/views/components/filter-ing.jsp" />
						</div>

						<!-- 상품 목록 영역 (필터바 있는 경우) -->
						<div class="col-lg-9">
							<jsp:include page="/WEB-INF/views/components/products-ing.jsp" />
						</div>
					</c:if>

					<!-- 베스트/할인 페이지용 중앙 정렬된 상품 목록 -->
					<c:if test="${viewType eq 'best' or viewType eq 'discount'}">
						<div class="col-lg-10 mx-auto">
							<jsp:include page="/WEB-INF/views/components/products-ing.jsp" />
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</main>

	<script
		src="${pageContext.request.contextPath}/libs/nouislider/dist/nouislider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/wnumb/wNumb.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/components/ingredient-component.js"></script>

</body>

</html>