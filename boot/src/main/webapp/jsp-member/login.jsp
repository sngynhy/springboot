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
								</header>

							<!-- Banner -->
								<section>
									<header class="main">
									<div>
										<h1 style="text-align: center;">Login</h1>
									</div>
									</header>
									<!-- 로그인 정보 입력 -->
									<div class="loginContextBox">		
										<div class="row gtr-uniform">
											<div class="col-6 col-12-xsmall" style="width: 200px;">
												<input type="text" name="id" id="id" placeholder="ID" />
											</div>
											<div class="col-6 col-12-xsmall" style="width: 200px;">
												<input type="password" name="pw" id="pw" placeholder="PASSWORD" />
											</div>
											<!-- 버튼 -->
											<div class="col-12">
												<ul class="actions">
													<li><input type="button" value="Login" class="primary" onclick="login()" /></li>
													<li><input type="button" value="Join" onclick="location.href='/jsp-member/join.jsp'"/></li>
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

	</body>
	<script type="text/javascript">
		function login() {
			if ($("#id").val() == '') {
				alert('아이디를 입력하세요.');
				$("#id").focus();
				return;
			}
			if ($("#pw").val() == '') {
				alert('비밀번호를 입력하세요.');
				$("#pw").focus();
				return;
			}
			
			$.ajax({ 
				type: "POST",
				url: "/login.do",
				data: {
					id : $("#id").val(),
					pw : $("#pw").val()
				},
				success: function(res) { 
					if (res == true) {  // 중복 데이터가 없을 때
						window.location.href = '/main.do';
					} else {
						alert("로그인에 실패하였습니다. 아이디 혹은 비밀번호 확인 후 다시 시도하세요.");
						$("#id").text("");
						$("#pw").text("");
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