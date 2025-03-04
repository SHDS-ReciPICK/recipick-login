<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 필터 사이드바 -->
		<div class="filter-ing-content">
			<div class="offcanvas offcanvas-start offcanvas-collapse w-md-50" tabindex="-1" id="offcanvasCategory"
				aria-labelledby="offcanvasCategoryLabel">

				<!-- 필터 바디 -->
				<div class="offcanvas-body ps-lg-2 pt-lg-0">
					<!-- 전체 카테고리 섹션 -->
					<div class="mb-8">
						<!-- title -->
						<h5 class="mb-3">전체 카테고리</h5>
						<ul class="nav nav-category" id="categoryCollapseMenu">

							<!-- 대분류1 -->
							<li class="nav-item border-bottom w-100"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
									data-bs-target="#categoryFlushOne" aria-expanded="false" aria-controls="categoryFlushOne"
									data-category="신선식품류">신선식품류 <i class="feather-icon icon-chevron-right"></i>
								</a>
								<!-- accordion collapse -->
								<div id="categoryFlushOne" class="accordion-collapse collapse" data-bs-parent="#categoryCollapseMenu">
									<div>
										<ul class="nav flex-column ms-3">
											<!-- 중분류 -->
											<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed"
													data-bs-toggle="collapse" data-bs-target="#subCategoryOne1" aria-expanded="false"
													aria-controls="subCategoryOne1" data-category="채소•과일•견과류">채소•과일•견과류
													<i class="feather-icon icon-chevron-right"></i>
												</a>
												<!-- 소분류 체크박스 -->
												<div id="subCategoryOne1" class="accordion-collapse collapse"
													data-bs-parent="#categoryFlushOne">
													<ul class="nav flex-column ms-3">
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-111"
																	data-main="신선식품류" data-sub="채소•과일•견과류" data-detail="채소류">
																<label class="form-check-label w-100 py-2 px-2 rounded"
																	for="category-ing-111">채소류</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-112"
																	data-main="신선식품류" data-sub="채소•과일•견과류" data-detail="과일류">
																<label class="form-check-label w-100 py-2 px-2 rounded"
																	for="category-ing-112">과일류</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-113"
																	data-main="신선식품류" data-sub="채소•과일•견과류" data-detail="견과류">
																<label class="form-check-label w-100 py-2 px-2 rounded"
																	for="category-ing-113">견과류</label>
															</div>
														</li>
													</ul>
												</div>
											</li>

											<!-- 중분류 -->
											<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed"
													data-bs-toggle="collapse" data-bs-target="#subCategoryTwo1" aria-expanded="false"
													aria-controls="subCategoryTwo1" data-category="수산•해산•건어물">수산•해산•건어물
													<i class="feather-icon icon-chevron-right"></i>
												</a>
												<!-- 소분류 체크박스 -->
												<div id="subCategoryTwo1" class="accordion-collapse collapse"
													data-bs-parent="#categoryFlushOne">
													<ul class="nav flex-column ms-3">
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-121"
																	data-main="신선식품류" data-sub="수산•해산•건어물" data-detail="생선류">
																<label class="form-check-label w-100 py-2 px-2 rounded"
																	for="category-ing-121">생선류</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-122"
																	data-main="신선식품류" data-sub="수산•해산•건어물" data-detail="해산물">
																<label class="form-check-label w-100 py-2 px-2 rounded"
																	for="category-ing-122">해산물</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-123"
																	data-main="신선식품류" data-sub="수산•해산•건어물" data-detail="가공품">
																<label class="form-check-label w-100 py-2 px-2 rounded"
																	for="category-ing-123">가공품</label>
															</div>
														</li>
													</ul>
												</div>
											</li>
											<!-- 중분류 -->
											<li class="nav-item"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
													data-bs-target="#subCategoryThree1" aria-expanded="false" aria-controls="subCategoryThree1"
													data-category="정육•가공육•계란">정육•가공육•계란
													<i class="feather-icon icon-chevron-right"></i>
												</a>
												<!-- 소분류 체크박스 -->
												<div id="subCategoryThree1" class="accordion-collapse collapse"
													data-bs-parent="#categoryFlushOne">
													<ul class="nav flex-column ms-3">
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-131"
																	data-main="신선식품류" data-sub="정육•가공육•계란" data-detail="생선류">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-131">생선류
																</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-132"
																	data-main="신선식품류" data-sub="정육•가공육•계란" data-detail="가공육">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-132">가공육
																</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-133"
																	data-main="신선식품류" data-sub="정육•가공육•계란" data-detail="계란육">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-133">계란육
																</label>
															</div>
														</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>

							<!-- 대분류2 -->
							<li class="nav-item border-bottom w-100"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
									data-bs-target="#categoryFlushTwo" aria-expanded="false" aria-controls="categoryFlushTwo"
									data-category="가공식품류">가공식품류 <i class="feather-icon icon-chevron-right"></i>
								</a> <!-- accordion collapse -->
								<div id="categoryFlushTwo" class="accordion-collapse collapse" data-bs-parent="#categoryCollapseMenu">
									<div>
										<ul class="nav flex-column ms-3">
											<!-- 중분류 -->
											<li class="nav-item"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
													data-bs-target="#subCategoryOne2" aria-expanded="false" aria-controls="subCategoryOne2"
													data-category="면•양념•오일">면•양념•오일
													<i class="feather-icon icon-chevron-right"></i>
												</a>
												<!-- 소분류 체크박스 -->
												<div id="subCategoryOne2" class="accordion-collapse collapse"
													data-bs-parent="#categoryFlushTwo">
													<ul class="nav flex-column ms-3">
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-211"
																	data-main="가공식품류" data-sub="면•양념•오일" data-detail="면류">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-211">면류
																</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-212"
																	data-main="가공식품류" data-sub="면•양념•오일" data-detail="소스•양념">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-212">소스•양념
																</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-213"
																	data-main="가공식품류" data-sub="면•양념•오일" data-detail="가공식품">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-213">가공식품
																</label>
															</div>
														</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>

							<!-- 대분류3 -->
							<li class="nav-item border-bottom w-100"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
									data-bs-target="#categoryFlushThree" aria-expanded="false" aria-controls="categoryFlushThree"
									data-category="음료류">음료류 <i class="feather-icon icon-chevron-right"></i>
								</a> <!-- accordion collapse -->
								<div id="categoryFlushThree" class="accordion-collapse collapse" data-bs-parent="#categoryCollapseMenu">
									<div>
										<ul class="nav flex-column ms-3">
											<!-- 중분류 -->
											<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed"
													data-bs-toggle="collapse" data-bs-target="#subCategoryOne3" aria-expanded="false"
													aria-controls="subCategoryOne3" data-category="생수•음료류">생수•음료류
													<i class="feather-icon icon-chevron-right"></i>
												</a>
												<!-- 소분류 항목 체크박스로 구현 -->
												<div id="subCategoryOne3" class="accordion-collapse collapse"
													data-bs-parent="#categoryFlushThree">
													<ul class="nav flex-column ms-3">
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-311"
																	data-main="음료류" data-sub="생수•음료류" data-detail="생수류">
																<label class="form-check-label w-100 py-2 px-2 rounded"
																	for="category-ing-311">생수류</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-312"
																	data-main="음료류" data-sub="생수•음료류" data-detail="음료">
																<label class="form-check-label w-100 py-2 px-2 rounded"
																	for="category-ing-312">음료</label>
															</div>
														</li>
													</ul>
												</div>
											</li>
											<!-- 중분류 -->
											<li class="nav-item"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
													data-bs-target="#subCategoryTwo3" aria-expanded="false" aria-controls="subCategoryTwo3"
													data-category="커피•차">커피•차<i class="feather-icon icon-chevron-right"></i>
												</a>
												<!-- 소분류 항목 체크박스로 구현 -->
												<div id="subCategoryTwo3" class="accordion-collapse collapse"
													data-bs-parent="#categoryFlushThree">
													<ul class="nav flex-column ms-3">
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-321"
																	data-main="음료류" data-sub="커피•차" data-detail="커피">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-321">커피
																</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-322"
																	data-main="음료류" data-sub="커피•차" data-detail="차류">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-322">차류
																</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-323"
																	data-main="음료류" data-sub="커피•차" data-detail="용품">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-323">용품
																</label>
															</div>
														</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>

							<!-- 대분류4 -->
							<li class="nav-item border-bottom w-100"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
									data-bs-target="#categoryFlushFour" aria-expanded="false" aria-controls="categoryFlushFour"
									data-category="유가공류">유가공류 <i class="feather-icon icon-chevron-right"></i>
								</a>
								<!-- accordion collapse -->
								<div id="categoryFlushFour" class="accordion-collapse collapse" data-bs-parent="#categoryCollapseMenu">
									<div>
										<!-- nav -->
										<ul class="nav flex-column ms-3">
											<!-- 중분류 -->
											<li class="nav-item"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
													data-bs-target="#subCategoryOne4" aria-expanded="false" aria-controls="subCategoryOne4"
													data-category="유제품">유제품 <i class="feather-icon icon-chevron-right"></i>
												</a>
												<!-- 소분류 -->
												<div id="subCategoryOne4" class="accordion-collapse collapse"
													data-bs-parent="#categoryFlushFour">
													<ul class="nav flex-column ms-3">
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-411"
																	data-main="유가공류" data-sub="유제품" data-detail="우류휴">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-411">우류휴
																</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-412"
																	data-main="유가공류" data-sub="유제품" data-detail="치즈•버터">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-412">치즈•버터
																</label>
															</div>
														</li>
														<li class="nav-item">
															<div class="form-check d-flex align-items-center m-0">
																<input class="form-check-input category-checkbox" type="checkbox" id="category-ing-413"
																	data-main="유가공류" data-sub="유제품" data-detail="냉장•냉동">
																<label class="form-check-label w-100 py-2 px-2 rounded" for="category-ing-413">냉장•냉동
																</label>
															</div>
														</li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</div>

					<!-- 가격대 섹션 -->
					<div class="mb-8">
						<h5 class="mb-3">가격대</h5>
						<div class="d-flex flex-wrap gap-2">
							<!-- 가격대 버튼들 -->
							<button type="button" class="btn btn-outline-secondary price-range-btn" data-min="0" data-max="1000">
								1천원 이하
							</button>
							<button type="button" class="btn btn-outline-secondary price-range-btn" data-min="1000"
								data-max="10000">1천원~1만원</button>
							<button type="button" class="btn btn-outline-secondary price-range-btn" data-min="10000" data-max="0">1만원
								이상</button>
						</div>

						<!-- 가격대 섹션 직접 입력 부분 -->
						<div class="mt-3">
							<!-- 가격대 직접 입력 부분 -->
							<div class="input-group">
								<input type="number" class="form-control" id="minPriceInput" value="${currentMinDiscountPrice}"
									placeholder="최소 가격">
								<span class="input-group-text">~</span>
								<input type="number" class="form-control" id="maxPriceInput" value="${currentMaxDiscountPrice}"
									placeholder="최대 가격">
								<button class="btn btn-primary" id="applyPriceRange">적용</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>