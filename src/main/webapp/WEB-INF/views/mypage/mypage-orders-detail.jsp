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
<title>주문 상세</title>
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
							<h2 class="mb-6">주문 상세</h2>

							<!-- 상품 이미지와 설명 -->
							<div class="row mb-5">
								<div class="col-md-6">
									<div class="img-zoom">
										<img src="${vo.main_image }${vo.image}" alt="Ecommerce"
											class="img-fluid rounded shadow"
											style="width: 100%; object-fit: cover;" />
									</div>
								</div>
								<div class="col-md-6">
									<h3 class="fw-bold">${vo.title}</h3>
									<p class="text-muted">${vo.description}</p>
									<hr />
									<ul class="list-unstyled">
										<li><strong>주문 번호:</strong> ${vo.oh_id}</li>
										<li><strong>주문 일자:</strong> ${vo.order_date}</li>
										<li><strong>수량:</strong> ${vo.qty}</li>
										
										<li><strong>배송 상태:</strong> ${vo.delivery_status}</li>
									</ul>
									<form action="/recipick/deleteOrder.do" method="post"
										onsubmit="return confirm('정말 주문을 취소하시겠습니까?');">
										<input type="hidden" name="oh_id" value="${vo.oh_id}">
										<button type="submit" class="btn btn-danger">주문 취소</button>
									</form>
								</div>
							</div>

							<!-- 사용자 정보 -->
							<div class="mb-5">
								<h4 class="fw-bold">사용자 정보</h4>
								<hr />
								<ul class="list-unstyled">
									<li><strong>이름:</strong> ${vo.name}</li>
									<li><strong>연락처:</strong> ${vo.phone}</li>
									<li><strong>배송 주소:</strong> ${vo.address}</li>
								</ul>
							</div>

							<!-- 결제 정보 -->
							<div class="mb-5">
								<h4 class="fw-bold">결제 정보</h4>
								<hr />
								<ul class="list-unstyled">
									<li><strong>결제 수단:</strong> ${vo.payment_method}</li>
									<li><strong>할인 금액:</strong> &#8361;<fmt:formatNumber
											value="350" type="number" pattern="#,###" /></li>
									<li><strong>총 결제 금액:</strong> &#8361;<fmt:formatNumber
											value="4650" type="number" pattern="#,###" /></li>
								</ul>
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
	<!-- 팝업 코드 -->
	<div class="modal fade" id="cancelOrderModal" tabindex="-1"
		aria-labelledby="cancelOrderModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cancelOrderModalLabel">주문취소 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">주문을 취소하시겠습니까?</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-danger"
						id="confirmCancelOrder">주문취소</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    // 주문 취소 버튼 동작
    document.getElementById('confirmCancelOrder').addEventListener('click', function () {
        // 주문 취소 처리 (선택적으로 서버와의 통신 가능)
        alert('주문이 취소되었습니다.');

        // 페이지 리다이렉션
        window.location.href = 'account-orders.html';
    });
</script>

	<!-- <script>document.addEventListener('DOMContentLoaded', function () {
    // 사용자 정보 로드 (예: Ajax로 서버에서 데이터를 가져옴)
    const userData = {
        name: "홍길동",
        contact: "010-1234-5678",
        address: "서울특별시 강남구 테헤란로 123"
    };

    // 결제 정보 로드
    const paymentData = {
        paymentMethod: "신용카드",
        discountAmount: "₩5,000",
        totalAmount: "₩45,000"
    };

		// 사용자 정보 출력
		document.getElementById('userName').textContent = userData.name;
		document.getElementById('userContact').textContent = userData.contact;
		document.getElementById('userAddress').textContent = userData.address;

		// 결제 정보 출력
		document.getElementById('paymentMethod').textContent = paymentData.paymentMethod;
		document.getElementById('discountAmount').textContent = paymentData.discountAmount;
		document.getElementById('totalAmount').textContent = paymentData.totalAmount;
	});
</script> -->

	<!-- <script src="${pageContext.request.contextPath}/js/components/recipe-component.js"></script> -->
</body>

</html>