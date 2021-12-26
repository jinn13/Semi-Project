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
                <li id="bar">></li>
                <li><a href="${ path }/find-id" class="sml-text2"><span>ID찾기</span></a></li>
            </ul>

            <section class="login-section">
                <div class="login-pic">
                    <img src="${ path }/resources/images/login-img/login-img2-1.jpg" id="login-img" alt="">
                </div>

                
                <div class="login-content">
                    <p>아이디 찾기</p>
                      <form id="login-form" action="${ path }/member/login" method="post">
                        <div id="login-form-input">
                          <input type="text" name="userName" id="userName" required="required" placeholder="이름을 입력해주세요.">
                          <input type="text" name="userPhone" id="userPhone" required="required" placeholder="전화번호를 입력해주세요.">
                        </div>
                          <input type="button" id="findid" style="font-size: 18px;cursor:pointer;"  value="아이디 찾기" class="submit">
                      </form>

                        <ul class="find-signup-area">
                            <li><a href="${ path }/login" class="sml-text2"><span>이전 화면으로</span></a></li>
                            <li id="bar">|</li>
                            <li><a href="${ path }/find-pw" class="sml-text2"><span>비밀번호 찾기</span></a></li>
                            <li id="bar">|</li>
                            <li><a href="${ path }/enroll" class="sml-text2"><span>회원가입</span></a></li>

                        </ul>

                        <hr class="short-line">

                </div>
            </section>
          </div>
</div>

</body>
<script>
	// 아이디 중복 확인
	$(document).ready(()=>{
		$("#findid").on("click", ()=>{
			let userName = $("#userName").val().trim(); 
            let userPhone = $("#userPhone").val().trim();
			// alert("버튼클릭 : "+userName+", "+userPhone);
			$.ajax({
				type: "post",
				url: "${ pageContext.request.contextPath }/find-id", // 서블릿의 url매핑 경로
				dataType: "json",
				data: {
					userName, userPhone
				},
				success: (data)=>{
					 if(data != null){
					 	alert("아이디는 "+data.id+"입니다.");
					 }else{
					 	alert("해당 정보의 ID가 존재하지 않습니다. 가입을 해 주세요.");
					 }
				},
				error: (error)=>{
					console.log(error);
				}
			});
		});
	});
</script> 
<script src="${ path }/resources/js/main.js"></script>

<jsp:include page="/views/common/footer.jsp" />

