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
								<section class="pt35">
									<div class="common-header">
										<c:choose>
										<c:when test="${data.b_type eq 'info'}">
											<h3 class="title-underline">정보 공유 게시판</h3>
											<div class="common-btn-area">
												<c:forEach var="v" items="${sidebarData.cateData}">
													<c:if test="${data.cate_id eq v.cate_id}">
														<h4 class="category-btn-area" style="color: gray;">${v.category}</h4>
													</c:if>
												</c:forEach>
											</div>
										</c:when>
										<c:when test="${data.b_type eq 'ask'}">
											<h3 class="title-underline">자유 질문 게시판</h3>
										</c:when>
										<c:when test="${data.b_type eq 'review'}">
											<h3 class="title-underline">여행 후기 게시판</h3>
											<div class="common-btn-area">
												<c:forEach var="v" items="${sidebarData.nationData}">
													<c:if test="${data.n_id eq v.n_id}">
														<h4 class="category-btn-area" style="color: gray;">${v.nation}</h4>
													</c:if>
												</c:forEach>
											</div>
										</c:when>
									</c:choose>
									</div>
									<%-- <header class="major">
									<c:choose>
										<c:when test="${data.b_type eq 'info'}">
											<h3>정보 공유 게시판</h3>
											<c:forEach var="v" items="${sidebarData.cateData}">
												<c:if test="${data.cate_id eq v.cate_id}">
													<h4 style="color: gray;">${v.category}</h4>
												</c:if>
											</c:forEach>
										</c:when>
										<c:when test="${data.b_type eq 'ask'}">
											<h3>자유 질문 게시판</h3>
										</c:when>
										<c:when test="${data.b_type eq 'review'}">
											<h3>여행 후기 게시판</h3>
											<c:forEach var="v" items="${sidebarData.nationData}">
												<c:if test="${data.n_id eq v.n_id}">
													<h4 style="color: gray;">${v.nation}</h4>
												</c:if>
											</c:forEach>
										</c:when>
									</c:choose>
									</header> --%>
									<!-- 게시글 정보 -->
									<div class="common-header">
										<h2 class="common-title">${data.title}</h2>
										<div class="common-btn-area">
											<c:choose>
												<c:when test="${!empty sessionID && data.id != sessionID && data.fav == 0}"> <!-- 빈 하트 -->
													<img alt="하트이미지" src="/images/heart_1.png" id="fav" onclick="like('${data.b_id}', '${sessionID}')" style="width: 18px; cursor: pointer;" />
												</c:when>
												<c:when test="${!empty sessionID && data.fav > 0}"> <!-- 찬 하트 -->
													<img alt="하트이미지" src="/images/heart_2.png" id="fav" onclick="like('${data.b_id}', '${sessionID}')" style="width: 18px; cursor: pointer;" />
												</c:when>
											</c:choose>
											
											<c:if test="${data.id == sessionID}">
												<ul class="actions" style="float: right;">
													<li><input type="button" value="수정" class="button small" onclick="location.href='/updateboardView.do?b_id=${data.b_id}'"/></li>
													<li><input type="button" value="삭제" class="button small" onclick="deleteConfirm('${data.b_id}', '${data.b_type}', '${data.cate_id}', '${data.a_id}', '${data.n_id}')" /></li>
												</ul>
											</c:if>
										</div>
									</div>
 									<header class="main">
										<p>
											<span style="padding-right: 22px;">${data.id}</span>
											<span style="padding-right: 22px;">${data.b_date}</span>
										</p>
									</header>
																	
									<!-- 게시글 출력 -->
									<hr class="major" />
									<div class="container">
										${data.content}
									</div>
									<hr class="major" />
									
									<!-- 댓글 -->
									<div class="replyArea">
										<p>댓글</p>
										<c:forEach var="v" items="${rdata}">
										<ul class="alt">
											<li><strong>${v.id}</strong>&emsp;${v.reply}&emsp;${v.r_date}&emsp;
											<c:if test="${v.id eq sessionID}">
											<a href="javascript:deleteReply('${v.r_id}', '${data.b_id}', '${data.b_type}', '${data.cate_id}', '${data.a_id}', '${data.n_id}');">삭제</a>
											</c:if>
											</li>
										</ul>
										</c:forEach>
										<form method="post" action="/insertReply.do">
											<c:if test="${!empty sessionID}">
											<input type="hidden" name="id" value="${sessionID}">
											<input type="hidden" name="b_id" value="${data.b_id}">
											<input type="hidden" name="b_type" value="${data.b_type}">
											<input type="hidden" name="cate_id" value="${data.cate_id}">
											<input type="hidden" name="a_id" value="${data.a_id}">
											<input type="hidden" name="n_id" value="${data.n_id}">
											<textarea name="reply" id="reply" placeholder="댓글을 작성해주세요." rows="6"></textarea>
											<input type="submit" value="등록" class="button small mt10" style="float: right;">
											</c:if>
											<c:if test="${empty sessionID}">
											<textarea id="reply" placeholder="로그인 후 이용 가능합니다." rows="6" readonly="readonly"></textarea>
											</c:if>
										</form>
									</div>
									
									<!-- 글쓰기, 전체목록 / 수정, 삭제 버튼 -->
									<ul class="actions mt10 floatr">
									<c:if test="${!empty sessionID}">
										<c:choose>
											<c:when test="${data.b_type eq 'info'}">
											<li><a href="/insertBoardView.do?b_type=info&cate_id=${cate_id}" class="button small" style="float: right;">글쓰기</a></li>
											</c:when>
											<c:when test="${data.b_type eq 'ask'}">
												<li><a href="/insertBoardView.do?b_type=ask" class="button small" style="float: right;">글쓰기</a></li>
											</c:when>
											<c:when test="${data.b_type eq 'review'}">
												<li><a href="/insertBoardView.do?b_type=review&a_id=${a_id}&n_id=${n_id}" class="button small" style="float: right;">글쓰기</a></li>
											</c:when>
										</c:choose>
									</c:if>
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
		function deleteConfirm(b_id, b_type, cate_id, a_id, n_id) {
			if (confirm("삭제하시겠습니까?")) {
				window.location.href="/deleteBoard.do?b_id="+b_id+"&b_type="+b_type+"&cate_id="+cate_id+"&a_id="+a_id+"&n_id="+n_id;
			}
		}
		
		function deleteReply(r_id, b_id, b_type, cate_id, a_id, n_id) {
			window.location.href="/deleteReply.do?r_id="+r_id+"&b_id="+b_id+"&b_type="+b_type+"&cate_id="+cate_id+"&a_id="+a_id+"&n_id="+n_id;
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