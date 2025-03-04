<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<title>최근 본 레시피</title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon/recipick-favicon-orange.svg">


<!-- Libs CSS -->
<link
	href="${pageContext.request.contextPath}/libs/bootstrap-icons/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/feather-webfont/dist/feather-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.css"
	rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.min.css">
<style>
/* 카드 크기 고정 */
.fixed-card {
	max-width: 250px; /* 카드 전체 너비 고정 */
	height: 400px; /* 카드 전체 높이 고정 */
}

/* 카드 본문 크기 고정 */
.fixed-card-body {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%; /* 카드 전체 높이에 맞춤 */
}

/* 이미지 크기 고정 */
.fixed-image {
	width: 100%; /* 이미지 너비를 카드 너비에 맞춤 */
	height: 150px; /* 이미지 높이 고정 */
	object-fit: cover; /* 이미지 비율 유지하며 고정된 영역 채움 */
}

/* 제목, 텍스트 여백 */
.fixed-card-body h2 {
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 1rem;
}

.fixed-card-body .text-small {
	margin-bottom: 5px;
}
</style>

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
	<jsp:include page="/WEB-INF/views/components/navbar.jsp" />
	<script
		src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>

	<main>
		<div id="recentRecipesContainer">
			<!-- section -->
			<section>
				<div class="container">
					<!-- row -->
					<div class="row">

						<!-- col -->
						<div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
							<div class="pt-10 pe-lg-10">
								<!-- nav -->
								<ul class="nav flex-column nav-pills nav-pills-dark">
									<!-- nav item -->
									<li class="nav-item"><a class="nav-link"
										aria-current="page"
										href="${pageContext.request.contextPath}/mypage-like"> <i
											class="feather-icon icon-shopping-bag me-2"></i> 좋아요
									</a></li>
									
									<li class="nav-item"><a class="nav-link"
										aria-current="page"
										href="${pageContext.request.contextPath}/mypage-myrecipe">
											<i class="feather-icon icon-shopping-bag me-2"></i> 내가 작성한
											게시글
									</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page"
										href="${pageContext.request.contextPath}/mypage-review"> <i
											class="feather-icon icon-shopping-bag me-2"></i> 리뷰 관리
									</a></li>
									<li class="nav-item"><a class="nav-link"
										aria-current="page"
										href="${pageContext.request.contextPath}/mypage-orders"> <i
											class="feather-icon icon-shopping-bag me-2"></i> 주문/배송 조회
									</a></li>
									<!-- nav item -->
									<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/mypage-settings">
											<i class="feather-icon icon-settings me-2"></i> 회원정보수정
									</a></li>


									<!-- nav item -->
									<li class="nav-item"><a class="nav-link"
										href="/recipe/logout.do"> <i
											class="feather-icon icon-log-out me-2"></i> Log out
									</a></li>
								</ul>
							</div>
						</div>
						<!-- 여기에 내용 -->

						<div class="col-lg-9 col-md-8 col-12">
							<div class="py-6 p-md-6 p-lg-10">
								<div class="container">
									<div class="row mb-9">
										<div class="col-md-12">
											<div
												class="d-flex flex-row justify-content-between align-items-center">
												<div>
													<h2>최근 본 레시피</h2>
													<!-- breacrumb -->
													<nav aria-label="breadcrumb">
														<ol class="breadcrumb mb-0">

														</ol>
													</nav>
												</div>
												<div></div>
											</div>
										</div>
									</div>
									<div
										class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">

										<c:if test="${not empty recipes}">
											<c:forEach items="${recipes}" var="recipe">
												<div class="col" data-original-price="9990"
													data-sale-price="8990">

													<div class="card card-product">
														<div class="card-body">

															<div class="text-center position-relative">
																<a
																	href="${pageContext.request.contextPath}/recipe/products/${recipe.recipe_id}">
																	<img src="${recipe.main_image}" alt="${recipe.title}"
																	class="mb-3 fixed-image" />
																</a>
															</div>

															<!-- 상품 정보 -->
															<div class="text-small mb-1">
																<a
																	href="${pageContext.request.contextPath}/recipe/products/category?main=${recipe.recipe_main}"
																	class="text-decoration-none text-muted">
																	${recipe.recipe_main} </a>
															</div>

															<!-- 상품명 -->
															<h2 class="fs-6">
																<a
																	href="${pageContext.request.contextPath}/recipe/products/${recipe.recipe_id}"
																	class="text-inherit text-decoration-none">
																	${recipe.title} </a>
															</h2>

															<!-- 평점 -->


															<!-- 가격 정보 -->
															<div
																class="d-flex justify-content-between align-items-center mt-3">
																<div>
																	<span class="text-dark fw-bold"> <fmt:formatNumber
																			value="${recipe.price}" pattern="#,###" />원
																	</span>
																</div>

																<!-- 장바구니 버튼 -->
																<div>
																	<button type="button" class="btn btn-primary btn-sm"
																		onclick="addToCart(${recipe.recipe_id})">담기</button>
																</div>
															</div>

															<!-- 부가 정보 -->
															<div class="mt-2">
																<small class="text-muted"> <i
																	class="bi bi-clock me-1"></i>${recipe.cooking_time}분 <i
																	class="bi bi-people ms-2 me-1"></i>${recipe.serving_count}인분
																</small>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${empty recipes}">
											<p>최근 본 레시피가 없습니다.</p>
										</c:if>


									</div>
								</div>
	</main>
	</div>


	<!-- Footer -->
	<!-- 푸터 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/footer.jsp" />

	<!-- Javascript-->
	<!-- Libs JS -->
	<!-- <script src="${pageContext.request.contextPath}/libs/jquery/dist/jquery.min.js"></script> -->
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>

	<!-- <script src="${pageContext.request.contextPath}/js/components/recipe-component.js"></script> -->


</body>

</html>