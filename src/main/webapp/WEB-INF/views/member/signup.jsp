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
<title>회원가입</title>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script>
    	var dupCheck = false;
    	function goSave() {
    		if ($("#email").val() == '') {
    			alert('이메일을 입력하세요');
    			$("#email").focus();
    			return;
    		}
    		
    		if (!dupCheck) {
    			alert('이메일 중복여부를 체크해주세요');
    			return;
    		}
    		
    		var con = true;
    		$.ajax({
				url:'/emailCheck.do',
				data : {email:$("#email").val()},
				async : false,
				success : function(res) {
					console.log(res);
					if (res == '1') {
						alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
						con = false;
						return;
					}
				}
			});
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
    	
    	
    	$(function() {
    		$("#emailCheck").click(function() {
    			if ($("#email").val() == '') {
        			alert('이메일을 입력하세요');
        			$("#email").focus();
        			return;
        		} else {
        			const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        			 if (!emailRegex.test($("#email").val())) {
        		            alert('올바른 이메일 형식을 입력하세요');
        		            $("#email").focus();
        		            return;
        		        }
	    			$.ajax({
	    				url:'/recipick/emailCheck.do',
	    				data:{email:$('#email').val()},
	    				success:function(res) {
	    					console.log(res);
							if (res == '0') {
								dupCheck = true;
								alert('사용 가능한 이메일입니다.');
							} else {
								alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
							}
	    				}
	    			})
        		}
    		})
    	})
    	
    </script>

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
							src="${pageContext.request.contextPath}/images/svg-graphics/signup-g.svg"
							alt="" class="img-fluid" />
					</div>
					<!-- col -->
					<div
						class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
						<div class="mb-lg-9 mb-5">
							<h1 class="mb-1 h2 fw-bold">쇼핑을 시작하세요</h1>
							<p>레시픽에 오신 것을 환영합니다! 가입을 위한 정보를 기입해 주세요.</p>
						</div>
						<!-- form -->
						<!--  <form class="needs-validation" novalidate> -->
						<form name="frm" id="frm" action="insert.do" method="post">
							<div class="row g-3">
								<!-- col -->

								<div class="col-12">
									<!-- input -->
									<div class="input-group">

										<input type="email" name="email" class="form-control"
											id="email" placeholder="이메일" required />

										<button class="btn btn-primary" id="emailCheck" type="button">중복확인</button>


									</div>
								</div>
								<div class="col">
									<!-- input -->

									<input type="text" name="nickname" class="form-control"
										id="nickname" placeholder="닉네임" required />
									<div class="invalid-feedback">닉네임을 입력해주세요.</div>

								</div>

								<div class="col-12">
									<div class="password-field position-relative">

										<div class="password-field position-relative">
											<input type="password" class="form-control fakePassword"
												name="pwd" id="pwd" placeholder="비밀번호" required /> <span><i
												class="bi bi-eye-slash passwordToggler"></i></span>
											<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
										</div>
									</div>

								</div>
								<div class="col-12">
									<div class="password-field position-relative">

										<div class="password-field position-relative">
											<input type="password" class="form-control fakePassword"
												name="pw_check" id="pw_check" placeholder="비밀번호확인" required />
											<span><i class="bi bi-eye-slash passwordToggler"></i></span>
											<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
										</div>
									</div>
								</div>
								<div class="col-12">
									<select name="gender" id="gender" class="form-control">
										<option value="m">남성</option>
										<option value="f">여성</option>
									</select>
								</div>
								<div class="col-12">
									<!-- input -->

									<input type="text" class="form-control" name="name" id="name"
										placeholder="이름" required />
									<div class="invalid-feedback">이름을 입력해주세요.</div>

								</div>
								<div class="col-12">
									<!-- input -->

									<input type="text" class="form-control" name="birth" id="birth"
										placeholder="생년월일" required />
									<div class="invalid-feedback">생년월일을 입력해주세요.</div>

								</div>
								<div class="col-12">
									<!-- input -->

									<input type="text" class="form-control" name="phone" id="phone"
										placeholder="휴대폰번호" required />
									<div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>

								</div>
								<div class="col-12">
									<!-- input -->



									<div class="input-group">
										<input type="text" id="address" name="address"
											class="form-control" placeholder="주소를 입력하세요">
										<button type="button" id="findAddress"
											class="btn btn-secondary">주소 찾기</button>
									</div>
								</div>



								<!-- btn -->
								<div class="col-12 d-grid">
									<button type="button" class="btn btn-primary"
										onclick="goSave()">가입하기</button>
								</div>

								<p></p>
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
</body>

</html>