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
				<input type="text" name="userId" id="userId" placeholder="아이디"/>
			</div>
			<div class="form-group">
				<label for="userPw">비밀번호</label>
				<input type="password" name="userPwd" id="userPwd" placeholder="패스워드"/>
			</div>
			<div class="form-group">
				<label for="userPw">비밀번호 재확인</label>
				<input type="password" id="userPwCheck" placeholder="패스워드 확인"/>
			</div>
			<div class="form-group">
				<label for="userName">이름</label>
				<input type="text" name="userName" id="userName" placeholder="이름"/>
			</div>
      		<div class="form-group">
				<label for="userBirth">생년월일</label>
				<input type="text" name="bornBirth" id="bornYear" placeholder="년도"/>
        		<input type="text" name="bornBirth" id="bornMonth" placeholder="월"/>
        		<input type="text" name="bornBirth" id="bornDate" placeholder="일"/>
			</div>
			<div class="form-group">
          		<label for="userNickname">닉네임</label>
          		<input type="text" name="userNickname" id="userNickname" placeholder="닉네임"/>
        	</div>
        	<div class="form-group">
          		<label for="userEmail">이메일</label>
          		<input type="email" name="userEmail" id="userEmail" placeholder="이메일"/>
        	</div>	
      		<div class="form-group">
				<label for="userPhone">휴대전화</label>
				<input type="text" name="userPhone" id="userPhone" placeholder="휴대전화"/>
			</div>
			<div class="form-group">
				<label for="userAddress">주소</label>
				<input type="text" name="userAddress" id="userAddress" placeholder="주소"/>
			</div>
      
      <button type="submit">가입하기</button>
      </form>
		</div>
	</div>
	


<jsp:include page="/views/common/footer.jsp" />