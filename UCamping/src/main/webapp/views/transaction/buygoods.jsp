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
<link rel="stylesheet" href="${ path }/resources/css/buygoods.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>
    <div id="categories">
        <select id="categories2">
            <option value="all" selected>전체</option>
            <option value="Tent&Tarf">텐트 및 타프</option>
            <option value="Bedding&Equipment">침구 및 캠핑용품</option>
            <option value="Furniture&accept">가구 및 수납</option>
            <option value="Cooking">취사용품</option>
            <option value="Clothes&Lantern&Stuff">의류/조명/잡화</option>
        </select>
    </div>
    <div id="board-list-container">
        <table class="buygoods" id="tbl-board">
	        <c:if test="${ !empty salelist }">
					<c:forEach var="saleboard" items="${ salelist }">
	                    <tr>
	                        <th></th>
	                        <th></th>
	                        <th></th>
	                    </tr>
	                    <tr>
	                        <td id="images" colspan="" rowspan="5" width="370px" height="">
	                        	<a href="${ path }/productDetail?no=${ saleboard.no }">
	                            <img src="${ path }/resources/upload/saleboard/${ saleboard.fileSystemName }" width="318px" height="174px" download="${ path }/resources/upload/saleboard/${ saleboard.fileName }"/>
	                        	</a>
	                        </td>
	                        <td style="font-size: 18px;" id="title"colspan="2" width="646px" height="35px">
	                        	<a href="${ path }/productDetail?no=${ saleboard.no }">
	                        	${ saleboard.title }
	                        	</a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td style="font-size: 16px;" width="200px">
	                        	<c:if test="${ ! empty loginMember }">
									<a href="${ path }/saleboard/wish?no=${ saleboard.no }"><img src="${ path }/resources/images/icon/icons8-star-96.png" width="20" height="20"> 관심상품 등록</a>
								</c:if>
	                        </td>
	                        
	                    </tr>
	                    <tr>
	                        
	                        <td width="646px" style="font-size: 16px;">${ saleboard.content }</td>
	                        
	                    </tr>
	                    <tr>
	                        <td style="font-size: 16px;">가격 : ${ saleboard.price }</td>
	                        <td width="200px" style="font-size: 16px;"><img src="${ path }/resources/images/icon/icons8-chat-64.png" width="20" height="20"> 채팅 보내기</td>
	                    </tr>
	                    <tr>
	                        <td style="font-size: 16px;">판매자 : ${ saleboard.writerId }</td>
	                        
	                    </tr>
	                    <tr></tr>
	               </c:forEach>
			</c:if>
                       
        </table>
        <div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ pageContext.request.contextPath }/saleboard/salelist?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ pageContext.request.contextPath }/saleboard/salelist?page=${ pageInfo.prevePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">				
					<button disabled>${ status.current }</button>
				</c:if>
				
				<c:if test="${ status.current != pageInfo.currentPage }">				
					<button onclick="location.href='${ pageContext.request.contextPath }/saleboard/salelist?page=${ status.current }'">${ status.current }</button>
				</c:if>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ pageContext.request.contextPath }/saleboard/salelist?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ pageContext.request.contextPath }/saleboard/salelist?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
    </div>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />