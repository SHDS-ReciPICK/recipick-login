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
<title>관리자 홈</title>
<link
	href="${pageContext.request.contextPath}/libs/dropzone/dist/min/dropzone.min.css"
	rel="stylesheet" />
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon/recipick-favicon-orange.svg">


<!-- Libs CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
<script>
$(function() {
	$('.btn-danger').click(function() {
		let recipe_id = $(this).data('recipe-id');
		console.log(recipe_id);
		$.ajax({
			url : '/recipick/deleteRecipe?recipe_id='+recipe_id,
			method:'DELETE',
			success : function(data) {
				console.log('서버 응답:', data);
				$("#recipeRow_"+recipe_id).remove();
				alert('레시피가 삭제되었습니다')
			}
		})
	})
});
</script>

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
	<nav class="navbar navbar-expand-lg navbar-glass">
		<div class="container-fluid">
			<div class="d-flex justify-content-between align-items-center w-100">
				<div class="d-flex align-items-center">
					<a class="text-inherit d-block d-xl-none me-4"
						data-bs-toggle="offcanvas" href="#offcanvasExample" role="button"
						aria-controls="offcanvasExample"> <svg
							xmlns="http://www.w3.org/2000/svg" width="32" height="32"
							fill="currentColor" class="bi bi-text-indent-right"
							viewBox="0 0 16 16">
                            <path
								d="M2 3.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm10.646 2.146a.5.5 0 0 1 .708.708L11.707 8l1.647 1.646a.5.5 0 0 1-.708.708l-2-2a.5.5 0 0 1 0-.708l2-2zM2 6.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
                        </svg>
					</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="main-wrapper">
		<nav class="navbar-vertical-nav d-none d-xl-block">
			<div class="navbar-vertical">
				<div class="px-4 py-5">
					<!--                     <a href="../index.html" class="navbar-brand"> -->
					<img
						src="${pageContext.request.contextPath}/images/logo/recipick-logo-orange.svg"
						alt="로고"> </a>
				</div>
				<div class="navbar-vertical-content flex-grow-1" data-simplebar="">
					<ul class="navbar-nav flex-column" id="sideNavbar">
						<li class="nav-item"><a class="nav-link active"
							href="../recipick/dashboard-home">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-house"></i></span>
									<span class="nav-link-text">관리자 대시보드</span>
								</div>
						</a></li>
						<li class="nav-item mt-6 mb-3"><span class="nav-label">관리자
								메뉴</span></li>
						<li class="nav-item"><a class="nav-link"
							href="../recipick/dashboard-recipe">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-cart"></i></span> <span
										class="nav-link-text">새 레시피 추가하기</span>
								</div>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../recipick/dashboard-ingredient">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-list-task"></i></span>
									<span class="nav-link-text">새 식재료 추가하기</span>
								</div>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../recipick/dashboard-delete">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-shop"></i></span> <span
										class="nav-link-text">레시피 삭제하기</span>
								</div>
						</a></li>
						<li class="nav-item"><a class="nav-link "
							href="../recipick/dashboard-inventory">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-star"></i></span> <span
										class="nav-link-text">식재료 재고관리</span>
								</div>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../recipick/signin.do"> <i
								class="feather-icon icon-log-out me-2"></i> Log out
						</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- main -->
		<main class="main-content-wrapper">
			<div class="container">
				<!-- row -->
				<div class="row mb-8">
					<div class="col-md-12">
						<div
							class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-4">
							<!-- pageheader -->
							<div>
								<h2>레시피관리</h2>
								<!-- breacrumb -->
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb mb-0">
										<li class="breadcrumb-item"><a href="#"
											class="text-inherit">대시보드</a></li>
										<li class="breadcrumb-item active" aria-current="page">관리자
											홈</li>
									</ol>
								</nav>
							</div>
							<!-- button -->

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-12 mb-5">
						<!-- card -->
						<div class="card h-100 card-lg">
							<div class="card-body py-3">
								<!-- table -->
								<div class="table-responsive">
									<h2>관리자 홈에 오신것을 환영합니다.</h2>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</main>
	</div>




	<!-- Libs JS -->
	<!-- <script src="${pageContext.request.contextPath}/libs/jquery/dist/jquery.min.js"></script> -->
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/dropzone/dist/min/dropzone.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/flatpickr/dist/flatpickr.min.js"></script>

	<!-- Theme JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/quill/dist/quill.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendors/editor.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendors/dropzone.js"></script>


</body>
<!-- 여기까지 전부 -->
</html>
