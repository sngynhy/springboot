function checkID() {

	if($("#id").val() == '') {
		alert("ID를 입력해주세요.");
		return;
	}
	if(!validId()) {
		return;
	}
	
	$.ajax({ 
		type: "GET",
		url: "/checkID.do",
		data: {
			id : $("#id").val() // $().val() : 값 가져오기
		},
		success: function(res) { 
			if (res == false) {  // 중복 데이터가 없을 때
				alert("사용 가능한 ID입니다.");
				$('#checkedId').val(true);
				$('#checkID_button').hide();
				return true;
			} else {
				alert("ID가 이미 존재합니다. 다시 입력하세요.");
				return false;
			}
		},
		error: function(xhr) {
			console.log(xhr.status + " : " + xhr.errorText);
			alert("에러발생!");
		}
	});
}

function validId() {
	var regExp = /^[a-z]{1}[a-z0-9]{3,11}$/; // 반드시 영문으로 시작 숫자 허용 4~20자리 - 영문 대/소문자 + 숫자 조합
    if ($('#id').val().match(regExp) == null) { // 대소문자 및 숫자 입력가능
       $("#resultId").text("아이디는 영문 소문자/숫자, 4~12자 입력 가능합니다. (단, 반드시 영문 소문자로 시작)");
       return false;
    }
    $("#resultId").text("");
    return true;
}

function changId() {
	if ($('#checkedId').val()) {
		$('#checkedId').val(false);
		$('#checkID_button').show();
	}
}

function validPw1() {
	var regExp = /^[a-z0-9]{4,12}$/; // 문자와 숫자 조합의 6~12 자리
	if ($('#pw1').val().match(regExp) == null) {
		$("#resultPw1").text("비밀번호는 영문 소문자/숫자 조합으로 4자~12자 입력 가능합니다.");
		return false;
	} else if ($('#pw1').val() == $('#id').val()) {
		$("#resultPw1").text("아이디와 동일한 비밀번호는 사용할 수 없습니다.");
		return false;
	}
	$("#resultPw1").text("");
	return true;
}

function validPw2(){
	if ($('#pw1').val() != $('#pw2').val()) {
		$("#resultPw2").text("비밀번호가 일치하지 않습니다.");
		return false;
	}
	$("#resultPw2").text("");
	return true;
}

function validEmail(){
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
	if ($('#email').val().match(regExp) == null) {
		$("#resultEmail").text("올바른 이메일 형식이 아닙니다.");
		return false;
	}
	$("#resultEmail").text("");
	return true;
}

function validPhone(){
	var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; 
	if ($('#phone').val().match(regExp) == null) {
		$("#resultPhone").text("휴대폰 번호는 '-'을 포함하여 입력해주세요.");
		return false;
	}
	$("#resultPhone").text("");
	return true;
}

// 입력값 유효성 검사
function joinValidate() {
	
	if($('#checkedId').val() == 'false') {
		alert("아이디 중복 확인를 진행해주세요.")
		return false;
	}
	
	var regId = /^[a-z]{1}[a-z0-9]{3,11}$/;
	if ($('#id').val().match(regId) == null) { // 대소문자 및 숫자 입력가능
		alert("아이디는 영문 소문자/숫자, 4~12자 입력 가능합니다. (단, 반드시 영문 소문자로 시작)")
		$('#id').focus(); // document.엘리멘트.focus로 해당 위치 이동
		return false;
	}
	  // 비밀번호 유효성 검사(4~16자 까지 허용)
	var regPw = /^[a-z0-9]{4,12}$/; // 문자와 특수문자 조합의 6~12 자리
	if ($('#pw1').val().match(regPw) == null) {
		alert("비밀번호는 영문 소문자/숫자 조합으로 6자~12자 입력 가능합니다.")
		$('#pw1').focus();
		return false;
	} else if ($('#pw1').val() == $('#id').val()) {
		alert("아이디와 동일한 비밀번호는 사용할 수 없습니다.")
		$('#pw1').focus();
		return false;
	}
		// 비밀번호와 비밀번호 확인 일치여부 체크
	if ($('#pw1').val() != $('#pw2').val()) {
		alert("비밀번호가 일치하지 않습니다.")
		$('#pw2').value = "";
		$('#pw2').focus();
		return false;
	}
		 // 이메일 유효성 검사
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if($('#email').val().match(regEmail) == null) {
		alert('올바른 이메일 형식이 아닙니다.')
		$('#email').focus();
		return false;
	}
		// 휴대폰 번호 유효성 
	var regPhone = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
	if($('#phone').val().match(regPhone) == null) {
		alert('휴대폰 번호는 \'-\'을 포함하여 입력해주세요.')
		$('#phone').focus();
		return false;
	}
	if (!$('#accept').is(':checked')) {
		alert("약관 동의를 체크해주세요.")
		$('#accept').focus();
		return false;
	}
	return true;
}