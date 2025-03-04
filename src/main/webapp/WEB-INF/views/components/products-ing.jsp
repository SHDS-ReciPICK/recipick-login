<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
// 현재 페이지의 쿼리스트링 처리
String queryString = request.getQueryString();
if (queryString != null) {
	// 기존 page 파라미터 제거 
	queryString = queryString.replaceAll("&?page=[^&]*", "");
}
// 처리된 쿼리스트링을 페이지 스코프에 저장
pageContext.setAttribute("currentQueryString", queryString);
%>

<style>
/* 기본 카드 레이아웃 스타일 */
.card-product {
	height: 100%;
	display: flex;
	flex-direction: column;
	margin-bottom: 1rem;
}

.card-product .card-body {
	padding: 0.75rem;
}

/* 이미지 컨테이너 스타일 */
.image-container {
	position: relative;
	width: 100%;
	padding-bottom: 100%; /* 1:1 비율 유지 */
	margin-bottom: 0.75rem;
}

.fixed-image {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* 상품 정보 영역 스타일 */
.product-info {
	flex: 1;
	display: flex;
	flex-direction: column;
}

/* 가격 정보 스타일 */
.price-container {
	margin-top: 0.5rem;
	font-size: 0.875rem;
	line-height: 1.2;
}

/* 할인 뱃지 스타일 */
.discount-badge {
	position: absolute;
	top: 8px;
	right: 8px;
	background-color: #dc3545;
	color: white;
	padding: 0.25rem 0.5rem;
	border-radius: 4px;
	font-size: 0.75rem;
	font-weight: 500;
	z-index: 1;
}
</style>

<!-- 상품 목록 섹션 -->
<div class="products-ing-content">

	<!-- viewType이 'best'나 'discount'가 아닐 때만 상단 컨트롤 영역 표시 -->
	<c:if test="${viewType ne 'best' and viewType ne 'discount'}">
		<div class="d-lg-flex justify-content-between align-items-center mb-4">
			<!-- 검색 결과 카운트 -->
			<div class="mb-3 mb-lg-0">
				<p class="mb-0 text-muted">
					총 <span class="fw-bold text-primary">${totalCount}</span> 건의 식재료
				</p>
			</div>

			<!-- 정렬 옵션 그룹 -->
			<div class="d-flex align-items-center gap-2">
				<div class="btn-group" role="group" aria-label="정렬 옵션">
					<button type="button"
						class="btn btn-sm sort-btn ${param.sortType eq 'newest' or empty param.sortType ? 'btn-primary' : 'btn-outline-primary'}"
						data-sort="newest">
						<i class="bi bi-calendar-check me-1"></i>신상품순
					</button>
					<button type="button"
						class="btn btn-sm sort-btn ${param.sortType eq 'stock' ? 'btn-primary' : 'btn-outline-primary'}"
						data-sort="stock">
						<i class="bi bi-box me-1"></i>재고순
					</button>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${viewType eq 'discount'}">
		<div class="d-lg-flex justify-content-between align-items-center">
			<div class="mb-3 mb-lg-0">
				<p class="mb-0">
					총 <span class="text-dark fw-bold">${totalCount}</span> 건의 할인 상품
				</p>
			</div>
		</div>
	</c:if>


	<!-- 상품 그리드 -->
	<div
		class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
		<c:forEach items="${ingredients}" var="ingredient">
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<!-- 이미지 영역 -->
						<div class="text-center position-relative">
							<a
								href="${pageContext.request.contextPath}/ingredient/product/ingredient-single/${ingredient.ing_id}">
								<div class="image-container">
									<img src="${ingredient.image}" alt="${ingredient.name}"
										class="fixed-image" />
									
									<!-- 할인 상품 뱃지 -->
									<c:if test="${ingredient.discount > 0}">
										<div class="discount-badge">할인</div>
									</c:if>
								</div>
							</a>
						</div>

						<!-- 상품 정보 영역 -->
						<div class="product-info">
							<!-- 카테고리 -->
							<div class="text-small mb-1">
								<a
									href="${pageContext.request.contextPath}/ingredient/products/category?main=${ingredient.ing_detail}"
									class="text-decoration-none text-muted">
									${ingredient.ing_detail} </a>
							</div>

							<!-- 상품명 -->
							<h2 class="fs-6 mb-2">
								<a
									href="${pageContext.request.contextPath}/ingredient/product/ingredient-single/${ingredient.ing_id}"
									class="text-inherit text-decoration-none">
									${ingredient.name} </a>
							</h2>

							<!-- 가격 정보 -->
							<div class="price-container">
								<c:if test="${ingredient.discount > 0}">
									<div class="text-danger fw-bold">${ingredient.discount}%
										할인</div>
									<span class="text-dark"> <fmt:formatNumber
											value="${ingredient.getDiscountedPrice()}" pattern="#,###" />원
									</span>
									<span class="text-decoration-line-through text-muted"> <fmt:formatNumber
											value="${ingredient.getActualPrice()}" pattern="#,###" />원
									</span>
								</c:if>
								<c:if test="${ingredient.discount == 0}">
									<span class="text-dark"> <fmt:formatNumber
											value="${ingredient.getActualPrice()}" pattern="#,###" />원
									</span>
								</c:if>
							</div>

							<!-- 추가 정보 -->
							<div
								class="d-flex justify-content-between align-items-center mt-3">
								<small class="text-muted"> ${ingredient.avg_gram}g </small>
								<button type="button" class="btn btn-primary btn-sm"
									onclick="addToCart(${ingredient.ing_id})">담기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- 페이징 -->
	<c:if test="${viewType ne 'best'}">
		<div class="pagination-container">
			<div class="row mt-8">
				<div class="col">
					<nav>
						<ul class="pagination justify-content-center">
							<!-- 이전 페이지 -->
							<li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/ingredient/products/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${currentPage - 1}"
								aria-label="Previous"> <i
									class="feather-icon icon-chevron-left"></i>
							</a>
							</li>

							<!-- 페이지 번호 -->
							<c:forEach begin="1" end="${totalPages}" var="pageNum">
								<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
									<a class="page-link"
									href="${pageContext.request.contextPath}/ingredient/products/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${pageNum}">
										${pageNum} </a>
								</li>
							</c:forEach>

							<!-- 다음 페이지 -->
							<li
								class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/ingredient/products/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${currentPage + 1}"
								aria-label="Next"> <i
									class="feather-icon icon-chevron-right"></i>
							</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</c:if>
</div>