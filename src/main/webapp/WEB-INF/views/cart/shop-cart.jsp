<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<title>장바구니</title>
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

	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>


	<!-- 포트원 결제 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- 포트원 결제 -->



	<main>
		<section class="mb-lg-14 mb-8 mt-8">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-12">
						<!-- card -->
						<div class="card py-1 border-0 mb-8">
							<div>
								<h1 class="fw-bold">장바구니</h1>
							</div>
						</div>
					</div>
				</div>
				<!-- row -->
				<div class="row">
					<div class="col-lg-8 col-md-7">
						<div class="py-3">
							<h2>레시피</h2>
							<!-- <div class="alert alert-danger p-2" role="alert"> 레시피에 변경된
								옵션이 있습니다.</div> -->
							<ul class="list-group list-group-flush">
								<c:set var="hasCategory1" value="false" />
								<c:forEach var="item" items="${cartItems}">
									<c:if test="${item.category == 1}">
										<c:set var="hasCategory1" value="true" />
									</c:if>
								</c:forEach>
								<c:choose>
									<c:when test="${hasCategory1}">
										<c:forEach var="item" items="${cartItems}">
											<c:if test="${item.category == 1}">
												<li class="list-group-item py-3 ps-0 border-top"
													data-cart-id="${item.cart_id}" data-id="${item.recipe_id}"
													data-type="${item.category}"
													data-member-id="${item.member_id}"
													data-price="${item.rcp_original_price}"
													data-discount-price="${item.rcp_discount_price}">
													<%-- data-member-id="${sessionScope.member.id}"> --%>
													<div class="row align-items-center">
														<!-- 이미지 -->
														<div class="col-6 col-md-6 col-lg-7">
															<div class="d-flex align-items-center">
																<img src="${item.rcp_img}" alt="Ecommerce"
																	class="icon-shape icon-xxl" />
																<div class="ms-3">
																	<h6 class="mb-0">${item.rcp_title}</h6>
																	<%-- <span><small class="text-muted">${item.ing_avg_gram}g</small></span> --%>
																	<div class="mt-3 small lh-1">
																		<a href="#"
																			class="btn btn-outline-primary btn-sm btn-option-edit"
																			data-cart-id="${item.cart_id}" data-bs-toggle="modal"
																			data-bs-target="#recipeOption"> 옵션 수정 </a>
																	</div>

																</div>
															</div>
														</div>
														<!-- 수량 조정 -->
														<div class="col-4 col-md-4 col-lg-3">
															<div class="input-group input-spinner">
																<input type="button" value="-"
																	class="button-rcp-minus btn btn-sm"
																	data-field="quantity" /> <input type="number" step="1"
																	max="10" value="${item.qty}" name="quantity"
																	class="quantity-field form-control-sm form-input" /> <input
																	type="button" value="+"
																	class="button-rcp-plus btn btn-sm"
																	data-field="quantity" />
															</div>
														</div>
														<!-- 가격 -->
														<div
															class="col-2 text-lg-end text-start text-md-end col-md-2">
															<%-- <span class="fw-bold">${item.rcp_original_price} 원</span> --%>
															<!-- 초기 가격 표시 -->
															<span
																class="fw-bold item-price text-decoration-line-through text-secondary">${item.rcp_original_price * item.qty}
																원</span> <br> <span class="fw-bold item-discount-price">${item.rcp_discount_price * item.qty}
																원</span>
														</div>

														<div></div>
													</div> <a href="#!"
													class="position-absolute top-0 end-0 mt-1 me-1 text-decoration-none">
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
															height="16" class="bi bi-x text-danger"
															viewBox="0 0 16 16">
															<path
																d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
														</svg>
												</a>
												</li>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<li class="list-group-item text-center">장바구니에 레시피 아이템이
											없습니다.</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>

						<!-- 식재료 -->
						<div class="py-3">
							<h2>식재료</h2>
							<!-- <div class="alert alert-danger p-2" role="alert">
								품절된 식재료 항목이 있습니다.
							</div> -->
							<ul class="list-group list-group-flush">
								<c:set var="hasCategory0" value="false" />
								<c:forEach var="item" items="${cartItems}">
									<c:if test="${item.category == 0}">
										<c:set var="hasCategory0" value="true" />
									</c:if>
								</c:forEach>
								<c:choose>
									<%-- <c:when test="${not empty cartItems}"> --%>
									<c:when test="${hasCategory0}">
										<c:forEach var="item" items="${cartItems}">
											<c:if test="${item.category == 0}">
												<li class="list-group-item py-3 ps-0 border-top"
													data-cart-id="${item.cart_id}" data-id="${item.ing_id}"
													data-type="${item.category}"
													data-member-id="${item.member_id}"
													data-price="${item.ing_original_price}"
													data-discount-price="${item.ing_discount_price}">
													<%-- data-member-id="${sessionScope.member.id}"> --%>
													<div class="row align-items-center">
														<!-- 이미지 -->
														<div class="col-6 col-md-6 col-lg-7">
															<div class="d-flex align-items-center">
																<img src="${item.ing_img}" alt="Ecommerce"
																	class="icon-shape icon-xxl" />
																<div class="ms-3">
																	<h6 class="mb-0">${item.ing_name}</h6>
																	<span><small class="text-muted">${item.ing_avg_gram}g</small></span>
																</div>
															</div>
														</div>
														<!-- 수량 조정 -->
														<div class="col-4 col-md-4 col-lg-3">
															<div class="input-group input-spinner">
																<input type="button" value="-"
																	class="button-ing-minus btn btn-sm"
																	data-field="quantity" /> <input type="number" step="1"
																	max="10" value="${item.qty}" name="quantity"
																	class="quantity-field form-control-sm form-input" /> <input
																	type="button" value="+"
																	class="button-ing-plus btn btn-sm"
																	data-field="quantity" />
															</div>
														</div>
														<!-- 가격 -->
														<div
															class="col-2 text-lg-end text-start text-md-end col-md-2">
															<span
																class="fw-bold item-price text-decoration-line-through text-secondary">${item.ing_original_price * item.qty}
																원</span> <br> <span class="fw-bold item-discount-price">${item.ing_discount_price * item.qty}
																원</span>
														</div>
													</div> <a href="#!"
													class="position-absolute top-0 end-0 mt-1 me-1 text-decoration-none">
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
															height="16" class="bi bi-x text-danger"
															viewBox="0 0 16 16">
															<path
																d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
														</svg>
												</a>
												</li>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<li class="list-group-item text-center">장바구니에 식재료 아이템이
											없습니다.</li>
									</c:otherwise>
								</c:choose>
							</ul>
							
							<div class="mb-5 card mt-6">
								<div class="card-body p-6">
									<h2 class="h5 mb-4">재료 총합</h2>
									<div class="card mb-2">
										<ul class="list-group list-group-flush">
											<c:forEach var="ingredient" items="${totalIngs}">
												<li
													class="list-group-item d-flex justify-content-between align-items-start">
													<div class="me-auto">
														<div>${ingredient.ing_name}</div>
													</div> <span  class="text-muted">${ingredient.total_weight}g</span>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-lg-4 col-md-5">
						<div class="mb-5 card mt-6">
							<div class="card-body p-6">
								<!-- heading -->
								<h2 class="h5 mb-4">결제금액</h2>
								<div class="card mb-2">
									<!-- list group -->
									<ul class="list-group list-group-flush">
										<!-- list group item -->
										<li
											class="list-group-item d-flex justify-content-between align-items-start">
											<div class="me-auto">
												<div>상품금액</div>
											</div>
											<span id="totalOriginalPrice">0원</span>
										</li>

										<!-- list group item -->
										<li
											class="list-group-item d-flex justify-content-between align-items-start">
											<div class="me-auto">
												<div>할인금액</div>
											</div> <span id="totalDiscountPrice">0원</span>
										</li>
										<!-- list group item -->
										<li
											class="list-group-item d-flex justify-content-between align-items-start">
											<div class="me-auto">
												<div class="fw-bold">결제예정금액</div>
											</div> <!-- <span id="totalPrice">0 원</span> --> <span
											id="totalPayablePrice">0 원</span>
										</li>
									</ul>
								</div>
								<div class="d-grid mb-1 mt-4">
									<button
										class="btn btn-primary btn-lg d-flex justify-content-center align-items-center w-100"
										type="button" id="orderButton">
										<span class="fw-bold total-price">0 원 주문하기</span>
									</button>
									<br>
									<!-- <button id="addToCart" class="btn btn-primary ms-2">담기</button> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<div class="modal fade" id="recipeOption" tabindex="-1"
		aria-labelledby="recipeOptionLabel" aria-hidden="true">
		<div class="modal-dialog custom-small">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title" id="recipeOptionLabel">레시피 상세 옵션</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- Modal Body -->
				<div class="modal-body p-6">
					<!-- 설명 -->
					<p class="small mb-4">부족한 재료를 더하고, 필요 없는 재료는 줄여보세요!</p>
					<!-- 동적으로 삽입될 리스트 -->
					<ul id="recipeOptionsList" class="list-group list-group-flush">
						<!-- 데이터를 동적으로 추가 -->
					</ul>
				</div>
				<!-- Modal Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary"
						id="saveRecipeOptions">저장</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	    $(document).ready(function () {
	    	
	    	/* updateTotalPrice(); */
	    	formatPricesOnLoad()
	    	
	    	
	/*             let orderData = {
	                totalOriginalPrice: parseInt($('#totalOriginalPrice').text().replace(/[^0-9]/g, '')), // 상품금액
	                totalDiscountPrice: parseInt($('#totalDiscountPrice').text().replace(/[^0-9]/g, '')), // 할인금액
	                totalPayablePrice: parseInt($('#totalPayablePrice').text().replace(/[^0-9]/g, '')), // 결제 예정 금액
	            };

	    	 */
	    	
	    	 
	    	 $('#orderButton').click(function (e) {
			        e.preventDefault();
			        /* 
			        let items = [];
			        $('.list-group-item').each(function () {
			            let cartItem = {
			                cartId: $(this).data('cart-id'),
			                itemId: $(this).data('id'), // recipe_id 또는 ing_id
			                category: $(this).data('type'), // 1: 레시피, 0: 식재료
			                quantity: parseInt($(this).find('.quantity-field').val()) || 1,
			                totalPrice: parseInt($(this).find('.item-discount-price').text().replace(/[^0-9]/g, '')) || 0 
			            };
			            items.push(cartItem);
			        }); */

			        // 전송할 데이터 구성
			        let orderData = {
			            totalOriginalPrice: parseInt($('#totalOriginalPrice').text().replace(/[^0-9]/g, '')),
			            totalDiscountPrice: parseInt($('#totalDiscountPrice').text().replace(/[^0-9]/g, '')),
			            totalPayablePrice: parseInt($('#totalPayablePrice').text().replace(/[^0-9]/g, '')),
			            /* items: items  */
			        };

			        // 데이터를 서버 세션에 저장
			        $.ajax({
			            url: `${pageContext.request.contextPath}/shop-checkout/session-data`,
			            type: 'POST',
			            contentType: 'application/json',
			            data: JSON.stringify(orderData),
			            success: function (response) {
			                if (response.success) {
			                    // 세션에 데이터가 저장된 후 페이지 이동
			                    window.location.href = `${pageContext.request.contextPath}/shop-checkout`;
			                } else {
			                    // 서버 응답이 실패 상태일 경우
			                    alert(response.message || '데이터 저장 중 오류 발생');
			                }
			            },
			            error: function (xhr, status, error) {
			                // Ajax 요청 자체가 실패한 경우
			                alert(`서버와 통신 중 문제가 발생했습니다: ${error}`);
			            }
			        });

			    });
	    	 
	    	 
	        // 삭제버튼 클릭
	        $(document).on('click', '.bi-x', function (e) {
	            e.preventDefault(); // 기본동작 방지
	            
	            let listItem = $(this).closest('li'); 
	            let id = listItem.data('id'); 
	            let type = listItem.data('type'); 
	            let memberId = listItem.data('member-id');
	            let cartId = listItem.data('cart-id');
	            
	            $.ajax({
	                url: '${pageContext.request.contextPath}/cart/delete',
	                type: 'POST',
	                data: {
	                    cart_id: cartId,
 	                    type: type,
	                    /* member_id: memberId, */
	                },
	                success: function (response) {
	                    if (response.success) {
	                        listItem.remove(); // 화면에서 삭제
	                        updateTotalPrice()
	                    } else {
	                        alert('삭제 중 오류');
	                    }
	                },
	                error: function () {
	                    alert('서버문');
	                }
	            });
	        });
	        
	        // 수량 업데이트 함수
	        
	        $(document).on('click', '.button-rcp-minus', function () {
	            updateQuantity($(this), -1);
	        });

	        $(document).on('click', '.button-rcp-plus', function () {
	            updateQuantity($(this), 1);
	        });
	        
	        
	        $(document).on('click', '.button-ing-minus', function () {
	            updateQuantity($(this), -1);
	        });

	        $(document).on('click', '.button-ing-plus', function () {
	            updateQuantity($(this), 1);
	        });
	        
	       	        
	        
	        function updateTotalPrice() {
	            let totalOriginalPrice = 0;
	            let totalDiscountPrice = 0;

	            $('.list-group-item').each(function () {
	                let quantity = parseInt($(this).find('.quantity-field').val()) || 0; 
	                let originalPrice = parseInt($(this).data('price')) || 0; 
	                let discountPrice = parseInt($(this).data('discount-price')) || 0;

	                totalOriginalPrice += originalPrice * quantity; 
	                totalDiscountPrice += discountPrice * quantity; 
	            });

	            $('#totalOriginalPrice').text(totalOriginalPrice.toLocaleString() + " 원"); 
	            $('#totalDiscountPrice').text((totalOriginalPrice - totalDiscountPrice).toLocaleString() + " 원");
	            $('#totalPayablePrice').text(totalDiscountPrice.toLocaleString() + " 원"); 
	            $('.total-price').text(totalDiscountPrice.toLocaleString() + " 원 주문하기");

	            // 히든 필드 값 업데이트 (서버로 전송 시 사용)
	            $('#totalPriceInput').val(totalDiscountPrice);
	            
	            if (totalDiscountPrice === 0) {
	                $('#orderButton').prop('disabled', true).addClass('disabled');
	            } else {
	                $('#orderButton').prop('disabled', false).removeClass('disabled');
	            }
	        }
	        
	        
	        function formatPricesOnLoad() {
	            $('.list-group-item').each(function () {
	                let listItem = $(this);
	                let price = parseInt(listItem.data('price')) || 0; 
	                let discountPrice = parseInt(listItem.data('discount-price')) || 0; 
	                let quantity = parseInt(listItem.find('.quantity-field').val()) || 1; 

	                listItem.find('.item-price').text((price * quantity).toLocaleString() + " 원");
	                listItem.find('.item-discount-price').text((discountPrice * quantity).toLocaleString() + " 원");
	            });

	            // 총 가격 업데이트
	            updateTotalPrice();
	        }
	        
	        
	        function updateQuantity(button, change) {
	            let listItem = button.closest('li');
	            let cartId = listItem.data('cart-id');
	            let type = listItem.data('type');
	            let price = listItem.data('price'); // 원래 가격
	            let discountPrice = listItem.data('discount-price'); 
	            let quantityInput = listItem.find('.quantity-field');
	            let currentQty = parseInt(quantityInput.val());
	            let newQty = currentQty + change;

	            // 수량이 1 미만으로 내려가지 않도록 제한
	            if (newQty < 1) {
	                alert('수량은 최소 1개 이상이어야 합니다.');
	                return;
	            }

	            // 수량 업데이트 요청
	            $.ajax({
	                url: `${pageContext.request.contextPath}/cart/updateQty`,
	                type: 'POST',
	                data: {
	                    cart_id: cartId,
	                    type: type,
	                    qty: newQty
	                },
	                
	                success: function (response) {
	                    if (response.success) {
	                        // 수량 업데이트
	                        quantityInput.val(newQty);
	                        // 가격 업데이트
	                        let priceElement = listItem.find('.item-price'); // 원래 가격 
	                        let discountPriceElement = listItem.find('.item-discount-price'); // 할인된 가격 
	                        
/* 	                        priceElement.text(price * newQty + " 원");
	                        discountPriceElement.text(discountPrice * newQty + " 원"); */
	                        
	                        
	                        priceElement.text((price * newQty).toLocaleString() + " 원");
	                        discountPriceElement.text((discountPrice * newQty).toLocaleString() + " 원");

	                    } else {
	                        alert('수량 변경 중 오류');
	                    }
	                },
	                error: function () {
	                    alert('서버와 통신 중 문제가 발생했습니다.');
	                }
	            });
	        }

	        
	        $(document).on('click', '.modal-minus', function () {
	            let listItem = $(this).closest('li');
	            let quantityInput = listItem.find('.quantity-field');
	            let currentQty = parseInt(quantityInput.val(), 10) || 0;

	            if (currentQty > 0) {
	                quantityInput.val(currentQty - 1);
	                
	/*                 let unit = parseInt(listItem.find('.option-unit').text().replace(/[^0-9]/g, ''), 10) || 0; // 단위 추출
	                let updatedWeight = unit * (currentQty - 1); // 업데이트된 무게 계산
	                listItem.find('.quantity-display').text(`${updatedWeight.toLocaleString()} g`); // 표시 업데이트 */
	                
	            }
	           
	            
	            
	            /* const updatedWeight = unit * currentQty;
	           	listItem.find('.quantity-display').text(`${updatedWeight.toLocaleString()} g`); */ 
	        });

	        $(document).on('click', '.modal-plus', function () {
	            let listItem = $(this).closest('li');
	            let quantityInput = listItem.find('.quantity-field');
	            let currentQty = parseInt(quantityInput.val(), 10) || 0;

	            quantityInput.val(currentQty + 1);
	            
	            /* let unit = parseInt(listItem.find('.option-unit').text().replace(/[^0-9]/g, ''), 10) || 0; // 단위 추출
	            let updatedWeight = unit * (currentQty + 1); // 업데이트된 무게 계산
	            listItem.find('.quantity-display').text(`${updatedWeight.toLocaleString()} g`); // 표시 업데이트
	             */
	            
	            /* const updatedWeight = unit * currentQty;
	            listItem.find('.quantity-display').text(`${updatedWeight.toLocaleString()} g`); */ 
	        });
	        
	        
			/* 옵션수정버튼 */
			$(document).on('click', '.btn-option-edit', function () {
				    let cartId = $(this).data('cart-id'); // 버튼에서 cartId 가져오기
				    $('#recipeOption').data('cart-id', cartId);
				    
				    $.ajax({
				        url: `${pageContext.request.contextPath}/cart/recipe-ings`,
				        type: 'GET',
				        data: { cart_id: cartId },
				        success: function (response) {
				            if (response.success) {
				                const options = response.data;
			
				                $('#recipeOptionsList').empty();
				                console.log($('#recipeOptionsList').data('cart-id'));

				                options.forEach(option => {
				                    const listItem = `
				                        <li class="list-group-item py-3 ps-0 border-top" data-ing-id = "\${option.ing_id}" data-ri-id = "\${option.ri_id}" >
				                            <div class="row align-items-center">
				                                <!-- 이미지 -->
				                                <div class="col-6 col-md-6 col-lg-7">
				                                    <div class="d-flex align-items-center">
				                                        <div class="ms-3 d-flex flex-column justify-content-center">
				                                            <h6 class="mb-0">\${option.name}</h6>
				                                            <span><small class="text-muted quantity-display">\${option.unit * option.upd_qty} g</small></span>
				                                        </div>
				                                    </div>
				                                </div>
				                                <!-- 수량 조정 -->
				                                <div class="col-4 col-md-4 col-lg-3">
				                                    <div class="input-group input-spinner">
				                                        <input type="button" value="-" class="modal-minus btn btn-sm" 
				                                               data-field="quantity" />
				                                        <input type="number" step="1" max="10" value="\${option.upd_qty}" 
				                                               name="quantity" class="quantity-field form-control-sm form-input" />
				                                        <input type="button" value="+" class="modal-plus btn btn-sm"
				                                               data-field="quantity" />
				                                    </div>
				                                </div>
				                                <!-- 업데이트된 수량 -->
				                                <div class="col-2 text-lg-end text-start text-md-end col-md-2">
				                                    <small class="fw-bold text-muted option-unit "> \${option.unit} g </small>
				                                </div>
				                            </div>
				                        </li>`;
				                    $('#recipeOptionsList').append(listItem); 
				                });
				                
				                $('#recipeOption').modal('show');
				            } else {
				                alert(response.message); 
				            }
				        },
				        error: function () {
				            alert('옵션 데이터 조회 중 오류 발생');
				        }
				    });
				    
				    
				    $('#saveRecipeOptions').off('click').on('click', function () {
			            let updatedOptions = [];
			            $('#recipeOptionsList .list-group-item').each(function () {
			            	let riId = parseInt($(this).data('ri-id'), 10); 
			                let ingId = parseInt($(this).data('ing-id'), 10); 
			                let newQty = parseInt($(this).find('.quantity-field').val(), 10); 
			                updatedOptions.push({
			                    ing_id: ingId,
			                   	ri_id: riId,
			                    qty: newQty
			                });
			            });

			            let requestData = {
			                cart_id: cartId,
			                options: updatedOptions
			            };
			            
			            console.log(JSON.stringify(requestData));

			            $.ajax({
			                url: `${pageContext.request.contextPath}/cart/updateRecipeOptions`,
			                type: 'POST',
			                contentType: 'application/json',
			                data: JSON.stringify(requestData),
			                success: function (response) {
			                    if (response.success) {
			                        /* alert("금액확인");  */
			                        $('#recipeOption').modal('hide'); 
			                        location.reload(); // 필요 시 페이지 새로고침
			                    } else {
			                        alert('옵션 업데이트 중 오류 발생: ' + response.message);
			                    }
			                },
			                error: function () {
			                    alert('서버와 통신 중 문제가 발생했습니다.');
			                }
			            });
			        });
				});
			
	    });
	   
	</script>
	<!-- Footer -->
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

</body>
</html>