//아이디
let idCheck = RegExp(/^[a-zA-Z][a-zA-Z\d]{4,11}$/);
$('#userId').keyup(function() {
  if (!idCheck.test($('#userId').val())) {
    $('#member-id').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-id').css('color', 'green').text("형식에 맞음");
  }
});


// 비밀번호
let passwordCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,16}$/);
$('#userPwd').keyup(function() {
  if (!passwordCheck.test($('#userPwd').val())) {
    $('#member-password').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-password').css('color', 'green').text("형식에 맞음");
  }
});


// 비밀번호 확인체크
$('#userPwCheck').keyup(function(){
  let passwd = $('#userPwd').val();
  let passwdcheck = $('#userPwCheck').val();

  if(passwd == passwdcheck){
    passCheck = true;
    $('#member-passwordcheck').text('동일한 비밀번호 입니다.');
    $('#member-passwordcheck').css('color', '#08a600');
  }else{
    passCheck = false;
    $('#member-passwordcheck').text('동일하지 않은 비밀번호 입니다.');
    $('#member-passwordcheck').css('color', 'red');
  }
});


// 이름
let nameCheck = RegExp(/^[a-zA-Z가-힣]{2,}$/);
$('#userName').keyup(function() {
  if (!nameCheck.test($('#userName').val())) {
    $('#member-name').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-name').css('color', 'green').text("형식에 맞음");
  }
});


// 생년월일
// 년도
let yearCheck = RegExp(/^(19|20)\d{2}$/);
$('#bornYear').keyup(function() {
  if (!yearCheck.test($('#bornYear').val())) {
    $('#member-year').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-year').css('color', 'green').text("형식에 맞음");
  }
});

// 월
let monthCheck = RegExp(/^(0[1-9]|1[012])$/);
$('#bornMonth').keyup(function() {
  if (!monthCheck.test($('#bornMonth').val())) {
    $('#member-month').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-month').css('color', 'green').text("형식에 맞음");
  }
});

// 일
let dateCheck = RegExp(/^(0[1-9]|[12][0-9]|3[01])$/);
$('#bornDate').keyup(function() {
  if (!dateCheck.test($('#bornDate').val())) {
    $('#member-date').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-date').css('color', 'green').text("형식에 맞음");
  }
});


// 닉네임
let nicknameCheck = RegExp(/^[a-zA-Z가-힣\d]{2,}$/);
$('#userNickname').keyup(function() {
	if (!nicknameCheck.test($('#userNickname').val())) {
		$('#member-nickname').css('color', 'red').text("형식에 맞지 않음");
		} else {
      $('#member-nickname').css('color', 'green').text("형식에 맞음");
    }
});


// 이메일
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