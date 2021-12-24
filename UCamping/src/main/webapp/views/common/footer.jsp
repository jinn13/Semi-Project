<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>    


<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/footer.css">

	<footer>
    <div class="inner">

      <ul class="menu">
        <li><a href="${ path }/terms">개인정보처리방침</a></li>
        <li><a href="${ path }/terms">영상정보처리기기 운영관리 방침</a></li>
        <li><a href="${ path }/terms">홈페이지 이용약관</a></li>
        <li><a href="${ path }/terms">위치정보 이용약관</a></li>

      </ul>

      <div class="info">
        <span>사업자등록번호 201-12-56789</span>
        <span>(주)유캠프 코리아</span>
        <span>TEL : 02) 1234-5678</span>
      </div>

      <p class="copyright">
        &copy; <span class="this-year"></span> Ucamping Company. All Rights Reserved.
      </p>
      <div class="ucam">UCamping</div>

    </div>
  </footer>
