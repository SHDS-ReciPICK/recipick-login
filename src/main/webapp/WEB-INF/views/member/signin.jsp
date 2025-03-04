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
<title>로그인</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script>
  	function loginCheck(){
  		if($("#email").val() == ''){
  			alert('이메일을 입력해 주십시오')
  			$("#email").focus()
  			return false
  		}
  		 if($("#pwd").val() == ''){
  			alert('비밀번호를 입력해 주십시오')
  			$("#pwd").focus() 
  			return false
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
	<!-- navigation -->
	<div class="border-bottom shadow-sm">
		<nav class="navbar navbar-light py-2">
			<div
				class="container justify-content-center justify-content-lg-between">

				<!-- 로고 -->
				<a class="navbar-brand d-none d-lg-block"
					href="${isRecipePage ? pageContext.request.contextPath.concat('/recipe') : pageContext.request.contextPath.concat('/ingredient')}">
					<img
					src="${pageContext.request.contextPath}/images/logo/recipick-logo-orange.svg"
					alt="eCommerce HTML Template" />
				</a>
				<div class="d-flex justify-content-between w-100 d-lg-none">
					<a class="navbar-brand" href="../index.html"> <img
						src="${pageContext.request.contextPath}/images/logo/recipick-log-orange.svg"
						alt="eCommerce HTML Template" />
					</a>
				</div>

			</div>
		</nav>
	</div>


	<main>
		<!-- section -->
		<section class="my-lg-14 my-8">
			<div class="container">
				<!-- row -->
				<div class="row justify-content-center align-items-center">
					<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
						<!-- img -->
						<img
							src="${pageContext.request.contextPath}/images/svg-graphics/signin-g.svg"
							alt="" class="img-fluid" />
					</div>
					<!-- col -->
					<div
						class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
						<div class="mb-lg-9 mb-5">
							<h1 class="mb-1 h2 fw-bold">로그인하기</h1>
							<p>레시픽에 오신 것을 환영합니다! 이메일을 입력해 주십시오.</p>
						</div>

						<form action="signin.do" method="post" id="board1" name="board1"
							onsubmit="return loginCheck();">
							<div class="row g-3">
								<!-- row -->

								<div class="col-12">
									<!-- input -->

									<input type="email" class="form-control" id="email"
										name="email" placeholder="이메일" required />
									<div class="invalid-feedback">이메일을 입력해 주십시오.</div>
								</div>
								<div class="col-12">
									<!-- input -->
									<div class="password-field position-relative">

										<div class="password-field position-relative">
											<input type="password" class="form-control fakePassword"
												id="pwd" name="pwd" placeholder="*****" required /> <span><i
												class="bi bi-eye-slash passwordToggler"></i></span>
											<div class="invalid-feedback">비밀번호를 입력해 주십시오.</div>
										</div>
									</div>
								</div>
								<div class="d-flex justify-content-between">
									<!-- form check -->
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="saveEmail" />
										<label class="form-check-label" for="saveEmail">이메일 저장</label>
									</div>
									<div>
										비밀번호를 잊어버렸나요? <a
											href="${pageContext.request.contextPath}/forgot-password">비밀번호
											찾기</a>
									</div>
								</div>
								<!-- btn -->
								<div class="col-12 d-grid">
									<button type="submit" class="btn btn-primary">로그인</button>

								</div>
								<!-- link -->
								<div>
									계정이 없으신가요? <a
										href="${pageContext.request.contextPath}/signup.do">회원가입하기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Footer -->
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

	<script src="${pageContext.request.contextPath}/js/vendors/password.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>
	<script>
  document.addEventListener("DOMContentLoaded", function () {
	    const emailInput = document.getElementById("email");
	    const saveEmailCheckbox = document.getElementById("saveEmail");

	    // 페이지 로드 시 로컬 저장소에서 이메일 불러오기
	    const savedEmail = localStorage.getItem("savedEmail");
	    if (savedEmail) {
	        emailInput.value = savedEmail;
	        saveEmailCheckbox.checked = true; // 체크박스 자동 체크
	    }

	    // 폼 제출 이벤트
	    document.getElementById("board1").addEventListener("submit", function () {
	        if (saveEmailCheckbox.checked) {
	            // 이메일 저장
	            localStorage.setItem("savedEmail", emailInput.value);
	        } else {
	            // 이메일 삭제
	            localStorage.removeItem("savedEmail");
	        }
	    });
	});</script>
</body>

</html>