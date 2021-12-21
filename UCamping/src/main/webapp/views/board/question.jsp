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
<link rel="stylesheet" href="${ path }/resources/css/question.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
  <h1 style="text-align: center;">무엇을 도와드릴까요?</h1>
    <br><br><br>
    <table id="tbl-question">
        <tr>
            <th>번호</th>
            <th width="500px">제목</th>
            <th width="100px">글쓴이</th>
            <th width="100px">작성일</th>
            <th width="100px">조회수</th>
        </tr>
        <tr>
            <td>7</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>6</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>5</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>4</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>3</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>2</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>1</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
    <button type="submit" id="btn1" style="padding:6px; margin:8px;">문의하기</button>
    <br><br><br><br>
    
    <div id="pageBar">
        <!-- 맨 처음으로 -->
        <button onclick="location.href='${ pageContext.request.contextPath }/board/list?page=1'">&lt;&lt;</button>

        <!-- 이전 페이지로 -->
        <button onclick="location.href='${ pageContext.request.contextPath }/board/list?page=${ pageInfo.prevePage }'">&lt;</button>

        <!--  10개 페이지 목록 -->
        <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
            <c:if test="${ status.current == pageInfo.currentPage }">				
                <button disabled>${ status.current }</button>
            </c:if>
            
            <c:if test="${ status.current != pageInfo.currentPage }">				
                <button onclick="location.href='${ pageContext.request.contextPath }/board/list?page=${ status.current }'">${ status.current }</button>
            </c:if>
        </c:forEach>

        <!-- 다음 페이지로 -->
        <button onclick="location.href='${ pageContext.request.contextPath }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>

        <!-- 맨 끝으로 -->
        <button onclick="location.href='${ pageContext.request.contextPath }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
    </div>
</div>

</body>
</html>

<jsp:include page="/views/common/footer.jsp" />