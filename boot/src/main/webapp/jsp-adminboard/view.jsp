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
		<link rel="stylesheet" href="/assets/css/recommand.css" />
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
									<mytag:login />
								</header>
							
							<!-- Section -->
								<section>
									<div class="recommand-header">
										<h2 class="recommand-title"><a href="javascript:window.history.go(-1)">Recommend</a></h2>
									</div>
									<%-- <div class="recommand-header">
										<h1>${data.title}</h1>										
										<div class="recommand-btn-area">
											<a href="/insertRecoomandView.do" class="button primary samll">수정</a>
											<button class="button samll" onclick="deleteRecommandConfirm()">삭제</button>
										</div>
									</div> --%>
									
									<div class="common-header">
										<h1 class="common-title">${data.title}</h1>
										<div class="common-btn-area">
											<c:choose>
												<c:when test="${!empty sessionID && data.id != 'admin' && data.fav == 0}"> <!-- 빈 하트 -->
													<img alt="하트이미지" src="/images/heart_1.png" id="fav" onclick="like('${data.b_id}', '${sessionID}')" style="width: 18px; cursor: pointer;" />
												</c:when>
												<c:when test="${!empty sessionID && data.fav > 0}"> <!-- 찬 하트 -->
													<img alt="하트이미지" src="/images/heart_2.png" id="fav" onclick="like('${data.b_id}', '${sessionID}')" style="width: 18px; cursor: pointer;" />
												</c:when>
											</c:choose>
											<c:if test="${data.id == 'admin'}">
												<ul class="actions" style="float: right;">
													<li><input type="button" value="수정" class="button small" onclick="location.href='/updateRecoomandView.do?b_id=${data.b_id}'"/></li>
													<li><input type="button" value="삭제" class="button small" onclick="deleteRecommandConfirm()" /></li>
												</ul>
											</c:if>
										</div>
									</div>
									
									<!-- 게시글 출력 -->
									<div class="container">
										${data.content}
									</div>
									
									<hr class="major" />
									
									<ul class="actions mt10 floatr">
										<li><a href="javascript:window.history.go(-1)" class="button small" style="float: right;">전체 목록</a></li>
									</ul>
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
		function deleteRecommandConfirm () {
			var res = confirm('정말로 삭제 하시겠습니까?');
			if (res) {
				deleteRecommand();
			}
		}
		
		function deleteRecommand() {
			$.ajax({ 
				type: "POST",
				url: "/deleteRecommand.do",
				data: {
					b_id : $("#b_id").val()
				},
				success: function(data) { 
					if(data === 'true') {
						alert('성공적으로 삭제 되었습니다.');
						window.location.href = '/recommandList.do';
						
						//setTimeout(() => { //상단에 실행 되어야 할 부분이 실행되지 않고 페이지 이동을 하게될 경우 settimeout으로 나중에 이동되도록 처리 
//							window.location.href = 'recommandList.do'; 
						//})
					} else {
						alert('삭제에 실패했습니다.');
					}
				},
				error: function(xhr) {
					console.log(xhr.status + " : " + xhr.errorText);
					alert("에러발생!");
				}
			});
		}
		function like(b_id, id) { // 찜 기능 - 버튼 클릭시 찜 추가 또는 찜 제거
			var liked = $('#fav').attr('src').indexOf('heart_2') > 0; // 찜 한 경우
			var url = "/insertLike.do";
			if(liked) { // 이미 찜 한 상태라면 클릭 시 찜 제거
				url = "/deleteLike.do";
			}
			$.ajax({
				url: url,
                type: "POST",
                data: {
                    b_id: b_id,
                    id: id
                },
                success: function (res) {
			        if (liked) { // 찜 한 경우
			        	if(res == 'true') {
				        	$('#fav').attr('src','/images/heart_1.png');	
				        }		        		
		        	} else { // 찜 안한 경우
		        		if(res == 'true') {
		        			$('#fav').attr('src','/images/heart_2.png');
				        }
		        	}
			        
                },
			})
		}
	</script>
</html>