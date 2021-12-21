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
		<style>
			.resultText {
			    color: red;
			    font-size: small;
			}
		</style>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header" style="padding-top: 30px;">
									<strong class="logo" style="color: #3d4449;">WANDERIZM</strong>
								</header>

							<!-- Section -->
								<section style="padding-top: 35px;">
									<header class="major">
										<h3>비밀번호 변경하기</h3>
									</header>
									
									<div class="row gtr-uniform" style="width: 600px;">
										<div class="col-6 col-12-xsmall">
											새 비밀번호<input type="password" name="pw" id="pw1" onkeyup="validPw1()" onchange="validPw2()" placeholder="새 비밀번호 입력" />
												<span class="resultText" id="resultPw1"></span>
										</div>
										<div class="col-6 col-12-xsmall">
											비밀번호 확인<input type="password" id="pw2" onkeyup="validPw2()" placeholder="비밀번호 확인" />
												<span class="resultText" id="resultPw2"></span>
										</div>
										
										<!-- Break -->
										<div class="col-12">
											<ul class="actions">
												<li><input type="button" value="확인" onclick="updatePw()" class="primary" /></li>
											</ul>
										</div>
									</div>
								</section>
							</div>
						</div>
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
		function updatePw() {
			if ($('#pw1').val() == "${sessionID}") {
				alert("아이디와 동일한 비밀번호는 사용할 수 없습니다.");
				$('#pw1').focus();
				return;
			}
			
			if(!validPw1()) {
				alert("비밀번호는 영문 소문자/숫자 조합으로 6자~12자 입력 가능합니다. (단, 아이디와 동일한 비밀번호는 사용할 수 없습니다.)");
				$('#pw1').focus();
				return;
			} else if (!validPw2()) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#pw2').value = "";
				$('#pw2').focus();
				return;
			}
			
			if ($("#pw1").val() == '') {
				alert('비밀번호를 입력하세요.');
				$("#pw1").focus();
				return;
			}
			if ($("#pw2").val() == '') {
				alert('비밀번호를 한번 더 확인해주세요.');
				$("#pw2").focus();
				return;
			}
			if ($("#pw1").val() != $("#pw2").val()) {
				alert('비밀번호가 일치하지 않습니다.');
				$("#pw2").focus();
				return;
			}
			
			$.ajax({ 
				type: "POST",
				url: "/updatePw.do",
				data: {
					pw : $("#pw1").val()
				},
				success: function(res) { 
					if (res == true) {  // 중복 데이터가 없을 때
						alert("성공적으로 변경되었습니다.");
						window.close();
					} else {
						alert("비밀번호 변경에 실패하였습니다. 확인 후 다시 시도해주세요.");
						$("#pw1").text("");
						$("#pw2").text("");
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