<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />   

    <link rel="stylesheet" href="${ path }/resources/css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="login.css">
    <title>UCamping - Your First Secondhand Camping shop</title>
    <script src="./lib/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet">

    
</head>
<body>
    <div class="body">
        <div class="login-view">
            <ul class="sml-category">
                <li><a href="${ path }" class="sml-text2"><span><i id="sml-ctgr-img1" class="material-icons-outlined chgcolor">home</i> 홈</span></a></li>
                <li id="bar">></li>
                <li><a href="${ path }/login" class="sml-text2"><span>로그인</span></a></li>
            </ul>

            <section class="login-section">
                <div class="login-pic">
                    <img src="${ path }/resources/images/login-img/login-img3-1.jpg" id="login-img" alt="">
                </div>

                
                <div class="login-content">
                    <p>로그인</p>
                      <form id="login-form" action="${ path }/login" method="post">
                        <div id="login-form-input">
                          <input type="text" name="userId" id="userId" required="required" placeholder="아이디">
                          <input type="password" name="userPwd" id="userPwd" required="required" placeholder="비밀번호">
                        </div>
                          <input type="submit" style="cursor:pointer;" value="로그인" class="submit">
                      </form>

                        <ul class="find-signup-area">
                            <li><a href="${ path }/find-id" class="sml-text2"><span>아이디 찾기</span></a></li>
                            <li id="bar">|</li>
                            <li><a href="${ path }/find-pw" class="sml-text2"><span>비밀번호 찾기</span></a></li>
                            <li id="bar">|</li>
                            <li><a href="${ path }/enroll" class="sml-text2"><span>회원가입</span></a></li>
                        </ul>

                        <hr class="short-line">

                        <div class="simple-login-area">
                          <p>SNS 간편 로그인</p>
                          <input type="button" class="splgin-btn" id="naver" style="cursor:pointer;" value="네이버 간편 로그인">
                          <input type="button" class="splgin-btn" id="kakao" style="cursor:pointer;" value="카카오 간편 로그인">
                          <input type="button" class="splgin-btn" id="google" style="cursor:pointer;" value="구글 간편 로그인">
                      </div>
                </div>
            </section>
          </div>
</div>

</body>
<script src="${ path }/resources/js/main.js"></script>

<jsp:include page="/views/common/footer.jsp" />

