 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />   
        
<link rel="stylesheet" href="${ path }/resources/css/main.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="./lib/jquery-3.6.0.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet">


<body>
	<div class="body">
        <div class="main-slide">
          <div class="slick">
            <div class="item1" style="background-color: rgb(230, 230, 230);">
              <div class="main-img" style="background-image: url(resources/images/main/main2-2.jpg);">
                <!-- <p>Your First Secondhand Camping shop </p> -->
              </div>
            </div>
            <div class="item1" style="background-color: rgb(220, 220, 220);">
              <div class="main-img" style="background-image: url(resources/images/main/main14-1.jpg);"></div>
            </div>
            <div class="item1" style="background-color: rgb(210, 210, 210);">
              <div class="main-img" style="background-image: url(resources/images/main/main7-1.jpg);"></div>
            </div>
          </div>
        </div>

        <div class="item-list">
            <div class="small-title">
              <h2>새로 올라온 상품</h2>
              <a href="${ path }/saleboard/salelist">더보기</a>
            </div>
            <div class="img-slide">
              <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item1.jpg">폴라리스 스틸쿨러<p class="price">85,000원</p></img></a></div>
              <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item7.jpg">노마드 차박 텐트<p class="price">123,000원</p></img></a></div>
              <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item3.jpg">리얼 릴렉스 체어<p class="price">70,000원</p></img></a></div>
              <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item4.jpg">안티파이어 윈드스크린<p class="price">130,000원</p></img></a></div>
              <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item5.jpg">웨일테일 불멍화로대<p class="price">45,000원</p></img></a></div>
              <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item6.jpg">오핑 파라핀 랜턴 실버<p class="price">23,000원</p></img></a></div>
            </div>
            <div class="slide-btn">
              <img class="sml-left" src="${ path }/resources/images/icon/left.png" alt="">
              <img class="sml-right" src="${ path }/resources/images/icon/right.png" alt="">
            </div>
        </div>

        <hr class="line">

        <div class="item-list">
          <div class="small-title">
            <h2>금주의 인기 상품</h2>
            <a href="${ path }/saleboard/salelist">더보기</a>
          </div>
          <!-- 복사한다면 img-slide, sml-left, right 번호 바꿔야 함. -->
          <div class="img-slide2">
            <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item12.jpg">캠벨 파라핀 랜턴<p class="price">33,000원</p></img></a></div>
            <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item20.jpg">프로스트 아이스 쿨러<p class="price">98,000원</p></img></a></div>
            <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item15.jpg">폴라리스 이그니스 블랙<p class="price">120,000원</p></img></a></div>
 			<div><a href=""><img class="item-img" src="${ path }/resources/images/item/item17.jpg">스트라이프 캠핑 해먹<p class="price">45,000원</p></img></a></div>
            <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item4.jpg">안티파이어 윈드스크린<p class="price">130,000원</p></img></a></div>
            <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item16.jpg">오핑 파라핀 랜턴 실버<p class="price">23,000원</p></img></a></div>
          </div>
          <div class="slide-btn">
            <img class="sml-left2" src="${ path }/resources/images/icon/left.png" alt="">
            <img class="sml-right2" src="${ path }/resources/images/icon/right.png" alt="">
        </div>
      </div>




      <div class="main-slide2">
        <div class="slick">
          <div class="item" style="background-color: red;">
            <div class="bg" style="background-image: url(resources/images/main/main15-1.jpg);"></div>
          </div>
          <div class="item" style="background-color: blue;">
            <div class="bg" style="background-image: url(resources/images/main/main10-1.jpg);"></div>
          </div>
          <div class="item" style="background-color: green;">
            <div class="bg" style="background-image: url(resources/images/main/main12.jpg);"></div>
          </div>
      </div>
      <div class="slide-btn">
        <img class="main-left2" src="${ path }/resources/images/icon/left2.png" alt="">
        <img class="main-right2" src="${ path }/resources/images/icon/right2.png" alt="">
    </div>
      </div>




      <div class="item-list">
        <div class="small-title">
          <h2>침구 및 캠핑용품</h2>
          <a href="${ path }/saleboard/salelist">더보기</a>
        </div>
        <!-- 복사한다면 img-slide, sml-left, right 번호 바꿔야 함. -->
        <div class="img-slide3">
          <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item14.jpg">블루 클레오 침낭<p class="price">85,000원</p></img></a></div>
          <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item2.jpg">빅테일 라이트 발전기<p class="price">175,000원</p></img></a></div>
          <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item15.jpg">폴라리스 이그니스 블랙<p class="price">120,000원</p></img></a></div>
          <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item17.jpg">스트라이프 캠핑 해먹<p class="price">123,000원</p></img></a></div>
          <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item4.jpg">웨일테일 불멍화로대<p class="price">123,000원</p></img></a></div>
          <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item16.jpg">랜드란 야전 침대<p class="price">89,000원</p></img></a></div>
        </div>
        <div class="slide-btn">
          <img class="sml-left3" src="${ path }/resources/images/icon/left.png" alt="">
          <img class="sml-right3" src="${ path }/resources/images/icon/right.png" alt="">
      </div>
    </div>

    
    <hr class="line">

    <div class="item-list">
      <div class="small-title">
        <h2>의류 & 조명 & 잡화</h2>
        <a href="${ path }/saleboard/salelist">더보기</a>
      </div>
      <!-- 복사한다면 img-slide, sml-left, right 번호 바꿔야 함. -->
      <div class="img-slide4">
        <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item12.jpg">캠벨 파라핀 랜턴<p class="price">123,000원</p></img></a></div>
        <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item19.jpg">개인용 화로<p class="price">123,000원</p></img></a></div>
        <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item29.jpg">트윈 라이트 랜턴<p class="price">123,000원</p></img></a></div>
        <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item33.jpg">스틸 라이트 웜<p class="price">20,000원</p></img></a></div>
        <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item11.jpg">블루투스 다크 랜턴<p class="price">15,000원</p></img></a></div>
        <div><a href=""><img class="item-img" src="${ path }/resources/images/item/item6.jpg">오핑 파라핀 랜턴 실버<p class="price">23,000원</p></img></a></div>
      </div>
      <div class="slide-btn">
        <img class="sml-left4" src="${ path }/resources/images/icon/left.png" alt="">
        <img class="sml-right4" src="${ path }/resources/images/icon/right.png" alt="">
    </div>
  </div>

</body>

    <script src="${ path }/resources/js/main.js"></script>

<jsp:include page="/views/common/footer.jsp" />