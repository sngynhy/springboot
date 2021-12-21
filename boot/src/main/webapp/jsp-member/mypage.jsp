<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<a href="main.jsp" class="logo"><strong>WANDERIZM</strong></a>
									<mytag:login />
								</header>

							<!-- Section -->
								<section style="padding-top: 35px;">
									<header class="major">
										<h3>나의 정보</h3>
									</header>
									
									<div class="row gtr-uniform" style="width: 600px;">
										<div class="col-6 col-12-xsmall">
											아이디<input type="text" name="id" id="id" value="${data.id}" readonly="readonly" />
										</div>
										<div class="col-6 col-12-xsmall">
											이메일<input type="email" name="email" id="email" value="${data.email}" readonly="readonly" />
										</div>
										<div class="col-6 col-12-xsmall">
											휴대폰 번호<input type="text" name="phone" id="phone" value="${data.phone}" readonly="readonly" />
										</div>

										<div class="col-6 col-12-xsmall">
											비밀번호<input type="password" name="pw" id="pw" placeholder="비밀번호 입력" />
										</div>
										
										<!-- 버튼 -->
										<div class="col-12">
											<ul class="actions">
												<li><input type="button" value="수정하기" onclick="checkPw()"class="button" /></li>
											</ul>
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
		function checkPw() {
			
			if ($("#pw").val() == '') {
				alert("비밀번호를 입력하세요.")
				$('#pw').focus();
				return;
			}
			
			$.ajax({ 
				type: "POST",
				url: "/checkPW.do",
				data: {
					id : $("#id").val(),
					pw : $("#pw").val()
				},
				success: function(res) { 
					if (res == true) {
						window.location.href = '/updateView.do';
					} else {
						alert("비밀번호가 일치하지 않습니다.");
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