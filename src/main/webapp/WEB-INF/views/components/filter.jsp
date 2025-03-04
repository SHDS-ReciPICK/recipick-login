<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 필터 사이드바 -->
		<div class="filter-content">
			<c:if test="${viewType ne 'best' and viewType ne 'discount'}">
				<div class="offcanvas offcanvas-start offcanvas-collapse w-md-50" tabindex="-1" id="offcanvasCategory"
					aria-labelledby="offcanvasCategoryLabel">
					<!-- 필터 바디 -->
					<div class="offcanvas-body ps-lg-2 pt-lg-0">
						<!-- 전체 카테고리 섹션 -->
						<div class="mb-8">
							<h5 class="mb-3">전체 카테고리</h5>
							<ul class="nav nav-category" id="categoryCollapseMenu">

								<!-- 한식 대분류 -->
								<li class="nav-item border-bottom w-100" data-main-category="korean"><a href="#"
										class="nav-link collapsed category-link" data-bs-toggle="collapse"
										data-bs-target="#categoryFlushOne" aria-expanded="false" aria-controls="categoryFlushOne"
										data-category="한식">한식 <i class="feather-icon icon-chevron-right"></i>
									</a>
									<div id="categoryFlushOne" class="accordion-collapse collapse" data-bs-parent="#categoryCollapseMenu">
										<div>
											<ul class="nav flex-column ms-3">
												<!-- 중분류 -->
												<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed category-link"
														data-bs-toggle="collapse" data-bs-target="#subCategoryOne1" data-category="일상식"
														aria-expanded="false" aria-controls="subCategoryOne1">일상식 <i
															class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 체크박스 -->
													<div id="subCategoryOne1" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushOne">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-111"
																		data-main="한식" data-sub="일상식" data-detail="밥류•죽류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-111">밥류•죽류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-112"
																		data-main="한식" data-sub="일상식" data-detail="찌개•국물류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-112">찌개•국물류 </label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-113"
																		data-main="한식" data-sub="일상식" data-detail="구이•볶음류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-113">구이•볶음류 </label>
																</div>
															</li>
														</ul>
													</div>
												</li>

												<!-- 중분류 -->
												<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed category-link"
														data-bs-toggle="collapse" data-bs-target="#subCategoryTwo1" data-category="특별식"
														aria-expanded="false" aria-controls="subCategoryTwo1">특별식 <i
															class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 체크박스 -->
													<div id="subCategoryTwo1" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushOne">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-121"
																		data-main="한식" data-sub="특별식" data-detail="명절요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-121">명절요리</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-122"
																		data-main="한식" data-sub="특별식" data-detail="제사•차례상"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-122">제사•차례상</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-123"
																		data-main="한식" data-sub="특별식" data-detail="잔치요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-123">잔치요리</label>
																</div>
															</li>
														</ul>
													</div>
												</li>
												<!-- 중분류 -->
												<li class="nav-item"><a href="#" class="nav-link collapsed category-link"
														data-bs-toggle="collapse" data-bs-target="#subCategoryThree1" data-category="건강식"
														aria-expanded="false" aria-controls="subCategoryThree1">건강식 <i
															class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 체크박스 -->
													<div id="subCategoryThree1" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushOne">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-131"
																		data-main="한식" data-sub="건강식" data-detail="나물류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-131">나물류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-132"
																		data-main="한식" data-sub="건강식" data-detail="찜•구이류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-132">찜•구이류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-133"
																		data-main="한식" data-sub="건강식" data-detail="약선요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-133">약선요리</label>
																</div>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</li>

								<!-- 일식 -->
								<li class="nav-item border-bottom w-100" data-main-category="korean"><a href="#"
										class="nav-link collapsed category-link" data-bs-toggle="collapse"
										data-bs-target="#categoryFlushTwo" aria-expanded="false" aria-controls="categoryFlushTwo"
										data-category="일식">일식 <i class="feather-icon icon-chevron-right"></i>
									</a> <!-- accordion collapse -->
									<div id="categoryFlushTwo" class="accordion-collapse collapse" data-bs-parent="#categoryCollapseMenu">
										<div>
											<ul class="nav flex-column ms-3">
												<!-- 중분류 -->
												<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed category-link"
														data-bs-toggle="collapse" data-bs-target="#subCategoryOne2" data-category="일상식"
														aria-expanded="false" aria-controls="subCategoryOne2">일상식 <i
															class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 체크박스 -->
													<div id="subCategoryOne2" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushTwo">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-211"
																		data-main="일식" data-sub="일상식" data-detail="덮밥류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-211">덮밥류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-212"
																		data-main="일식" data-sub="일상식" data-detail="면류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-212">면류 </label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-213"
																		data-main="일식" data-sub="일상식" data-detail="구이류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-213">구이류</label>
																</div>
															</li>
														</ul>
													</div>
												</li>
												<!-- 중분류 -->
												<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed"
														data-bs-toggle="collapse" data-bs-target="#subCategoryTwo2" data-category="특별식"
														aria-expanded="false" aria-controls="subCategoryTwo2">특별식
														<i class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 체크박스 -->
													<div id="subCategoryTwo2" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushTwo">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-221"
																		data-main="일식" data-sub="특별식" data-detail="스시•롤"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-221">스시•롤 </label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-222"
																		data-main="일식" data-sub="특별식" data-detail="전통요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-222">전통요리</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-223"
																		data-main="일식" data-sub="특별식" data-detail="이자카야요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-223">이자카야요리 </label>
																</div>
															</li>
														</ul>
													</div>
												</li>
												<!-- 중분류 -->
												<li class="nav-item"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
														data-bs-target="#subCategoryThree2" data-category="건강식" aria-expanded="false"
														aria-controls="subCategoryThree2">건강식
														<i class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 체크박스 -->
													<div id="subCategoryThree2" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushTwo">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-231"
																		data-main="일식" data-sub="건강식" data-detail="찜류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-231">찜류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-232"
																		data-main="일식" data-sub="건강식" data-detail="국물류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-232">국물류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-233"
																		data-main="일식" data-sub="건강식" data-detail="채소요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-233">채소요리 </label>
																</div>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</li>

								<!-- 중식 -->
								<li class="nav-item border-bottom w-100" data-main-category="korean"><a href="#"
										class="nav-link collapsed category-link" data-bs-toggle="collapse"
										data-bs-target="#categoryFlushThree" aria-expanded="false" aria-controls="categoryFlushThree"
										data-category="중식">중식 <i class="feather-icon icon-chevron-right"></i>
									</a> <!-- accordion collapse -->
									<div id="categoryFlushThree" class="accordion-collapse collapse"
										data-bs-parent="#categoryCollapseMenu">
										<div>
											<ul class="nav flex-column ms-3">
												<!-- 중분류 -->
												<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed"
														data-bs-toggle="collapse" data-bs-target="#subCategoryOne3" data-category="일상식"
														aria-expanded="false" aria-controls="subCategoryOne3">일상식
														<i class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 항목 체크박스로 구현 -->
													<div id="subCategoryOne3" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushThree">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-311"
																		data-main="중식" data-sub="일상식" data-detail="면•밥류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-311">면•밥류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-312"
																		data-main="중식" data-sub="일상식" data-detail="볶음류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-312">볶음류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-313"
																		data-main="중식" data-sub="일상식" data-detail="딤섬류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-313">딤섬류</label>
																</div>
															</li>
														</ul>
													</div>
												</li>
												<!-- 중분류 -->
												<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed"
														data-bs-toggle="collapse" data-bs-target="#subCategoryTwo3" data-category="특별식"
														aria-expanded="false" aria-controls="subCategoryTwo3">특별식
														<i class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 항목 체크박스로 구현 -->
													<div id="subCategoryTwo3" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushThree">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-321"
																		data-main="중식" data-sub="특별식" data-detail="고급요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-321">고급요리</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-322"
																		data-main="중식" data-sub="특별식" data-detail="코스요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-322">코스요리</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-323"
																		data-main="중식" data-sub="특별식" data-detail="연회요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-323">연회요리</label>
																</div>
															</li>
														</ul>
													</div>
												</li>
												<!-- 중분류 -->
												<li class="nav-item"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
														data-category="건강식" data-bs-target="#subCategoryThree3" aria-expanded="false"
														aria-controls="subCategoryThree3">
														건강식 <i class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 항목 체크박스로 구현 -->
													<div id="subCategoryThree3" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushThree">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-331"
																		data-main="중식" data-sub="건강식" data-detail="찜•탕류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-331">찜•탕류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-332"
																		data-main="중식" data-sub="건강식" data-detail="채소요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-332">채소요리</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-333"
																		data-main="중식" data-sub="건강식" data-detail="약선요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-333">약선요리 </label>
																</div>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</li>

								<!-- 양식 -->
								<li class="nav-item border-bottom w-100" data-main-category="korean"><a href="#"
										class="nav-link collapsed category-link" data-bs-toggle="collapse"
										data-bs-target="#categoryFlushFour" aria-expanded="false" aria-controls="categoryFlushFour"
										data-category="양식">양식 <i class="feather-icon icon-chevron-right"></i>
									</a> <!-- accordion collapse -->
									<div id="categoryFlushFour" class="accordion-collapse collapse"
										data-bs-parent="#categoryCollapseMenu">
										<div>
											<!-- nav -->
											<ul class="nav flex-column ms-3">
												<!-- 중분류 -->
												<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed"
														data-bs-toggle="collapse" data-bs-target="#subCategoryOne4" data-category="일상식"
														aria-expanded="false" aria-controls="subCategoryOne4">일상식
														<i class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 -->
													<div id="subCategoryOne4" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushFour">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-411"
																		data-main="양식" data-sub="일상식" data-detail="파스타류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-411">파스타류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-412"
																		data-main="양식" data-sub="일상식" data-detail="샌드위치•버거류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-412">샌드위치•버거류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-413"
																		data-main="양식" data-sub="일상식" data-detail="오믈렛•에그류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-413">오믈렛•에그류</label>
																</div>
															</li>
														</ul>
													</div>
												</li>
												<!-- 중분류 -->
												<li class="nav-item border-bottom"><a href="#" class="nav-link collapsed"
														data-bs-toggle="collapse" data-bs-target="#subCategoryTwo4" data-category="특별식"
														aria-expanded="false" aria-controls="subCategoryTwo4">특별식
														<i class="feather-icon icon-chevron-right"></i>
													</a> <!-- 소분류 -->
													<div id="subCategoryTwo4" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushFour">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-421"
																		data-main="양식" data-sub="특별식" data-detail="스테이크류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-421">스테이크류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-422"
																		data-main="양식" data-sub="특별식" data-detail="해산물요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-422">해산물요리</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-423"
																		data-main="양식" data-sub="특별식" data-detail="코스요리"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-423">코스요리</label>
																</div>
															</li>
														</ul>
													</div>
												</li>
												<!-- 중분류 -->
												<li class="nav-item"><a href="#" class="nav-link collapsed" data-bs-toggle="collapse"
														data-bs-target="#subCategoryThree4" data-category="건강식" aria-expanded="false"
														aria-controls="subCategoryThree4">건강식
														<i class="feather-icon icon-chevron-right"></i>
													</a>
													<!-- 소분류 -->
													<div id="subCategoryThree4" class="accordion-collapse collapse"
														data-bs-parent="#categoryFlushFour">
														<ul class="nav flex-column ms-3">
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-431"
																		data-main="양식" data-sub="건강식" data-detail="샐러드류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-431">샐러드류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-432"
																		data-main="양식" data-sub="건강식" data-detail="구운요리류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-432">구운요리류</label>
																</div>
															</li>
															<li class="nav-item">
																<div class="form-check d-flex align-items-center m-0">
																	<input class="form-check-input category-checkbox" type="checkbox" id="category-433"
																		data-main="양식" data-sub="건강식" data-detail="수프류"> <label
																		class="form-check-label w-100 py-2 px-2 rounded" for="category-433">수프류</label>
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
								<button type="button" class="btn btn-outline-secondary price-range-btn" data-min="0"
									data-max="10000">1만원 이하</button>
								<button type="button" class="btn btn-outline-secondary price-range-btn" data-min="10000"
									data-max="30000">1만원~3만원</button>
								<button type="button" class="btn btn-outline-secondary price-range-btn" data-min="30000"
									data-max="50000">3만원~5만원</button>
								<button type="button" class="btn btn-outline-secondary price-range-btn" data-min="50000"
									data-max="0">5만원 이상</button>
							</div>

							<!-- 가격대 섹션 직접 입력 부분 -->
							<div class="mt-3">
								<div class="input-group">
									<input type="number" class="form-control" id="minPriceInput" placeholder="최소 가격"> <span
										class="input-group-text">~</span>
									<input type="number" class="form-control" id="maxPriceInput" placeholder="최대 가격">
									<button class="btn btn-primary" id="applyPriceRange">적용</button>
								</div>
							</div>
						</div>

						<!-- 평점 섹션 -->
						<div class="mb-8">
							<h5 class="mb-3">평점</h5>
							<div>
								<!-- 5점 -->
								<div class="form-check mb-2">
									<input class="form-check-input rating-checkbox" type="checkbox" id="ratingFive" data-rating="5">
									<label class="form-check-label d-flex align-items-center gap-2" for="ratingFive"> <span
											class="text-warning d-flex gap-1"> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
										</span> <span class="small text-muted">(5.0)</span>
									</label>
								</div>
								<!-- 4점 -->
								<div class="form-check mb-2">
									<input class="form-check-input rating-checkbox" type="checkbox" id="ratingFour" data-rating="4">
									<label class="form-check-label d-flex align-items-center gap-2" for="ratingFour"> <span
											class="text-warning d-flex gap-1"> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i class="bi bi-star"></i>
										</span> <span class="small text-muted">(4.0)</span>
									</label>
								</div>
								<!-- 3점 -->
								<div class="form-check mb-2">
									<input class="form-check-input rating-checkbox" type="checkbox" id="ratingThree" data-rating="3">
									<label class="form-check-label d-flex align-items-center gap-2" for="ratingThree"> <span
											class="text-warning d-flex gap-1"> <i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
										</span> <span class="small text-muted">(3.0)</span>
									</label>
								</div>

								<!-- 2점 -->
								<div class="form-check mb-2">
									<input class="form-check-input rating-checkbox" type="checkbox" id="ratingTwo" data-rating="2"> <label
										class="form-check-label d-flex align-items-center gap-2" for="ratingTwo"> <span
											class="text-warning d-flex gap-1">
											<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											<i class="bi bi-star"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i>
										</span> <span class="small text-muted">(2.0)</span>
									</label>
								</div>

								<!-- 1점 -->
								<div class="form-check mb-2">
									<input class="form-check-input rating-checkbox" type="checkbox" id="ratingOne" data-rating="1"> <label
										class="form-check-label d-flex align-items-center gap-2" for="ratingOne"> <span
											class="text-warning d-flex gap-1">
											<i class="bi bi-star-fill"></i> <i class="bi bi-star"></i> <i class="bi bi-star"></i> <i
												class="bi bi-star"></i> <i class="bi bi-star"></i>
										</span> <span class="small text-muted">(1.0)</span>
									</label>
								</div>
							</div>
						</div>

					</div>
				</div>
			</c:if>
		</div>