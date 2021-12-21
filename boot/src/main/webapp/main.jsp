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
		<script src="http://maps.google.com/maps/api/js?key=AIzaSyCYMgnB665pxh3-7R3gvJs4ozv41LNuhsw&region=kr"></script>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="#" class="logo"><strong>WANDERIZM</strong></a>
									<mytag:login />
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>Hi, Wanderier!</h1>
											<p>A free and fully responsive site template</p>
										</header>
										<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu. Proin aliquam facilisis ante interdum congue. Integer mollis, nisl amet convallis, porttitor magna ullamcorper, amet egestas mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor sit nullam.</p>
										<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu. Proin aliquam facilisis ante interdum congue. Integer mollis, nisl amet convallis, porttitor magna ullamcorper, amet egestas mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor sit nullam.</p>
									</div>
									<span class="image object">
									<!-- 지도 출력 -->
										<!-- <img src="/images/pic10.jpg" alt="" /> -->
										<div id="map" style="width: 100%; height: 100%;"></div>
									</span>
								</section>
								
							<!-- Section -->
								<section>
									<header class="major">
										<!-- <h2>Ipsum sed dolor</h2> -->
									</header>
									<div class="posts">
										
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
		$(document).ready(function () {
	      	initMap();
	    });
		
		function initMap() {
				
			var ll = {lat: 46.70197354296489, lng: 8.289828281197462}; // lat: 위도, lng: 경도
			map = new google.maps.Map(  // Map(위치, 출력 값) 어디에 무엇을 보여줄 것인지 파라미터로 작성
						document.getElementById("map"),  // 지도를 나타낼 위치
						{zoom:4, center:ll} // 출력 값 - ll를 center값으로 설정
					);
			
			drawMakers();
		}
		
		function drawMakers() { 
			var marker = [];
			<c:forEach var="v" items="${sidebarData.nationData}">
				marker.push(new google.maps.Marker (
						{position: new google.maps.LatLng('${v.lat}', '${v.lng}'),
							map: map,
							lat: '${v.lat}',
							lng: '${v.lng}',
							n_id:'${v.n_id}'}
					));
			</c:forEach>
			
			for (var i=0; i<marker.length; i++) {
				marker[i].addListener('click', function() {
					console.log(this);
					/* location.href="/getBoardList.do?b_type=review&n_id=" + this.n_id; */
					map.setZoom(5);
					map.setCenter({lat: Number(this.lat) , lng: Number(this.lng)});
					window.setTimeout(() => {
						location.href="/getBoardList.do?b_type=review&n_id=" + this.n_id;
					}, 1000);
				});
			}
			
		}
		
		initMap(); // 선언과 함께 맵 생성 
	</script>
</html>