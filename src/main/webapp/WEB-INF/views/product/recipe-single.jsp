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
<meta name="author" content="Codescandy">
<title>ReciPICK</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon/recipick-favicon-orange.svg">

<!-- External Libraries -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="${pageContext.request.contextPath}/libs/tiny-slider/dist/tiny-slider.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/slick-carousel/slick/slick.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/libs/slick-carousel/slick/slick-theme.css"
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

<!-- Custom Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.min.css">

</head>


<body>

	<!-- 헤더 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/header.jsp" />

	<!-- 내브바 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/navbar.jsp" />

	<!-- 여기부터 메인 -->

	<script
		src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>

	<main>
		<div class="mt-4">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<div class="col-12">
						<!-- breadcrumb -->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="#">홈</a></li>
								<li class="breadcrumb-item"><a href="#">${category.recipe_detail}</a></li>
								<li class="breadcrumb-item active" aria-current="page">${recipe.title}</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<section class="mt-8">
			<div class="container">
				<div class="row">
					<div class="col-md-5 col-xl-6">
						<div class="product" id="product">
							<div>
								<%-- 							<div class="zoom" onmousemove="zoom(event)" 마우스 갖다대면 커지는 부분인데 일단스킵
								style="background-image: url(${pageContext.request.contextPath}/images/products/product-single-img-1.jpg)"> --%>
								<img src="${recipe.main_image}" alt="${recipe.main_image}" />
							</div>
						</div>
					</div>
					<div class="col-md-7 col-xl-6">
						<div class="ps-lg-10 mt-6 mt-md-0">
							<a href="#!" class="mb-4 d-block">${category.recipe_detail}</a>
							<div class="d-flex align-items-center mb-4">
								<h1 class="mb-0 flex-grow-1">${recipe.title}</h1>
								<a class="btn btn-light" href="shop-wishlist.html"
									data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="Wishlist"><i class="feather-icon icon-heart"></i></a>
							</div>

							<p class="mb-5">${recipe.description}</p>

							<!-- 							<div class="d-flex align-items-center mb-5">
								<small class="text-warning">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-half"></i>
								</small>
								<a href="#" class="ms-2">(30 리뷰)</a>
							</div> -->

							<hr class="my-6" />

							<div class="mb-5">
								<div class="d-flex align-items-center">
									<span class="ms-3">요리테마 : ${category.recipe_main}</span> <span
										class="mx-3">조리시간 : ${recipe.cooking_time} 분</span> <span
										class="mx-3">인원 : ${recipe.serving_count} 명</span>
								</div>
							</div>
							<div class="mb-5">
								<div class="d-flex align-items-center">
									<!-- <p class="fw-bold ms-3">레시피에 포함된 상세 식재료보기</p> -->
								</div>
								<!-- <div class="d-flex align-items-center">
									<button type="button" class="btn btn-warning btn-lg me-2" data-bs-toggle="modal"
										data-bs-target="#ingredientModal">
										<i class="bi bi-carrot"></i> 식재료 보기
									</button>
								</div> -->
							</div>
							<!-- 모달안씀
							<div class="modal fade" id="ingredientModal" tabindex="-1" aria-labelledby="ingredientModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="ingredientModalLabel">식재료 목록</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<ul>
												<li>당근 100g</li>
												<li>양파 50g</li>
												<li>감자 500g</li>
											</ul>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">저장</button>
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										</div>
									</div>
								</div>
							</div> -->
							<div class="mb-5">
								<div class="d-flex align-items-center">
									<p class="fw-bold ms-3">검색 태그</p>
								</div>
								<div class="d-flex align-items-center flex-wrap">
									<c:forEach var="tag" items="${tags}">
										<a
											href="/recipick/recipe/products/search?searchType=tag&keyword=${tag}"
											class="text-decoration-none text-muted me-3 mb-2 py-1 px-2 rounded-2"
											style="background-color: #f2f2f2;">#${tag}</a>
									</c:forEach>
								</div>
							</div>



							<div class="price-container text-end">
								<!-- 할인 정보 -->
								<c:if test="${recipe.original_price > recipe.discount_price}">
									<div class="discount-badge text-danger fw-bold">
										<span><fmt:formatNumber
												value="${recipe.avg_discount_rate}" pattern="#,##0" /></span>% 할인
									</div>
								</c:if>

								<!-- 가격 정보 -->
								<div
									class="price-details d-flex flex-column align-items-end mt-3">
									<c:if test="${recipe.original_price > recipe.discount_price}">
										<!-- 원래 가격 (취소선) -->
										<div
											class="original-price text-muted text-decoration-line-through fs-5">
											<fmt:formatNumber value="${recipe.original_price}"
												pattern="#,###" />
											원
										</div>
										<!-- 할인된 가격 -->
										<div class="discounted-price text-dark fw-bold fs-3">
											<fmt:formatNumber value="${recipe.discount_price}"
												pattern="#,###" />
											원
										</div>

									</c:if>

									<c:if test="${recipe.original_price <= recipe.discount_price}">
										<!-- 정가 (할인 없는 경우) -->
										<div class="regular-price text-dark fw-bold fs-3">
											<fmt:formatNumber value="${recipe.original_price}"
												pattern="#,###" />
											원
										</div>
									</c:if>
								</div>
							</div>

							<label for="quantitySelect" class="form-label me-2"
								style="display: block;">세트 수</label> <select id="quantitySelect"
								class="form-select">
								<option selected value="1">1개</option>
								<option value="2">2개</option>
								<option value="3">3개</option>
								<option value="4">4개</option>
								<option value="5">5개</option>
							</select>
							<!-- 							선택 수량 * 해서 전송 -->

							<hr class="my-6" />

							<div
								class="mt-3 d-flex justify-content-end g-2 align-items-center">
								<button type="button"
									class="btn btn-primary me-2 btn-option-edit"
									data-recipe-id="${recipe.recipe_id}">
									<i class="feather-icon icon-shopping-bag me-2"></i>장바구니에 담기
								</button>
							</div>

							<hr class="my-6" />
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="mt-lg-14 mt-8">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
							<!-- nav item -->
							<li class="nav-item" role="presentation">
								<!-- btn -->
								<button class="nav-link active" id="product-tab"
									data-bs-toggle="tab" data-bs-target="#product-tab-pane"
									type="button" role="tab" aria-controls="product-tab-pane"
									aria-selected="true">레시피 설명</button>
							</li>
							<!-- nav item -->
							<li class="nav-item" role="presentation">
								<!-- btn -->
								<button class="nav-link" id="details-tab" data-bs-toggle="tab"
									data-bs-target="#details-tab-pane" type="button" role="tab"
									aria-controls="details-tab-pane" aria-selected="false">
									영양정보</button>
							</li>
							<!-- nav item -->
							<li class="nav-item" role="presentation">
								<!-- btn -->
								<button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
									data-bs-target="#reviews-tab-pane" type="button" role="tab"
									aria-controls="reviews-tab-pane" aria-selected="false">
									리뷰</button>
							</li>
							<!-- nav item -->

						</ul>
						<!-- tab content -->
						<div class="tab-content" id="myTabContent">
							<!-- tab pane -->
							<div class="tab-pane fade show active" id="product-tab-pane"
								role="tabpanel" aria-labelledby="product-tab" tabindex="0">
								<div class="tab-pane fade show active" id="product-tab-pane"
									role="tabpanel" aria-labelledby="product-tab" tabindex="0">
									<c:forEach var="step" items="${steps}" varStatus="status">
										<div class="my-8">
											<div class="mb-5">
												<h4 class="mb-1">Step${status.count}</h4>
												<div class="d-flex" style="width: 100%;">
													<div style="flex: 2;">
														<p class="mb-0">${step.description}</p>
													</div>
													<div style="flex: 1;">
														<img src="${step.img_url}" alt="${step.img_url}"
															class="img-thumbnail"
															style="width: 200px; height: 150px;">
													</div>
												</div>
											</div>
										</div>
									</c:forEach>

									<!-- 							<div class="my-8">
										<div class="mb-5">
											<h4 class="mb-1">Step2</h4>
											<div class="d-flex" style="width: 100%;">
												<div style="flex: 2;">
													<p class="mb-0">
														재료 손질에 대한 상세 설명이 들어갈 공간입니다. 이 영역은 왼쪽 영역보다 두 배 넓습니다.
													</p>
												</div>
												<div style="flex: 1;">
													<p class="mb-0">
														재료손질하기(이미지영역)
													</p>
												</div>
											</div>
										</div>
									</div> -->
								</div>
							</div>
							<!-- tab pane -->
							<div class="tab-pane fade" id="details-tab-pane" role="tabpanel"
								aria-labelledby="details-tab" tabindex="0">
								<div class="my-8">
									<div class="row">
										<div class="col-12">
											<h4 class="mb-4">Details</h4>
										</div>
										<div class="col-12 col-lg-6">
											<table class="table table-striped">
												<!-- table -->
												<tbody>
													<tr>
														<th>Weight</th>
														<td>1000 Grams</td>
													</tr>
													<tr>
														<th>Ingredient Type</th>
														<td>Vegetarian</td>
													</tr>
													<tr>
														<th>Brand</th>
														<td>Dmart</td>
													</tr>
													<tr>
														<th>Item Package Quantity</th>
														<td>1</td>
													</tr>
													<tr>
														<th>Form</th>
														<td>Larry the Bird</td>
													</tr>
													<tr>
														<th>Manufacturer</th>
														<td>Dmart</td>
													</tr>
													<tr>
														<th>Net Quantity</th>
														<td>340.0 Gram</td>
													</tr>
													<tr>
														<th>Product Dimensions</th>
														<td>9.6 x 7.49 x 18.49 cm</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="col-12 col-lg-6">
											<table class="table table-striped">
												<!-- table -->
												<tbody>
													<tr>
														<th>ASIN</th>
														<td>SB0025UJ75W</td>
													</tr>
													<tr>
														<th>Best Sellers Rank</th>
														<td>#2 in Fruits</td>
													</tr>
													<tr>
														<th>Date First Available</th>
														<td>30 April 2022</td>
													</tr>
													<tr>
														<th>Item Weight</th>
														<td>500g</td>
													</tr>
													<tr>
														<th>Generic Name</th>
														<td>Banana Robusta</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- tab pane -->
							<div class="tab-pane fade" id="reviews-tab-pane" role="tabpanel"
								aria-labelledby="reviews-tab" tabindex="0">
								<div class="my-8">
									<!-- row -->
									<div class="row">

										<div class="mb-10">
											<div
												class="d-flex justify-content-between align-items-center mb-8">
												<div>
													<!-- heading -->
													<h4>레시피 리뷰</h4>
												</div>
												<div>
													<select class="form-select">
														<option selected>최신순</option>
														<option value="Most Recent">오래된순</option>
													</select>
												</div>
											</div>
											<c:forEach var="review" items="${reviews}">
												<div class="d-flex border-bottom pb-6 mb-6">
													<div class="ms-5">
														<div class="mb-2">
															<c:forEach begin="1" end="5" varStatus="status">
																<c:choose>
																	<c:when test="${status.index le review.star_rating}">
																		<i class="bi bi-star-fill text-warning"></i>
																	</c:when>
																	<c:otherwise>
																		<i class="bi bi-star text-warning"></i>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<br>
														</div>
														<p>
															<fmt:formatDate value="${review.review_dt}"
																pattern="yyyy-MM-dd" />
														</p>
														<p>${review.content}</p>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<!-- tab pane -->
								<div class="tab-pane fade" id="sellerInfo-tab-pane"
									role="tabpanel" aria-labelledby="sellerInfo-tab" tabindex="0">...</div>
							</div>
						</div>
					</div>
				</div>
		</section>

		<!-- section -->

	</main>
	<!-- 여기까지메인-->
	<!-- Footer -->
	<!-- 푸터 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/footer.jsp" />
	<!-- modal -->
	<!-- Modal -->
	<div class="modal fade" id="quickViewModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body p-8">
					<div class="position-absolute top-0 end-0 me-3 mt-3">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<!-- img slide -->
							<div class="product productModal" id="productModal">
								<div class="zoom" onmousemove="zoom(event)"
									style="
                  background-image: url(${pageContext.request.contextPath}/images/products/product-single-img-1.jpg);
                ">
									<!-- img -->
									<img
										src="${pageContext.request.contextPath}/images/products/product-single-img-1.jpg"
										alt="">
								</div>
								<div>
									<div class="zoom" onmousemove="zoom(event)"
										style="
                    background-image: url(${pageContext.request.contextPath}/images/products/product-single-img-2.jpg);
                  ">
										<!-- img -->
										<img
											src="${pageContext.request.contextPath}/images/products/product-single-img-2.jpg"
											alt="">
									</div>
								</div>
								<div>
									<div class="zoom" onmousemove="zoom(event)"
										style="
                    background-image: url(${pageContext.request.contextPath}/images/products/product-single-img-3.jpg);
                  ">
										<!-- img -->
										<img
											src="${pageContext.request.contextPath}/images/products/product-single-img-3.jpg"
											alt="">
									</div>
								</div>
								<div>
									<div class="zoom" onmousemove="zoom(event)"
										style="
                    background-image: url(${pageContext.request.contextPath}/images/products/product-single-img-4.jpg);
                  ">
										<!-- img -->
										<img
											src="${pageContext.request.contextPath}/images/products/product-single-img-4.jpg"
											alt="">
									</div>
								</div>
							</div>
							<!-- product tools -->
							<div class="product-tools">
								<div class="thumbnails row g-3" id="productModalThumbnails">
									<div class="col-3" class="tns-nav-active">
										<div class="thumbnails-img">
											<!-- img -->
											<img
												src="${pageContext.request.contextPath}/images/products/product-single-img-1.jpg"
												alt="">
										</div>
									</div>
									<div class="col-3">
										<div class="thumbnails-img">
											<!-- img -->
											<img
												src="${pageContext.request.contextPath}/images/products/product-single-img-2.jpg"
												alt="">
										</div>
									</div>
									<div class="col-3">
										<div class="thumbnails-img">
											<!-- img -->
											<img
												src="${pageContext.request.contextPath}/images/products/product-single-img-3.jpg"
												alt="">
										</div>
									</div>
									<div class="col-3">
										<div class="thumbnails-img">
											<!-- img -->
											<img
												src="${pageContext.request.contextPath}/images/products/product-single-img-4.jpg"
												alt="">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="ps-lg-8 mt-6 mt-lg-0">
								<a href="#!" class="mb-4 d-block">소분류명</a>
								<h2 class="mb-1 h1">Napolitanke Ljesnjak</h2>
								<div class="mb-4">
									<small class="text-warning"> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i></small><a
										href="#" class="ms-2">(30 reviews)</a>
								</div>
								<div class="fs-4">
									<span class="fw-bold text-dark">$32</span> <span
										class="text-decoration-line-through text-muted">$35</span><span><small
										class="fs-6 ms-2 text-danger">26% Off</small></span>
								</div>
								<hr class="my-6">
								<div class="mb-4">
									<button type="button" class="btn btn-outline-secondary">
										250g</button>
									<button type="button" class="btn btn-outline-secondary">
										500g</button>
									<button type="button" class="btn btn-outline-secondary">
										1kg</button>
								</div>
								<div>
									<!-- input -->
									<!-- input -->
									<div class="input-group input-spinner  ">
										<input type="button" value="-"
											class="button-minus  btn  btn-sm " data-field="quantity">
										<input type="number" step="1" max="10" value="1"
											name="quantity"
											class="quantity-field form-contr	ol-sm form-input   ">
										<input type="button" value="+" class="button-plus btn btn-sm "
											data-field="quantity">
									</div>
								</div>
								<div
									class="mt-3 row justify-content-start g-2 align-items-center">

									<div class="col-lg-4 col-md-5 col-6 d-grid">
										<!-- button -->
										<!-- btn -->
										<button type="button" class="btn btn-primary">
											<i class="feather-icon icon-shopping-bag me-2"></i>Add to
											cart
										</button>
									</div>
									<div class="col-md-4 col-5">
										<!-- btn -->
										<a class="btn btn-light" href="#" data-bs-toggle="tooltip"
											data-bs-html="true" aria-label="Compare"><i
											class="bi bi-arrow-left-right"></i></a> <a class="btn btn-light"
											href="#!" data-bs-toggle="tooltip" data-bs-html="true"
											aria-label="Wishlist"><i class="feather-icon icon-heart"></i></a>
									</div>
								</div>
								<hr class="my-6">
								<div>
									<table class="table table-borderless">
										<tbody>
											<tr>
												<td>Product Code:</td>
												<td>FBB00255</td>
											</tr>
											<tr>
												<td>Availability:</td>
												<td>In Stock</td>
											</tr>
											<tr>
												<td>Type:</td>
												<td>Fruits</td>
											</tr>
											<tr>
												<td>Shipping:</td>
												<td><small>01 day shipping.<span
														class="text-muted">( Free pickup today)</span></small></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="recipeOption" tabindex="-1"
		aria-labelledby="recipeOptionLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="recipeOptionLabel">레시피 상세 옵션</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body p-6">
					<p class="small mb-4">부족한 재료를 더하고 필요 없는 재료는 줄여보세요!</p>
					<ul id="recipeOptionsList" class="list-group list-group-flush">
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<!-- <button type="button" class="btn btn-primary">저장</button> -->
					<button type="button" class="btn btn-primary"
						data-recipe-id="${recipe.recipe_id}" id="saveRecipeOptions">저장</button>
				</div>
			</div>
		</div>
	</div>


	<!-- JavaScript -->
	<!-- JavaScript -->

	<script
		src="${pageContext.request.contextPath}/js/vendors/jquery.min.js"></script>

	<!-- JavaScript -->

	<script
		src="${pageContext.request.contextPath}/js/vendors/jquery.min.js"></script>

	<script>

					$(document).ready(function () {

						$(document).on('click', '.btn-option-edit', function () {
							let recipeId = $(this).data('recipe-id');

							$.ajax({

								url: `${pageContext.request.contextPath}/product/recipe/${recipeId}`,

								type: 'GET',

								success: function (response) {
									if (response.success) {
										const ings = response.data;

										console.log(ings.ing_name);

										$('#recipeOptionsList').empty();

										ings.forEach(option => {

											console.log("Appending to #recipeOptionsList");
											console.log($('#recipeOptionsList').length);

											console.log($('#recipeOptionsList').html());

											console.log("각 옵션 데이터:", option);
											console.log("이미지 경로:", option.rcp_ing_img || "기본 경로");
											console.log("재료 이름:", option.ing_name || "기본 이름");
											console.log("수량:", option.upd_qty || 1);

											console.log("응답 데이터:", response);
											console.log(ings);


											const listItem = `
						        <li class="list-group-item py-3 ps-0 border-top" data-ingredient-id= "\${option.ing_id}">
						            <div class="row align-items-center">
						                <!-- 이미지 -->
						                <div class="col-6 col-md-6 col-lg-7">
						                    <div class="d-flex align-items-center">
						                       <!-- < img src="${pageContext.request.contextPath}/images/products/\${option.ing_img}" 
						                             alt="${option.ing_name}" 
						                             class="icon-shape icon-xxl" /> -->
						                        <div class="ms-3 d-flex flex-column justify-content-center">
						                            <h6 class="mb-0">\${option.ing_name}</h6>
						                            <span><small class="text-muted">단위: \${option.unit} </small></span> 
						                            <!--그람으로 바꿔-->
						                        </div>
						                    </div>
						                </div>
						                <!-- 수량 조정 -->
						                <div class="col-4 col-md-4 col-lg-3">
						                    <div class="input-group input-spinner">
						                        <input type="button" value="-" class="button-minus btn btn-sm" data-field="quantity" />
						                        <input type="number" step="1" max="10" value="\${option.ing_times}" name="quantity" class="quantity-field form-control-sm form-input" />
						                        <input type="button" value="+" class="button-plus btn btn-sm" data-field="quantity" />
						                    </div>
						                </div>
						                <!-- 업데이트된 수량 -->
						                <div class="col-2 text-lg-end text-start text-md-end col-md-2">
						                    <span class="fw-bold total-unit"> \${option.unit} g</span>
						                </div>
						            </div>
						        </li>`;
											$('#recipeOptionsList').append(listItem);
										});

										$('#recipeOption').modal('show');
									} else {
										alert(response.message);
									}
								},
								error: function () {
									alert('옵션 데이터 조회 중 오류 발생?');
								}
							});
						});


						$(document).on('click', '.button-plus, .button-minus', function (e) {
							e.preventDefault(); // 기본 동작 방지
							const isPlus = $(this).hasClass('button-plus');
							const input = $(this).siblings('input[name="quantity"]');
							let currentValue = parseInt(input.val(), 10);

							if (isNaN(currentValue)) {
								currentValue = 0;
							}


							if (isPlus) {
								input.val(currentValue + 1);
							} else if (currentValue > 0) { // 최소값 제한
								input.val(currentValue - 1);
							}
						});


						$(document).on('click', '#saveRecipeOptions', function () {

							const setCount = parseInt($('#quantitySelect').val(), 10);
							const recipeId = $(this).data('recipe-id');
							const type = 1;

							const ingredients = [];
							$('#recipeOptionsList .list-group-item').each(function () {
								/* const ingredientName = $(this).find('h6').text().trim(); // 재료 이름 */
								const ingredientId = $(this).data('ingredient-id');
								const quantity = parseInt($(this).find('input[name="quantity"]').val(), 10);

								ingredients.push({
									ing_id: ingredientId,
									ing_qty: quantity
								});
							});

							const requestData = {

								id: recipeId,
								setCount: setCount,
								options: ingredients,
								type: type
							};


							console.log('전송 데이터:', requestData);

							$.ajax({
								url: `${pageContext.request.contextPath}/cart/addItem`,
								type: 'POST',
								contentType: 'application/json',
								data: JSON.stringify(requestData),
								success: function (response) {
									if (response.success) {
										$('#recipeOption').modal('hide');
										/* location.reload(); // 필요 시 페이지 새로고침 */
									} else {
										alert(`저장 실패: ${response.message}`);
									}
								},
								error: function () {
									alert('저장 중 오류가 발생했습니다.');
								}
							});
						});

					});

				</script>


	<!-- Libs JS -->
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/slick-carousel/slick/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/tiny-slider/dist/min/tiny-slider.js"></script>

	<!-- Theme JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>

	<!-- Vendor Scripts -->
	<script
		src="${pageContext.request.contextPath}/js/vendors/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/vendors/slick-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/vendors/tns-slider.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendors/zoom.js"></script>


	<!-- Custom Scripts -->
	<!-- <script src="/ReciPICK/assets/js/components/recipe-component.js"></script> -->

</body>

</html>