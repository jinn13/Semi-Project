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
	<div id="title-area1">	
      <div id="notice">공지사항</div>
      
      <c:if test="${ !empty loginMember && loginMember.role == 'ROLE_ADMIN'}">
      <button type="button" id="btn-add"
      onclick="location.href='${ path }/admin/notice/write'">글쓰기</button>
      </c:if>
	</div>

 <table id="tbl-board">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:if test="${ empty list }">			
				<tr>
					<td colspan="3" style="text-align: center;">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>
			<c:if test="${ !empty list }">
				<c:forEach var="notice" items="${list}">
					<tr>
						<td>${ notice.rowNum }</td>
						<td style="text-align: left;">
							<a href="${ pageContext.request.contextPath }/notice/view?no=${ notice.no }">
								${ notice.title }
							</a>
						</td>
						<td>${ notice.createDate }</td>
					</tr>
				</c:forEach>
			</c:if>			
		</table>
		



		<div id="pageBar" style="letter-spacing: 15px;">
			<!-- 맨 처음으로 -->
			<a href="${ pageContext.request.contextPath }/notice?page=1" style="letter-spacing: 0px;">&lt;&lt;</a>

			<!-- 이전 페이지로 -->
			<a href="${ pageContext.request.contextPath }/notice?page=${ pageInfo.prevePage }">&lt;</a>
			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">				
					<span style="color: #a4835f;">${ status.current }</span>
				</c:if>
				
				<c:if test="${ status.current != pageInfo.currentPage }">				
					<a href="${ pageContext.request.contextPath }/notice?page=${ status.current }">${ status.current }</a>
				</c:if>

			</c:forEach>
			<!-- 다음 페이지로 -->
			<a href="${ pageContext.request.contextPath }/notice?page=${ pageInfo.nextPage }">&gt;</a>

			<!-- 맨 끝으로 -->
			<a href="${ pageContext.request.contextPath }/notice?page=${ pageInfo.maxPage }" style="letter-spacing: 0px;">&gt;&gt;</a>
		</div>
		
      
      
  </section>
  
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />