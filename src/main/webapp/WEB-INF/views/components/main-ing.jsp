<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<!-- Hover Effects on Button -->
			<style>
				#scroll-down-button:hover {
					transform: scale(1.1);
					background-color: #008b08;
					box-shadow: 0 12px 18px rgba(0, 0, 0, 0.25);
				}
			</style>

			<main>
				<!-- 메인 배너 -->
				<section class="py-lg-16 py-10"
					style="background: url(${pageContext.request.contextPath}/images/banner/banner-4.jpg) no-repeat; background-position: center; background-size: cover; min-height: 542.56px; position: relative; display: flex; justify-content: center; align-items: center;">

					<!-- Overlay for better text contrast -->
					<div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.4);">
					</div>

					<!-- Content -->
					<div style="position: relative; z-index: 1; text-align: center;">
						<h2 style="color: white; font-size: 36px; font-weight: 700; margin-bottom: 20px;">새로운
							쇼핑 경험</h2>
						<p style="color: white; font-size: 18px; font-weight: 400; margin-bottom: 30px;">최고의
							제품을 쇼핑하러 가세요!</p>

						<!-- Scroll Down Button -->
						<button id="scroll-down-button"
							style="padding: 20px 80px; background-color: #FF8A3D; color: white; border: none; border-radius: 30px; cursor: pointer; font-size: 18px; font-weight: 600; box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2); transition: all 0.3s ease; display: inline-block;">
							쇼핑하러 가기</button>
					</div>

					<script>
						const button = document.getElementById('scroll-down-button');
						button.addEventListener('click', function () {
							window.location.href = "ingredient/products/category"; // 이동할 URL을 여기에 입력
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
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
											class="bi bi-journal text-primary" viewBox="0 0 16 16">
											<path
												d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z">
											</path>
											<path
												d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z">
											</path>
										</svg>
									</div>
									<div class="ms-3">
										<h3 class="mb-2">이번 주의 인기 식재료</h3>
										<p class="mb-0">가장 인기 있는 레시피 모아보세요!</p>
									</div>
									<div></div>
								</div>
							</div>
							<!-- button -->
							<div class="col-md-4 text-end d-none d-md-block">
								<a href="recipe/products/monthly" class="btn btn-primary">전체 보기</a>
							</div>
						</div>
						<div class="row">
							<c:forEach var="ingredient" items="${ingredients}">
								<!-- col -->
								<div class="col" data-original-price="${ingredient.price}" data-sale-price="${ingredient.price * 0.9}">
									<div class="card card-product">
										<div class="card-body">
											<div class="position-relative" style="aspect-ratio: 1 / 1;">
												 <a href="${pageContext.request.contextPath}/ingredient/product/ingredient-single/${ingredient.ing_id}">  
														<img src="${ingredient.image}" alt="${ingredient.ing_name}" class="img-fluid w-100 h-100"
															style="object-fit: cover; position: absolute;">
												</a>
											</div>
											<h2 class="fs-6 mt-3">
												<a href="${pageContext.request.contextPath}/ingredient/product/ingredient-single/${ingredient.ing_id}"
													class="text-inherit text-decoration-none">${ingredient.ing_name}</a>
											</h2>
											
											<div class="d-flex justify-content-between align-items-center">
												<div>
													<span class="discount-percentage text-danger">${ingredient.discount}% 할인</span> <br>
													<span class="text-dark sale-price">
														<fmt:formatNumber value="${ingredient.price * (1 - ingredient.discount/100)}"
															pattern="#,###" />원
													</span>
													<span class="text-decoration-line-through text-muted original-price">
														<fmt:formatNumber value="${ingredient.price}" pattern="#,###" />원
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

				<!-- 몸에 좋은 재료 궁합 -->
				<section class="my-8">
					<div class="container">
						<!-- Heading -->
						<div class="row align-items-center mb-6">
							<div class="col-lg-10 col-9">
								<div class="d-flex">
									<div class="mt-1">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
											stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
											class="feather feather-shopping-bag text-primary">
											<path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
											<line x1="3" y1="6" x2="21" y2="6"></line>
											<path d="M16 10a4 4 0 0 1-8 0"></path>
										</svg>
									</div>
									<div class="ms-3">
										<h3 class="mb-2">몸에 좋은 재료 궁합</h3>
										<p class="mb-0">자연이 주는 건강한 궁합</p>
									</div>
								</div>
							</div>
						</div>

						<!-- Bootstrap Carousel -->
						<div id="videoCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
							<div class="carousel-inner">
								<!-- Slide 1 -->
								<div class="carousel-item active">
									<div class="row">
										<div class="col-md-6 mb-3">
											<div class="card">
												<iframe class="w-100" height="350" src="https://www.youtube.com/embed/kDph4KyL5Z8"
													title="마트에서 찾은, 장 건강 꿀 조합 식품~👍" frameborder="0"
													allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
													referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
											</div>
										</div>
										<div class="col-md-6 mb-3">
											<div class="card">
												<iframe class="w-100" height="350" src="https://www.youtube.com/embed/51tsf2VdIBA"
													title="감자와 최고의 궁합 좋은음식 10가지" frameborder="0"
													allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
													referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
											</div>
										</div>
									</div>
								</div>

								<!-- Slide 2 -->
								<div class="carousel-item">
									<div class="row">
										<div class="col-md-6 mb-3">
											<div class="card">
												<iframe class="w-100" height="350" src="https://www.youtube.com/embed/UV-ha4viQxw"
													title="달걀의 효능과 함께 먹으면 좋은 식재료 레시피! ( 계란 )" frameborder="0"
													allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
													referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
											</div>
										</div>
										<div class="col-md-6 mb-3">
											<div class="card">
												<iframe class="w-100" height="350" src="https://www.youtube.com/embed/GGstK55yBb0"
													title="토마토와 함께 먹으면 보약되는 음식3가지와 항암 토마토로 먹는 방법. 만성염증에 탁월한 꿀팁 레시피. 면역력 높이는 겨울 보약 만들기. 당뇨 치매에 좋은 음식. 혈관 건강."
													frameborder="0"
													allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
													referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Carousel Controls -->
							<button class="carousel-control-prev" type="button" data-bs-target="#videoCarousel" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#videoCarousel" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</section>
			</main>