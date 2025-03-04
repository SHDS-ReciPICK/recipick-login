<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
// 현재 페이지의 쿼리스트링을 가져와서 처리 
String queryString = request.getQueryString();
if (queryString != null) {
	// 기존 page 파라미터 제거 
	queryString = queryString.replaceAll("&?page=[^&]*", "");
}
// 처리된 쿼리스트링을 페이지 스코프에 저장
pageContext.setAttribute("currentQueryString", queryString);
%>


<!-- 상품 목록 섹션 -->
<div class="products-content">

	<!-- viewType이 'best'나 'discount'가 아닐 때만 상단 컨트롤 영역 표시 -->
	<c:if test="${viewType ne 'best' and viewType ne 'discount'}">
		<div class="d-lg-flex justify-content-between align-items-center mb-4">
			<!-- 검색 결과 카운트 -->
			<div class="mb-3 mb-lg-0">
				<p class="mb-0 text-muted">
					총 <span class="fw-bold text-primary">${totalCount}</span> 건의 레시피
				</p>
			</div>

			<!-- 정렬 옵션 그룹 -->
			<div class="d-flex align-items-center gap-2">

				<div class="btn-group" role="group" aria-label="정렬 옵션">
					<button type="button"
						class="btn btn-sm sort-btn ${param.sortType eq 'popular' or empty param.sortType ? 'btn-primary' : 'btn-outline-primary'}"
						data-sort="popular">
						<i class="bi bi-graph-up me-1"></i>인기순
					</button>
					<button type="button"
						class="btn btn-sm sort-btn ${param.sortType eq 'newest' ? 'btn-primary' : 'btn-outline-primary'}"
						data-sort="newest">
						<i class="bi bi-calendar-check me-1"></i>신상품순
					</button>
					<button type="button"
						class="btn btn-sm sort-btn ${param.sortType eq 'rating' ? 'btn-primary' : 'btn-outline-primary'}"
						data-sort="rating">
						<i class="bi bi-star-fill me-1"></i>평점순
					</button>
					<button type="button"
						class="btn btn-sm sort-btn ${param.sortType eq 'review' ? 'btn-primary' : 'btn-outline-primary'}"
						data-sort="review">
						<i class="bi bi-chat-dots me-1"></i>리뷰많은순
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

		<!-- 레시피 목록 반복 -->
		<c:forEach items="${recipes}" var="recipe">
			<div class="col">
				<div class="card card-product">
					<div class="card-body">
						<!-- 이미지 영역 -->
						<div class="text-center position-relative">
							<a
								href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipe.recipe_id}
																	     ?discount_price=${recipe.discount_price}
																	     &original_price=${recipe.original_price}
																	     &avg_discount_rate=${recipe.avg_discount_rate}">
								<div class="image-container">
									<img src="${recipe.main_image}" alt="${recipe.title}"
										class="fixed-image" />
									<!-- 간단한 할인 뱃지 -->
									<c:if test="${recipe.original_price > recipe.discount_price}">
										<div class="discount-badge">할인</div>
									</c:if>
								</div>
							</a>
						</div>

						<!-- 상품 정보 영역 -->
						<div class="product-info">
							<!-- 카테고리 -->
							<%-- <div class="text-small mb-1">
								<a
									href="${pageContext.request.contextPath}/recipe/products/category?detail=${recipe.recipe_detail}"
									class="text-decoration-none text-muted">
									${recipe.recipe_detail} </a>
					
							</div> --%>

							<!-- 상품명 -->
							<h2 class="fs-6 mb-2">
								<a
									href="${pageContext.request.contextPath}/recipe/product/recipe-single/${recipe.recipe_id}
																		       ?discount_price=${recipe.discount_price}
																		       &original_price=${recipe.original_price}
																		       &avg_discount_rate=${recipe.avg_discount_rate}"
									class="text-inherit text-decoration-none">${recipe.title}</a>
							</h2>
							
							<!-- 평점 -->
							<div class="text-warning mb-1">
								<c:forEach begin="1" end="5" var="i">
									<c:choose>
										<c:when test="${i <= recipe.avg_rating}">
											<i class="bi bi-star-fill"></i>
										</c:when>
										<c:when test="${i - recipe.avg_rating <= 0.5}">
											<i class="bi bi-star-half"></i>
										</c:when>
										<c:otherwise>
											<i class="bi bi-star"></i>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 평점과 리뷰 수 표시 -->
								<span class="text-muted ms-2"> <fmt:formatNumber
										value="${recipe.avg_rating}" pattern="0.0" />
									(${recipe.review_count})
								</span>
							</div>

							<!-- 가격 정보 -->
							<div class="price-container">
								<c:if test="${recipe.original_price > recipe.discount_price}">
									<div class="text-danger fw-bold">
										<fmt:formatNumber value="${recipe.avg_discount_rate}"
											pattern="#,##0" />
										% 할인
									</div>
									<div class="price-row">
										<span class="text-dark"> <fmt:formatNumber
												value="${recipe.discount_price}" pattern="#,###" />원
										</span> <span class="text-decoration-line-through"> <fmt:formatNumber
												value="${recipe.original_price}" pattern="#,###" />원
										</span>
									</div>
								</c:if>
							</div>

							<!-- 부가 정보와 담기 버튼 -->
							<div class="extra-info-row">
								<div class="info-group">
									<small class="text-muted"> <i class="bi bi-clock"></i>${recipe.cooking_time}분
										<i class="bi bi-people"></i>${recipe.serving_count}인분
									</small>
								</div>
								<button type="button" class="btn btn-primary btn-sm"
									onclick="addToCart(${recipe.recipe_id})">담기</button>
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
								href="${pageContext.request.contextPath}/recipe/products/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${currentPage - 1}"
								aria-label="Previous"> <i
									class="feather-icon icon-chevron-left"></i>
							</a>
							</li>

							<!-- 페이지 번호 -->
							<c:forEach begin="1" end="${totalPages}" var="pageNum">
								<li class="page-item ${pageNum == currentPage ? 'active' : ''}">
									<a class="page-link"
									href="${pageContext.request.contextPath}/recipe/products/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${pageNum}">
										${pageNum} </a>
								</li>
							</c:forEach>

							<!-- 다음 페이지 -->
							<li
								class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/recipe/products/${viewType}?${not empty currentQueryString ? currentQueryString.concat('&') : ''}page=${currentPage + 1}"
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