<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- 헤더 컴포넌트 -->

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<title>레시피 추가하기</title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon/recipick-favicon-orange.svg">

<!-- Libs CSS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

<style>
/* 태그 스타일 */
.badge-custom {
	background-color: #FF8A3D;
	/* 배경색 */
	color: #ffffff;
	/* 텍스트 색 */
	padding: 4px 8px;
	/* 텍스트에 맞춰 패딩 설정 */
	border-radius: 12px;
	display: inline-flex;
	align-items: center;
	font-size: 14px;
	margin-right: 8px;
	/* 태그와 다른 태그 사이 간격 */
	margin-bottom: 8px;
	/* 태그와 아래 요소 사이 간격 */
	white-space: nowrap;
	/* 텍스트가 한 줄로 표시되게 설정 */
}

/* 닫기 버튼 스타일 */
.btn-close {
	background: transparent;
	border: none;
	color: #ffffff;
	font-size: 14px;
	margin-left: 6px;
	/* 버튼과 텍스트 사이 간격 */
	cursor: pointer;
}

/* 닫기 버튼 호버 시 효과 */
.btn-close:hover {
	color: #ff0000;
	/* 빨간색으로 변경 */
	transition: all 0.3s ease;
}

/* 태그와 닫기 버튼을 가로로 정렬 */
.badge-custom {
	display: inline-flex;
	align-items: center;
	justify-content: flex-start;
	/* 버튼을 텍스트 끝에 정렬 */
}

#deleteStep:hover, #deleteIngredient:hover {
	color: #ff0000 !important;
	transition: all 0.3s ease;
}
</style>



<script>
$(document).ready(function() {
	  // 대분류 카테고리 변경 시 중분류 옵션 변경 (중분류가 모두 동일하여 주석처리함)
/* 	  $('#mainCategory').change(function() {
	    var mainCategory = $(this).val();
	    var midCategoryOptions = getMidCategoryOptions(mainCategory);

	    $('#midCategory').empty().append('<option value="">중분류</option>');
	    $.each(midCategoryOptions, function(index, value) {
	      $('#midCategory').append('<option value="' + index + '">' + value + '</option>');
	    });

	    $('#subCategory').empty().append('<option value="">소분류</option>');
	  }); */

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

	  // 대분류에 따른 중분류 옵션 반환 (중분류가 모두 동일하여 주석처리함)
/* 	  function getMidCategoryOptions(mainCategory) {
	    switch (mainCategory) {
	      case '한식':
	        return {
	          '일상식': '일상식',
	          '특별식': '특별식',
	          '건강식': '건강식',
	        };
	      case '중식':
	        return {
	          '일상식': '일상식',
	          '특별식': '특별식',
	          '건강식': '건강식',
	        };
	      case '일식':
	        return {
	          '일상식': '일상식',
	          '특별식': '특별식',
	          '건강식': '건강식',
	        };
	      case '양식':
	        return {
	          '일상식': '일상식',
	          '특별식': '특별식',
	          '건강식': '건강식',
	        };
	      default:
	        return {};
	    }
	  } */

	  // 대분류, 중분류에 따른 소분류 옵션 반환
	  function getSubCategoryOptions(mainCategory, midCategory) {
	    switch (mainCategory) {
	      case '한식':
	        switch (midCategory) {
	          case '일상식':
	            return {
	              '밥류•죽류': '밥류•죽류',
	              '찌개•국물류': '찌개•국물류',
	              '구이•볶음류': '구이•볶음류'
	            };
	          case '특별식':
	            return {
	              '명절요리': '명절요리',
	              '제사•차례상': '제사•차례상',
	              '잔치음식': '잔치음식'
	            };
	          case '건강식':
	            return {
	              '나물류': '나물류',
	              '찜•구이류': '찜•구이류',
	              '약선요리': '약선요리'
	            };
	          default:
	            return {};
	        }
	      case '일식':
	        switch (midCategory) {
	          case '일상식':
	            return {
	              '덮밥류': '덮밥류',
	              '면류': '면류',
	              '구이류': '구이류'
	            };
	          case '특별식':
	            return {
	              '스시•롤': '스시•롤',
	              '전통요리': '전통요리',
	              '이자카야요리': '이자카야요리'
	            };
	          case '건강식':
	            return {
	              '찜류': '찜류',
	              '국물류': '국물류',
	              '채소요리': '채소요리'
	            };
	          default:
	            return {};
	        }
	      case '중식':
	        switch (midCategory) {
	          case '일상식':
	            return {
	              '면•밥류': '면•밥류',
	              '볶음류': '볶음류',
	              '딤섬류': '딤섬류'
	            };
	          case '특별식':
	            return {
	              '고급요리': '고급요리',
	              '코스요리': '코스요리',
	              '연회요리': '연회요리'
	            };
	          case '건강식':
	            return {
	              '찜•탕류': '찜•탕류',
	              '채소요리': '채소요리',
	              '약선요리': '약선요리'
	            };
	          default:
	            return {};
	        }
	      case '양식':
	        switch (midCategory) {
	          case '일상식':
	            return {
	              '파스타류': '파스타류',
	              '샌드위치•버거류': '샌드위치•버거류',
	              '오믈렛•에그류': '오믈렛•에그류'
	            };
	          case '특별식':
	            return {
	              '스테이크류': '스테이크류',
	              '해산물요리': '해산물요리',
	              '코스요리': '코스요리'
	            };
	          case '건강식':
	            return {
	              '샐러드류': '샐러드류',
	              '구운요리류': '구운요리류',
	              '수프류': '수프류'
	            };
	          default:
	        return {};
	    }
	  }
  }
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
					<!-- <a href="../recipick/signin.do" class="navbar-brand"> -->
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
						<li class="nav-item"><a class="nav-link active"
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
						<li class="nav-item"><a class="nav-link "
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
								<h2>새 레시피 추가하기</h2>
								<!-- breacrumb -->
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb mb-0">
										<li class="breadcrumb-item"><a href="#"
											class="text-inherit">대시보드</a></li>
										<li class="breadcrumb-item active" aria-current="page">레시피추가</li>
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
						<div class="my-6 mx-4 d-flex flex-row align-items-center">
							<div style="float: left; padding-right: 20px;" class="col-9">
								<!-- 레시피 제목 -->
								<div class="d-flex align-items-center">
									<h4 class="mb-0 me-8"
										style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">레시피
										제목</h4>
									<input type="text" id="title" class="form-control"
										style="height: 48px;" placeholder="예) 소고기 미역국 끓이기">
								</div>

								<!-- 레시피 소개 -->
								<div class="d-flex mt-6 align-items-top">
									<h4 class="mb-0 me-8"
										style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">레시피
										소개</h4>
									<textarea class="form-control" rows="4" id="description"
										placeholder="예) 어머니로부터 전수받은 특별한 미역국 레시피입니다."></textarea>
								</div>


								<div class="d-flex mt-6 align-items-center">
									<h4 class="mb-0 me-8"
										style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">
										조리시간</h4>
									<div class="input-group" style="width: 200px;">
										<input type="text" id="cooking_time" class="form-control"
											style="height: 48px;" placeholder="조리시간"> <span
											class="input-group-text">분(minute)</span>
									</div>

									<h4 class="mb-0 me-8 ms-8"
										style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">
										요리분량</h4>
									<div class="input-group" style="width: 200px;">
										<input type="text" id="serving_count" class="form-control"
											style="height: 48px;" placeholder="인원수"> <span
											class="input-group-text">인분</span>
									</div>
								</div>

								<!-- 카테고리 -->
								<div class="d-flex mt-6 align-items-center">
									<h4 class="mb-0 me-8"
										style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">카테고리
									</h4>
									<div class="d-flex" style="gap: 20px;">
										<div class="col" style="width: 150px;">
											<select class="form-select" id="mainCategory"
												style="height: 48px;">
												<option value="">대분류</option>
												<option value="한식">한식</option>
												<option value="중식">중식</option>
												<option value="일식">일식</option>
												<option value="양식">양식</option>
											</select>
										</div>
										<div class="col" style="width: 150px;">
											<select class="form-select" id="midCategory"
												style="height: 48px;">
												<option value="">중분류</option>
												<option value="일상식">일상식</option>
												<option value="특별식">특별식</option>
												<option value="건강식">건강식</option>
											</select>
										</div>
										<div class="col" style="width: 150px;">
											<select class="form-select" id="subCategory"
												style="height: 48px;">
												<option value="">소분류</option>
											</select>
										</div>
									</div>
								</div>
							</div>

							<div class="col-3">
								<!-- 대표 사진 -->
								<div id="mainImg"
									class="d-flex align-items-center justify-content-center"
									style="width: 100%; aspect-ratio: 1/1; background-color: #dfe2e1; cursor: pointer;">
									<div class="d-flex"
										style="flex-direction: column; align-items: center;">
										<i class="feather-icon icon-image"
											style="font-size: 48px; color: #ffffff;"></i>
										<p class="mt-2 mb-0" style="color: #ffffff;">대표 사진을
											등록해주세요.</p>
									</div>
									<!-- 파일 입력 (숨김) -->
									<input type="file" id="mainFileInput" accept="image/*"
										style="display: none;">
								</div>
							</div>
						</div>

						<div>
							<hr class="mt-8" />
						</div>

						<div class="mx-4 mt-4">
							<h4 class="mb-4 me-8"
								style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">
								재료 정보</h4>

							<div
								style="border: 0.8px solid #dfe2e1; border-radius: 8px; padding: 36px 16px 36px 16px;"
								class="form-control">
								<!-- 항목 제목 -->
								<div id="ingredientTitle" class="mx-8 d-none">
									<div class="d-flex flex-row me-3 gap-3">

										<h5 class="mb-0"
											style="white-space: nowrap; line-height: 48px; width: 312px;">재료코드</h5>

										<h5 class="mb-0"
											style="white-space: nowrap; line-height: 48px; width: 263px;">재료명</h5>

										<div class="d-flex align-items-center" style="width: 263px;">
											<h5 class="mb-0"
												style="white-space: nowrap; line-height: 48px;">최소 단위</h5>
											<p class="text-muted my-0 ms-3">
												<small>단위는 그램(g)입니다.</small>
											</p>
										</div>

									</div>

									<div style="width: 124px;"></div>
								</div>

								<!-- 추가된 재료가 들어가는 공간 -->
								<div id="ingredientList" class="mx-8"></div>
								<!-- 추가된 재료가 들어가는 공간 -->
								<div class="d-flex justify-content-center">
									<button id="addIngredientBtn" class="btn btn-primary px-5 mt-3"
										type="button" style="height: 42px;">
										<!-- 버튼 -->
										<i class="feather-icon icon-plus me-2"></i>
										<!-- 아이콘 -->
										재료 추가
									</button>
								</div>
							</div>
						</div>

						<div>
							<hr class="mt-8" />
						</div>
						<div class="mx-4 mt-4">
							<h4 class="mb-4 me-8"
								style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">
								요리 순서</h4>
							<div
								style="border: 0.8px solid #dfe2e1; border-radius: 8px; padding: 36px 16px 36px 16px;"
								class="form-control">

								<!-- 추가된 요리과정이 들어가는 공간 -->
								<div id="stepList"></div>
								<!-- 추가된 요리과정이 들어가는 공간 -->
								<div class="d-flex justify-content-center">
									<button id="addStepBtn" class="btn btn-primary px-5 mt-3"
										type="button" style="height: 42px;">
										<!-- 버튼 -->
										<i class="feather-icon icon-plus me-2"></i>
										<!-- 아이콘 -->
										단계 추가
									</button>
								</div>
							</div>
						</div>



						<div>
							<hr class="mt-8" />
						</div>
						<div class="mx-4 mt-4">
							<div class="d-flex align-items-top">
								<h4 class="mb-0 me-8"
									style="white-space: nowrap; line-height: 48px; width: 100px; flex-shrink: 0;">태그</h4>
								<div class="d-flex"
									style="flex-direction: column; flex-grow: 1;">
									<input id="tag-input" type="search" class="form-control"
										style="height: 48px;" placeholder="예) #미역국 #생일 #특별한날">
									<div id="tags-list" class="mt-3 mb-3">
										<!-- 태그 목록 -->
									</div>
								</div>
							</div>
						</div>

						<div class="d-flex justify-content-center mt-9" style="gap: 32px;">
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

	<!-- Footer -->
	<!-- 푸터 컴포넌트 -->

	<!-- Javascript-->
	<!-- Libs JS -->
	<script
		src="${pageContext.request.contextPath}/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script src="${pageContext.request.contextPath}/js/theme.min.js"></script>

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
					uploadedImg.style.width = "100%";  // 이미지 크기를 부모 div에 맞게 조정
					uploadedImg.style.height = "100%";
					uploadedImg.style.objectFit = "cover";
					uploadedImg.style.border = '2px solid #dfe2e1';

					// #img 내 기존 내용을 지우고 이미지로 변경
					mainImg.innerHTML = '';  // 기존 내용을 지우기
					mainImg.appendChild(uploadedImg);  // 이미지 추가
				};

				reader.readAsDataURL(file);
			}
		});
		</script>



	<script>
		//////////////////////////////////
		// 모달의 버튼 클릭 시 이벤트 핸들러 추가
		document.addEventListener('click', function (event) {
		  if (event.target.classList.contains('update-btn')) {
		    const button = event.target;
		    const ingredientName = button.closest('tr').querySelector('td:nth-child(2) a').textContent;
		    const ingredientUnit = button.closest('tr').querySelector('td:nth-child(3) a').textContent;
		    const ingredientId = button.closest('tr').querySelector('td:first-child a').textContent;
		    // 선택한 재료명과 단위 값을 설정합니다.
		    document.querySelector('#ingredient-id-' + ingredientCounter).value = ingredientId;
		    document.querySelector('#ingredient-name-' + ingredientCounter).value = ingredientName;
		    document.querySelector('#ingredient-unit-' + ingredientCounter).value = ingredientUnit;

		  }
		});

				
		// 재료 추가 시 목록 추가
		const addIngredientBtn = document.querySelector('#addIngredientBtn'); // 재료 추가 버튼 
		const ingredientList = document.querySelector('#ingredientList'); // 기존 재료 정보 목록
		const ingredientTitle = document.querySelector('#ingredientTitle');
		const inputField = document.getElementById(`ingredient-name-${ingredientCounter}`); 

		
		let isTitleAdded = false;

		let ingredientCounter = 0; // 카운터 변수 초기화
		addIngredientBtn.addEventListener("click", function () {
		    ingredientCounter++; // 카운터 증가
		    console.log(ingredientCounter); 

			const newIngredientDiv = document.createElement("div");
			newIngredientDiv.classList.add('d-flex');
			newIngredientDiv.style.flexDirection = 'row';
			newIngredientDiv.style.justifyContent = 'space-between';

			newIngredientDiv.innerHTML = `
			
			<div class="d-flex flex-row align-items-center flex-grow-1 gap-3 me-3 mb-3">
			
				<div class="flex-grow-1">
					<div class="input-group">
						<input type="text" id="ingredient-id-\${ingredientCounter}" style="height: 48px;" class="form-control" style="height: 48px;" placeholder="검색창에서 선택해주세요." disabled>
			            <button type="button" class="btn bg-white border" type="button" data-bs-toggle="modal" data-bs-target="#myModal">
		                	<i class="feather-icon icon-search" style="font-size: 16px;"></i>
		           	    </button>
		           	</div>
	           	</div>
	            
	            <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" >
	            	<div class="modal-dialog">
	              		<div class="modal-content">
	              
	                		<div class="modal-header">
	                  			<h5 class="modal-title" id="myModalLabel">식재료목록</h5>
	                  			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                		</div>
	                
			                <div class="modal-body" style="max-height: 400px; overflow-y: auto;">
			                  <table class="table">
			                    <thead class="bg-light">
			                      <tr>
			                        <th class="text-center">코드</th>
			                        <th class="text-center">식재료명</th>
			                        <th class="text-center">최소판매단위</th>
			                        <th class="text-center">확인</th>
			                      </tr>
			                    </thead>
			                    <tbody id="recipeTableBody">
			                      <c:forEach var="recipe" items="${recipes}">
			                        <tr>
			                          <td class="text-center"><a>${recipe.ing_id}</a></td>
			                          <td class="text-center"><a>${recipe.name}</a></td>
			                          <td class="text-center"><a>${recipe.unit}</a></td>
			                          
			                          <td class="text-center">
			                            <button class="btn btn-light-primary text-dark-primary update-btn" data-ing-id="${recipe.ing_id}" data-bs-dismiss="modal">확인</button>
			                          </td>
			                        </tr>
			                      </c:forEach>
			                    </tbody>
			                  </table>
			                </div>
	                
			                <div class="modal-footer">
			                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			                </div>
	                
	              		</div>
	            	</div>
	          	</div>
		         
	          	<div class="flex-grow-1">
					<input type="text" id="ingredient-name-\${ingredientCounter}" class="form-control rounded" style="height: 48px;" placeholder="검색창에서 선택해주세요." disabled>
				</div>
					
				<div class="flex-grow-1">
					<input type="text" id="ingredient-unit-\${ingredientCounter}" class="form-control flex-grow-1 rounded" style="height: 48px;" placeholder="검색창에서 선택해주세요." disabled>
				</div>
			</div>
	
			<div class="d-flex flex-row align-items-center mb-3"> 
				<!-- 수량 조절 -->
				<div style="height: 48px;" class="d-flex align-items-center">
					<div class="input-group input-spinner d-flex flex-row ">
						<input type="button" value="-" class="button-minus btn btn-sm"
							data-field="quantity" />
						<input type="number" step="1" max="10" value="1" name="quantity"
							class="quantity-field form-control-sm form-input" />
						<input type="button" value="+" class="button-plus btn btn-sm"
							data-field="quantity" />
					</div>
		
				<div class="d-flex align-items-center">
					<i id="deleteIngredient" class="feather-icon icon-x ms-3" style="cursor: pointer; font-size: 24px; color: #dfe2e1;"></i>
				</div>
			</div>
			
			`;
		
			ingredientList.appendChild(newIngredientDiv);
		
			newIngredientDiv.querySelector('#deleteIngredient').addEventListener('click', function (e) {
				e.preventDefault(); // 기본 동작 방지
				ingredientList.removeChild(newIngredientDiv);
		
				// 재료 삭제 후 항목 제목 상태 업데이트
				if (ingredientList.children.length === 0) {
					ingredientTitle.classList.add('d-none'); // 항목 제목 숨기기
					isTitleAdded = false;
				}
			});
		
			// 재료 추가 후 항목 제목 상태 업데이트
			if (!isTitleAdded) {
				ingredientList.insertAdjacentElement('beforebegin', ingredientTitle); // #ingredientList 바로 앞에 #ingredientTitle 를 삽입
				ingredientTitle.classList.remove('d-none');
				isTitleAdded = true;
			}
			
		});
		</script>



	<script>
		////////////////////////////////////////////////////////////////

		// 단계 추가 시 목록 추가
		const addStepBtn = document.querySelector('#addStepBtn');
		const stepList = document.querySelector('#stepList');
		
		addStepBtn.addEventListener("click", function () {
		  const newStepDiv = document.createElement("div");
		  const stepCount = stepList.children.length + 1;
		
		  // 단계별 고유 ID 생성
		  const stepImgId = `stepImg_${stepCount}`;
		  const stepFileInputId = `stepFileInput_${stepCount}`;
		
		  // 템플릿 리터럴을 사용하여 동적으로 HTML 생성
		  newStepDiv.innerHTML = `
		    <div id="step" class="mx-8 mb-3" style="display: flex; justify-content: space-between;">
		      <div style="float: left; flex-grow: 1;">
		        <div class="d-flex align-items-top">
		          <h3 id="stepNum" class="mb-0 me-6 text-primary" style="white-space: nowrap; line-height: 48px; flex-shrink: 0; width: 80px;">Step \${stepCount}</h3>
		          <textarea class="form-control" rows="5" placeholder="예) 소고기를 적당한 크기로 썰어서 준비해주세요."></textarea>
		        </div>
		      </div>
		      <div id="${stepImgId}" class="d-flex align-items-center justify-content-center ms-3" style="width: 131px; aspect-ratio: 1 / 1; background-color: #dfe2e1; cursor: pointer;">
		        <i class="feather-icon icon-image" style="font-size: 24px; color: #ffffff;"></i>
		        <input type="file" id="${stepFileInputId}" accept="image/*" style="display: none;"> 
		      </div>
		      <div class="d-flex align-items-center">
		        <i id="deleteStep" class="feather-icon icon-x ms-3" style="cursor: pointer; font-size: 24px; color: #dfe2e1;"></i>
		      </div>
		    </div>
		  `;
		
		  stepList.appendChild(newStepDiv);
		
		  // 단계 삭제 이벤트 처리
		  newStepDiv.querySelector('#deleteStep').addEventListener('click', function (e) {
		    e.preventDefault(); // 기본 동작 방지
		    stepList.removeChild(newStepDiv); // 해당 단계 삭제
		    updateStepNumbers(); // 번호 업데이트
		  });
		});
		
		// 이벤트 위임을 사용하여 이미지 업로드 이벤트 처리
		stepList.addEventListener('click', function(event) {
		  // 클릭된 요소가 이미지 영역인지 확인
		  if (event.target.closest('.d-flex.align-items-center.justify-content-center')) {
		    const stepImg = event.target.closest('.d-flex.align-items-center.justify-content-center');
		    const stepFileInput = stepImg.querySelector('input[type="file"]');
		    stepFileInput.click(); 
		  }
		});
		
		stepList.addEventListener('change', function(event) {
		  // 변경된 요소가 파일 입력 요소인지 확인
		  if (event.target.tagName === 'INPUT' && event.target.type === 'file') {
		    const stepFileInput = event.target;
		    const stepImg = stepFileInput.closest('.d-flex.align-items-center.justify-content-center');
		
		    const file = stepFileInput.files[0];
		    if (file) {
		      const reader = new FileReader();
		
		      reader.onload = function (event) {
		        const uploadedImg = new Image();
		        uploadedImg.src = event.target.result;
		        uploadedImg.style.width = "100%"; 
		        uploadedImg.style.height = "100%";
		        uploadedImg.style.objectFit = "cover";
		        uploadedImg.style.border = '2px solid #dfe2e1';
		
		        // 기존 내용을 지우고 이미지로 변경
		        stepImg.innerHTML = ''; 
		        stepImg.appendChild(uploadedImg); 
		      };
		
		      reader.readAsDataURL(file);
		    }
		  }
		});
		
		// Step 번호 업데이트 함수
		function updateStepNumbers() {
		  const allSteps = stepList.querySelectorAll('#step'); // 모든 단계 가져오기
		  allSteps.forEach((stepDiv, index) => {
		    const stepNum = stepDiv.querySelector('h3'); // 각 단계의 번호
		    stepNum.textContent = `Step ${index + 1}`; // 번호를 재설정
		  });
		}
		///////////////////////////////////////////////////////////////////////////
		
		</script>


	<script>
		// 태그 
		// 태그를 저장할 배열
		let tags = [];

		// input 요소와 태그 목록을 가져오기
		const input = document.getElementById("tag-input");
		const tagsList = document.getElementById("tags-list");

		// 태그 입력 처리
		input.addEventListener("keyup", function (event) {
			if (event.key === "Enter" && input.value.trim() !== "") {
				const tag = input.value.trim();

				// 이미 존재하는 태그가 아니면 추가
				if (!tags.includes(tag)) {
					tags.push(tag);

					// 태그 표시
					const tagElement = document.createElement("span");
					tagElement.classList.add("badge", "badge-custom", "mr-2", "mb-3");
					tagElement.textContent = tag;

					// 태그 삭제 버튼 추가
					const removeBtn = document.createElement("button");
					removeBtn.classList.add("btn-close");
					
					// X 텍스트 대신 아이콘
					const icon = document.createElement("i");
					icon.classList.add("feather-icon", "icon-x");
					removeBtn.textContent = "";
					removeBtn.appendChild(icon);
					
					removeBtn.onclick = function () {
						tags = tags.filter((t) => t !== tag);
						tagElement.remove();
					};

					tagElement.appendChild(removeBtn);
					tagsList.appendChild(tagElement);
				}

				// 입력 필드 비우기
				input.value = "";
			}
		});
	</script>

	<script>
   mainFileInput.addEventListener("change", function () {
	    const file = mainFileInput.files[0];
	    if (file) {
	        const reader = new FileReader();

	        reader.onload = function (event) {

	            main_image = event.target.result; // Base64 문자열 저장
	        };

	        reader.readAsDataURL(file);
	    }
	});
   
  
   $(document).ready(function() {
	   
	   
	   $('#ingredientList').on('click', '.button-plus', function() {
		    const button = $(this);
		    const inputField = button.siblings('.quantity-field');
		    let currentValue = parseInt(inputField.val());

		    if (currentValue < 10) { // 최대값 10으로 제한 (필요에 따라 수정 가능)
		      inputField.val(currentValue + 1);
		    }
		  });

		  // "-" 버튼에 대한 이벤트 핸들러 (기존 코드 활용)
		  $('#ingredientList').on('click', '.button-minus', function() {
		    const button = $(this);
		    const inputField = button.siblings('.quantity-field');
		    let currentValue = parseInt(inputField.val());

		    if (currentValue > 1) { // 최소값 1로 제한
		      inputField.val(currentValue - 1);
		    }
		  });

	   
	   
	    $("#registrationButton").click(function() {
	        var title = $("#title").val();
	        var description = $("#description").val();
	        var cooking_time = $("#cooking_time").val();
	        var serving_count = $("#serving_count").val();

	        //recipe_category_group 데이터
	        var recipe_main = $("#mainCategory").val();
	        var recipe_sub = $("#midCategory").val();
	        var recipe_detail = $("#subCategory").val();
	        
	        
	        const ingredients = [];
	        const ingredientElements = document.querySelectorAll("#ingredientList > div"); // 재료 div들을 선택

	        ingredientElements.forEach(function(element, index) {
	            const ingredientId = element.querySelector(`#ingredient-id-\${index + 1}`).value;
	            const ingredientName = element.querySelector(`#ingredient-name-\${index + 1}`).value;
	            const ingredientUnit = element.querySelector(`#ingredient-unit-\${index + 1}`).value;
	            const ingredientQuantity = element.querySelector('.quantity-field').value; 

	            ingredients.push({
	                ing_id: ingredientId,
	                ing_name: ingredientName,
	                ing_gram: ingredientUnit,
	                ing_times: ingredientQuantity
	            });
	        });

	        
	        const steps = [];
	        const stepElements = document.querySelectorAll("#stepList > div");

	        stepElements.forEach(function(element, index) {
	          const stepDescription = element.querySelector(`textarea`).value;
	          const stepImageElement = element.querySelector('.d-flex.align-items-center.justify-content-center.ms-3'); 
	          let stepImage = ''; 

	          // 이미지 요소 (img 태그) 확인
	          const imgElement = stepImageElement.querySelector('img'); 
	          if (imgElement) {
	            stepImage = imgElement.src; // img 태그의 src 속성 값 가져오기
	          }

	          steps.push({
	            sort: index + 1,
	            description: stepDescription,
	            img_url: stepImage 
	          });
	        });
	        
	        // tags-list div에서 모든 span 태그를 가져옵니다.
	        const tagElements = document.querySelectorAll("#tags-list span");

	        // span 태그의 텍스트 콘텐츠를 저장할 배열을 만듭니다.
	        const tagsArray = [];

	        // 각 span 태그를 순회하면서 텍스트 콘텐츠를 배열에 추가합니다.
	        tagElements.forEach(function(tagElement) {
	            tagsArray.push(tagElement.textContent);
	        });
	        
	        $.ajax({
	            url: "/recipick/dashboard/recipe",
	            type: "POST",
	            contentType: 'application/json', // Content-Type 헤더 설정
	            data: JSON.stringify({ 
	            	title: title,
	                description: description,
	                cooking_time: cooking_time,
	                serving_count: serving_count,
	                main_image : main_image,
	                
	                recipe_main: recipe_main,
	                recipe_sub: recipe_sub,
	                recipe_detail: recipe_detail,
	                
	                tagNames: tagsArray,
	                ingredients: ingredients,
	                steps: steps
	            }), // 데이터를 JSON 문자열로 변환
	            success: function(response) {
	                // 성공적으로 저장되면 페이지를 새로 고침합니다.
	                alert('정상적으로 데이터베이스(DB)에 레시피가 등록되었습니다.');
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
</html>