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
<title>결제</title>
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

	<script
		src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>

	<!-- 결제 창 -->
	<main>
		<!-- section 지워도 되는부분-->
		<div class="mt-4">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<!-- <div class="col-12">
						breadcrumb
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="#!">Home</a></li>
								<li class="breadcrumb-item"><a href="#!">Shop</a></li>
								<li class="breadcrumb-item active" aria-current="page">Shop
									Checkout</li>
							</ol>
						</nav>
					</div> -->
				</div>
			</div>
		</div>
		<!-- section -->
		<section class="mb-lg-14 mb-8 mt-8">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<div class="col-12">
						<div>
							<div class="mb-8">
								<!-- text -->
								<h1 class="fw-bold mb-0">주문서</h1>
								<p class="mt-2">오늘 주문시 내일 새벽 도착! 즐겁고 맛있는 경험을 준비하세요!</p>
								<!-- <p class="mb-0">결제 옵션을 선택하여 주문을 진행하세요.</p> -->
							</div>
						</div>
					</div>
				</div>
				<div>
					<!-- row -->
					<div class="row">
						<div class="col-xl-7 col-lg-6 col-md-12">
							<!-- accordion -->
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<!-- accordion item -->
								<div class="accordion-item py-4">
									<div class="d-flex justify-content-between align-items-center">
										<!-- heading one -->
										<a href="#" class="fs-5 text-inherit collapsed h4"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
											aria-expanded="true" aria-controls="flush-collapseOne"> <!-- <i class="feather-icon icon-map-pin me-2 text-muted"></i> -->
											<i class="feather-icon icon-shopping-bag me-2 text-muted"></i>
											배송 정보
										</a>
										<!-- btn -->
										<!-- a href="#" class="btn btn-outline-primary btn-sm"
											data-bs-toggle="modal" data-bs-target="#addAddressModal">새로운
											배송지 추가</a> -->
										<!-- collapse -->
									</div>
									<div id="flush-collapseOne"
										class="accordion-collapse collapse show"
										data-bs-parent="#accordionFlushExample">
										<div class="mt-5">
											<div class="row">
												<!-- 기존 배송지 -->
												<div class="col-xl-6 col-lg-12 col-md-6 col-12 mb-4">
													<div class="card h-100">
														<div class="card-body">
															<div class="form-check mb-4">
																<input class="form-check-input" type="radio"
																	name="flexRadioDefault" id="homeRadio" checked /> <label
																	class="form-check-label text-dark" for="homeRadio">집</label>
															</div>
															<address>
																<strong>${orderer.name}</strong> <br /> 07283 <br />
																${orderer.address} <br /> <abbr title="Phone">${orderer.phone}</abbr>
															</address>
															<span class="text-danger">기본 배송지</span>
														</div>
													</div>
												</div>

												<!-- 새로운 배송지 추가 -->
												<div class="col-xl-6 col-lg-12 col-md-6 col-12 mb-4">
													<div class="card h-100">
														<div
															class="card-body d-flex justify-content-center align-items-center">
															<a href="#" class="btn btn-outline-primary btn-sm"
																data-bs-toggle="modal" data-bs-target="#addAddressModal">
																새로운 배송지 추가 </a>
														</div>
													</div>
												</div>
											</div>
										</div>

										<i class="feather-icon icon-clock me-2 text-muted"> 새벽배송
											일자</i>
										<ul class="nav nav-pills nav-pills-light mb-3 nav-fill mt-5"
											id="dateTabs" role="tablist">
										</ul>
										<div class="mt-5">
											<label for="DeliveryInstructions" class="form-label sr-only">배송
												요청사항</label>
											<div>
												<!-- button -->
												<select class="form-select mb-3">
													<option selected="">문 앞에 놓아주세요.</option>
													<option value="1">배송 후 초인종을 눌러주세요.</option>
													<option value="2">문자 메시지로 도착 알림 부탁드립니다.</option>
												</select>
											</div>
											<label for="DeliveryInstructions" class="form-label sr-only">공동현관
												출입방법</label>
											<div>
												<textarea class="form-control" id="DeliveryInstructions"
													rows="1" placeholder="공동현관 출입 방법을 알려주세요."></textarea>
												<p class="form-text">방법이 정확하지 않을 경우, 부득이하게 1층 공동현관 앞에 배송
													될 수 있습니다.</p>
											</div>
										</div>
										<div class="mt-8"></div>
										<div class="mt-5 d-flex justify-content-end">
											<a href="#" class="btn btn-primary ms-2"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseTwo" aria-expanded="false"
												aria-controls="flush-collapseTwo">확인</a>
										</div>

									</div>

								</div>
								<div class="accordion-item py-4">
									<a href="#" class="text-inherit h5" data-bs-toggle="collapse"
										data-bs-target="#flush-collapseTwo" aria-expanded="false"
										aria-controls="flush-collapseTwo"> <i
										class="feather-icon icon-credit-card me-2 text-muted"></i> 결제
										수단 <!-- collapse -->
									</a>
									<div id="flush-collapseTwo" class="accordion-collapse collapse"
										data-bs-parent="#accordionFlushExample">
										<div class="mt-5">
												<!-- <div class="card card-bordered shadow-none mb-2">
													card body
													<div class="card-body p-6">
														<div class="d-flex">
															<div class="form-check">
																input
																<input class="form-check-input" type="radio"
																	name="flexRadioDefault" id="creditdebitcard" /> <label
																	class="form-check-label ms-2" for="creditdebitcard"></label>
															</div>
															<div>
																<h5 class="mb-1 h6">SOL Pick 카드 결제</h5>
																<p class="mb-0 small">입금 계좌번호를 선택하여 결제를 완료해주세요.</p>
															</div>
														</div>

													</div>
												</div> -->
												
												<!-- 컬러페이 프로모션 카드 - 결제 섹션 상단에 배치 -->
												<div class="mb-5">
												    <div class="card border-0 rounded-4" style="background-color: #f8f3ff;">
												        <div class="card-body p-4 text-center">
												        	<%-- <img src="${pageContext.request.contextPath}/images/logo/recipick-logo.svg" alt="쏠픽" height="28" class="me-1"> 
												            <h5 class="card-title mb-2">카드로 결제하고</h5> --%>
												            <h5 class="card-title mb-2">
												                <span class="d-inline-flex align-items-center">
												                	<img src="${pageContext.request.contextPath}/images/logo/shinhan.png" alt="신한" height="24" class="me-1">
												                	<span> X </span>
												                    <img src="${pageContext.request.contextPath}/images/logo/recipick-logo.svg" alt="쏠픽" height="24" class="me-1">
												                    <span>카드로 결제하고</span>
												                </span>
												            </h5>
												            <h4 class="card-subtitle mb-3 text-primary fw-bold">포인트 적립 받으세요</h4>
												            <button class="btn btn-primary rounded-pill px-4 py-2 fw-semibold" id="applyDiscount">
												                할인 받기
												            </button>
												            
												            <div class="text-muted small mt-3">
												                <!-- 결제 시 최대 5,280원 추가 적립 -->
												                식당 등 2% 적립
												            </div>
												        </div>
												    </div>
												</div>
												<!-- 레시픽 카드 결제 옵션 -->
												<div class="card card-bordered shadow-none mb-2">
												    <!-- card body -->
												    <div class="card-body p-6" style="background-color: #f8f3ff; border-left: 5px solid #9758d9;">
												        <div class="d-flex">
												            <div class="form-check">
												                <!-- input -->
												                <input class="form-check-input" type="radio" name="flexRadioDefault" id="recipickCard" /> 
												                <label class="form-check-label ms-2" for="recipickCard"></label>
												            </div>
												            <div>
												                <div class="d-flex align-items-center">
												                    <div class="me-2">
												                        <img src="${pageContext.request.contextPath}/images/payment/recipick-card-icon.svg" alt="레시픽 카드" width="30" height="30" />
												                    </div>
												                </div>
												                <p class="mb-0 small">30,000원 할인 혜택을 받아보세요!</p>
												                <div class="mt-2">
												                    <span class="badge bg-primary">5,280원 추가 적립</span>
												                </div>
												            </div>
												        </div>
												    </div>
												</div>
												
												<div class="card card-bordered shadow-none mb-2">
													<!-- card body -->
													<div class="card-body p-6">
														<div class="d-flex">
															<div class="form-check">
																<!-- checkbox -->
																<input class="form-check-input" type="radio"
																	name="flexRadioDefault" id="paypal" /> <label
																	class="form-check-label ms-2" for="paypal"></label>
															</div>
															<div>
																<!-- title -->
																<h5 class="mb-1 h6">카드 / 간편결제</h5>
																<p class="mb-0 small">카드 또는 간편결제 서비스로 안전하게 결제하세요.</p>
															</div>
														</div>
													</div>
												</div>
												<!-- card -->
												<div class="card card-bordered shadow-none mb-2">
													<!-- card body -->
													<div class="card-body p-6">
														<div class="d-flex">
															<div class="form-check">
																<!-- input -->
																<input class="form-check-input" type="radio"
																	name="flexRadioDefault" id="creditdebitcard" /> <label
																	class="form-check-label ms-2" for="creditdebitcard"></label>
															</div>
															<div>
																<h5 class="mb-1 h6">무통장입금</h5>
																<p class="mb-0 small">입금 계좌번호를 선택하여 결제를 완료해주세요.</p>
															</div>
														</div>

													</div>
												</div>
												<div class="mt-5 d-flex justify-content-end">
													<a href="#" class="btn btn-outline-gray-400 text-muted"
														data-bs-toggle="collapse"
														data-bs-target="#flush-collapseOne" aria-expanded="false"
														aria-controls="flush-collapseOne"> 이전 </a>
													<!-- <a href="#"
														class="btn btn-primary ms-2">결제하기</a> -->
													<button id="paymentButton" class="btn btn-primary ms-2">결제하기</button>
												</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12 offset-xl-1 col-xl-4 col-lg-6">
							<div class="mt-4 mt-lg-0">
								<div class="card shadow-sm">
									<!-- 주문 내역 헤더 -->
									<div
										class="d-flex justify-content-between align-items-center px-6 py-4">
										<h5 class="mb-0">주문 내역</h5>
										<button id="toggleDetailsButton" class="btn btn-sm btn-light"
											type="button" onclick="toggleDetails()">
											<i id="toggleIcon" class="bi bi-caret-down-fill"></i>
										</button>
									</div>

									<!-- 간단한 초기 메시지 -->
									<div id="simpleSummary" class="px-6 py-4 text-muted">
									
	 									<span>${cartItems[0].category == 0 ? cartItems[0].ing_name : cartItems[0].rcp_title}
											외 ${cartItems.size() - 1}개 상품을 주문합니다.</span>
											
						<%-- 				<span>
  ${cartItems.size() == 1 
    ? (cartItems[0].category == 0 ? cartItems[0].ing_name : cartItems[0].rcp_title) + '을 주문합니다.' 
    : (cartItems[0].category == 0 ? cartItems[0].ing_name : cartItems[0].rcp_title) + ' 외 ' + (cartItems.size() - 1) + '개 상품을 주문합니다.'}
</span> --%>
									</div>

									<!-- 주문 내역 상세 -->
									<div id="orderDetails" class="collapse">
										<!-- 레시피 섹션 -->
										<h6 class="px-6 py-1 bg-transparent mb-0">레시피</h6>
										<ul class="list-group list-group-flush">
											<c:forEach var="item" items="${cartItems}">
												<c:if test="${item.category == 1}">
													<li class="list-group-item px-4 py-3">
														<div class="row align-items-center">
															<div class="col-2 col-md-2">
																<img src="${item.rcp_img}" alt="Recipe Image"
																	class="img-fluid ms-3"
																	style="width: 50px; height: 35px; object-fit: cover; border-radius: 5px;" />
															</div>
															<div class="col-5 col-md-5">
																<h6 class="mb-0">${item.rcp_title}</h6>
																<%-- <span><small class="text-muted">${item.rcp_price}
																		원</small></span> --%>
															</div>
															<div class="col-2 col-md-2 text-muted ms-auto me-3">
																<span>${item.qty} 개</span>
															</div>
															<%-- <div
																class="col-3 text-lg-end text-start text-md-end col-md-3">
																<span class="fw-bold">${item.rcp_price * item.qty}
																	원</span>
															</div> --%>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>

										<!-- 식재료 섹션 -->
										<h6 class="px-6 py-1 bg-transparent mb-0 mt-2">식재료</h6>
										<ul class="list-group list-group-flush">
											<c:forEach var="item" items="${cartItems}">
												<c:if test="${item.category == 0}">
													<li class="list-group-item px-4 py-3">
														<div class="row align-items-center">
															<div class="col-2 col-md-2">
																<img src="${item.ing_img}" alt="Recipe Image"
																	class="img-fluid ms-3"
																	style="width: 50px; height: 35px; object-fit: cover; border-radius: 5px;" />
															</div>
															<div class="col-5 col-md-5">
																<h6 class="mb-0">${item.ing_name}</h6>
																<%-- <span><small class="text-muted">${item.ing_avg_gram}g
																		/ ${item.unit} 단위</small></span> --%>
															</div>
															<div class="col-2 col-md-2 text-muted ms-auto me-3">
																<span>${item.qty} 개</span>
															</div>
															<%-- <div
																class="col-3 text-lg-end text-start text-md-end col-md-3">
																<span class="fw-bold">${(item.ing_avg_gram / item.unit) * item.ing_price * item.qty}
																	원</span>
															</div> --%>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>

									<!-- 주문 요약: 항상 표시 -->
									<ul class="list-group list-group-flush">
										<li class="list-group-item px-4 py-3">
											<div
												class="d-flex align-items-center justify-content-between mb-2">
												<div>주문금액</div>
												<div class="fw-bold" id="totalOriginalPrice">
													${totalOriginalPrice}원</div>
											</div>
											<div
												class="d-flex align-items-center justify-content-between">
												<div>할인금액</div>
												<div class="fw-bold" id="totalDiscountPrice">-
													${totalDiscountPrice} 원</div>
											</div>
										</li>
										<li class="list-group-item px-4 py-3">
											<div
												class="d-flex align-items-center justify-content-between fw-bold">
												<div>최종결제금액</div>
												<div id="totalPrice">${totalPrice}원</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>


	<!-- 주소 삭제 모달 아이콘 생성 필요-->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Delete address</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h6>Are you sure you want to delete this address?</h6>
					<p class="mb-6">
						Jitu Chauhan <br /> 4450 North Avenue Oakland, <br /> Nebraska,
						United States, <br /> 402-776-1106
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-gray-400"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-danger">Delete</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 주소 추가 모달 -->
	<div class="modal fade" id="addAddressModal" tabindex="-1"
		aria-labelledby="addAddressModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal body -->
				<div class="modal-body p-6">
					<div class="d-flex justify-content-between mb-5">
						<!-- heading -->
						<div>
							<h5 class="h6 mb-1" id="addAddressModalLabel">새로운 배송지</h5>
							<p class="small mb-0">주문을 위한 새로운 배송지를 추가해주세요.</p>
						</div>
						<div>
							<!-- button -->
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
					</div>
					<!-- row -->
					<div class="row g-3">
						<!-- col -->
						<div class="col-12">
							<input type="text" class="form-control" placeholder="이름"
								aria-label="name" required="" />
						</div>

						<div class="col-12">
							<div class="d-flex align-items-center">
								<input type="text" id="sample6_postcode"
									class="form-control me-2" placeholder="우편 번호" /> <input
									type="button" id="findAddress" class="btn btn-primary"
									value="우편번호 찾기" />
							</div>
						</div>

						<div class="col-12">
							<input type="text" id="sample6_address" class="form-control"
								placeholder="주소" />
						</div>

						<div class="col-12">
							<!-- button -->
							<input type="text" id="sample6_detailAddress"
								class="form-control" placeholder="상세주소" />
						</div>

						<div class="col-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="flexCheckDefault" />
								<!-- label -->
								<label class="form-check-label" for="flexCheckDefault">기본
									배송지로 지정</label>
							</div>
						</div>
						<!-- button -->
						<div class="col-12 text-end">
							<button type="button" class="btn btn-outline-primary"
								data-bs-dismiss="modal">취소</button>
							<button class="btn btn-primary" type="button">주소 저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 레시픽 카드 결제 모달 -->
<div class="modal fade" id="recipickCardModal" tabindex="-1" aria-labelledby="recipickCardModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #9758d9; color: white;">
        <h5 class="modal-title" id="recipickCardModalLabel">레시픽 카드 결제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="recipickCardError" class="alert alert-danger d-none"></div>
        
        <!-- 카드 정보 입력 -->
        <div class="mb-3">
          <label for="recipickCardNumber" class="form-label">카드 번호</label>
          <input type="text" class="form-control" id="recipickCardNumber" placeholder="0000 0000 0000 0000">
        </div>
        
        <div class="row mb-3">
          <div class="col-6">
            <label for="recipickCardExpiry" class="form-label">유효기간</label>
            <input type="text" class="form-control" id="recipickCardExpiry" placeholder="MM/YY">
          </div>
          <div class="col-6">
            <label for="recipickCardCvv" class="form-label">CVV</label>
            <input type="text" class="form-control" id="recipickCardCvv" placeholder="123">
          </div>
        </div>
        
        <!-- 포인트 사용 섹션 -->
        <div class="card p-3 mt-4 mb-3" style="background-color: #f7f2ff;">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="usePointsCheckbox">
              <label class="form-check-label fw-bold" for="usePointsCheckbox">
                포인트 사용
              </label>
            </div>
            <div class="text-primary fw-bold">
              사용 가능 포인트: <span id="availablePoints">5,280</span>P
            </div>
          </div>
          
          <div id="pointsInputSection" class="d-none">
            <div class="input-group">
              <input type="number" class="form-control" id="pointsToUse" placeholder="사용할 포인트">
              <button class="btn btn-outline-primary" type="button" id="useAllPoints">전액사용</button>
            </div>
            <small class="text-muted mt-1">1,000P부터 100P 단위로 사용 가능합니다.</small>
          </div>
        </div>
        
        <!-- 최종 결제 금액 표시 -->
        <div class="bg-light p-3 rounded">
          <div class="d-flex justify-content-between align-items-center">
            <span>최종 결제 금액</span>
            <span class="fs-5 fw-bold text-primary" id="finalPaymentAmount">${totalPrice}원</span>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="confirmRecipickPayment">결제하기</button>
      </div>
    </div>
  </div>
</div>


	<!-- Footer -->
	<!-- 푸터 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/footer.jsp" />
	<!-- Javascript-->
	<script src="${pageContext.request.contextPath}/libs/flatpickr/dist/flatpickr.min.js"></script>
	<script src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>

	<script src="${pageContext.request.contextPath}/libs/imask/dist/imask.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendors/inputmask.js"></script>


	<!-- 아임포트 라이브러리 -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- 이건모지 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- 여기까지 아임포트 라이브러리 -->

	<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


	<!-- 우편번호 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>


	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="https://pg.kakao.com/kakaopay.js"></script>

	<script>
	
	$(document).ready(function () {
	    function formatCurrency(value) {
	        return parseInt(value).toLocaleString() + " 원";
	    }

	    // JSP에서 전달된 값 확인 및 디버깅
	    const totalOriginalPrice = parseInt(${totalOriginalPrice} || 0);
	    const totalDiscountPrice = parseInt(${totalDiscountPrice} || 0);
	    const totalPrice = parseInt(${totalPrice} || 0);

	    // DOM 업데이트
	    $('#totalOriginalPrice').text(formatCurrency(totalOriginalPrice));
	    $('#totalDiscountPrice').text(formatCurrency(totalDiscountPrice));
	    $('#totalPrice').text(formatCurrency(totalPrice));
	    
	    // 우편번호 찾기 버튼 클릭 이벤트
	    $('#findAddress').on('click', function () {
	        new daum.Postcode({
	            oncomplete: function (data) {
	                const roadAddr = data.roadAddress;
	                const jibunAddr = data.jibunAddress;
	                $('#sample6_postcode').val(roadAddr || jibunAddr);
	            }
	        }).open();
	    });
	    
	    // 주문 내역 토글 기능
	    $('#toggleDetailsButton').on('click', function () {
	        const details = $('#orderDetails');
	        const summary = $('#simpleSummary');
	        const icon = $('#toggleIcon');

	        if (details.hasClass('show')) {
	            details.removeClass('show');
	            summary.show();
	            icon.removeClass('bi-caret-up-fill').addClass('bi-caret-down-fill');
	        } else {
	            details.addClass('show');
	            summary.hide();
	            icon.removeClass('bi-caret-down-fill').addClass('bi-caret-up-fill');
	        }
	    });
	    
	    // 날짜 탭 생성
	    const daysContainer = $('#dateTabs');
	    
	    if (daysContainer.length === 0) {
	        console.error("dateTabs 컨테이너를 찾을 수 없습니다.");
	        return;
	    }

	    const today = new Date();
	    const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
	    const options = { month: "2-digit", day: "2-digit", timeZone: "Asia/Seoul" };

	    for (let i = 0; i < 7; i++) {
	        const date = new Date(today);
	        date.setDate(today.getDate() + i + 1);

	        const dayName = daysOfWeek[date.getDay()];
	        formattedDate = date.toLocaleDateString("ko-KR", options);
	        formattedDate = formattedDate.slice(0, -1);
	        
	        const isoDate = date.toISOString().split('T')[0];
	        const isToday = i === 0 ? "내일" : dayName;
	        
	        const button = `
	            <li class="nav-item" role="presentation">
	                <button class="nav-link \${i == 0 ? "active" : ""}" 
	                        id="pills-\${isToday}-tab"
	                        data-bs-toggle="pill" 
	                        data-bs-target="#pills-\${isToday}"
	                        type="button" role="tab" 
	                        aria-controls="pills-\${isToday}" 
	                        data-date="\${isoDate}" 
	                        aria-selected="${i == 0}">
	                    \${isToday} <br /> <small>\${formattedDate}</small>
	                </button>
	            </li>`;
	        daysContainer.append(button);
	    }
	    
	    $('#dateTabs').on('click', '.nav-link', function () {
	        $('#dateTabs .nav-link').removeClass('active');
	        $(this).addClass('active');
	    });
	    
	    // 로딩 표시 함수
	    function showLoading() {
	        // 로딩 인디케이터 표시 로직
	        console.log("로딩 시작...");
	    }

	    function hideLoading() {
	        // 로딩 인디케이터 숨김 로직
	        console.log("로딩 종료...");
	    }
	    
	    $('#paymentButton').on('click', function () {
	        const isRecipickCardSelected = $('#recipickCard').is(':checked');
	        const selectedDeliveryDate = $('#dateTabs .nav-link.active').data('date');
	        
	        if (isRecipickCardSelected) {
	            // 레시픽 카드 결제 처리
	            handleRecipickCardPayment(selectedDeliveryDate);
	        } else {
	            // 일반 결제 (아임포트)
	            handleRegularPayment(selectedDeliveryDate);
	        }
	    });
	    
	    // 레시픽 카드 결제 처리 함수
	    function handleRecipickCardPayment(selectedDeliveryDate) {
	        // 레시픽 카드 결제 모달 표시
	        $('#recipickCardModal').modal('show');
	    }

	    // 포인트 사용 체크박스 토글
	    $('#usePointsCheckbox').on('change', function() {
	        if ($(this).is(':checked')) {
	            $('#pointsInputSection').removeClass('d-none');
	            updateFinalAmount();
	        } else {
	            $('#pointsInputSection').addClass('d-none');
	            $('#pointsToUse').val('');
	            updateFinalAmount();
	        }
	    });

	    // 전액 사용 버튼
	    $('#useAllPoints').on('click', function() {
	        const availablePoints = parseInt($('#availablePoints').text().replace(/,/g, ''));
	        $('#pointsToUse').val(availablePoints);
	        updateFinalAmount();
	    });

	    // 포인트 입력 시 최종 결제 금액 업데이트
	    $('#pointsToUse').on('input', function() {
	        updateFinalAmount();
	    });

	    // 최종 결제 금액 업데이트
	    function updateFinalAmount() {
	        const originalAmount = parseInt($('#totalPrice').text().replace(/[^0-9]/g, ''));
	        let pointsToUse = 0;
	        
	        if ($('#usePointsCheckbox').is(':checked')) {
	            pointsToUse = parseInt($('#pointsToUse').val()) || 0;
	            
	            // 사용 가능한 포인트를 초과해서 사용하지 못하도록 제한
	            const availablePoints = parseInt($('#availablePoints').text().replace(/,/g, ''));
	            if (pointsToUse > availablePoints) {
	                pointsToUse = availablePoints;
	                $('#pointsToUse').val(availablePoints);
	            }
	            
	            // 결제 금액보다 많은 포인트를 사용하지 못하도록 제한
	            if (pointsToUse > originalAmount) {
	                pointsToUse = originalAmount;
	                $('#pointsToUse').val(pointsToUse);
	            }
	        }
	        
	        const finalAmount = originalAmount - pointsToUse;
	        $('#finalPaymentAmount').text(formatCurrency(finalAmount));
	    }

	    // 카드 결제 모달에서 결제 버튼 클릭 시
	    $('#confirmRecipickPayment').on('click', function() {
	        const cardNumber = $('#recipickCardNumber').val();
	        const cardExpiry = $('#recipickCardExpiry').val();
	        const cardCvv = $('#recipickCardCvv').val();
	        const usePoints = $('#usePointsCheckbox').is(':checked');
	        const pointsToUse = usePoints ? parseInt($('#pointsToUse').val()) : 0;
	        
	        // 입력 검증
	        if (!cardNumber || !cardExpiry || !cardCvv) {
	            $('#recipickCardError').removeClass('d-none').text('카드 정보를 모두 입력해주세요.');
	            return;
	        }
	        
	        // 모달 닫기
	        $('#recipickCardModal').modal('hide');
	        
	        // 현재 가격 정보
	        const currentPrice = parseInt($('#totalPrice').text().replace(/[^0-9]/g, ''));
	        const uid = new Date().getTime().toString().substr(-10);
	        
	        // 레시픽 카드 결제 API 호출
	        processRecipickCardPayment(cardNumber, cardExpiry, cardCvv, currentPrice, selectedDeliveryDate, uid, pointsToUse);
	    });

	    // 레시픽 카드 서비스로 결제 요청하는 함수
	    function processRecipickCardPayment(cardNumber, cardExpiry, cardCvv, amount, deliveryDate, merchantUid, pointsToUse) {
	        // 로딩 표시
	        showLoading();
	        
	        // 레시픽 카드 API 호출 데이터
	        const paymentData = {
	            cardNumber: cardNumber,
	            cardExpiry: cardExpiry,
	            cardCvv: cardCvv,
	            amount: amount,
	            pointsToUse: pointsToUse,
	            orderId: merchantUid,
	            userId: '${orderer.email}', // 사용자 식별자
	        };
	        
	        // 테스트용 성공 응답 (실제로는 API 호출)
	        setTimeout(function() {
	            hideLoading();
	            
	            // 결제 성공 데이터
	            const successData = {
	                totalPrice: amount,
	                deliveryDate: deliveryDate,
	                orderDate: new Date().toISOString().split('T')[0],
	                paymentMethod: 'recipick_card',
	                merchantUid: merchantUid,
	                address: `${orderer.address}`,
	                orderStatus: '결제완료',
	                impUid: 'recipick_' + merchantUid,
	                pointsUsed: pointsToUse,
	                pointsEarned: Math.floor(amount * 0.02) // 2% 적립
	            };
	            
	            // 주문 성공 처리
	            saveOrderAndRedirect(successData);
	        }, 1000);
	        
	        /* 실제 API 호출은 아래와 같이 구현
	        $.ajax({
	            url: 'https://card-api.recipick.com/api/card/payment/process',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(paymentData),
	            success: function(response) {
	                hideLoading();
	                
	                if (response.success) {
	                    // 결제 성공 데이터
	                    const successData = {
	                        totalPrice: amount,
	                        deliveryDate: deliveryDate,
	                        orderDate: new Date().toISOString().split('T')[0],
	                        paymentMethod: 'recipick_card',
	                        merchantUid: merchantUid,
	                        address: `${orderer.address}`,
	                        orderStatus: '결제완료',
	                        impUid: response.paymentId,
	                        pointsUsed: pointsToUse,
	                        pointsEarned: response.pointsEarned
	                    };
	                    
	                    // 주문 성공 처리
	                    saveOrderAndRedirect(successData);
	                } else {
	                    // 결제 실패 처리
	                    alert('카드 결제 실패: ' + response.message);
	                }
	            },
	            error: function(xhr, status, error) {
	                hideLoading();
	                alert('결제 처리 중 오류가 발생했습니다.');
	                console.error('결제 오류:', error);
	            }
	        });
	        */
	    }

	    // 주문 정보 저장 및 리다이렉트
	    function saveOrderAndRedirect(orderData) {
	        // 테스트용 성공 로직 (실제로는 API 호출)
	        console.log('주문 정보 저장:', orderData);
	        window.location.href = `${pageContext.request.contextPath}/checkout/payment-success?merchantUid=${orderData.merchantUid}`;
	        
	        /* 실제 API 호출은 아래와 같이 구현
	        $.ajax({
	            url: `${pageContext.request.contextPath}/checkout/success`,
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(orderData),
	            success: function(response) {
	                if (response.success) {
	                    window.location.href = `${pageContext.request.contextPath}/checkout/payment-success?merchantUid=${orderData.merchantUid}`;
	                } else {
	                    alert('결제는 성공했으나 주문 저장 중 문제가 발생했습니다.');
	                }
	            },
	            error: function(xhr, status, error) {
	                alert('서버와 통신 중 에러가 발생했습니다.');
	                console.error('통신 에러:', error);
	            }
	        });
	        */
	    }
	    
	    // 일반 결제 처리 함수
	    function handleRegularPayment(selectedDeliveryDate) {
	        const IMP = window.IMP; 
	        IMP.init('imp48864864');
	        
	        const uid = new Date().getTime().toString().substr(-10);
	       
	        const paymentData = {
	            pg: 'uplus',
	            pay_method: 'card',  
	            merchant_uid: uid, 
	            name: '테스트 상품', 
	            amount: 100,
	            buyer_email: '${orderer.email}', 
	            buyer_name: '${orderer.name}', 
	            buyer_tel: '${orderer.phone}', 
	            buyer_addr: '${orderer.address}', 
	            buyer_postcode: '123-456', 
	        };

	        IMP.request_pay(paymentData, function (rsp) {
	            const isSuccess = rsp.success;
	            
	            // 공통 데이터
	            const commonData = {
	                totalPrice: paymentData.amount, 
	                deliveryDate: selectedDeliveryDate,  
	                orderDate: new Date().toISOString().split('T')[0], 
	                paymentMethod: paymentData.pay_method, 
	                merchantUid: rsp.merchant_uid,
	                address: `${orderer.address}`
	            };
	        
	            if (isSuccess) {
	                console.log('결제 성공:', rsp);

	                const successData = {
	                    ...commonData,
	                    orderStatus: '결제완료',
	                    impUid: rsp.imp_uid 
	                };
	                console.log(successData);
	                
	                $.ajax({
	                    url: `${pageContext.request.contextPath}/checkout/success`,
	                    type: 'POST',
	                    contentType: 'application/json',
	                    data: JSON.stringify(successData),
	                    success: function (response) {
	                        if (response.success) {
	                            const formattedTotalPrice = formatCurrency(paymentData.amount);
	                            window.location.href = `${pageContext.request.contextPath}/checkout/payment-success?merchantUid=${rsp.merchant_uid}`;
	                        } else {
	                            alert('결제 정보 저장 중 문제가 발생했습니다.');
	                        }
	                    },
	                    error: function (xhr, status, error) {
	                        alert('서버와 통신 중 에러가 발생했습니다.');
	                        console.error('통신 에러:', error);
	                    }
	                });
	            } else {
	                console.log('결제 실패:', rsp);

	                const failureData = {
	                    ...commonData,
	                    orderStatus: '주문실패', 
	                    errorMessage: rsp.error_msg 
	                };

	                $.ajax({
	                    url: `${pageContext.request.contextPath}/checkout/failure`,
	                    type: 'POST',
	                    contentType: 'application/json',
	                    data: JSON.stringify(failureData),
	                    success: function (response) {
	                        if (response.success) {
	                            const formattedTotalPrice = formatCurrency(paymentData.amount);
	                            window.location.href = `${pageContext.request.contextPath}/checkout/payment-failed?merchantUid=${rsp.merchant_uid}`;
	                        } else {
	                            alert('결제 실패 정보 저장 중 문제가 발생했습니다.');
	                        }
	                    },
	                    error: function (xhr, status, error) {
	                        alert('서버와 통신 중 에러가 발생했습니다.');
	                        console.error('통신 에러:', error);
	                    }
	                });
	            }
	        });
	    }
	});


	</script>

</body>

</html>