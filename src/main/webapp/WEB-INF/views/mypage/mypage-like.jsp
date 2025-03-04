<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
// 현재 페이지의 쿼리스트링을 가져와서 처리 
String queryString = request.getQueryString();
if (queryString != null) {
	// 기존 page 파라미터 제거 
	queryString = queryString.replaceAll("&?page=[^&]*", "");
}
// 처리된 쿼리스트링을 페이지 스코프에 저장
pageContext.setAttribute("currentQueryString", queryString);
%>


<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<title>좋아요</title>
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
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components/recipe-component.css"> -->

<!-- Font CSS -->
<link
	href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT@2/fonts/variable/woff2/SUIT-Variable.css"
	rel="stylesheet">

<style>
body {
	font-family: 'SUIT Variable', sans-serif;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/components/recipe-component.css">

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
		<!-- section -->
		<section>
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->

					<!-- col -->
					<div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
						<div class="pt-10 pe-lg-10">
							<!-- nav -->
							<ul class="nav flex-column nav-pills nav-pills-dark">
								<!-- nav item -->
								<li class="nav-item"><a class="nav-link active"
									aria-current="page"
									href="${pageContext.request.contextPath}/mypage-like"> <i
										class="feather-icon icon-shopping-bag me-2"></i> 좋아요
								</a></li>

								<li class="nav-item"><a class="nav-link"
									aria-current="page"
									href="${pageContext.request.contextPath}/mypage-myrecipe">
										<i class="feather-icon icon-shopping-bag me-2"></i> 내가 작성한 게시글
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
					<div class="col-lg-9 col-md-8 col-12">
						<div class="py-6 p-md-6 p-lg-10">
							<!-- heading -->
							<h2 class="mb-6">좋아요</h2>

							<div class="products-content">
								<!-- 검색 결과 수 표시 -->
								<div class="mb-3 mb-lg-0">
									<p class="mb-0">
										총 <span class="text-dark fw-bold">${totalCount}</span> 건
									</p>
								</div>


								<div
									class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
									<c:forEach items="${recipes}" var="recipe">
										<div class="col">
											<div class="card card-product">
												<div class="card-body">
													<!-- 이미지 영역 -->
													<div class="text-center position-relative">
														<a
															href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipe.recipe_id}
																	     ?discount_price=${recipe.discount_price}
																	     &original_price=${recipe.original_price}
																	     &avg_discount_rate=${recipe.avg_discount_rate}">
															<div class="image-container">
																<img src="${recipe.main_image}" alt="${recipe.title}"
																	class="fixed-image" />
																<!-- 간단한 할인 뱃지 -->
																<c:if
																	test="${recipe.original_price > recipe.discount_price}">
																	<div class="discount-badge">할인</div>
																</c:if>
															</div>
														</a>
													</div>

													<!-- 상품 정보 영역 -->
													<div class="product-info">

														<!-- 상품명 -->
														<h2 class="fs-6 mb-2">
															<a
																href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipe.recipe_id}
																		       ?discount_price=${recipe.discount_price}
																		       &original_price=${recipe.original_price}
																		       &avg_discount_rate=${recipe.avg_discount_rate}"
																class="text-inherit text-decoration-none">${recipe.title}</a>
														</h2>

														<!-- 평점 -->
														<div class="text-warning mb-1">
															<c:forEach begin="1" end="5" var="i">
																<c:choose>
																	<c:when test="${i <= recipe.avg_rating}">
																		<i class="bi bi-star-fill"></i>
																	</c:when>
																	<c:when test="${i - recipe.avg_rating <= 0.5}">
																		<i class="bi bi-star-half"></i>
																	</c:when>
																	<c:otherwise>
																		<i class="bi bi-star"></i>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<!-- 평점과 리뷰 수 표시 -->
															<span class="text-muted ms-2"> <fmt:formatNumber
																	value="${recipe.avg_rating}" pattern="0.0" />
																(${recipe.review_count})
															</span>
														</div>

														<!-- 가격 정보 -->
														<div class="price-container">
															<c:if
																test="${recipe.original_price > recipe.discount_price}">
																<div class="text-danger fw-bold">
																	<fmt:formatNumber value="${recipe.avg_discount_rate}"
																		pattern="#,##0" />
																	% 할인
																</div>
																<div class="price-row">
																	<span class="text-dark"> <fmt:formatNumber
																			value="${recipe.discount_price}" pattern="#,###" />원
																	</span> <span class="text-decoration-line-through"> <fmt:formatNumber
																			value="${recipe.original_price}" pattern="#,###" />원
																	</span>
																</div>
															</c:if>
														</div>

														<!-- 부가 정보와 담기 버튼 -->
														<div class="extra-info-row">
															<div class="info-group">
																<small class="text-muted"> <i
																	class="bi bi-clock"></i>${recipe.cooking_time}분 <i
																	class="bi bi-people"></i>${recipe.serving_count}인분
																</small>
															</div>
															<button type="button" class="btn btn-primary btn-sm"
																onclick="addToCart(${recipe.recipe_id})">담기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>

								<div class="pagination-container">
									<div class="row mt-8">
										<div class="col">
											<nav>
												<ul class="pagination justify-content-center">
													<!-- 이전 페이지 -->
													<li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
														<a class="page-link"
														href="${pageContext.request.contextPath}/mypage-like/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${currentPage - 1}"
														aria-label="Previous"> <i
															class="feather-icon icon-chevron-left"></i>
													</a>
													</li>

													<!-- 페이지 번호 -->
													<c:forEach begin="1" end="${totalPages}" var="pageNum">
														<li
															class="page-item ${pageNum == currentPage ? 'active' : ''}">
															<a class="page-link"
															href="${pageContext.request.contextPath}/mypage-like/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${pageNum}">
																${pageNum} </a>
														</li>
													</c:forEach>

													<!-- 다음 페이지 -->
													<li
														class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
														<a class="page-link"
														href="${pageContext.request.contextPath}/mypage-like/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${currentPage + 1}"
														aria-label="Next"> <i
															class="feather-icon icon-chevron-right"></i>
													</a>
													</li>
												</ul>
											</nav>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
		</section>
	</main>



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