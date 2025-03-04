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
<title>식재료 추가하기</title>
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
<script
	src="${pageContext.request.contextPath}/libs/jquery/dist/jquery.min.js"></script>


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
$(document).ready(function() {
	  // 대분류 카테고리 변경 시 중분류 옵션 변경
	  $('#mainCategory').change(function() {
	    var mainCategory = $(this).val();
	    var midCategoryOptions = getMidCategoryOptions(mainCategory);

	    $('#midCategory').empty().append('<option value="">중분류</option>');
	    $.each(midCategoryOptions, function(index, value) {
	      $('#midCategory').append('<option value="' + index + '">' + value + '</option>');
	    });

	    $('#subCategory').empty().append('<option value="">소분류</option>');
	  });

	  // 중분류 카테고리 변경 시 소분류 옵션 변경
	  $('#midCategory').change(function() {
	    var mainCategory = $('#mainCategory').val();
	    var midCategory = $(this).val();
	    var subCategoryOptions = getSubCategoryOptions(mainCategory, midCategory);

	    $('#subCategory').empty().append('<option value="">소분류</option>');
	    $.each(subCategoryOptions, function(index, value) {
	      $('#subCategory').append('<option value="' + index + '">' + value + '</option>');
	    });
	  });

	  // 대분류에 따른 중분류 옵션 반환
	  function getMidCategoryOptions(mainCategory) {
	    switch (mainCategory) {
	      case '신선식품류':
	        return {
	          '채소•과일•견과류': '채소•과일•견과류',
	          '수산•해산•건어물': '수산•해산•건어물',
	          '정육•가공육•계란': '정육•가공육•계란',
	        };
	      case '가공식품류':
	        return {
	          '면•양념•오일': '면•양념•오일'
	        };
	      case '음료류':
	        return {
	          '생수•음료류': '생수•음료류',
	          '커피•차': '커피•차',
	        };
	      case '유가공품':
	        return {
	          '유제품': '유제품'
	        };
	      default:
	        return {};
	    }
	  }

	  // 대분류, 중분류에 따른 소분류 옵션 반환
	  function getSubCategoryOptions(mainCategory, midCategory) {
	    switch (mainCategory) {
	      case '신선식품류':
	        switch (midCategory) {
	          case '채소•과일•견과류':
	            return {
	              '채소류': '채소류',
	              '과일류': '과일류',
	              '견과류': '견과류'
	            };
	          case '수산•해산•건어물':
	            return {
	              '생선류': '생선류',
	              '해산물': '해산물',
	              '가공품': '가공품'
	            };
	          case '정육•가공육•계란':
	            return {
	              '정육': '정육',
	              '가공육': '가공육',
	              '계란육': '계란육'
	            };
	          default:
	            return {};
	        }
	      case '가공식품류':
	        switch (midCategory) {
	          case '면•양념•오일':
	            return {
	              '면류': '면류',
	              '소스•양념': '소스•양념',
	              '가공식품': '가공식품'
	            };
	          default:
	            return {};
	        }
	      case '음료류':
	        switch (midCategory) {
	          case '생수•음료류':
	            return {
	              '생수류': '생수류',
	              '음료': '음료'
	            };
	          case '커피•차':
	            return {
	              '커피': '커피',
	              '차류': '차류',
	              '용품': '용품'
	            };

	          default:
	            return {};
	        }
	      case '유가공품':
	        switch (midCategory) {
	          case '유제품':
	            return {
	              '우유류': '우유류',
	              '치즈•버터': '치즈•버터',
	              '냉장•냉동': '냉장•냉동'
	            };

	          default:
	            return {};
	        }
	      default:
	        return {};
	    }
	  }
	});
</script>

</head>

<body>
	<!-- main wrapper -->

	<!-- navbar -->
<body>


	<div class="main-wrapper">
		<nav class="navbar-vertical-nav d-none d-xl-block">
			<div class="navbar-vertical">
				<div class="px-4 py-5">
					<!--                     <a href="../recipick/signin.do" class="navbar-brand"> -->
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
						<li class="nav-item"><a class="nav-link active"
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

		<main class="main-content-wrapper">
			<section class="container">
				<div class="row mb-8">
					<div class="col-md-12">
						<div
							class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-4">
							<!-- pageheader -->
							<div>
								<h2>새 식재료 추가하기</h2>
								<!-- breacrumb -->
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb mb-0">
										<li class="breadcrumb-item"><a href="#"
											class="text-inherit">대시보드</a></li>
										<li class="breadcrumb-item active" aria-current="page">식재료추가</li>
									</ol>
								</nav>
							</div>
							<!-- button -->

						</div>
					</div>
				</div>
			</section>
			<section class="container">
				<div class="card mb-6 shadow border-0">
					<div class="card-body p-6">
						<div class="row">
							<div class="col-md-8">
								<h4 class="mb-4">식재료 필수 정보</h4>
								<div class="row mb-4">
									<div class="col-md-6">
										<label for="ingredientCode" class="form-label">식재료 코드</label>
										<input type="text" id="ingredientCode" class="form-control"
											placeholder="코드">
									</div>
									<div class="col-md-6">
										<label for="ingredientName" class="form-label">식재료 명</label> <input
											type="text" id="ingredientName" class="form-control"
											placeholder="식재료">
									</div>
								</div>
								<div class="row mb-4">
									<div class="col-md-6">
										<label for="averageWeight" class="form-label">평균중량</label>
										<div class="input-group">
											<input type="text" id="averageWeight" class="form-control"
												placeholder="평균중량"> <span class="input-group-text">그램(g)</span>
										</div>
									</div>
									<div class="col-md-6">
										<label for="discountRate" class="form-label">할인율</label>
										<div class="input-group">
											<input type="text" id="discountRate" class="form-control"
												placeholder="할인율"> <span class="input-group-text">퍼센트(%)</span>
										</div>
									</div>
								</div>
								<div class="row mb-4">
									<div class="col-md-6">
										<label for="minSellingUnit" class="form-label">최소판매단위</label>
										<div class="input-group">
											<input type="text" id="minSellingUnit" class="form-control"
												placeholder="최소판매단위"> <span class="input-group-text">그램(g)</span>
										</div>
									</div>
									<div class="col-md-6">
										<label for="origin" class="form-label">원산지</label> <input
											type="text" id="origin" class="form-control"
											placeholder="원산지">
									</div>
								</div>
								<div class="row mb-4">
									<div class="col-md-6">
										<label for="unitPrice" class="form-label">단가</label>
										<div class="input-group">
											<input type="text" id="unitPrice" class="form-control"
												placeholder="단가"> <span class="input-group-text">원</span>
										</div>
									</div>
								</div>

								<label for="ingredientCategory" class="form-label">카테고리</label>
								<div class="row mb-4">
									<div class="row row-cols-md-3 mb-4">
										<div class="col">
											<select class="form-select" id="mainCategory">
												<option value="">대분류</option>
												<option value="신선식품류">신선식품류</option>
												<option value="가공식품류">가공식품류</option>
												<option value="음료류">음료류</option>
												<option value="유가공품">유가공품</option>
											</select>
										</div>
										<div class="col">
											<select class="form-select" id="midCategory">
												<option value="">중분류</option>
											</select>
										</div>
										<div class="col">
											<select class="form-select" id="subCategory">
												<option value="">소분류</option>
											</select>
										</div>
									</div>
								</div>

								<h4 class="mb-4">식재료 선택 정보</h4>
								<div class="row mb-4">
									<div class="col-md-6">
										<label for="stockQuantity" class="form-label">재고수량</label>
										<div class="input-group">
											<input type="text" id="stockQuantity" class="form-control"
												placeholder="9999g"> <span class="input-group-text">그램(g)</span>
										</div>
									</div>
									<div class="col-md-6">
										<label for="season" class="form-label">제철</label> <select
											id="season" class="form-select">
											<option selected>사계절</option>
											<option value="봄">봄</option>
											<option value="여름">여름</option>
											<option value="가을">가을</option>
											<option value="겨울">겨울</option>
										</select>
									</div>
								</div>



							</div>

							<div class="col-md-4">
								<h4 class="mb-4">대표 이미지</h4>
								<div id="mainImg"
									class="d-flex align-items-center justify-content-center"
									style="flex-grow: 1; aspect-ratio: 1/1; background-color: #dfe2e1; cursor: pointer;">
									<div class="d-flex"
										style="flex-direction: column; align-items: center;">
										<i class="feather-icon icon-image"
											style="font-size: 60px; color: #ffffff;"></i>
										<p class="mt-2 mb-0" style="color: #ffffff;">대표 사진을
											등록해주세요.</p>
									</div>
									<!-- 파일 입력 (숨김) -->
									<input type="file" id="mainFileInput" accept="image/*"
										style="display: none;">
								</div>
							</div>
						</div>
						<h4 class="mb-4">식재료 소개</h4>
						<textarea id="ingredientDescription" class="form-control mb-4"
							rows="6" placeholder="예) 맛있는 호박고구마."></textarea>

						<div class="mt-5 d-flex justify-content-center gap-3">
							<button id="registrationButton"
								class="btn btn-primary px-9 py-2 fs-5" type="button">등록</button>
							<button class="btn btn-outline-gray-400 px-9 py-2 fs-5"
								type="button">취소</button>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>

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
		src="${pageContext.request.contextPath}/libs/quill/dist/quill.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendors/editor.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/dropzone/dist/min/dropzone.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/dropzone/dist/min/dropzone.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/vendors/dropzone.js"></script>

	<script>
// 대표 사진 등록
   const mainImg = document.querySelector('#mainImg');
   const mainFileInput = document.querySelector('#mainFileInput'); // 파일 입력

   mainImg.addEventListener("click", function () {
       mainFileInput.click();
   });

   mainFileInput.addEventListener("change", function () {
       const file = mainFileInput.files[0];
       if (file) {
           const reader = new FileReader();

           reader.onload = function (event) {
               const uploadedImg = new Image();
               uploadedImg.src = event.target.result;
               uploadedImg.style.width = "100%"; // 이미지 크기를 부모 div에 맞게 조정
               uploadedImg.style.height = "100%";
               uploadedImg.style.objectFit = "cover";
               uploadedImg.style.border = '2px solid #dfe2e1';

               // #img 내 기존 내용을 지우고 이미지로 변경
               mainImg.innerHTML = ''; // 기존 내용을 지우기
               mainImg.appendChild(uploadedImg); // 이미지 추가
           };

           reader.readAsDataURL(file);
       }
   });
   
   mainFileInput.addEventListener("change", function () {
	    const file = mainFileInput.files[0];
	    if (file) {
	        const reader = new FileReader();

	        reader.onload = function (event) {
	            // ... (이미지 미리보기 코드) ...
	            image = event.target.result; // Base64 문자열 저장
	        };

	        reader.readAsDataURL(file);
	    }
	});
   $(document).ready(function() {
	    $("#registrationButton").click(function() {
	        var ingredientCode = $("#ingredientCode").val();
	        var ingredientName = $("#ingredientName").val();
	        var averageWeight = $("#averageWeight").val();
	        var discountRate = $("#discountRate").val();
	        var minSellingUnit = $("#minSellingUnit").val();
	        var origin = $("#origin").val();
	        var unitPrice = $("#unitPrice").val();
	        var stockQuantity = $("#stockQuantity").val();
	        var season = $("#season").val();
	        var ingredientDescription = $("#ingredientDescription").val();
	        var ing_main = $("#mainCategory").val();
	        var ing_sub = $("#midCategory").val();
	        var ing_detail = $("#subCategory").val();

	        $.ajax({
	            url: "/recipick/dashboard/ingredient",
	            type: "POST",
	            contentType: 'application/json', // Content-Type 헤더 설정
	            data: JSON.stringify({ 
	                code: ingredientCode,
	                name: ingredientName,
	                avg_gram: averageWeight,
	                discount: discountRate,
	                unit: minSellingUnit,
	                origin: origin,
	                price: unitPrice,
	                stock: stockQuantity,
	                season: season,
	                detail: ingredientDescription,
	                image : image,
	                ing_main: ing_main,
	                ing_sub: ing_sub,
	                ing_detail: ing_detail
	                
	            }), // 데이터를 JSON 문자열로 변환
	            success: function(response) {
	                // 성공적으로 저장되면 페이지를 새로 고침합니다.
	                alert('정상적으로 데이터베이스(DB)에 식재료가 등록되었습니다.');
	                location.reload();
	            },
	            error: function(xhr, status, error) {
	                // 오류 발생 시 처리
	                console.error(error);
	            }
	        });
	    });
	});
	</script>



</body>
<!-- 여기까지 전부 -->
</html>
