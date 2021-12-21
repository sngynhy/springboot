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
								<header id="header">
									<a href="main.jsp" class="logo"><strong>WANDERIZM</strong></a>
									<mytag:login />
								</header>

							<!-- Section -->
								<section style="padding-top: 35px;">
									<header class="major">
										<h3>나의 정보 수정</h3>
									</header>
									<div class="row gtr-uniform" style="width: 600px;">
										<div class="col-6 col-12-xsmall">
											아이디<input type="text" name="id" id="id" value="${data.id}" readonly="readonly" />
										</div>
										<div class="col-6 col-12-xsmall">
											이메일<input type="email" name="email" id="email" value="${data.email}" onkeyup="validEmail()" />
											<span class="resultText" id="resultEmail"></span>
										</div>
										<div class="col-6 col-12-xsmall">
											휴대폰 번호<input type="text" name="phone" id="phone" value="${data.phone}" onkeyup="validPhone()" />
											<span class="resultText" id="resultPhone"></span>
										</div>

										<div class="col-6 col-12-xsmall">
											비밀번호<br><input type="button" id="pw" onclick="updatePw()" class="button small" value="비밀번호 변경하기" style="margin-top: 5px;" />
										</div>
										
										<!-- Break -->
										<div class="col-12">
											<ul class="actions">
												<li><input type="button" value="수정" onclick="updateMember()" class="primary" /></li>
												<li><input type="button" value="탈퇴" id="del" onclick="delMem()" /></li>
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
			<script src="/assets/js/jquery-3.6.0.min.js"></script>
			<script src="/assets/js/validation.js"></script>
	</body>
	<script type="text/javascript">
	function delMem() {
		if (confirm("정말로 탈퇴 하시겠습니까?")) {
			window.location.href="/deleteMember.do";
		}
	}
	function updatePw() {
		var ret = window.open('/jsp-member/updatePw.jsp', '비밀번호 변경하기', 'width=700, height=500');
	}
	//updateMember.do
	function updateMember() {
		if(!validEmail()) {
			alert('올바른 이메일 형식이 아닙니다.')
			$('#email').focus();
			return;
		} else if (!validPhone()) {
			alert('휴대폰 번호는 \'-\'을 포함하여 입력해주세요.')
			$('#phone').focus();
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "/updateMember.do",
			data: {
				email: $("#email").val(),
				phone: $("#phone").val()
			},
			success: function(res) { 
				if (res == true) {
					alert("성공적으로 회원 정보가 변경되었습니다.");
					location.href="/mypage.do";
				} else {
					alert("정보 변경에 실패하였습니다. 확인 후 다시 시도해주세요.");
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