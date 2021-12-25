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
                <li><a href="${ path }/enroll" class="sml-text2"><span>회원가입</span></a></li>
            </ul>
        </div>

		<h1 style="text-align: center;">회원가입</h1>
<div id="container">
		<div id="join">

		<form name="memberEnrollFrm" action="${ path }/enroll" method="post">
			<div class="form-group">
				<label for="userId">아이디</label>
				<input type="text" name="userId" id="userId" placeholder="첫 문자를 영어로 시작하여 총 5~12자로 입력하세요."/>
				<input type="button" id="checkDuplicate" value="중복검사" >
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
				<input type="text" name="bornBirth" id="bornYear" placeholder="1901"/>
        		<input type="text" name="bornBirth" id="bornMonth" placeholder="01"/>
        		<input type="text" name="bornBirth" id="bornDate" placeholder="01"/>
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
//아이디 중복 확인
$(document).ready(() => {
	$("#checkDuplicate").on("click", () => {
		let userId = $("#userId").val().trim();
		
		$.ajax({
			type: "post",
			url: "${ path }/idCheck",
			dataType: "JSON",
			data: {
				userId
			},
			success: (data) => {
				console.log(data);
				
				if(data.duplicate == true) {
					alert("이미 사용중인 아이디 입니다.");
				} else {
					alert("사용 가능한 아이디 입니다.");
				}
			},
			error: (error) => {
				console.log(error);
			}	
		});
	});
});
</script>
	

<script src="${ path }/resources/js/join.js"></script>
<jsp:include page="/views/common/footer.jsp" />