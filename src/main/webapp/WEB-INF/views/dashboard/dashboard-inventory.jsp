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
<title>재고관리</title>
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


<script>
$(function() {
	  // 각 행의 변경된 수량을 저장할 객체
	  var updatedQuantities = {};

	  // 증감 버튼 이벤트 리스너
	  $('.input-group button').click(function() {
	    var $quantitySpan = $(this).siblings('.input-group-text');
	    var ing_id = $quantitySpan.data('ing-id');
	    var quantity = parseInt($quantitySpan.text());

	    if ($(this).text() === '-') {
	      if (quantity > 0) {
	        quantity--;
	      }
	    } else {
	      quantity++;
	    }

	    $quantitySpan.text(quantity);

	    // 변경된 수량을 객체에 저장
	    updatedQuantities[ing_id] = quantity;
	  });

	  // 확인 버튼 이벤트 리스너
	  $('.update-btn').click(function() {
	    var ing_id = $(this).data('ing-id');
	    var quantity = updatedQuantities[ing_id];

	    // AJAX 요청
	    $.ajax({
	      url: '/recipick/dashboard/updateStock',
	      method: 'POST',
	      contentType: 'application/json',
	      data: JSON.stringify({
	        ing_id: ing_id,
	        stock: quantity
	      }),
	      success: function(data) {
	        console.log('서버 응답:', data);
	        alert('정상적으로 재고수량이 변경되었습니다.');
	        // 업데이트 성공 후, 변경된 수량 객체에서 해당 항목 제거
	        delete updatedQuantities[ing_id];
	      }
	    });
	  });
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
	<!-- main wrapper -->
	<!-- navbar -->

	<div class="main-wrapper">
		<!-- navbar vertical -->
		<!-- navbar -->


		<nav class="navbar-vertical-nav d-none d-xl-block">
			<div class="navbar-vertical">
				<div class="px-4 py-5">
					<!-- 						<a href="../index.html" class="navbar-brand"> -->
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
						<li class="nav-item"><a class="nav-link"
							href="../recipick/dashboard-delete">
								<div class="d-flex align-items-center">
									<span class="nav-link-icon"><i class="bi bi-shop"></i></span> <span
										class="nav-link-text">레시피 삭제하기</span>
								</div>
						</a></li>
						<li class="nav-item"><a class="nav-link active"
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
		<!-- 여기서부터 시작 -->
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
								<h2>식재료 재고관리</h2>
								<!-- breacrumb -->
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb mb-0">
										<li class="breadcrumb-item"><a href="#"
											class="text-inherit">대시보드</a></li>
										<li class="breadcrumb-item active" aria-current="page">재고관리</li>
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
											action="/recipick/dashboard-inventory" method="GET">
											<input class="form-control me-2" type="search" name="search"
												placeholder="식재료 검색" aria-label="Search" />
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
												<th class="text-center">식재료명</th>
												<th class="text-center">재고수량</th>
												<th class="text-center">확인</th>
											</tr>
										</thead>

										<tbody class="text-center">
											<c:forEach var="ingredient" items="${ingredients}">
												<tr>
													<td>
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value=""
																id="categoryOne" /> <label class="form-check-label"
																for="categoryOne"></label>
														</div>
													</td>
													<td><a href="#!"><img src="${ingredient.image}"
															alt="" class="icon-shape icon-sm" /></a></td>
													<td><a href="#" class="text-reset">${ingredient.name}</a></td>

													<td>
														<div class="input-group d-flex justify-content-center">
															<button class="btn btn-outline-secondary" type="button">-</button>
															<span class="input-group-text"
																id="quantity-${ingredient.name}"
																data-ing-id="${ingredient.ing_id}">${ingredient.stock}</span>
															<button class="btn btn-outline-secondary" type="button">+</button>
														</div>
													</td>
													<td>
														<button
															class="btn btn-light-primary text-dark-primary update-btn"
															data-ing-id="${ingredient.ing_id}">확인</button>
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
											href="/recipick/dashboard-inventory?page=${currentPage - 1}&search=${param.search}">이전</a>
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
												href="/recipick/dashboard-inventory?page=${i}&search=${param.search}">${i}</a>
											</li>
										</c:forEach>
										<li
											class="page-item <c:if test="${currentPage >= totalPages}">disabled</c:if>">
											<a class="page-link"
											href="/recipick/dashboard-inventory?page=${currentPage + 1}&search=${param.search}">다음</a>
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

	<!-- Libs JS -->
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>




	<!-- 여기까지 끝 -->
</body>
</html>
