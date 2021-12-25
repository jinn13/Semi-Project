//이름
let nameCheck = RegExp(/^[a-zA-Z가-힣]{2,}$/);
$('#userName').keyup(function() {
  if (!nameCheck.test($('#userName').val())) {
    $('#member-name').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-name').css('color', 'green').text("형식에 맞음");
  }
});

//닉네임
let nicknameCheck = RegExp(/^[a-zA-Z가-힣\d]{2,}$/);
$('#userNickname').keyup(function() {
	if (!nicknameCheck.test($('#userNickname').val())) {
		$('#member-nickname').css('color', 'red').text("형식에 맞지 않음");
		} else {
      $('#member-nickname').css('color', 'green').text("형식에 맞음");
    }
});

//이메일
let emailCheck = RegExp(/^[\w-]+@([\w-]+)\.([A-Za-z\.]{2,3})$/);
$('#userEmail').keyup(function() {
	if (!emailCheck.test($('#userEmail').val())) {
		$('#member-email').css('color', 'red').text("형식에 맞지 않음");
		} else {
      $('#member-email').css('color', 'green').text("형식에 맞음");
    }
});

// 휴대전화
let phoneCheck = RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);
$('#userPhone').keyup(function() {
	if (!phoneCheck.test($('#userPhone').val())) {
		$('#member-phone').css('color', 'red').text("형식에 맞지 않음");
		} else {
      $('#member-phone').css('color', 'green').text("형식에 맞음");
    }
});