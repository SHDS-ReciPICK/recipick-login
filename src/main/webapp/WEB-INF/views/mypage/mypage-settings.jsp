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
<title>회원정보 수정</title>
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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<!-- Theme CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script>
	var dupCheck = false;
    	function goSave() {
     		
    		var con = true;
    		
    		if (!con) return;
    		if ($("#pwd").val() == '') {
    			alert('비밀번호를 입력하세요');
    			$("#pwd").focus();
    			return;
    		}
    		if ($("#pwd").val() != $("#pw_check").val()) {
    			alert('비밀번호를 확인하세요');
    			return;
    		}
    		var reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;
    		if ($("#pwd").val().match(reg) == null) {
    			alert('비밀번호는 영문+숫자 조합으로 8자이상 입력하세요');
    			$("#pwd").val('');
    			$("#pwd_check").val('');
    			return;
    		}
    		if ($("#name").val() == '') {
    			alert('이름을 입력하세요');
    			$("#name").focus();
    			return;
    		}
    		// 전송
    		$("#frm").submit();
    	}
    	function goDelete() {
            if (confirm("정말로 계정을 삭제하시겠습니까?")) {
                const frm = document.getElementById('frm');
                frm.action = "delete.do"; // 폼 액션 변경
                frm.method = "post"; // HTTP 메서드 설정
                frm.submit(); // 폼 제출
            }
        }	
    	
    
    	
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

	<!-- 헤더 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/header.jsp" />

	<!-- 내브바 컴포넌트 -->
	<jsp:include page="/WEB-INF/views/components/navbar.jsp" />

	<script
		src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>
	<main>
		<!-- section -->
		<section>
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<div class="col-12">
						<div
							class="d-flex justify-content-between align-items-center d-md-none py-4">
							<!-- heading -->
							<h3 class="fs-5 mb-0">Account Setting</h3>
							<!-- button -->
							<button
								class="btn btn-outline-gray-400 text-muted d-md-none btn-icon btn-sm ms-3"
								type="button" data-bs-toggle="offcanvas"
								data-bs-target="#offcanvasAccount"
								aria-controls="offcanvasAccount">
								<i class="bi bi-text-indent-left fs-3"></i>
							</button>
						</div>
					</div>
					<!-- col -->
					<div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
						<div class="pt-10 pe-lg-10">
							<!-- nav -->
							<ul class="nav flex-column nav-pills nav-pills-dark">
								<!-- nav item -->
								<li class="nav-item"><a class="nav-link"
									aria-current="page"
									href="${pageContext.request.contextPath}/mypage-like"> <i
										class="feather-icon icon-shopping-bag me-2"></i> 좋아요
								</a></li>
								
								<li class="nav-item"><a class="nav-link"
									aria-current="page"
									href="${pageContext.request.contextPath}/mypage-myrecipe">
										<i class="feather-icon icon-shopping-bag me-2"></i> 내가 작성한 게시글
								</a></li>
								<li class="nav-item"><a class="nav-link"
									aria-current="page"
									href="${pageContext.request.contextPath}/mypage-review"> <i
										class="feather-icon icon-shopping-bag me-2"></i> 리뷰 관리
								</a></li>
								<li class="nav-item"><a class="nav-link"
									aria-current="page"
									href="${pageContext.request.contextPath}/mypage-orders"> <i
										class="feather-icon icon-shopping-bag me-2"></i> 주문/배송 조회
								</a></li>
								<!-- nav item -->
								<li class="nav-item"><a class="nav-link  active"
									href="${pageContext.request.contextPath}/mypage-settings">
										<i class="feather-icon icon-settings me-2"></i> 회원정보수정
								</a></li>


								<!-- nav item -->
								<li class="nav-item"><a class="nav-link"
									href="/recipe/logout.do"> <i
										class="feather-icon icon-log-out me-2"></i> Log out
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="py-6 p-md-6 p-lg-10">
							<div class="mb-6">
								<!-- heading -->
								<h2 class="mb-0">회원수정하기</h2>
							</div>
							<div>
								<!-- heading -->
								<h5 class="mb-4">회원 상세</h5>
								<div class="row">
									<div class="col-lg-5">
										<!-- form -->
										<form name="frm" id="frm" action="update.do" method="post">
											<!-- input -->
											<div class="mb-3">
												<label class="form-label">이메일</label>
												<div class="input-group">
													${vo.email }
													<%-- <input type="email" name="email" class="form-control" id="email" value="${vo.email }" required /> --%>


												</div>
											</div>
											<!-- input -->
											<div class="mb-3">
												<label class="form-label">닉네임</label> <input type="text"
													name="nickname" class="form-control" id="nickname"
													value=${vo.nickname } required />
											</div>

											<!-- input -->
											<div class="mb-5">
												<label class="form-label">비밀번호</label>
												<div class="password-field position-relative">
													<input type="text" class="form-control" name="pwd" id="pwd"
														placeholder="password" required />

													<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
												</div>
											</div>
											<div class="mb-5">
												<label class="form-label">비밀번호 확인</label>
												<div class="password-field position-relative">
													<input type="text" class="form-control" name="pw_check"
														id="pw_check" placeholder="password" required />

													<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
												</div>
											</div>
											<div class="mb-5">
												<label for="gender" class="form-label">성별</label>
												<div class="input-group">
													<span class="input-group-text"> <i
														class="bi bi-gender-ambiguous"></i>
													</span> <select name="gender" id="gender" class="form-select">
														<option value="m"
															<c:if test="${vo.gender == 'm'}">selected</c:if>>남성</option>
														<option value="f"
															<c:if test="${vo.gender == 'f'}">selected</c:if>>여성</option>
													</select>
												</div>
											</div>
											<div class="mb-5">
												<label class="form-label">이름</label> <input type="text"
													class="form-control" name="name" id="name"
													value="${vo.name }" required />

											</div>
											<div class="mb-5">
												<label class="form-label">생년월일</label> <input type="text"
													class="form-control" name="birth" id="birth"
													value=${vo.birth } required />

											</div>
											<div class="mb-5">
												<label class="form-label">휴대폰번호</label> <input type="text"
													class="form-control" name="phone" id="phone"
													value=${vo.phone } required />

											</div>
											<div class="mb-5">
												<label for="address" class="form-label">주소</label>
												<div class="input-group">
													<input type="text" id="address" name="address"
														class="form-control" value=${vo.address }>
													<button type="button" id="findAddress"
														class="btn btn-secondary">주소 찾기</button>
												</div>
											</div>
											<!-- button -->
											<div class="mb-3">
												<button type="button" class="btn btn-primary"
													onclick="goSave()">수정하기</button>
											</div>
											<input type="hidden" name="member_id"
												value="${vo.member_id }" /> <br>
											<div>
												<h5 class="mb-4">회원 탈퇴</h5>
												<p class="mb-2">계정을 삭제하시겠습니까?</p>
												<p class="mb-5">계정 삭제 시 주문 관련 정보들이 모두 삭제됩니다.</p>
												<button type="button" class="btn btn-outline-danger"
													onclick="goDelete()">계정을 삭제하고 싶습니다.</button>
											</div>

										</form>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
		</section>
	</main>

	<!-- 푸터 컴포넌트 -->
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

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		document.getElementById('findAddress').addEventListener('click', function () {
			new daum.Postcode({
				oncomplete: function (data) {
					// 도로명 주소를 변수에 저장
					var roadAddr = data.roadAddress; 
					var jibunAddr = data.jibunAddress; // 지번 주소
	
					// 입력창에 도로명 주소 표시
					document.getElementById('address').value = roadAddr || jibunAddr;
				}
			}).open();
		});
	</script>

	<script
		src="${pageContext.request.contextPath}/js/components/recipe-component.js"></script>
</body>

</html>