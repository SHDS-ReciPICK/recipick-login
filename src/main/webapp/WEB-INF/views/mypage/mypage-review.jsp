<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<title>주문 배송 조회</title>
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
.table tbody:empty {
	display: none;
}

.truncate-text {
	white-space: nowrap; /* 줄 바꿈 방지 */
	overflow: hidden; /* 넘치는 텍스트 숨김 */
	text-overflow: ellipsis; /* 말줄임표 추가 */
	max-width: 300px; /* 최대 너비 설정 */
	display: block; /* 블록 요소로 처리 */
}

#reviewPopup {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1000;
	background: white;
	padding: 40px; /* 패딩 증가 */
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* 그림자 강조 */
	border-radius: 10px; /* 모서리 둥글게 */
	width: 500px; /* 더 넓게 */
}

.rating {
	font-size: 2rem; /* 별 크기 증가 */
	cursor: pointer;
	margin-right: 10px;
}

textarea {
	width: 100%; /* 전체 너비 */
	height: 150px; /* 높이 증가 */
	border: 1px solid #ddd; /* 경계선 추가 */
	border-radius: 5px; /* 모서리 둥글게 */
	padding: 10px; /* 텍스트 패딩 */
	font-size: 1.1rem; /* 글자 크기 증가 */
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
								<li class="nav-item"><a class="nav-link active"
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
							<h2 class="mb-6">리뷰 관리</h2>


							<ul class="nav nav-tabs" id="reviewTabs" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="write-review-tab"
										data-bs-toggle="tab" data-bs-target="#write-review"
										type="button" role="tab" aria-controls="write-review"
										aria-selected="true">리뷰 작성</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="view-review-tab"
										data-bs-toggle="tab" data-bs-target="#view-review"
										type="button" role="tab" aria-controls="view-review"
										aria-selected="false">리뷰 보기</button>
								</li>
							</ul>
							<div class="tab-content" id="reviewTabContent">
								<!-- 리뷰 작성 -->
								<div class="tab-pane fade show active" id="write-review"
									role="tabpanel" aria-labelledby="write-review-tab">

									<div class="table-responsive-xxl border-0">
										<table class="table mb-0 text-nowrap table-centered">
											<thead class="bg-light">
												<tr>
													<th>&nbsp;</th>
													<th>상품명</th>
													<th>주문번호</th>
													<th>주문일자</th>
													<th>수량</th>
													<th>배송상태</th>
													
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty notWritten.list }">
													<tr>
														<td colspan="8" class="text-center">작성할 리뷰 목록이 없습니다.</td>
													</tr>
												</c:if>
												<c:forEach var="vo" items="${notWritten.list }">
													<tr>
														<td class="align-middle border-top-0 w-0"><a
															href="mypage-orders-detail?oh_id=${vo.oh_id}"><img
																src="${vo.main_image }" alt="Ecommerce"
																class="icon-shape icon-xl" /></a></td>
														<td class="align-middle border-top-0"><a
															href="mypage-orders-detail?oh_id=${vo.oh_id}"
															class="fw-semibold text-inherit">
																<h6 class="mb-0">${vo.title }</h6> <span
																class="truncate-text"> <small class="text-muted">${vo.description}</small>
															</span></td>
														<td class="align-middle border-top-0"><a
															href="mypage-orders-detail?oh_id=${vo.oh_id}"
															class="text-inherit">${vo.oh_id }</a></td>
														<td class="align-middle border-top-0">${vo.order_date }</td>
														<td class="align-middle border-top-0">${vo.qty }</td>
														<td class="align-middle border-top-0">
															${vo.delivery_status }</td>
														
														<td class="align-middle border-top-0">
															<button class="btn btn-primary btn-sm"
																onclick="openReviewPopup(${vo.recipe_id})">리뷰
																작성하기</button>
														</td>

														<div id="reviewPopup">
															<h3 class="mb-4 text-center">리뷰 작성</h3>
															<form id="reviewForm"
																action="${pageContext.request.contextPath}/writeReview"
																method="post">
																<input type="hidden" name="recipe_id" id="popupRecipeId">
																<input type="hidden" name="member_id"
																	value="${vo.member_id}">

																<!-- 별점 선택 -->
																<div class="text-center mb-4">
																	<span class="rating" onclick="setStarRating(1)">★</span>
																	<span class="rating" onclick="setStarRating(2)">★</span>
																	<span class="rating" onclick="setStarRating(3)">★</span>
																	<span class="rating" onclick="setStarRating(4)">★</span>
																	<span class="rating" onclick="setStarRating(5)">★</span>
																</div>
																<input type="hidden" name="star_rating" id="starRating">
																<!-- 리뷰 내용 입력 -->
																<div class="mb-4">
																	<textarea name="content" placeholder="리뷰 내용을 입력하세요"
																		required></textarea>
																</div>

																<!-- 버튼 -->
																<div class="d-flex justify-content-end">
																	<button type="submit"
																		class="btn btn-primary btn-lg me-3">입력</button>
																	<button type="button" class="btn btn-secondary btn-lg"
																		onclick="closeReviewPopup()">취소</button>
																</div>
															</form>
														</div>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div class="pagenate clear">
											<ul class="pagination justify-content-center">
												<c:if test="${notWritten.isPrev}">
													<li class="page-item"><a class="page-link mx-1"
														href="mypage-review?page=${notWritten.startPage-1 }"
														aria-label="Previous"> <i
															class="feather-icon icon-chevron-left"></i>
													</a></li>
												</c:if>
												<c:forEach var="p" begin="${notWritten.startPage}"
													end="${notWritten.endPage}">
													<c:if test="${p == MemberVO.page}">
														<li class="page-item active"><a
															class="page-link mx-1" href="#">${p}</a></li>
													</c:if>
													<c:if test="${p != MemberVO.page}">
														<li class="page-item"><a class="page-link mx-1"
															href="mypage-review?page=${p}">${p}</a></li>
													</c:if>
												</c:forEach>
												<c:if test="${notWritten.isNext}">
													<li class="page-item"><a class="page-link mx-1"
														href="mypage-review?page=${notWritten.endPage+1 }"
														aria-label="Next"> <i
															class="feather-icon icon-chevron-right"></i>
													</a></li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>


							<!-- 리뷰 보기 -->
							<div class="tab-pane fade" id="view-review" role="tabpanel"
								aria-labelledby="view-review-tab">


								<div class="table-responsive-xxl border-0">
									<table class="table mb-0 text-nowrap table-centered">
										<thead class="bg-light">
											<tr>
												<th>&nbsp;</th>
												<th>상품명</th>
												<th>주문번호</th>
												<th>별점</th>
												<th>주문 날짜</th>
												<th>리뷰 작성일</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty written.list}">
												<tr>
													<td colspan="6" class="text-center">작성된 리뷰가 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="vo" items="${written.list}">
												<tr>
													<td class="align-middle border-top-0 w-0"><a
														href="mypage-orders-detail?oh_id=${vo.oh_id}"><img
															src="${vo.main_image }" alt="Ecommerce"
															class="icon-shape icon-xl" /></a></td>
													<td class="align-middle border-top-0"><a
														href="mypage-orders-detail?oh_id=${vo.oh_id}"
														class="fw-semibold text-inherit">
															<h6 class="mb-0">${vo.title }</h6>
													</a> <span class="truncate-text"> <small
															class="text-muted">${vo.description}</small>
													</span></td>
													<td class="align-middle border-top-0">${vo.oh_id}</td>

													<td class="align-middle border-top-0"><span
														class="text-warning"> <c:forEach var="i" begin="1"
																end="${vo.star_rating}">
			                                        &#9733;
			                                    </c:forEach>
													</span></td>
													<td class="align-middle border-top-0">${vo.order_date}</td>
													<td class="align-middle border-top-0">${fn:replace(vo.review_dt, 'T', ' ')}</td>
													<td class="align-middle border-top-0">
														<form action="/recipick/deleteReview" method="post"
															onsubmit="return confirm('정말 리뷰를 삭제하시겠습니까?');">
															<input type="hidden" name="review_id"
																value="${vo.review_id}" />
															<button type="submit" class="btn btn-danger btn-sm">리뷰
																삭제</button>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="pagenate clear">
										<ul class="pagination justify-content-center">
											<c:if test="${written.isPrev}">
												<li class="page-item"><a class="page-link mx-1"
													href="mypage-review?page=${written.startPage-1 }"
													aria-label="Previous"> <i
														class="feather-icon icon-chevron-left"></i>
												</a></li>
											</c:if>
											<c:forEach var="p" begin="${written.startPage}"
												end="${written.endPage}">
												<c:if test="${p == MemberVO.page}">
													<li class="page-item active"><a class="page-link mx-1"
														href="#">${p}</a></li>
												</c:if>
												<c:if test="${p != MemberVO.page}">
													<li class="page-item"><a class="page-link mx-1"
														href="mypage-review?page=${p}">${p}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${written.isNext}">
												<li class="page-item"><a class="page-link mx-1"
													href="mypage-review?page=${written.endPage+1 }"
													aria-label="Next"> <i
														class="feather-icon icon-chevron-right"></i>
												</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
	</main>

	<script>
function openReviewPopup(recipeId) {
    document.getElementById("reviewPopup").style.display = "block";
    document.getElementById("popupRecipeId").value = recipeId;
}

function closeReviewPopup() {
    document.getElementById("reviewPopup").style.display = "none";
}

/* function setStarRating(rating) {
    document.getElementById("starRating").value = rating;

    // 별점 UI 업데이트
    const stars = document.querySelectorAll(".rating");
    stars.forEach((star, index) => {
        if (index < rating) {
            star.style.color = "gold"; // 선택된 별
        } else {
            star.style.color = "gray"; // 선택되지 않은 별
        }
    });
} */
function setStarRating(rating) {
    document.getElementById("starRating").value = rating;

    const stars = document.querySelectorAll(".rating");
    stars.forEach((star, index) => {
        if (index < rating) {
            star.style.color = "#FFD700"; // 금색 강조
        } else {
            star.style.color = "#C0C0C0"; // 회색으로 비활성화
        }
    });
}
</script>

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


