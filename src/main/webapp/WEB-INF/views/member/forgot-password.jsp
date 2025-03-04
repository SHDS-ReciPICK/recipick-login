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
<title>비밀번호 찾기</title>
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
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row justify-content-center align-items-center">
					<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
						<!-- img -->
						<img
							src="${pageContext.request.contextPath}/images/svg-graphics/fp-g.svg"
							alt="" class="img-fluid" />
					</div>
					<div
						class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1 d-flex align-items-center">
						<div>
							<div class="mb-lg-9 mb-5">
								<!-- heading -->
								<h1 class="mb-2 h2 fw-bold">비밀번호를 잊으셨나요?</h1>
								<p>계정에 대한 비밀번호를 입력해 주십시오. 비밀번호를 초기화하기 위한 링크를 보낼 것입니다.</p>
							</div>
							<!-- form -->
							<form class="needs-validation" novalidate>
								<!-- row -->
								<div class="row g-3">
									<!-- col -->
									<div class="col-12">
										<!-- input -->
										<label for="formForgetEmail"
											class="form-label visually-hidden">Email address</label> <input
											type="email" class="form-control" id="formForgetEmail"
											placeholder="이메일" required />
										<div class="invalid-feedback">올바른 이메일을 입력하세요.</div>
									</div>

									<!-- btn -->
									<div class="col-12 d-grid gap-2">
										<button type="submit" class="btn btn-primary">초기화하기</button>
										<a href="${pageContext.request.contextPath}/signin.do"
											class="btn btn-light">뒤로가기</a>
									</div>
								</div>
							</form>
						</div>
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

	<script
		src="${pageContext.request.contextPath}/js/vendors/validation.js"></script>
</body>

</html>