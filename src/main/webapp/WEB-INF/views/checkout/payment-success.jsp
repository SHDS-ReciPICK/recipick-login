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
<meta content="Codescandy" name="author">
<title>주문 완료</title>
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

	<!-- 장바구니 팝업.. 레시피 옵션에 활용 (장바구니 페이지는 아님) shop cart-->

	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
		aria-labelledby="offcanvasRightLabel">
		<div class="offcanvas-header border-bottom">
			<div class="text-start">
				<h5 id="offcanvasRightLabel" class="mb-0 fs-4">Shop Cart</h5>
				<small>Location in 382480 주문번호</small>
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

	<script
		src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>



	<!-- 주문 완료 창 -->
	<main>
		<section class="mt-8 mb-8">
			<div class="container text-center">
				<!-- 아이콘 -->
				<div class="mb-4">
					<i class="feather-icon icon-check-circle text-success"
						style="font-size: 72px;"></i>
				</div>
				<!-- title -->
				<h1 class="fw-bold mb-4">주문이 완료되었습니다!</h1>
				<p class="mb-5">
					주문 번호 <strong>${merchantUid}</strong>이 성공적으로 접수되었습니다. <br>
				</p>

				<!-- 주문 세부 정보 -->
				<!-- <div class="card shadow-sm mb-4">
					<div class="card-body">
						<h5 class="fw-bold">주문 내역</h5>
						<ul class="list-group list-group-flush text-start">
							<li class="list-group-item d-flex justify-content-between align-items-center">
								Haldiram's Sev Bhujia <span>12,000 원</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								NutriChoice Digestive <span>3,000 원</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								Cadbury 5 Star Chocolate <span>7,000 원</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								Onion Flavour Potato <span>8,000 원</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								총 주문 금액 <span>76,000 원</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								할인 금액 <span>- 3,000 원</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center fw-bold">
								최종 결제 금액 <span>73,000 원</span>
							</li>
						</ul>
					</div>
				</div> -->

				<!-- 버튼 -->
				<div class="d-flex justify-content-center">
					<a href="/" class="btn btn-primary me-2">홈으로 가기</a> <a
						href="/order-history" class="btn btn-outline-secondary">주문 내역
						보기</a>
				</div>
			</div>
		</section>
	</main>


	<!-- Footer -->
	<!-- 푸터 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/footer.jsp" />

	<!-- Javascript-->
	<script
		src="${pageContext.request.contextPath}/libs/flatpickr/dist/flatpickr.min.js"></script>
	<!-- Libs JS -->
	<!-- <script src="${pageContext.request.contextPath}/libs/jquery/dist/jquery.min.js"></script> -->
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/libs/imask/dist/imask.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/vendors/inputmask.js"></script>

	<!-- header -->
	<!-- <script src="${pageContext.request.contextPath}/js/components/recipe-component.js"></script> -->
</body>

</html>