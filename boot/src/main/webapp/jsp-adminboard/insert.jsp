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
		<link rel="icon" href="/images/road-trip.png">
		<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
		<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
		<style>
			.ck-editor__editable_inline {
			    min-height: 600px;
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
								<a href="/main.do" class="logo"><strong>WANDERIZM</strong></a>
								<mytag:login />
							</header>
							
							<!-- Section -->
							<section style="padding-top: 35px;">
								<div class="recommand-header">
									<h2 class="recommand-title">Recommend</h2>
								</div>
								
								<!-- 게시글 입력 폼 -->
								<form method="post" action="/insertAdminBoard.do" name="form1" enctype="multipart/form-data">
								<!-- <form method="post" action="/insertAdminBoard.do" name="form1"> -->
									<input type="hidden" name="id" value="${sessionID}">
									<h2><span style="float: left; width: 10%">제목 : </span><input type="text" name="title" id="title" style="width: 90%;"></h2>
									<!-- CKEditor -->
									<textarea name="content" id="editor"></textarea>
									
									<!-- 썸네일 이미지 파일 추가 -->
									<div class="image-container" style="float: left;">
									    <img style="width: 100px;" id="preview-image" src="/images/preview.png">
									</div>
									<input type="file" class="hidden_input" id="input-image" name="fileUpload" accept="image/jpeg, image/jpg, image/png" style="margin-top: 40px;">
									<input type="button" value="등록" onclick="send()" class="button" style="float: right; margin-top:10px;">
								</form>
								
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
	<script>
		function send() {
			if ($('#title').val() == '') {
				alert('제목을 입력해주세요.');
				$('#title').focus();
				return;
			}
			if ($('.ck-content').text() == '') {
				alert('내용을 입력해주세요.');
				$('.ck-content').focus();
				return;
			}
			if ($('#input-image').val() == '') {
				alert('메인 이미지를 선택해주세요.');
				return;
			}
			document.form1.submit();
		}
	    // 3. CKEditor5를 생성할 textarea 지정
	    ClassicEditor
		.create( document.querySelector('#editor'),{
			language: "ko",
			ckfinder: {
		        uploadUrl: '/fileupload.do'
			},
			alignment: {
	            options: [ 'left', 'center', 'right' ]
	        },
	        image: {
	        	toolbar: ['toggleImageCaption','resizeImage']
	        }
		})
		.then( editor => {
	        console.log( 'Editor was initialized', editor );
	    } )
		.catch( error => {
			console.error( error );
		} );
	    
	    // FileReader를 활용한 업로드 한 이미지 파일 미리보기
	    function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		    	
		        // 이미지 파일인지 검사 (생략)
		        if (input.files[0].type.indexOf('image') < 0) {
		        	alert('jpeg/jpg/png 형식의 파일만 업로드 가능합니다.')
		        	input.value = '';
		        	return;
		        } 
		        
		        // FileReader : 비동기적으로 사용자가 업로드 한 파일을 읽을 수 있도록 해주는 인터페이스
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        // FileReader.onload 읽기 작업이 성공적으로 완료될 때마다 트리거 됨
		        reader.onload = e => { 
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result
		        }
		        // reader.readAsDataURL : 지정된 파일의 내용을 읽기 시작
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
    </script>
</html>