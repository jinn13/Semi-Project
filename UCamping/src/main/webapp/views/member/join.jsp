<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>     

<jsp:include page="/views/common/header.jsp" />       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유캠핑 회원가입</title>
 <link rel="icon" href="./favicon.png">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

  <!--Google Material Icons-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

  <link rel="stylesheet" href="${ path }/resources/css/join.css">
  <script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>

		<div id="sml-category-area">
            <ul class="sml-category">
                <li><a href="${ path }" class="sml-text2"><span><i id="sml-ctgr-img1" class="material-icons-outlined chgcolor">home</i> 홈</span></a></li>
                <li id="bar">></li>
                <li><a href="${ path }/member/enroll" class="sml-text2"><span>회원가입</span></a></li>
            </ul>
        </div>

		<h1 style="text-align: center;">회원가입</h1>
<div id="container">
		<div id="join">

		<form name="memberEnrollFrm" action="${ pageContext.request.contextPath }/member/enroll" method="post">
			<div class="form-group">
				<label for="userId">아이디</label>
				<input type="text" name="userId" id="userId" placeholder="첫 문자를 영어로 시작하여 총 5~12자로 입력하세요."/>
				<p id="member-id"></p>
			</div>
			<div class="form-group">
				<label for="userPw">비밀번호</label>
				<input type="password" name="userPwd" id="userPwd" placeholder="대/소문자, 숫자, 특수문자 포함하여 총 8~16자로 입력하세요."/>
				<p id="member-password"></p>
			</div>
			<div class="form-group">
				<label for="userPw">비밀번호 재확인</label>
				<input type="password" id="userPwCheck" placeholder="입력하신 패스워드를 다시 입력하세요."/>
				<div id="member-passwordcheck"></div>
			</div>
			<div class="form-group">
				<label for="userName">이름</label>
				<input type="text" name="userName" id="userName" placeholder="이름"/>
				<p id="member-name"></p>
			</div>
      		<div class="form-group">
				<label for="userBirth">생년월일</label>
				<input type="text" name="bornBirth" id="bornYear" placeholder="년도"/>
        		<input type="text" name="bornBirth" id="bornMonth" placeholder="월"/>
        		<input type="text" name="bornBirth" id="bornDate" placeholder="일"/>
        		<div id="member-year"></div>
          		<div id="member-month"></div>
          		<div id="member-date"></div>
			</div>
			<div class="form-group">
          		<label for="userNickname">닉네임</label>
          		<input type="text" name="userNickname" id="userNickname" placeholder="닉네임"/>
          		<p id="member-nickname"></p>
        	</div>
        	<div class="form-group">
          		<label for="userEmail">이메일</label>
          		<input type="email" name="userEmail" id="userEmail" placeholder="이메일"/>
          		<p id="member-email"></p>
        	</div>	
      		<div class="form-group">
				<label for="userPhone">휴대전화</label>
				<input type="text" name="userPhone" id="userPhone" placeholder="휴대전화"/>
				<p id="member-phone"></p>
			</div>
			<div class="form-group">
				<label for="userAddress">주소</label>
				<input type="text" name="userAddress" id="userAddress" placeholder="주소"/>
			</div> 
      <button type="submit">가입하기</button>
      </form>
		</div>
	</div>
<script>
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
let nicknameCheck = RegExp(/^[a-zA-Z가-힣]{2,}$/);
$('#userNickname').keyup(function() {
	if (!nicknameCheck.test($('#userNickname').val())) {
		$('#member-nickname').css('color', 'red').text("형식에 맞지 않음");
		} else {
      $('#member-nickname').css('color', 'green').text("형식에 맞음");
    }
});


// 이메일
let emailCheck = RegExp(/^[\w-]+@([\w-]+)\.([A-Za-z\.]{2,6})$/);
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

</script>	
	


<jsp:include page="/views/common/footer.jsp" />