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
<title>내가 작성한 게시글</title>
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
								
								<li class="nav-item"><a class="nav-link active"
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
							<div class="container">
								<main>
									<div class="row mb-9">
										<div class="col-md-12">
											<div
												class="d-flex flex-row justify-content-between align-items-center">
												<div>
													<h2>내가 작성한 게시글</h2>
													<!-- breacrumb -->
													<nav aria-label="breadcrumb">
														<ol class="breadcrumb mb-0">

														</ol>
													</nav>
												</div>
												<div></div>
											</div>
										</div>
									</div>


									<section class="mb-lg-14 mb-8">

										<div class="container">

											<c:if test="${empty posts}">
												<tr>
													<td colspan="8" class="text-center">등록된 글이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty posts }">

												<section>
													<div class="container">
														<ul class="nav justify-content-end mt-7 mb-2">
															<li class="nav-item"><a
																class="nav-link ${currentSort == 'datetime' ? 'active fw-bold' : ''}"
																href="/recipick/mypage-myrecipe?page=1&sort=datetime">최신순</a>
															</li>
															<li class="nav-item"><a
																class="nav-link ${currentSort == 'reply' ? 'active fw-bold' : ''}"
																href="/recipick/mypage-myrecipe?page=1&sort=reply">인기순</a>
															</li>
															<li class="nav-item"><a
																class="nav-link ${currentSort == 'view' ? 'active fw-bold' : ''}"
																href="/recipick/mypage-myrecipe?page=1&sort=view">조회순</a>
															</li>
														</ul>
													</div>
												</section>
												<div class="row">
													<c:forEach items="${posts}" var="post">
														<div class="col-12 col-md-6 col-lg-4 mb-10">
															<div class="mb-4">
																<a href="/recipick/post-detail/${post.post_id}">
																	<div class="img-zoom">
																		<img src="${post.img_url }" alt="${post.coverImage}"
																			class="img-fluid w-100" />
																	</div>
																</a>
															</div>

															<div class="mb-3 text-primary">${post.posterNickname}</div>
															<div>
																<h5>
																	<a href="/recipick/post-detail/${post.post_id}"
																		class="text-inherit">${post.title}</a>
																</h5>
																<p>${post.post_content}</p>
																<div
																	class="d-flex justify-content-between text-muted mt-4">
																	<span><small><fmt:formatDate
																				value="${post.post_datetime}" pattern="yyyy-MM-dd" /></small></span>
																	<span> <span class="me-1"> <small>조회수
																				<span class="text-dark fw-bold">${post.view}</span>
																		</small>
																	</span> <span> <small>댓글 <span
																				class="text-dark fw-bold">${post.countReply}</span></small>
																	</span>
																	</span>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>

												<!-- 페이징 -->
												<div class="col-12">
													<nav>
														<ul class="pagination justify-content-center">
															<li
																class="page-item ${currentPage == 1 ? 'disabled' : ''}">
																<a class="page-link mx-1"
																href="/recipick/mypage-myrecipe?page=${currentPage - 1}&sort=${currentSort}"
																aria-label="Previous"> <i
																	class="feather-icon icon-chevron-left"></i>
															</a>
															</li>

															<c:forEach begin="1" end="${totalPages}" var="pageNum">
																<li
																	class="page-item ${pageNum == currentPage ? 'active' : ''}">
																	<a class="page-link mx-1"
																	href="/recipick/mypage-myrecipe?page=${pageNum}&sort=${currentSort}">${pageNum}</a>
																</li>
															</c:forEach>

															<li
																class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
																<a class="page-link mx-1"
																href="/recipick/mypage-myrecipe?page=${currentPage + 1}&sort=${currentSort}"
																aria-label="Next"> <i
																	class="feather-icon icon-chevron-right"></i>
															</a>
															</li>
														</ul>
													</nav>
												</div>

											</c:if>

										</div>
									</section>
								</main>
							</div>
	</main>
	</div>



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