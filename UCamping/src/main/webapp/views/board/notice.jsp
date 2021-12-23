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
 <link rel="icon" href="./favicon.png">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

  <!--Google Material Icons-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

  <link rel="stylesheet" href="${ path }/resources/css/notice.css">
</head>
<body>
		<div id="sml-category-area">
            <ul class="sml-category">
                <li><a href="${ path }" class="sml-text2"><span><i id="sml-ctgr-img1" class="material-icons-outlined chgcolor">home</i> 홈</span></a></li>
                <li id="bar">></li>
                <li><a href="${ path }/notice" class="sml-text2"><span>공지사항</span></a></li>
            </ul>
        </div>
	<section>
      <div id="notice">공지사항</div>

      <table>
        <thead>
          <tr>
            <th style="width: 200px;">NO</th><th>제목</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td style="text-align: center;">6</td><td>[이벤트] 우리동네 설경을 자랑해보세요</td>
          </tr>
          <tr>
            <td style="text-align: center;">5</td><td>지역광고 후기이벤트 당첨자를 공개해요!</td>
          </tr>
          <tr>
            <td style="text-align: center;">4</td><td>개인정보처리방침이 변경될 예정이에요</td>
          </tr>
          <tr>
            <td style="text-align: center;">3</td><td>중고거래 게시판 거래 정책이 변경될 예정이에요</td>
          </tr>
          <tr>
            <td style="text-align: center;">2</td><td>전자거래분쟁조정위원회 안저넉래 캠페인에 따른 공지 전달드려요</td>
          </tr>
          <tr>
            <td style="text-align: center;">1</td><td>유캠프 운영정책 안내</td>
          </tr>
        </tbody>
      </table>
      <div id="back-forward">
        <a href="javascript:void(0)" class="on">&lt;&lt;</a>
        <a href="javascript:void(0)">&lt;</a>
        <a href="javascript:void(0)">1</a>
        <a href="javascript:void(0)">&gt;</a>
        <a href="javascript:void(0)">&gt;&gt;</a>
      </div>
      
  </section>
  
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />