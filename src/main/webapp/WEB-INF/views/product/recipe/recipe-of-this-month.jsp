<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<!-- 기본 메타 태그 -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Recipick" name="author">

<title>이달의 레시피</title>

<!-- 파비콘 설정 -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon/recipick-favicon-orange.svg">

<!-- CSS 라이브러리 연결 -->
<link
	href="${pageContext.request.contextPath}/libs/bootstrap-icons/font/bootstrap-icons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/feather-webfont/dist/feather-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.css"
	rel="stylesheet">

<!-- 메인 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.min.css">

<style>
/* 페이지 타이틀 섹션 스타일링 */
.page-title-section {
    padding: 3rem 0;
    background: linear-gradient(to right, #f8f9fa, #ffffff);
    margin-bottom: 3rem;
}

.page-title-section h1 {
    font-size: 2.5rem;
    color: #2c3e50;
    margin-bottom: 0.5rem;
}

.page-title-section p {
    color: #6c757d;
    font-size: 1.1rem;
}

/* 메인 레시피 카드 스타일링 */
.main-recipe {
    margin-bottom: 4rem;
    background: transparent;
    max-width: 1320px;
    margin-left: auto;
    margin-right: auto;
}

/* 메인 레시피 이미지 컨테이너 */
.main-recipe .img-zoom {
    height: 400px; /* 메인 레시피 이미지 높이 고정 */
    position: relative;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

/* 서브 레시피 그리드 */
.sub-recipes-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, 300px);
    gap: 2rem;
    justify-content: center;
    max-width: 1320px;
    margin: 0 auto;
    padding: 0 1rem;
}

/* 서브 레시피 카드 */
.sub-recipe-card {
    height: 480px; /* 서브 레시피 카드 높이 고정 */
    display: flex;
    flex-direction: column;
}

.sub-recipe-card .img-zoom {
    height: 200px; /* 서브 레시피 이미지 높이 고정 */
    position: relative;
    border-radius: 1rem;
    overflow: hidden;
    margin-bottom: 1rem;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

/* 반응형 조정 */
@media (max-width: 768px) {
    .main-recipe .img-zoom {
        height: 300px; /* 모바일에서 메인 이미지 높이 조정 */
    }
    
    .sub-recipe-card,
    .card-product {
        height: auto; /* 모바일에서는 자동 높이 */
        min-height: 400px;
    }
    
    .sub-recipe-card .img-zoom,
    .image-container {
        height: 180px; /* 모바일에서 이미지 높이 조정 */
    }
}

.main-recipe .img-zoom {
    position: relative;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    padding-bottom: 66.67%; /* 3:2 비율 적용 */
}

.main-recipe .img-zoom img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.main-recipe .img-zoom img {
    width: 100%;
    height: auto;
    transition: transform 0.3s ease;
}

.main-recipe .img-zoom:hover img {
    transform: scale(1.05);
}

.main-recipe-content {
    padding: 2rem 0;
}

.main-recipe-content h2 {
    font-size: 1.75rem;
    margin-bottom: 1rem;
    color: #2c3e50;
}

.main-recipe-content p {
    color: #6c757d;
    line-height: 1.6;
    margin-bottom: 1.5rem;
}

/* 서브 레시피 카드 스타일링 */
.sub-recipe-card {
    height: 100%;
    border: none;
    background: transparent;
    transition: transform 0.2s ease;
}

.sub-recipe-card:hover {
    transform: translateY(-5px);
}

.sub-recipe-card .img-zoom {
    position: relative;
    border-radius: 1rem;
    overflow: hidden;
    margin-bottom: 1rem;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    padding-bottom: 66.67%; /* 3:2 비율 적용 */
}

.sub-recipe-card .img-zoom img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.sub-recipe-card .img-zoom img {
    width: 100%;
    height: auto;
    transition: transform 0.3s ease;
}

.sub-recipe-card .img-zoom:hover img {
    transform: scale(1.05);
}

/* 레시피 정보 스타일링 */
.recipe-info {
    padding: 1rem 0;
}

.recipe-info h3 {
    font-size: 1.25rem;
    margin-bottom: 0.75rem;
    color: #2c3e50;
}

.recipe-info p {
    color: #6c757d;
    font-size: 0.95rem;
    line-height: 1.5;
    margin-bottom: 1rem;
}

/* 가격 정보 스타일링 */
.price-info {
    margin: 1rem 0;
}

.discount-percentage {
    color: #dc3545;
    font-weight: 600;
    font-size: 1.1rem;
    margin-bottom: 0.5rem;
}

.price-current {
    font-size: 1.2rem;
    font-weight: 600;
    color: #2c3e50;
}

.price-original {
    color: #adb5bd;
    text-decoration: line-through;
    margin-left: 0.5rem;
}

/* 부가 정보 스타일링 */
.recipe-meta {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    margin-top: 1rem;
    padding-top: 1rem;
    border-top: 1px solid #f0f0f0;
}

.recipe-meta span {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: #6c757d;
    font-size: 0.9rem;
}

.recipe-meta i {
    font-size: 1rem;
    color: #6c757d;
}

/* 반응형 스타일링 */
@media (max-width: 768px) {
    .page-title-section {
        padding: 2rem 0;
    }

    .page-title-section h1 {
        font-size: 2rem;
    }

    .main-recipe-content {
        padding: 1.5rem 0;
    }

    .main-recipe-content h2 {
        font-size: 1.5rem;
    }

    .sub-recipe-card {
        margin-bottom: 2rem;
    }
}
</style>

</head>

<body>
	<!-- 헤더 컴포넌트 포함 -->
	<jsp:include page="/WEB-INF/views/components/header.jsp" />

	<!-- 내비게이션 바 포함 -->
	<jsp:include page="/WEB-INF/views/components/navbar.jsp" />

	<!-- 메인 콘텐츠 -->
	<main>
		<!-- 페이지 타이틀 섹션 -->
		<section class="page-title-section">
			<div class="container">
				<div class="row">
					<div class="col-12 text-center">
						<h1 class="fw-bold">이달의 인기 레시피</h1>
						<p>가장 사랑받은 레시피를 만나보세요</p>
					</div>
				</div>
			</div>
		</section>

		<!-- 메인 레시피 섹션 -->
		<section class="mt-4 mb-8">
			<div class="container">
				<!-- 메인 레시피 카드 -->
				<div class="main-recipe row d-flex align-items-center">
					<div class="col-12 col-lg-8">
						<a
							href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipes[0].recipe_id}
																		       ?discount_price=${recipes[0].discount_price}
																		       &original_price=${recipes[0].original_price}
																		       &avg_discount_rate=${recipes[0].avg_discount_rate}">
							<div class="img-zoom">
								<img src="${recipes[0].main_image}" alt="${recipes[0].title}"
									class="img-fluid" />
							</div>
						</a>
					</div>
					<div class="col-12 col-lg-4">
						<div class="main-recipe-content">
							<h2>
								<a
									href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipes[0].recipe_id}
																		       ?discount_price=${recipes[0].discount_price}
																		       &original_price=${recipes[0].original_price}
																		       &avg_discount_rate=${recipes[0].avg_discount_rate}"
									class="text-decoration-none text-inherit">${recipes[0].title}</a>
							</h2>
							<p>${recipes[0].description}</p>

							<div class="price-info">
								<c:if
									test="${recipes[0].discount_price > 0 && recipes[0].discount_price < recipes[0].original_price}">
									<div class="discount-percentage">
										<fmt:formatNumber value="${recipes[0].avg_discount_rate}"
											pattern="#,##0" />
										% 할인
									</div>
								</c:if>
								<div class="d-flex align-items-center">
									<span class="price-current"> <fmt:formatNumber
											value="${recipes[0].discount_price}" pattern="#,###" />원
									</span> <span class="price-original"> <fmt:formatNumber
											value="${recipes[0].original_price}" pattern="#,###" />원
									</span>
								</div>
							</div>

							<div class="recipe-meta">
								<span><i class="bi bi-calendar"></i>${currentDate}</span> <span><i
									class="bi bi-clock"></i>${recipes[0].cooking_time}분</span> <span><i
									class="bi bi-people"></i>${recipes[0].serving_count}인분</span>
							</div>
						</div>
					</div>
				</div>

				<!-- 서브 레시피 그리드 -->
				<div class="row mt-8">
					<c:forEach items="${recipes}" var="recipe" begin="1">
						<div class="col-12 col-md-6 col-lg-4">
							<div class="sub-recipe-card">
								<a
									href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipe.recipe_id}
																		       ?discount_price=${recipe.discount_price}
																		       &original_price=${recipe.original_price}
																		       &avg_discount_rate=${recipe.avg_discount_rate}">
									<div class="img-zoom">
										<img src="${recipe.main_image}" alt="${recipe.title}"
											class="img-fluid" />
									</div>
								</a>
								<div class="recipe-info">
									<h3>
										<a
											href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipe.recipe_id}
																		       ?discount_price=${recipe.discount_price}
																		       &original_price=${recipe.original_price}
																		       &avg_discount_rate=${recipe.avg_discount_rate}"
											class="text-decoration-none text-inherit">${recipe.title}</a>
									</h3>
									<p>${recipe.description}</p>

									<div class="price-info">
										<c:if
											test="${recipe.discount_price > 0 && recipe.discount_price < recipe.original_price}">
											<div class="discount-percentage">
												<fmt:formatNumber value="${recipe.avg_discount_rate}"
													pattern="#,##0" />
												% 할인
											</div>
										</c:if>
										<div class="d-flex align-items-center">
											<span class="price-current"> <fmt:formatNumber
													value="${recipe.discount_price}" pattern="#,###" />원
											</span> <span class="price-original"> <fmt:formatNumber
													value="${recipe.original_price}" pattern="#,###" />원
											</span>
										</div>
									</div>

									<div class="recipe-meta">
										<span><i class="bi bi-clock"></i>${recipe.cooking_time}분</span>
										<span><i class="bi bi-people"></i>${recipe.serving_count}인분</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</main>

	<!-- 푸터 컴포넌트 포함 -->
	<jsp:include page="/WEB-INF/views/components/footer.jsp" />

	<!-- JavaScript 라이브러리 -->
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- 테마 JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>
</body>
</html>