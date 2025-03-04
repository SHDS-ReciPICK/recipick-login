<%@ page language="java" contentType="text/jsp; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 현재 페이지 정보 설정 -->
		<c:set var="currentPage" value="${pageContext.request.servletPath}" />
		<c:set var="isRecipePage" value="${isRecipePage}" />
		<c:set var="isIngredientPage" value="${isIngredientPage}" />
		<!-- 로그인 확인 -->
		<c:set var="isLoggedIn" value="${!empty login}" />

		<style>
			.top-banner {
				background: linear-gradient(to right, #f1f8e9, #f9fbe7);
				border-bottom: 1px solid #e8f5e9;
			}

			.header-logo {
				font-family: 'Brush Script MT', cursive;
				font-size: 1.8rem;
				color: #FF6F00;
				text-decoration: none;
				transition: color 0.3s ease;
			}

			.header-logo:hover {
				color: #E75C1A;
			}

			.nav-link {
				color: #1B5E20;
				transition: color 0.3s ease;
			}

			.nav-link:hover {
				color: #E75C1A;
			}

			.search-form .input-group {
				border: 1px solid #e0e0e0;
				border-radius: 8px;
			}

			.search-form .form-select,
			.search-form .form-control {
				border: none;
				background-color: white;
			}

			.search-form .form-select {
				color: #6c757d;
			}

			.search-form .btn {
				background-color: #F5F5F5;
				border: none;
				color: #6c757d;
			}

			.search-form .btn:hover {
				background-color: #E8F5E9;
			}

			.user-actions svg {
				color: #FF6F00;
				transition: color 0.3s ease;
			}

			.user-actions svg:hover {
				color: #E75C1A;
			}

			.badge {
				background-color: #FF8A3D !important;
			}
		</style>

		<script>
			const contextPath = '${pageContext.request.contextPath}';
		</script>

		<!-- Top Banner -->
		<div class="border-bottom">
			<div class="bg-light py-1">
				<div class="container">
					<div class="row w-100 align-items-center">
						<div class="col-md-6 col-12 text-md-start">
							<span>레시피부터 장바구니까지, 필요한 식재료를 한 번에 해결하는 스마트 쇼핑몰!</span>
						</div>
						<div class="col-md-6 d-none d-md-block text-end pe-4">
							<c:choose>
								<c:when test="${isLoggedIn}">
									<span class="text-muted">${nickname}님 환영합니다</span>
									<a href="/recipick/logout.do" class="text-decoration-none text-muted ms-3">로그아웃</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/signup.do" class="text-decoration-none text-muted me-3">회원
										가입</a>
									<span class="text-muted mx-2">|</span>
									<a href="${pageContext.request.contextPath}/signin.do"
										class="text-decoration-none text-muted ms-3">로그인</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header -->
		<header class="py-lg-4 py-3">
			<div class="container">
				<div class="row w-100 align-items-center">
					<!-- Logo & Navigation Section -->
					<div class="col-xl-3 col-lg-3">
						<div class="d-flex align-items-center">

							<!-- 로고 -->
							<a class="navbar-brand d-none d-lg-block"
								href="${isRecipePage ? pageContext.request.contextPath.concat('/recipe') : pageContext.request.contextPath.concat('/ingredient')}">
								<img src="${pageContext.request.contextPath}/images/logo/recipick-logo-orange.svg"
									alt="eCommerce HTML Template" />
							</a>
							<div class="d-flex justify-content-between w-100 d-lg-none">
								<a class="navbar-brand" href="../index.html">
									<img src="${pageContext.request.contextPath}/images/logo/recipick-log-orange.svg"
										alt="eCommerce HTML Template" />
								</a>
							</div>

							<!-- Navigation Links -->
							<nav class="d-flex align-items-center ms-4">
								<a class="navbar-brand d-none d-lg-block recipe ${isRecipePage ? 'text-primary fw-bold' : ''}"
									href="${pageContext.request.contextPath}/recipe">레시피</a> <span
									class="navbar-brand d-none d-lg-block mx-3">|</span> <a
									class="navbar-brand d-none d-lg-block ingredient ${isIngredientPage ? 'text-primary fw-bold' : ''}"
									href="${pageContext.request.contextPath}/ingredient">식재료</a>
							</nav>
						</div>
					</div>


					<!-- 검색 Section -->
					<div class="col-xl-6 col-lg-6">
						<c:choose>
							<c:when test="${isRecipePage}">
								<form action="${pageContext.request.contextPath}/recipe/products/search" method="get"
									class="search-form">
									<div class="input-group">
										<!-- 검색 타입 선택 -->
										<select name="searchType" class="form-select" style="max-width: 120px;">
											<option value="all" ${param.searchType=='all' ? 'selected' : '' }>전체</option>
											<option value="title" ${param.searchType=='title' ? 'selected' : '' }>제목</option>
											<option value="content" ${param.searchType=='content' ? 'selected' : '' }>내용</option>
											<option value="tag" ${param.searchType=='tag' ? 'selected' : '' }>태그</option>
										</select>

										<!-- 검색어 입력 -->
										<input class="form-control" type="search" name="keyword" value="${param.keyword}"
											placeholder="검색어를 입력해주세요" />

										<!-- 검색 버튼 -->
										<button class="btn bg-white border-0 d-flex align-items-center" type="submit">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-search">
												<circle cx="11" cy="11" r="8"></circle>
												<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
											</svg>
										</button>
									</div>
								</form>
							</c:when>
							<c:when test="${isIngredientPage}">
								<form action="${pageContext.request.contextPath}/ingredient/products/search" method="get"
									class="search-form">
									<div class="input-group">
										<!-- 검색 타입 선택 -->
										<select name="searchType" class="form-select" style="max-width: 120px;">
											<option value="all" ${param.searchType=='all' ? 'selected' : '' }>전체</option>
											<option value="name" ${param.searchType=='title' ? 'selected' : '' }>식재료명</option>
											<option value="detail" ${param.searchType=='content' ? 'selected' : '' }>상세</option>
										</select>

										<!-- 검색어 입력 -->
										<input class="form-control" type="search" name="keyword" value="${keyword}"
											placeholder="검색어를 입력해주세요" />

										<!-- 검색 버튼 -->
										<button class="btn bg-white border-0 d-flex align-items-center" type="submit">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-search">
												<circle cx="11" cy="11" r="8"></circle>
												<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
											</svg>
										</button>
									</div>
								</form>
							</c:when>
						</c:choose>
					</div>

					<!-- User Actions Section -->
					<div class="col-lg-3 col-xxl-3 text-end">
						<div class="list-inline d-flex justify-content-end align-items-center">
						<c:choose>
						<c:when test="${isLoggedIn}">
							<!-- Wishlist -->
							<div class="list-inline-item mx-2">
								<a href="${pageContext.request.contextPath}/mypage-like" class="text-muted position-relative"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-heart">
										<path
											d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
										</path>
									</svg>
									<span
										class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">${wishlistCount}</span>
								</a>
							</div>
							<!-- User Profile -->
							<div class="list-inline-item mx-2">
								<a href="${pageContext.request.contextPath}/mypage-orders" class="text-muted">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-user">
										<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
										<circle cx="12" cy="7" r="4"></circle>
									</svg>
								</a>
							</div>
							
								<!-- Shopping Cart -->
									<div class="list-inline-item me-5 me-lg-0 ms-2">
										<a class="text-muted position-relative" href="${pageContext.request.contextPath}/shop-cart"
											role="button">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-shopping-bag">
												<path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
												<line x1="3" y1="6" x2="21" y2="6"></line>
												<path d="M16 10a4 4 0 0 1-8 0"></path>
											</svg>
											<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
												${cartCount} <span class="visually-hidden">unread messages</span>
											</span>
										</a>
									</div>
						</c:when>	
						<c:otherwise>
						<!-- Wishlist -->
							<div class="list-inline-item mx-2">
								<a href="${pageContext.request.contextPath}/signin.do" class="text-muted position-relative"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-heart">
										<path
											d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
										</path>
									</svg>
									<span
										class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">${wishlistCount}</span>
								</a>
							</div>
							<!-- User Profile -->
							<div class="list-inline-item mx-2">
								<a href="${pageContext.request.contextPath}/signin.do" class="text-muted">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-user">
										<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
										<circle cx="12" cy="7" r="4"></circle>
									</svg>
								</a>
							</div>
							
								<!-- Shopping Cart -->
									<div class="list-inline-item me-5 me-lg-0 ms-2">
										<a class="text-muted position-relative" href="${pageContext.request.contextPath}/signin.do"
											role="button">
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
												stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-shopping-bag">
												<path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
												<line x1="3" y1="6" x2="21" y2="6"></line>
												<path d="M16 10a4 4 0 0 1-8 0"></path>
											</svg>
											<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary">
												${cartCount} <span class="visually-hidden">unread messages</span>
											</span>
										</a>
									</div>
						
								</c:otherwise>
							</c:choose>
						
						</div>
					</div>
				</div>
			</div>
		</header>