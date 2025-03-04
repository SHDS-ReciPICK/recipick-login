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



<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components/recipe-component.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
.truncate-text {
	white-space: nowrap; /* 줄 바꿈 방지 */
	overflow: hidden; /* 넘치는 텍스트 숨김 */
	text-overflow: ellipsis; /* 말줄임표 추가 */
	max-width: 400px; /* 최대 너비 설정 */
	display: block; /* 블록 요소로 처리 */
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
								<li class="nav-item"><a class="nav-link"
									aria-current="page"
									href="${pageContext.request.contextPath}/mypage-review"> <i
										class="feather-icon icon-shopping-bag me-2"></i> 리뷰 관리
								</a></li>
								<li class="nav-item"><a class="nav-link active"
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
							<h2 class="mb-6">주문/배송 조회</h2>
							<div class="d-flex mb-4">
								<!-- 상품명 검색 -->
								<form method="get" name="searchForm" id="searchForm"
									action="/recipick/mypage-orders"
									class="d-flex align-items-center">
									<input type="text" id="sval" name="searchWord"
										value="${MemberVO.searchWord}" class="form-control me-2"
										title="상품명을 입력하세요" style="width: 350px"> <input
										type="button" class="btn btn-outline-secondary mx-1"
										id="searchButton" value="검색" title="검색">

								</form>

							</div>

							<form id="yearForm" method="get" action="/recipick/mypage-orders"
								class="d-flex mb-4">
								<button type="submit" class="btn btn-outline-secondary mx-1"
									name="year" value="all">모두 보기</button>
								<button type="submit" class="btn btn-outline-primary mx-1"
									name="year" value="2025">2025</button>
								<button type="submit" class="btn btn-outline-primary mx-1"
									name="year" value="2024">2024</button>
								<button type="submit" class="btn btn-outline-primary mx-1"
									name="year" value="2023">2023</button>
								<button type="submit" class="btn btn-outline-primary mx-1"
									name="year" value="2022">2022</button>
								<button type="submit" class="btn btn-outline-primary mx-1"
									name="year" value="2021">2021</button>
								<button type="submit" class="btn btn-outline-primary mx-1"
									name="year" value="2020">2020</button>
								<button type="submit" class="btn btn-outline-primary mx-1"
									name="year" value="2019">2019</button>
							</form>


							<div class="table-responsive-xxl border-0">
								<!-- Table -->

								<table class="table mb-0 text-nowrap table-centered">
									<!-- Table Head -->

									<thead class="bg-light">
										<tr>
											<th>&nbsp;</th>
											<th>상품명</th>
											<th>주문번호</th>
											<th>주문일자</th>
											<th>수량</th>
											<th>주문상태</th>
											

											<th></th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${empty map.list }">
											<!-- 나중에 list mapper 작성할때 member_id랑 조인해야함 -->
											<tr>
												<td>주문 정보가 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="vo" items="${map.list }">

											<tr>

												<td class="align-middle border-top-0 w-0"><a
													href="mypage-orders-detail?oh_id=${vo.oh_id}"><img
														src="${vo.main_image }${vo.image }" alt="Ecommerce"
														class="icon-shape icon-xl" /></a>
												<td class="align-middle border-top-0"><a
													href="mypage-orders-detail?oh_id=${vo.oh_id}"
													class="fw-semibold text-inherit">
														<h6 class="mb-0">${vo.title }</h6>
												</a> <span class="truncate-text"> <small
														class="text-muted">${vo.description}${vo.detail} </small>
												</span> <!--여기에 recipe or ing description  --></td>
												<td class="align-middle border-top-0"><a
													href="mypage-orders-detail?oh_id=${vo.oh_id}"
													class="text-inherit">${vo.oh_id }</a></td>

												</td>
												<td class="align-middle border-top-0">${vo.order_date }</td>
												</td>
												<td class="align-middle border-top-0">${vo.qty }</td>
												</td>

												<td class="align-middle border-top-0"><c:choose>
														<c:when test="${vo.order_state == '주문완료'}">
															<span class="badge bg-success">주문완료</span>
														</c:when>
														<c:when test="${vo.order_state == '진행중'}">
															<span class="badge bg-warning">진행중</span>
														</c:when>
														<c:when test="${vo.order_state == '주문취소'}">
															<span class="badge bg-danger">주문취소</span>
														</c:when>
														<c:otherwise>
															<span class="badge bg-success">${vo.order_state} </span>
														</c:otherwise>
													</c:choose></td>

												

												<td class="text-muted align-middle border-top-0"><a
													href="mypage-orders-detail?oh_id=${vo.oh_id}"
													class="text-inherit" data-bs-toggle="tooltip"
													data-bs-placement="top" data-bs-title="View"><i
														class="feather-icon icon-eye"></i></a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>

								<div class="pagenate clear">
									<ul class="pagination justify-content-center">
										<!-- 이전 페이지 버튼 -->
										<c:if test="${map.isPrev}">
											<li class="page-item"><a class="page-link mx-1"
												href="mypage-orders?page=${map.startPage-1 }&searchWord=${MemberVO.searchWord}"
												aria-label="Previous"> <i
													class="feather-icon icon-chevron-left"></i>
											</a></li>
										</c:if>

										<!-- 페이지 번호 -->
										<c:forEach var="p" begin="${map.startPage}"
											end="${map.endPage}">
											<c:if test="${p == MemberVO.page}">
												<li class="page-item active"><a class="page-link mx-1"
													href="#">${p}</a></li>
											</c:if>
											<c:if test="${p != MemberVO.page}">
												<li class="page-item"><a class="page-link mx-1"
													href="mypage-orders?page=${p}&searchWord=${MemberVO.searchWord}">${p}</a>
												</li>
											</c:if>
										</c:forEach>

										<!-- 다음 페이지 버튼 -->
										<c:if test="${map.isNext}">
											<li class="page-item"><a class="page-link mx-1"
												href="mypage-orders?page=${map.endPage+1 }&searchWord=${MemberVO.searchWord}"
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

	<script>
			
		  document.addEventListener("DOMContentLoaded", function () {
		        // 검색 버튼 클릭 시 폼 제출
		        const searchButton = document.getElementById("searchButton");
		        const searchForm = document.getElementById("searchForm");
	
		        searchButton.addEventListener("click", function () {
		            searchForm.submit(); // 폼 제출
		        });
		    });
		
	</script>
	<!-- <script src="${pageContext.request.contextPath}/js/components/recipe-component.js"></script> -->
	<script>
	  const member_id = ${vo.member_id};
	    // member_id 값 확인
	    console.log("Member ID:", member_id);
	
	</script>
</body>

</html>


