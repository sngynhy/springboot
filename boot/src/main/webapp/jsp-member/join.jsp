<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>WANDERIZM</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/assets/css/main.css" />
		<link rel="stylesheet" href="/assets/css/login.css" />
		<link rel="stylesheet" href="/assets/css/common.css" />
		<link rel="icon" href="/images/road-trip.png">
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="/main.do" class="logo"><strong>WANDERIZM</strong></a>
									<ul class="icons">
										<li><a href="/jsp-member/login.jsp" class="button">LOGIN</a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section>
									<header class="main">
									<div>
										<h1 style="text-align: center;">Join Us</h1>
									</div>
									</header>
									<br>
									<div class="joinContextBox">
										<input type="hidden" id="checkedId" value="false">
											<div class="row gtr-uniform">
												<!-- 회원 정보 입력 -->
												<div class="col-12 col-12-xsmall">
													<div class="form-options">
														<input type="text" class="mr10" name="id" id="id" onkeyup="validId()" onchange="changId()" placeholder="아이디 입력" />
														<button type="button" id="checkID_button" onclick="checkID()">중복확인</button>
													</div>
													<span class="resultText" id="resultId"></span>
												</div>
												<div class="col-12 col-12-xsmall">
													<input type="password" name="pw" id="pw1" onkeyup="validPw1()" onchange="validPw2()" placeholder="비밀번호 입력" />
													<span class="resultText" id="resultPw1"></span>
												</div>
												<div class="col-12 col-12-xsmall">
													<input type="password" id="pw2" onkeyup="validPw2()" placeholder="비밀번호 확인" />
													<span class="resultText" id="resultPw2"></span>
												</div>
												<div class="col-12 col-12-xsmall">
													<input type="email" name="email" id="email" onkeyup="validEmail()" placeholder="이메일 입력" />
													<span class="resultText" id="resultEmail"></span>
												</div>
												<div class="col-12 col-12-xsmall">
													<input type="text" name="phone" id="phone" onkeyup="validPhone()" placeholder="휴대폰 번호 입력" />
													<span class="resultText" id="resultPhone"></span>
												</div>
	
												<!-- 약관 동의 -->
												<div class="col-6 col-12-small">
													<input type="checkbox" id="accept" name="accept" />
													<label for="accept">약관 동의</label>
												</div>
												<!-- Break -->
												<div class="col-12">
													<textarea rows="6" readonly="readonly">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
													</textarea>
												</div>
												<!-- Break -->
												<div class="col-12">
													<ul class="actions">
														<li><input type="button" value="JOIN" onclick="join()" class="primary" /></li>
														<li><input type="button" value="CANCLE" onclick="location.href='/main.do'"/></li>
													</ul>
												</div>
											</div>
									</div>
									
								</section>
						</div>
					</div>

				<!-- Sidebar -->
					<mytag:sidebar />

			</div>

		<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/browser.min.js"></script>
			<script src="/assets/js/breakpoints.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>
			<script src="/assets/js/jquery-3.6.0.min.js"></script>
			<script src="/assets/js/validation.js"></script>
	</body>
	<script type="text/javascript">
		function join() {
			if(!joinValidate()) {
				return;
			}
			
			$.ajax({
				type: "POST",
				url: "/insertMember.do",
				data: {
					id: $("#id").val(),
					pw: $("#pw1").val(),
					email: $("#email").val(),
					phone: $("#phone").val()
				},
				success: function(res) { 
					if (res == true) {
						alert("성공적으로 회원가입이 완료되었습니다.");
						location.href="/jsp-member/login.jsp";
					} else {
						alert("회원가입에 실패하였습니다. 확인 후 다시 시도해주세요.");
					}
				},
				error: function(xhr) {
					console.log(xhr.status + " : " + xhr.errorText);
					alert("에러발생!");
				}
			});
		}
	</script>
</html>