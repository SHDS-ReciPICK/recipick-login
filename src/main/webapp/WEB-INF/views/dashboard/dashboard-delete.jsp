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
<title>레시피 삭제하기</title>
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
				alert('정상적으로 레시피가 삭제되었습니다')
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


	<div class="main-wrapper">
		<nav class="navbar-vertical-nav d-none d-xl-block">
			<div class="navbar-vertical">
				<div class="px-4 py-5">
					<!--                   <a href="../recipick/signin.do" class="navbar-brand"> -->
					<img
						src="${pageContext.request.contextPath}/images/logo/recipick-logo-orange.svg"
						alt="로고"> </a>
				</div>
				<div class="navbar-vertical-content flex-grow-1" data-simplebar="">
					<ul class="navbar-nav flex-column" id="sideNavbar">
						<li class="nav-item"><a class="nav-link "
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
						<li class="nav-item"><a class="nav-link active"
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
								<h2>레시피 삭제하기</h2>
								<!-- breacrumb -->
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb mb-0">
										<li class="breadcrumb-item"><a href="#"
											class="text-inherit">대시보드</a></li>
										<li class="breadcrumb-item active" aria-current="page">레시피삭제</li>
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
						<div class="card h-100 card-lg py-5">
							<div class="px-6 py-6">
								<div class="row justify-content-between">
									<div class="col-lg-4 col-md-6 col-12 mb-2 mb-md-0">
										<!-- form -->
										<form class="d-flex" role="search"
											action="/recipick/dashboard-delete" method="GET">
											<input class="form-control me-2" type="search" name="search"
												placeholder="레시피 검색" aria-label="Search" />
											<button class="btn btn-outline-secondary" type="submit">
												<i class="bi bi-search"></i>
											</button>
										</form>
									</div>
									<!-- select option -->
									<div class="col-xl-2 col-md-4 col-12">
										<select class="form-select">
											<option selected>최신순</option>
											<option value="Published">오래된순</option>
											<option value="Unpublished">가나다순</option>
										</select>
									</div>
								</div>
							</div>
							<!-- card body -->
							<div class="card-body p-0">
								<!-- table -->
								<div class="table-responsive">
									<table
										class="table table-centered table-hover mb-0 text-nowrap table-borderless table-with-checkbox">
										<thead class="bg-light">
											<tr>
												<th class="text-center">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" value=""
															id="checkAll" /> <label class="form-check-label"
															for="checkAll"></label>
													</div>
												</th>
												<th class="text-center">아이콘</th>
												<th class="text-center">레시피명</th>
												<th class="text-center">레시피설명</th>
												<th class="text-center">삭제</th>
											</tr>
										</thead>
										<tbody class="text-center">
											<c:forEach var="recipe" items="${recipes}">
												<tr id="recipeRow_${recipe.recipe_id}">
													<td>
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value=""
																id="recipe-${recipe.recipe_id}" /> <label
																class="form-check-label"
																for="recipe-${recipe.recipe_id}"></label>
														</div>
													</td>
													<td><a href="#!"><img src="${recipe.main_image}"
															alt="" class="icon-shape icon-sm" /></a></td>
													<td><a href="#" class="text-reset">${recipe.title}</a></td>
													<td>
														<div class="input-group">
															<span class="input-group-text">${recipe.description}</span>
														</div>
													</td>
													<td>
														<button id="delete-recipe" class="btn btn-danger"
															data-recipe-id="${recipe.recipe_id}">삭제</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>




									</table>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<nav>
									<ul class="pagination mb-0">

										<li
											class="page-item <c:if test="${currentPage <= 1}">disabled</c:if>">
											<a class="page-link"
											href="/recipick/dashboard-delete?page=${currentPage - 1}&search=${param.search}">이전</a>
										</li>
										<c:set var="startPage"
											value="${(currentPage - 1) / 5 * 5 + 1}" />
										<c:set var="endPage" value="${startPage + 4}" />
										<c:if test="${endPage > totalPages}">
											<c:set var="endPage" value="${totalPages}" />
										</c:if>
										<c:forEach begin="${startPage}" end="${endPage}" var="i">
											<li
												class="page-item <c:if test="${currentPage == i}">active</c:if>">
												<a class="page-link"
												href="/recipick/dashboard-delete?page=${i}&search=${param.search}">${i}</a>
											</li>
										</c:forEach>
										<li
											class="page-item <c:if test="${currentPage >= totalPages}">disabled</c:if>">
											<a class="page-link"
											href="/recipick/dashboard-delete?page=${currentPage + 1}&search=${param.search}">다음</a>
										</li>

									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>


	<script>
	// DOM 요소 선택
	const decreaseButton = document.getElementById('decrease-snack');
	const increaseButton = document.getElementById('increase-snack');
	const quantitySpan = document.getElementById('snack-quantity');
  
	// 초기 수량 설정
	let quantity = 12;
	quantitySpan.textContent = quantity;
  
	// 감소 버튼 클릭 이벤트 핸들러
	decreaseButton.addEventListener('click', () => {
	  quantity--;
	  quantitySpan.textContent = quantity;
	});
  
	// 증가 버튼 클릭 이벤트 핸들러
	increaseButton.addEventListener('click', () => {
	  quantity++;
	  quantitySpan.textContent = quantity;
	});
  </script>



	<script>



document.addEventListener('DOMContentLoaded', function () {
    // descriptions 관련 코드는 이벤트 리스너 밖으로 이동
    const descriptions = document.querySelectorAll('.input-group-text');

    descriptions.forEach(description => {
        const fullText = description.textContent;
        const maxLength = 40;

        if (fullText.length > maxLength) {
            const truncatedText = fullText.substring(0, maxLength) + '...';
            description.textContent = truncatedText;
        }
    });
});
</script>

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
