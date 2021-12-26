<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>     

<jsp:include page="/views/common/header.jsp" />   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/customerCenter.css">
<link rel="icon" href="./favicon.png">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
  <!--Google Material Icons-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<body>
		<div id="sml-category-area">
            <ul class="sml-category">
                <li><a href="${ path }" class="sml-text2"><span><i id="sml-ctgr-img1" class="material-icons-outlined chgcolor">home</i> 홈</span></a></li>
                <li id="bar">></li>
                <li><a href="${ path }/faq" class="sml-text2"><span>FAQ</span></a></li>
            </ul>
        </div>
	<main>
    <div class="inner">
      <aside>
      
        <div id="customer-center">고객센터</div>
        <hr style="border: 1.5px solid black; background-color: black; margin-bottom: 15px;">
        
        <div id="customer-menu">
          <a href="${ path }/notice">공지사항<hr color="black" size="1"></a>
          <a href="${ path }/faq">자주 찾는 질문(FAQ)<hr></a>
          <!-- <a href="javascript:void(0)">이용 안내<hr></a>  -->
          <a href="${ path }/question">1:1 게시판 문의<hr></a>
        </div>
        
      </aside>
    
      <section>
        <div id="customer-content">자주 찾는 질문(FAQ)</div>
        <hr style="border: 1.5px solid black; background-color: black; margin-bottom: 15px;">
        <tr>
          <td><input type="text" name="question" id="question" placeholder="검색어를 입력해 주세요"></td>
          <td><button id="search">검색</button></td>
        </tr>

        <div id="sub-question">
          <button>계정/인증</button><button>구매/판매</button><button>거래품목</button><button>이용 제재</button><button>본인인증</button>
        </div>

        <div id="detail-question">
          <a href="javascript:void(0)">Q. 탈퇴는 어떻게 하나요?<hr></a>
          <a href="javascript:void(0)">Q. 프로필 사진과 닉네임을 변경하고 싶어요.<hr></a>
          <a href="javascript:void(0)">Q. 계정 휴면상태가 무엇인가요?<hr></a>
          <a href="javascript:void(0)">Q. 외국에서도 유캠핑을 이용하고 싶어요!<hr></a>
          <a href="javascript:void(0)">Q. 인증번호 문자가 오지 않아요.<hr></a>
          <a href="javascript:void(0)">Q. 여러 개의 휴대폰에서 동시에 로그인할 수 있나요?<hr></a>
          <a href="javascript:void(0)">Q. 가입한 적 없는데 계정이 있다고 나와요!<hr></a>
        </div>
      </section>
    </div>
  </main>
  


<jsp:include page="/views/common/footer.jsp" />
