<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>식재료 상세</title>
	
	<!-- Favicon icon-->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon/recipick-favicon.svg">

	<!-- Libs CSS -->
	<link href="${pageContext.request.contextPath}/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">
	
	<!-- Theme CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.min.css">
	
	<!-- CSS Libraries -->
	<link href="${pageContext.request.contextPath}/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/libs/nouislider/dist/nouislider.min.css" rel="stylesheet">
	
	<!-- Font CSS -->
	<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT@2/fonts/variable/woff2/SUIT-Variable.css" rel="stylesheet">

	<style>
		body {font-family: 'SUIT Variable', sans-serif;}
	</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/components/header.jsp" />
	<jsp:include page="/WEB-INF/views/components/navbar-ing.jsp" />

	<!-- Modal -->
	<div class="modal fade" id="userModal" tabindex="-1"
		aria-labelledby="userModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content p-4">
				<div class="modal-header border-0">
					<h5 class="modal-title fs-3 fw-bold" id="userModalLabel">Sign
						Up</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="needs-validation" novalidate>
						<div class="mb-3">
							<label for="fullName" class="form-label">Name</label> <input
								type="text" class="form-control" id="fullName"
								placeholder="Enter Your Name" required />
							<div class="invalid-feedback">Please enter name.</div>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email address</label> <input
								type="email" class="form-control" id="email"
								placeholder="Enter Email address" required />
							<div class="invalid-feedback">Please enter email.</div>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password"
								placeholder="Enter Password" required />
							<div class="invalid-feedback">Please enter password.</div>
							<small class="form-text"> By Signup, you agree to our <a
								href="#!">Terms of Service</a> & <a href="#!">Privacy Policy</a>
							</small>
						</div>

						<button type="submit" class="btn btn-primary" type="submit">Sign
							Up</button>
					</form>
				</div>
				<div class="modal-footer border-0 justify-content-center">
					Already have an account? <a href="#">Sign in</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Shop Cart -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header border-bottom">
			<div class="text-start">
				<h5 id="offcanvasRightLabel" class="mb-0 fs-4">Shop Cart</h5>
				<small>Location in 382480</small>
			</div>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div>
				<!-- alert -->
				<div class="alert alert-danger p-2" role="alert">
					You’ve got FREE delivery. Start <a href="#!" class="alert-link">checkout
						now!</a>
				</div>
				<ul class="list-group list-group-flush">
					<!-- list group -->
					<li class="list-group-item py-3 ps-0 border-top">
						<!-- row -->
						<div class="row align-items-center">
							<div class="col-6 col-md-6 col-lg-7">
								<div class="d-flex">
									<img
										src="${pageContext.request.contextPath}/images/products/product-img-1.jpg"
										alt="Ecommerce" class="icon-shape icon-xxl" />
									<div class="ms-3">
										<!-- title -->
										<a href="../pages/shop-single.html" class="text-inherit">
											<h6 class="mb-0">Haldiram's Sev Bhujia</h6>
										</a> <span><small class="text-muted">.98 / lb</small></span>
										<!-- text -->
										<div class="mt-2 small lh-1">
											<a href="#!" class="text-decoration-none text-inherit"> <span
												class="me-1 align-text-bottom"> <svg
														xmlns="http://www.w3.org/2000/svg" width="14" height="14"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
														stroke-linejoin="round"
														class="feather feather-trash-2 text-success">
														<polyline points="3 6 5 6 21 6"></polyline>
														<path
															d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
														</path>
														<line x1="10" y1="11" x2="10" y2="17"></line>
														<line x1="14" y1="11" x2="14" y2="17"></line>
													</svg>
											</span> <span class="text-muted">Remove</span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<!-- input group -->
							<div class="col-4 col-md-3 col-lg-3">
								<!-- input -->
								<!-- input -->
								<div class="input-group input-spinner">
									<input type="button" value="-" class="button-minus btn btn-sm"
										data-field="quantity" /> <input type="number" step="1"
										max="10" value="1" name="quantity"
										class="quantity-field form-control-sm form-input" /> <input
										type="button" value="+" class="button-plus btn btn-sm"
										data-field="quantity" />
								</div>
							</div>
							<!-- price -->
							<div class="col-2 text-lg-end text-start text-md-end col-md-2">
								<span class="fw-bold">$5.00</span>
							</div>
						</div>
					</li>
					<!-- list group -->
					<li class="list-group-item py-3 ps-0">
						<!-- row -->
						<div class="row align-items-center">
							<div class="col-6 col-md-6 col-lg-7">
								<div class="d-flex">
									<img
										src="${pageContext.request.contextPath}/images/products/product-img-2.jpg"
										alt="Ecommerce" class="icon-shape icon-xxl" />
									<div class="ms-3">
										<a href="../pages/shop-single.html" class="text-inherit">
											<h6 class="mb-0">NutriChoice Digestive</h6>
										</a> <span><small class="text-muted">250g</small></span>
										<!-- text -->
										<div class="mt-2 small lh-1">
											<a href="#!" class="text-decoration-none text-inherit"> <span
												class="me-1 align-text-bottom"> <svg
														xmlns="http://www.w3.org/2000/svg" width="14" height="14"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
														stroke-linejoin="round"
														class="feather feather-trash-2 text-success">
														<polyline points="3 6 5 6 21 6"></polyline>
														<path
															d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
														</path>
														<line x1="10" y1="11" x2="10" y2="17"></line>
														<line x1="14" y1="11" x2="14" y2="17"></line>
													</svg>
											</span> <span class="text-muted">Remove</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<!-- input group -->
							<div class="col-4 col-md-3 col-lg-3">
								<!-- input -->
								<!-- input -->
								<div class="input-group input-spinner">
									<input type="button" value="-" class="button-minus btn btn-sm"
										data-field="quantity" /> <input type="number" step="1"
										max="10" value="1" name="quantity"
										class="quantity-field form-control-sm form-input" /> <input
										type="button" value="+" class="button-plus btn btn-sm"
										data-field="quantity" />
								</div>
							</div>
							<!-- price -->
							<div class="col-2 text-lg-end text-start text-md-end col-md-2">
								<span class="fw-bold text-danger">$20.00</span>
								<div class="text-decoration-line-through text-muted small">$26.00</div>
							</div>
						</div>
					</li>
					<!-- list group -->
					<li class="list-group-item py-3 ps-0">
						<!-- row -->
						<div class="row align-items-center">
							<div class="col-6 col-md-6 col-lg-7">
								<div class="d-flex">
									<img
										src="${pageContext.request.contextPath}/images/products/product-img-3.jpg"
										alt="Ecommerce" class="icon-shape icon-xxl" />
									<div class="ms-3">
										<!-- title -->
										<a href="../pages/shop-single.html" class="text-inherit">
											<h6 class="mb-0">Cadbury 5 Star Chocolate</h6>
										</a> <span><small class="text-muted">1 kg</small></span>
										<!-- text -->
										<div class="mt-2 small lh-1">
											<a href="#!" class="text-decoration-none text-inherit"> <span
												class="me-1 align-text-bottom"> <svg
														xmlns="http://www.w3.org/2000/svg" width="14" height="14"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
														stroke-linejoin="round"
														class="feather feather-trash-2 text-success">
														<polyline points="3 6 5 6 21 6"></polyline>
														<path
															d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
														</path>
														<line x1="10" y1="11" x2="10" y2="17"></line>
														<line x1="14" y1="11" x2="14" y2="17"></line>
													</svg>
											</span> <span class="text-muted">Remove</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<!-- input group -->
							<div class="col-4 col-md-3 col-lg-3">
								<!-- input -->
								<!-- input -->
								<div class="input-group input-spinner">
									<input type="button" value="-" class="button-minus btn btn-sm"
										data-field="quantity" /> <input type="number" step="1"
										max="10" value="1" name="quantity"
										class="quantity-field form-control-sm form-input" /> <input
										type="button" value="+" class="button-plus btn btn-sm"
										data-field="quantity" />
								</div>
							</div>
							<!-- price -->
							<div class="col-2 text-lg-end text-start text-md-end col-md-2">
								<span class="fw-bold">$15.00</span>
								<div class="text-decoration-line-through text-muted small">$20.00</div>
							</div>
						</div>
					</li>
					<!-- list group -->
					<li class="list-group-item py-3 ps-0">
						<!-- row -->
						<div class="row align-items-center">
							<div class="col-6 col-md-6 col-lg-7">
								<div class="d-flex">
									<img
										src="${pageContext.request.contextPath}/images/products/product-img-4.jpg"
										alt="Ecommerce" class="icon-shape icon-xxl" />
									<div class="ms-3">
										<!-- title -->
										<!-- title -->
										<a href="../pages/shop-single.html" class="text-inherit">
											<h6 class="mb-0">Onion Flavour Potato</h6>
										</a> <span><small class="text-muted">250g</small></span>
										<!-- text -->
										<div class="mt-2 small lh-1">
											<a href="#!" class="text-decoration-none text-inherit"> <span
												class="me-1 align-text-bottom"> <svg
														xmlns="http://www.w3.org/2000/svg" width="14" height="14"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
														stroke-linejoin="round"
														class="feather feather-trash-2 text-success">
														<polyline points="3 6 5 6 21 6"></polyline>
														<path
															d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
														</path>
														<line x1="10" y1="11" x2="10" y2="17"></line>
														<line x1="14" y1="11" x2="14" y2="17"></line>
													</svg>
											</span> <span class="text-muted">Remove</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<!-- input group -->
							<div class="col-4 col-md-3 col-lg-3">
								<!-- input -->
								<!-- input -->
								<div class="input-group input-spinner">
									<input type="button" value="-" class="button-minus btn btn-sm"
										data-field="quantity" /> <input type="number" step="1"
										max="10" value="1" name="quantity"
										class="quantity-field form-control-sm form-input" /> <input
										type="button" value="+" class="button-plus btn btn-sm"
										data-field="quantity" />
								</div>
							</div>
							<!-- price -->
							<div class="col-2 text-lg-end text-start text-md-end col-md-2">
								<span class="fw-bold">$15.00</span>
								<div class="text-decoration-line-through text-muted small">$20.00</div>
							</div>
						</div>
					</li>
					<!-- list group -->
					<li class="list-group-item py-3 ps-0 border-bottom">
						<!-- row -->
						<div class="row align-items-center">
							<div class="col-6 col-md-6 col-lg-7">
								<div class="d-flex">
									<img
										src="${pageContext.request.contextPath}/images/products/product-img-5.jpg"
										alt="Ecommerce" class="icon-shape icon-xxl" />
									<div class="ms-3">
										<!-- title -->
										<a href="../pages/shop-single.html" class="text-inherit">
											<h6 class="mb-0">Salted Instant Popcorn</h6>
										</a> <span><small class="text-muted">100g</small></span>
										<!-- text -->
										<div class="mt-2 small lh-1">
											<a href="#!" class="text-decoration-none text-inherit"> <span
												class="me-1 align-text-bottom"> <svg
														xmlns="http://www.w3.org/2000/svg" width="14" height="14"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
														stroke-linejoin="round"
														class="feather feather-trash-2 text-success">
														<polyline points="3 6 5 6 21 6"></polyline>
														<path
															d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
														</path>
														<line x1="10" y1="11" x2="10" y2="17"></line>
														<line x1="14" y1="11" x2="14" y2="17"></line>
													</svg>
											</span> <span class="text-muted">Remove</span>
											</a>
										</div>
									</div>
								</div>
							</div>

							<!-- input group -->
							<div class="col-4 col-md-3 col-lg-3">
								<!-- input -->
								<!-- input -->
								<div class="input-group input-spinner">
									<input type="button" value="-" class="button-minus btn btn-sm"
										data-field="quantity" /> <input type="number" step="1"
										max="10" value="1" name="quantity"
										class="quantity-field form-control-sm form-input" /> <input
										type="button" value="+" class="button-plus btn btn-sm"
										data-field="quantity" />
								</div>
							</div>
							<!-- price -->
							<div class="col-2 text-lg-end text-start text-md-end col-md-2">
								<span class="fw-bold">$15.00</span>
								<div class="text-decoration-line-through text-muted small">$25.00</div>
							</div>
						</div>
					</li>
				</ul>
				<!-- btn -->
				<div class="d-flex justify-content-between mt-4">
					<a href="#!" class="btn btn-primary">Continue Shopping</a> <a
						href="#!" class="btn btn-dark">Update Cart</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="locationModal" tabindex="-1"
		aria-labelledby="locationModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body p-6">
					<div class="d-flex justify-content-between align-items-start">
						<div>
							<h5 class="mb-1" id="locationModalLabel">Choose your
								Delivery Location</h5>
							<p class="mb-0 small">Enter your address and we will specify
								the offer you area.</p>
						</div>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="my-5">
						<input type="search" class="form-control"
							placeholder="Search your area" />
					</div>
					<div class="d-flex justify-content-between align-items-center mb-2">
						<h6 class="mb-0">Select Location</h6>
						<a href="#" class="btn btn-outline-gray-400 text-muted btn-sm">Clear
							All</a>
					</div>
					<div>
						<div data-simplebar style="height: 300px">
							<div class="list-group list-group-flush">
								<a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action active">
									<span>Alabama</span> <span>Min:$20</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>Alaska</span> <span>Min:$30</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>Arizona</span> <span>Min:$50</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>California</span> <span>Min:$29</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>Colorado</span> <span>Min:$80</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>Florida</span> <span>Min:$90</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>Arizona</span> <span>Min:$50</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>California</span> <span>Min:$29</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>Colorado</span> <span>Min:$80</span>
								</a> <a href="#"
									class="list-group-item d-flex justify-content-between align-items-center px-2 py-3 list-group-item-action">
									<span>Florida</span> <span>Min:$90</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>
	
	<main>
		<div class="mt-4">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<div class="col-12">
						<!-- 대분류 / 중분류 / 소분류 -->
						<nav aria-label="breadcrumb">
						    <ol class="breadcrumb mb-0">
						        <li class="breadcrumb-item">
						            <a href="${pageContext.request.contextPath}/ingredient/products/category?main=${ing_category_group.ing_main}">
						                ${ing_category_group.ing_main}
						            </a>
						        </li>
						        <li class="breadcrumb-item">
						            <a href="${pageContext.request.contextPath}/ingredient/products/category?main=${ing_category_group.ing_main}&sub=${ing_category_group.ing_sub}">
						                ${ing_category_group.ing_sub}
						            </a>
						        </li>
						        <li class="breadcrumb-item active" aria-current="page">
						            <a href="${pageContext.request.contextPath}/ingredient/products/category?main=${ing_category_group.ing_main}&sub=${ing_category_group.ing_sub}&detail=${ing_category_group.ing_detail}">
						                ${ing_category_group.ing_detail}
						            </a>
						        </li>
						    </ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 헤드 -->
		<section class="mt-8">
			<div class="container">
				<div class="row">
				
					<!-- 커버 이미지 -->
					<div class="col-md-5 col-xl-6 d-flex align-items-center justify-content-center">
					    <!-- 커버 이미지 1개 -->
					    <div class="position-relative w-100 h-100">
					        <img src="${ingredient.image}" alt="" class="position-absolute w-100 h-100" style="object-fit: cover;"/>
					    </div>
					</div>
		
					<!-- 정보 -->
					<div class="col-md-7 col-xl-6">
						<div class="ps-lg-10 mt-6 mt-md-0">
						
							<!-- 식재료명 위에 소분류? -->
							<a href="${pageContext.request.contextPath}/ingredient/products/category?main=${ing_category_group.ing_main}&sub=${ing_category_group.ing_sub}&detail=${ing_category_group.ing_detail}" class="mb-4 d-block">
								${ing_category_group.ing_detail }
							</a>
							
							<!-- 식재료명 -->
							<div class="d-flex align-items-center mb-4">
								<h1 class="mb-0 flex-grow-1">${ingredient.name }</h1>
								<!-- 좋아요 -->
<!-- 								<a class="btn btn-light" href="shop-wishlist.html" data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"><i class="feather-icon icon-heart"></i></a> -->
							</div>
							
							<!-- 한 줄 설명 -->
							<p class="mb-4">${ingredient.detail }</p>
							
							<!-- 가격 -->
							<div class="fs-4 d-flex d-inline">
							    <c:if test="${ingredient.discount > 0}">
							        <h2 class="text-danger me-2">${ingredient.discount}%</h2>
							        <h2 class="fw-bold text-dark me-2">
							            <fmt:formatNumber value="${ingredient.price * (1 - ingredient.discount/100)}" pattern="#,###"/>원
							        </h2>
							        <h2 class="text-decoration-line-through text-muted">
							            <fmt:formatNumber value="${ingredient.price}" pattern="#,###"/>원
							        </h2>
							    </c:if>
							    <!-- 할인율 0일 때 -->
							    <c:if test="${ingredient.discount == 0}">
							        <h2 class="fw-bold text-dark">
							            <fmt:formatNumber value="${ingredient.price}" pattern="#,###"/>원
							        </h2>
							    </c:if>
							</div>
														
							<!-- 원산지 -->
							<h3 class="mb-0 mt-4">원산지: ${ingredient.origin }</h3>
							
							<hr class="my-5" />
							
							<!-- 상세 설명 테이블 -->
							<div>
								<table class="table table-borderless mb-0">
								    <tbody>
								        <tr>
								            <td><strong>식재료명:</strong></td>
								            <td>${ingredient.name }</td>
								        </tr>
								        <tr>
								            <td><strong>원산지:</strong></td>
								            <td>${ingredient.origin }</td>
								        </tr>
								        <tr>
								            <td><strong>판매자:</strong></td>
								            <td>${ingredient.supplier }</td>
								        </tr>
								        <tr>
								            <td><strong>계절:</strong></td>
								            <td>${ingredient.season }</td>
								        </tr>
								        <tr>
								            <td><strong>평균 중량:</strong></td>
								            <td>${ingredient.avg_gram }g</td>
								        </tr>
								        <tr>
								            <td><strong>최소 구매 단위:</strong></td>
								            <td>${ingredient.unit }g</td>
								        </tr>
								    </tbody>
								</table>
							</div>
							
							<hr class="my-6" />
							
							<!-- 수량 -->
							<label for="quantitySelect" class="form-label me-2" style="display: block;">수량</label> <select id="quantitySelect" class="form-select">
								<option selected>1개</option>
								<option value="1">2개</option>
								<option value="2">3개</option>
								<option value="3">4개</option>
								<option value="4">5개</option>
							</select>
							
							<!-- 장바구니, 바로 구매 버튼 -->
							<div class="mt-3 d-flex justify-content-end g-2 align-items-center">
								<button type="button" class="btn btn-primary btn-add-cart"
									data-ing-id="${ingredient.ing_id}" 
        							data-set-count="${recipe.serving_count}">
									<i class="feather-icon icon-shopping-bag me-2"></i>
									장바구니에 담기
								</button>
							</div>
							
						</div>
					</div>
				
				</div>
			</div>
		</section>
		
		<!-- 메인 -->
		<section class="mt-lg-14 mt-8 mb-lg-14 mb-14">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					
						<!-- 탭 -->
						<ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
								<button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#info-tab-pane" type="button" role="tab" aria-controls="info-tab-pane" aria-selected="true">
									상세정보
								</button>
							</li>
<!-- 							<li class="nav-item" role="presentation">
								<button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review-tab-pane" type="button" role="tab" aria-controls="review-tab-pane" aria-selected="true">
									리뷰
								</button>
							</li> -->
						</ul>
						
						<!-- 탭별 내용 -->
						<div class="tab-content" id="myTabContent">
							<!-- 상세정보 -->
							<div class="tab-pane fade show active" id="info-tab-pane" role="tabpanel" aria-labelledby="info-tab" tabindex="0">
								<!-- 둘 중에 하나... -->
								<div class="my-8">
									<div class="mb-12">
										<h5 class="mb-1 text-danger"><i class="feather-icon icon-alert-circle me-2"></i>표시된 이미지는 실제 상품과 다를 수 있습니다.</h5>
										<p class="mb-0">
											실제 상품과 최대한 일치하는 정보를 제공하기 위해 노력하고 있으나, 제품에 따라 일부 차이가 있을 수 있습니다.<br>
											구매 전 상세 정보를 반드시 확인해 주세요.
										</p>
									</div>
									<div class="mb-8">
										<h4 class="mb-3">영양성분 (100g 당 함량)</h4>
										<div class="col-12 col-lg-8">
											<table class="table table-striped border-bottom">
												<tbody>
													<tr>
														<th>에너지</th>
														<td>${ing_nutrient.calories }kcal</td>
													</tr>
													<tr>
														<th>탄수화물</th>
														<td>${ing_nutrient.carbohydrate }g</td>
													</tr>
													<tr>
														<th>당류</th>
														<td>${ing_nutrient.sugars }g</td>
													</tr>
													<tr>
														<th>지방</th>
														<td>${ing_nutrient.fat }g</td>
													</tr>
													<tr>
														<th>단백질</th>
														<td>${ing_nutrient.protein }g</td>
													</tr>
													<tr>
														<th>수분</th>
														<td>${ing_nutrient.moisture }g</td>
													</tr>
													<tr>
														<th>수용성 식이섬유</th>
														<td>${ing_nutrient.sol_fiber }g</td>
													</tr>
													<tr>
														<th>불용성 식이섬유</th>
														<td>${ing_nutrient.insol_fiber }g</td>
													</tr>
													<tr>
														<th>식이섬유</th>
														<td>${ing_nutrient.fiber }g</td>
													</tr>
													<tr>
														<th>회분</th>
														<td>${ing_nutrient.ash }g</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="mb-8">
										<h4 class="mb-3">주의사항</h4>
										<p class="mb-0">
											${ing_nutrient.caution }
										</p>
									</div>
									<div class="mb-0">
										<h4 class="mb-3">보관 방법</h4>
										<p class="mb-0">
											${ing_nutrient.storage }
										</p>
									</div>
								</div>
								<!-- <div class="my-8">
									<div class="row">
										<div class="col-12">
											<h4 class="mb-4">Details</h4>
										</div>
										<div class="col-12 col-lg-6">
											<table class="table table-striped">
												table
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
												table
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
								</div> -->
							</div>
							<!-- 리뷰 -->
							<%-- <div class="tab-pane fade" id="review-tab-pane" role="tabpanel" aria-labelledby="review-tab" tabindex="0">
								<div class="my-8">
									<!-- row -->
									<div class="row">
										<div class="col-md-4">
											<div class="me-lg-12 mb-6 mb-md-0">
												<div class="mb-5">
													<!-- title -->
													<h4 class="mb-3">Customer reviews</h4>
													<span> <!-- rating --> <small class="text-warning">
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
													</small> <span class="ms-3">4.1 out of 5</span> <small class="ms-3">11,130
															global ratings</small>
													</span>
												</div>
												<div class="mb-8">
													<!-- progress -->
													<div class="d-flex align-items-center mb-2">
														<div class="text-nowrap me-3 text-muted">
															<span class="d-inline-block align-middle text-muted">5</span>
															<i class="bi bi-star-fill ms-1 small text-warning"></i>
														</div>
														<div class="w-100">
															<div class="progress" style="height: 6px">
																<div class="progress-bar bg-warning" role="progressbar"
																	style="width: 60%" aria-valuenow="60" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
														</div>
														<span class="text-muted ms-3">53%</span>
													</div>
													<!-- progress -->
													<div class="d-flex align-items-center mb-2">
														<div class="text-nowrap me-3 text-muted">
															<span class="d-inline-block align-middle text-muted">4</span>
															<i class="bi bi-star-fill ms-1 small text-warning"></i>
														</div>
														<div class="w-100">
															<div class="progress" style="height: 6px">
																<div class="progress-bar bg-warning" role="progressbar"
																	style="width: 50%" aria-valuenow="50" aria-valuemin="0"
																	aria-valuemax="50"></div>
															</div>
														</div>
														<span class="text-muted ms-3">22%</span>
													</div>
													<!-- progress -->
													<div class="d-flex align-items-center mb-2">
														<div class="text-nowrap me-3 text-muted">
															<span class="d-inline-block align-middle text-muted">3</span>
															<i class="bi bi-star-fill ms-1 small text-warning"></i>
														</div>
														<div class="w-100">
															<div class="progress" style="height: 6px">
																<div class="progress-bar bg-warning" role="progressbar"
																	style="width: 35%" aria-valuenow="35" aria-valuemin="0"
																	aria-valuemax="35"></div>
															</div>
														</div>
														<span class="text-muted ms-3">14%</span>
													</div>
													<!-- progress -->
													<div class="d-flex align-items-center mb-2">
														<div class="text-nowrap me-3 text-muted">
															<span class="d-inline-block align-middle text-muted">2</span>
															<i class="bi bi-star-fill ms-1 small text-warning"></i>
														</div>
														<div class="w-100">
															<div class="progress" style="height: 6px">
																<div class="progress-bar bg-warning" role="progressbar"
																	style="width: 22%" aria-valuenow="22" aria-valuemin="0"
																	aria-valuemax="22"></div>
															</div>
														</div>
														<span class="text-muted ms-3">5%</span>
													</div>
													<!-- progress -->
													<div class="d-flex align-items-center mb-2">
														<div class="text-nowrap me-3 text-muted">
															<span class="d-inline-block align-middle text-muted">1</span>
															<i class="bi bi-star-fill ms-1 small text-warning"></i>
														</div>
														<div class="w-100">
															<div class="progress" style="height: 6px">
																<div class="progress-bar bg-warning" role="progressbar"
																	style="width: 14%" aria-valuenow="14" aria-valuemin="0"
																	aria-valuemax="14"></div>
															</div>
														</div>
														<span class="text-muted ms-3">7%</span>
													</div>
												</div>
												<div class="d-grid">
													<h4>Review this product</h4>
													<p class="mb-0">Share your thoughts with other
														customers.</p>
													<a href="#"
														class="btn btn-outline-gray-400 mt-4 text-muted">Write
														the Review</a>
												</div>
											</div>
										</div>
										<!-- col -->
										<div class="col-md-8">
											<div class="mb-10">
												<div
													class="d-flex justify-content-between align-items-center mb-8">
													<div>
														<!-- heading -->
														<h4>Reviews</h4>
													</div>
													<div>
														<select class="form-select">
															<option selected>Top Reviews</option>
															<option value="Most Recent">Most Recent</option>
														</select>
													</div>
												</div>
												<div class="d-flex border-bottom pb-6 mb-6">
													<!-- img -->
													<!-- img -->
													<img
														src="${pageContext.request.contextPath}/images/avatar/avatar-10.jpg"
														alt="" class="rounded-circle avatar-lg" />
													<div class="ms-5">
														<h6 class="mb-1">Shankar Subbaraman</h6>
														<!-- select option -->
														<!-- content -->
														<p class="small">
															<span class="text-muted">30 December 2022</span> <span
																class="text-primary ms-3 fw-bold">Verified
																Purchase</span>
														</p>
														<!-- rating -->
														<div class="mb-2">
															<i class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <span
																class="ms-3 text-dark fw-bold">Need to recheck
																the weight at delivery point</span>
														</div>
														<!-- text-->
														<p>Product quality is good. But, weight seemed less
															than 1kg. Since it is being sent in open package, there
															is a possibility of pilferage in between. FreshCart sends
															the veggies and fruits through sealed plastic covers and
															Barcode on the weight etc. .</p>
														<div>
															<div class="border icon-shape icon-lg border-2">
																<!-- img -->
																<img
																	src="${pageContext.request.contextPath}/images/products/product-img-1.jpg"
																	alt="" class="img-fluid" />
															</div>
															<div class="border icon-shape icon-lg border-2 ms-1">
																<!-- img -->
																<img
																	src="${pageContext.request.contextPath}/images/products/product-img-2.jpg"
																	alt="" class="img-fluid" />
															</div>
															<div class="border icon-shape icon-lg border-2 ms-1">
																<!-- img -->
																<img
																	src="${pageContext.request.contextPath}/images/products/product-img-3.jpg"
																	alt="" class="img-fluid" />
															</div>
														</div>
														<!-- icon -->
														<div class="d-flex justify-content-end mt-4">
															<a href="#" class="text-muted"> <i
																class="feather-icon icon-thumbs-up me-1"></i> Helpful
															</a> <a href="#" class="text-muted ms-4"> <i
																class="feather-icon icon-flag me-2"></i> Report abuse
															</a>
														</div>
													</div>
												</div>
												<div class="d-flex border-bottom pb-6 mb-6 pt-4">
													<!-- img -->
													<img
														src="${pageContext.request.contextPath}/images/avatar/avatar-12.jpg"
														alt="" class="rounded-circle avatar-lg" />
													<div class="ms-5">
														<h6 class="mb-1">Robert Thomas</h6>
														<!-- content -->
														<p class="small">
															<span class="text-muted">29 December 2022</span> <span
																class="text-primary ms-3 fw-bold">Verified
																Purchase</span>
														</p>
														<!-- rating -->
														<div class="mb-2">
															<i class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star text-warning"></i> <span
																class="ms-3 text-dark fw-bold">Need to recheck
																the weight at delivery point</span>
														</div>

														<p>Product quality is good. But, weight seemed less
															than 1kg. Since it is being sent in open package, there
															is a possibility of pilferage in between. FreshCart sends
															the veggies and fruits through sealed plastic covers and
															Barcode on the weight etc. .</p>

														<!-- icon -->
														<div class="d-flex justify-content-end mt-4">
															<a href="#" class="text-muted"> <i
																class="feather-icon icon-thumbs-up me-1"></i> Helpful
															</a> <a href="#" class="text-muted ms-4"> <i
																class="feather-icon icon-flag me-2"></i> Report abuse
															</a>
														</div>
													</div>
												</div>
												<div class="d-flex border-bottom pb-6 mb-6 pt-4">
													<!-- img -->
													<img
														src="${pageContext.request.contextPath}/images/avatar/avatar-9.jpg"
														alt="" class="rounded-circle avatar-lg" />
													<div class="ms-5">
														<h6 class="mb-1">Barbara Tay</h6>
														<!-- content -->
														<p class="small">
															<span class="text-muted">28 December 2022</span> <span
																class="text-danger ms-3 fw-bold">Unverified
																Purchase</span>
														</p>
														<!-- rating -->
														<div class="mb-2">
															<i class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star text-warning"></i> <span
																class="ms-3 text-dark fw-bold">Need to recheck
																the weight at delivery point</span>
														</div>

														<p>Everytime i ordered from fresh i got greenish
															yellow bananas just like i wanted so go for it , its
															happens very rare that u get over riped ones.</p>

														<!-- icon -->
														<div class="d-flex justify-content-end mt-4">
															<a href="#" class="text-muted"> <i
																class="feather-icon icon-thumbs-up me-1"></i> Helpful
															</a> <a href="#" class="text-muted ms-4"> <i
																class="feather-icon icon-flag me-2"></i> Report abuse
															</a>
														</div>
													</div>
												</div>
												<div class="d-flex border-bottom pb-6 mb-6 pt-4">
													<!-- img -->
													<img
														src="${pageContext.request.contextPath}/images/avatar/avatar-8.jpg"
														alt="" class="rounded-circle avatar-lg" />
													<div class="ms-5 flex-grow-1">
														<h6 class="mb-1">Sandra Langevin</h6>
														<!-- content -->
														<p class="small">
															<span class="text-muted">8 December 2022</span> <span
																class="text-danger ms-3 fw-bold">Unverified
																Purchase</span>
														</p>
														<!-- rating -->
														<div class="mb-2">
															<i class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star text-warning"></i> <span
																class="ms-3 text-dark fw-bold">Great product</span>
														</div>

														<p>Great product & package. Delivery can be expedited.</p>

														<!-- icon -->
														<div class="d-flex justify-content-end mt-4">
															<a href="#" class="text-muted"> <i
																class="feather-icon icon-thumbs-up me-1"></i> Helpful
															</a> <a href="#" class="text-muted ms-4"> <i
																class="feather-icon icon-flag me-2"></i> Report abuse
															</a>
														</div>
													</div>
												</div>
												<div>
													<a href="#" class="btn btn-outline-gray-400 text-muted">Read
														More Reviews</a>
												</div>
											</div>
											<div>
												<!-- rating -->
												<h3 class="mb-5">Create Review</h3>
												<div class="border-bottom py-4 mb-4">
													<h4 class="mb-3">Overall rating</h4>
													<div class="rater"></div>
												</div>
												<div class="border-bottom py-4 mb-4">
													<h4 class="mb-0">Rate Features</h4>
													<div class="my-5">
														<h5>Flavor</h5>
														<div class="rater"></div>
													</div>
													<div class="my-5">
														<h5>Value for money</h5>
														<div class="rater"></div>
													</div>
													<div class="my-5">
														<h5>Scent</h5>
														<div class="rater"></div>
													</div>
												</div>
												<!-- form control -->
												<div class="border-bottom py-4 mb-4">
													<h5>Add a headline</h5>
													<input type="text" class="form-control"
														placeholder="What’s most important to know" />
												</div>
												<div class="border-bottom py-4 mb-4">
													<h5>Add a photo or video</h5>
													<p>Shoppers find images and videos more helpful than
														text alone.</p>

													<div id="my-dropzone"
														class="dropzone mt-4 border-dashed rounded-2 min-h-0"></div>
												</div>
												<div class="py-4 mb-4">
													<!-- heading -->
													<h5>Add a written review</h5>
													<textarea class="form-control" rows="3"
														placeholder="What did you like or dislike? What did you use this product for?"></textarea>
												</div>
												<!-- button -->
												<div class="d-flex justify-content-end">
													<a href="#" class="btn btn-primary">Submit Review</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> --%>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	
	<jsp:include page="/WEB-INF/views/components/footer-ing.jsp" />
	
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
								<div class="zoom" style="background-image: url(${pageContext.request.contextPath}/images/products/product-single-img-1.jpg);">
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
										style="background-image: url(${pageContext.request.contextPath}/images/products/product-single-img-3.jpg);
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
								<a href="#!" class="mb-4 d-block">Bakery Biscuits</a>
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
											class="quantity-field form-control-sm form-input   ">
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

	<!-- addToCart -->
	<script
		src="${pageContext.request.contextPath}/js/vendors/jquery.min.js"></script>

	<script>
		$(document).ready(function() {
			$(document).on('click', '.btn-add-cart', function() {

				/* alert("click"); */
				const ingId = $(this).data('ing-id');
				const setCount = parseInt($('#quantitySelect').val(), 10); // select 박스에서 수량 가져오기
				const type = 0;

				const requestData = {
					id : ingId,
					setCount : setCount,
					type : type
				};

				console.log('전송 데이터:', requestData);

				// AJAX 요청
				$.ajax({
					url : `${pageContext.request.contextPath}/cart/addItem`,
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(requestData),
					success : function(response) {
						if (response.success) {
							location.reload(); // 필요 시 페이지 새로고침
						} else {
							alert(`저장 실패: ${response.message}`);
						}
					},
					error : function() {
						alert('장바구니 담기 중 오류가 발생했습니다.');
					}
				});
			});
		});
	</script>

	<!-- Required JS Libraries -->
	<script src="${pageContext.request.contextPath}/libs/nouislider/dist/nouislider.min.js"></script>
	<script src="${pageContext.request.contextPath}/libs/wnumb/wNumb.min.js"></script>
	<script src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>

</body>

</html>