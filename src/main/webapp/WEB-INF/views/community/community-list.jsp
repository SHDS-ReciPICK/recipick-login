<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta content="Codescandy" name="author">
	<title>나만의 레시피</title>

	<!-- Favicon icon-->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon/recipick-favicon-orange.svg">

	<!-- Libs CSS -->
	<link href="${pageContext.request.contextPath}/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">

	<!-- Theme CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.min.css">

	<!-- Font CSS -->
	<link href="https://cdn.jsdelivr.net/gh/sun-typeface/SUIT@2/fonts/variable/woff2/SUIT-Variable.css" rel="stylesheet">

	<style>
		body {
			font-family: 'SUIT Variable', sans-serif;
		}
	</style>

	<style>
		.nav-link.active {
			color: #21313c !important;
		}

		.nav-link {
			color: #5c6c75;
		}

		.nav-link:hover {
			color: #FF8A3D;
		}
		
		/* 썸네일 크기 */
		.img-zoom img {
		    aspect-ratio: 3 / 2;
		    object-fit: cover;
		 }
		 
		 /* 제목 */
		 h5 a {
		    display: block;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    max-width: 100%; /* 부모 요소의 가로 너비를 기준으로 줄임표 처리 */
		}
		
		/* 내용 */
		p {
		    display: -webkit-box;
		    -webkit-box-orient: vertical;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    -webkit-line-clamp: 2; /* 최대 두 줄까지만 표시 */
		    line-height: 1.6; /* 줄 간격 설정 */
		}
	</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/components/header.jsp" />
	<jsp:include page="/WEB-INF/views/components/navbar.jsp" />

	<script src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>
	<main>
		<!-- section -->
		<section class="mt-8">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-12 d-flex">
						<!-- heading -->
						<h1 class="fw-bold me-6">나만의 레시피</h1>
						<button class="btn btn-primary px-4" type="button" style="height: 42px;" onclick="postWrite()"> <!-- 버튼 -->
							<i class="feather-icon icon-plus me-2"></i> <!-- 아이콘 -->
							게시글 작성하기
						</button>
					</div>
				</div>
			</div>
		</section>

		<!-- 정렬 기준 -->
		<section>
		    <div class="container">
		        <ul class="nav justify-content-end mt-7 mb-2">
		            <li class="nav-item">
		                <a class="nav-link ${currentSort == 'datetime' ? 'active fw-bold' : ''}" 
		                   href="/recipick/community-list?page=1&sort=datetime">최신순</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link ${currentSort == 'reply' ? 'active fw-bold' : ''}" 
		                   href="/recipick/community-list?page=1&sort=reply">인기순</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link ${currentSort == 'view' ? 'active fw-bold' : ''}" 
		                   href="/recipick/community-list?page=1&sort=view">조회순</a>
		            </li>
		        </ul>
		    </div>
		</section>

		<!-- section -->
		<section class="mb-lg-14 mb-8">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
				    <c:forEach items="${posts}" var="post">
				        <div class="col-12 col-md-6 col-lg-4 mb-10">
				            <div class="mb-4">
				                <a href="/recipick/post-detail/${post.post_id}">
				                    <div class="img-zoom">
				                    <img src="${post.coverImage}" alt="${post.coverImage}" class="img-fluid w-100" />
				                    </div>
				                </a>
				            </div>
				            <div class="mb-3 text-primary">${post.posterNickname}</div>
				            <div>
				                <h5><a href="/recipick/post-detail/${post.post_id}" class="text-inherit">${post.title}</a></h5>
				                <p>${post.post_content}</p>
				                <div class="d-flex justify-content-between text-muted mt-4">
				                    <span><small><fmt:formatDate value="${post.post_datetime}" pattern="yyyy-MM-dd"/></small></span>
				                    <span>
				                        <span class="me-1">
				                            <small>조회수 <span class="text-dark fw-bold">${post.view}</span></small>
				                        </span>
				                        <span>
				                            <small>댓글 <span class="text-dark fw-bold">${post.countReply}</span></small>
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
				            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				                <a class="page-link mx-1" href="/recipick/community-list?page=${currentPage - 1}&sort=${currentSort}" aria-label="Previous">
				                    <i class="feather-icon icon-chevron-left"></i>
				                </a>
				            </li>
				
				            <c:forEach begin="1" end="${totalPages}" var="pageNum">
				                <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
				                    <a class="page-link mx-1" href="/recipick/community-list?page=${pageNum}&sort=${currentSort}">${pageNum}</a>
				                </li>
				            </c:forEach>
				
				            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				                <a class="page-link mx-1" href="/recipick/community-list?page=${currentPage + 1}&sort=${currentSort}" aria-label="Next">
				                    <i class="feather-icon icon-chevron-right"></i>
				                </a>
				            </li>
				        </ul>
				    </nav>
				</div>
			</div>
		</section>
	</main>

	<!-- 푸터 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/footer.jsp" />

	<!-- Javascript-->
	<script src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>

	<script>
		<!-- 게시글 작성하기 버튼 클릭 -->
		function postWrite() {
			window.location.href = "/recipick/post-write";
		}
		
	</script>
</body>

</html>