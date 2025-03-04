<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Hover Effects on Button -->
<style>
#scroll-down-button:hover {
	transform: scale(1.1);
	background-color: #008b08;
	box-shadow: 0 12px 18px rgba(0, 0, 0, 0.25);
}
</style>

<main>
	<section class="py-lg-16 py-10"
		style="background: url(${pageContext.request.contextPath}/images/banner/banner-5.jpg) no-repeat; background-position: center; background-size: cover; min-height: 542.56px; position: relative; display: flex; justify-content: center; align-items: center;">

		<!-- Overlay for better text contrast -->
		<div
			style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.4);">
		</div>

		<!-- Content -->
		<div style="position: relative; z-index: 1; text-align: center;">
			<h2
				style="color: white; font-size: 36px; font-weight: 700; margin-bottom: 20px;">새로운
				쇼핑 경험</h2>
			<p
				style="color: white; font-size: 18px; font-weight: 400; margin-bottom: 30px;">최고의
				제품을 쇼핑하러 가세요!</p>

			<!-- Scroll Down Button -->
			<button id="scroll-down-button"
				style="padding: 20px 80px; background-color: #FF8A3D; color: white; border: none; border-radius: 30px; cursor: pointer; font-size: 18px; font-weight: 600; box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2); transition: all 0.3s ease; display: inline-block;">
				쇼핑하러 가기</button>
		</div>

		<script>
			const button = document.getElementById('scroll-down-button');
			button.addEventListener('click', function() {
				window.location.href = "recipe/products/category"; // 이동할 URL을 여기에 입력
			});
		</script>
	</section>

	<section class="my-lg-14 my-8">
		<div class="container">
			<div class="row align-items-center mb-8">
				<div class="col-md-8 col-12">
					<!-- heading -->
					<div class="d-flex">
						<div class="mt-1">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								fill="currentColor" class="bi bi-journal text-primary"
								viewBox="0 0 16 16">
											<path
									d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z">
											</path>
											<path
									d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z">
											</path>
										</svg>
						</div>
						<div class="ms-3">
							<h3 class="mb-2">이번 주의 인기 레시피</h3>
							<p class="mb-0">가장 인기 있는 레시피 모아보세요!</p>
						</div>
						<div></div>
					</div>
				</div>
				<!-- button -->
				<div class="col-md-4 text-end d-none d-md-block">
					<a href="recipe/products/category" class="btn btn-primary">전체
						보기</a>
				</div>
			</div>
			<div class="row">
				<c:forEach var="recipe" items="${recipes}">
					<!-- col -->
					<div class="col" data-original-price="${recipe.price}"
						data-sale-price="${recipe.price * 0.9}">
						<div class="card card-product">
							<div class="card-body">
								<div class="position-relative" style="aspect-ratio: 1/1;">
									<a
										href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipe.recipeId}
																		       ?discount_price=${recipe.discountPrice}
																		       &original_price=${recipe.price}
																		       &avg_discount_rate=${recipe.avgDiscountRate}">
										<img src="${recipe.mainImage}" alt="${recipe.title}"
										class="img-fluid w-100 h-100"
										style="object-fit: cover; position: absolute;">
									</a>
								</div>
								<h2 class="fs-6 mt-3">
									<a
										href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipe.recipeId}
																		       ?discount_price=${recipe.discountPrice}
																		       &original_price=${recipe.price}
																		       &avg_discount_rate=${recipe.avgDiscountRate}"
										class="text-inherit text-decoration-none">${recipe.title}</a>
								</h2>
								<div>
									<small class="text-warning"> <c:forEach begin="1"
											end="5" var="i">
											<c:choose>
												<c:when test="${i <= recipe.avgRating}">
													<i class="bi bi-star-fill"></i>
												</c:when>
												<c:when test="${i - recipe.avgRating <= 0.5}">
													<i class="bi bi-star-half"></i>
												</c:when>
												<c:otherwise>
													<i class="bi bi-star"></i>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</small> <span class="text-muted small"> <fmt:formatNumber
											value="${recipe.avgRating}" pattern="0.0" />
										(${recipe.reviewCount})
									</span>
								</div>
								<div
									class="d-flex justify-content-between align-items-center mt-3">
									<div>
										<span class="discount-percentage text-danger"> <fmt:formatNumber
												value="${recipe.avgDiscountRate}" pattern="#,##0" />% 할인
										</span> <br> <span class="text-dark sale-price"> <fmt:formatNumber
												value="${recipe.price * (1 - recipe.avgDiscountRate/100)}"
												pattern="#,###" />원
										</span> <span
											class="text-decoration-line-through text-muted original-price">
											<fmt:formatNumber value="${recipe.price}" pattern="#,###" />원
										</span>
									</div>
									<div>
										<a href="#" class="btn btn-primary btn-sm">담기</a>
									</div>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</section>


	<!-- 테마별 인기 레시피 -->
	<section class="my-lg-14 my-8">
		<div class="container">
			<div class="row align-items-center mb-8">
				<!-- store -->
				<div class="col-md-8 col-12">
					<div class="d-flex">
						<div class="mt-1">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								fill="currentColor" class="bi bi-shop text-primary"
								viewBox="0 0 16 16">
											<path
									d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z">
											</path>
										</svg>
						</div>
						<div class="ms-3">
							<h3 class="mb-2">테마별 인기 레시피 한눈에 보기</h3>
							<p class="mb-0">소개글 한 줄</p>
						</div>
					</div>
				</div>
			</div>

			<div class="table-responsive-xxl pb-6 pb-xl-0">
				<div class="row">
					<div class="col">
						<div class="card border-0 card-hover">
							<a href="recipe/products/category?main=한식" class="img-zoom"><img
								src="${pageContext.request.contextPath}/images/banner/korea33.jpg"
								alt="" class="rounded img-fluid"
								style="height: 200px; object-fit: cover;" /></a>
							<div
								class="position-absolute bg-dark-info w-100 bottom-0 py-3 px-4 rounded-bottom">
								<a href="recipe/products/category?main=한식"
									class="text-white d-flex align-items-center btn-transition">
									한식 <i class="feather-icon icon-chevron-right fs-5"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-0">
							<a href="recipe/products/category?main=중식" class="img-zoom"><img
								src="${pageContext.request.contextPath}/images/banner/china3.jpg"
								alt="" class="rounded img-fluid"
								style="height: 200px; object-fit: cover;" /></a>
							<div
								class="position-absolute bg-dark-warning w-100 bottom-0 py-3 px-4 rounded-bottom">
								<a href="recipe/products/category?main=중식"
									class="text-white d-flex align-items-center btn-transition">
									중식 <i class="feather-icon icon-chevron-right fs-5"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-0">
							<a href="recipe/products/category?main=일식" class="img-zoom"><img
								src="${pageContext.request.contextPath}/images/banner/japan2.jpg"
								alt="" class="rounded img-fluid"
								style="height: 200px; object-fit: cover;" /></a>
							<div
								class="position-absolute bg-dark-danger w-100 bottom-0 py-3 px-4 rounded-bottom">
								<a href="recipe/products/category?main=일식"
									class="text-white d-flex align-items-center btn-transition">
									일식 <i class="feather-icon icon-chevron-right fs-5"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card border-0">
							<a href="recipe/products/category?main=양식" class="img-zoom"><img
								src="${pageContext.request.contextPath}/images/banner/western33.jpg"
								alt="" class="rounded img-fluid"
								style="height: 200px; object-fit: cover;" /></a>
							<div
								class="position-absolute bg-dark-success w-100 bottom-0 py-3 px-4 rounded-bottom">
								<a href="recipe/products/category?main=양식"
									class="text-white d-flex align-items-center btn-transition">
									양식 <i class="feather-icon icon-chevron-right fs-5"></i>
								</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</section>


	<!-- section -->
	<section class="my-8">
		<div class="container">
			<!-- Heading -->
			<div class="row align-items-center mb-6">
				<div class="col-lg-10 col-9">
					<div class="d-flex">
						<div class="mt-1">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-shopping-bag text-primary">
											<path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
											<line x1="3" y1="6" x2="21" y2="6"></line>
											<path d="M16 10a4 4 0 0 1-8 0"></path>
										</svg>
						</div>
						<div class="ms-3">
							<h3 class="mb-2">요리, 이젠 나도 해!</h3>
							<p class="mb-0">요리 초보자를 위한 입문 영상</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Bootstrap Carousel -->
			<div id="videoCarousel" class="carousel slide"
				data-bs-ride="carousel" data-bs-interval="3000">
				<div class="carousel-inner">
					<!-- Slide 1 -->
					<div class="carousel-item active">
						<div class="row">
							<div class="col-md-6 mb-3">
								<div class="card">
									<iframe class="w-100" height="350"
										src="https://www.youtube.com/embed/1YcAlZcdLrs"
										title="*요리팁* 버터 그리고 치즈 보관방법, how to store butter and cheese."
										frameborder="0"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
										referrerpolicy="strict-origin-when-cross-origin"
										allowfullscreen></iframe>
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<div class="card">
									<iframe class="w-100" height="350"
										src="https://www.youtube.com/embed/BB8Y91MW_RY"
										title="*요리 기초* 칼의 종류, 야채 써는 방법, 칼 사용방법" frameborder="0"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
										referrerpolicy="strict-origin-when-cross-origin"
										allowfullscreen></iframe>
								</div>
							</div>
						</div>
					</div>

					<!-- Slide 2 -->
					<div class="carousel-item">
						<div class="row">
							<div class="col-md-6 mb-3">
								<div class="card">
									<iframe class="w-100" height="350"
										src="https://www.youtube.com/embed/xBWCqTakP1g"
										title="*요리기초* 닭 자르는 방법, 닭 분리, 닭손질" frameborder="0"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
										referrerpolicy="strict-origin-when-cross-origin"
										allowfullscreen></iframe>
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<div class="card">
									<iframe class="w-100" height="350"
										src="https://www.youtube.com/embed/xQWETrqFUkw"
										title="*요리 기초* 너무 쉬운 치킨스톡 만들기, chicken stock recipe"
										frameborder="0"
										allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
										referrerpolicy="strict-origin-when-cross-origin"
										allowfullscreen></iframe>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Carousel Controls -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#videoCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#videoCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</section>


</main>