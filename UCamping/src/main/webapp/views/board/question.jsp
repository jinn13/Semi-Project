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
		<div id="sml-category-area">
            <ul class="sml-category">
                <li><a href="${ path }" class="sml-text2"><span><i id="sml-ctgr-img1" class="material-icons-outlined chgcolor">home</i> 홈</span></a></li>
                <li id="bar">></li>
                <li><a href="${ path }/question" class="sml-text2"><span>1:1문의</span></a></li>
            </ul>
        </div>


        <section>
            <div id="title-area1">	
                <div id="notice">1:1문의 게시판</div>
            </div>
        
         <table id="tbl-board">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th style="width: 200px">작성자</th>
                        <th style="width: 200px">작성일</th>
                    </tr>
                    <c:if test="${ empty list }">			
                        <tr>
                            <td colspan="3" style="text-align: center;">
                                조회된 게시글이 없습니다.
                            </td>
                        </tr>	
                    </c:if>
                   
                    <c:if test="${ !empty list }">
                        <c:forEach var="question" items="${list}">
                            <tr>
                                <td>${ question.rowNum }</td>
                                <td style="text-align: left;">
                                    <a href="${ pageContext.request.contextPath }/question/view?no=${ question.otoNo }">
                                        ${ question.otoTitle }
                                    </a>
                                </td>
                                <td>${ question.writerId }</td>
                                <td>${ question.otoDate }</td>
                            </tr>
                        </c:forEach>
                    </c:if>		
                   	
                </table>
                
	 			
                <div id="title-area1">
                    <button type="button" id="btn-add" 
                    onclick="location.href='${ path }/question/write'">문의하기</button>
                </div>
        
         
                <div id="pageBar" style="letter-spacing: 15px;">

                    <a href="${ pageContext.request.contextPath }/question?page=1" style="letter-spacing: 0px;">&lt;&lt;</a>
        

                    <a href="${ pageContext.request.contextPath }/question?page=${ pageInfo.prevePage }">&lt;</a>

                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                        <c:if test="${ status.current == pageInfo.currentPage }">				
                            <span style="color: #a4835f;">${ status.current }</span>
                        </c:if>
                        
                        <c:if test="${ status.current != pageInfo.currentPage }">				
                            <a href="${ pageContext.request.contextPath }/question?page=${ status.current }">${ status.current }</a>
                        </c:if>
        
                    </c:forEach>
         
                    <a href="${ pageContext.request.contextPath }/question?page=${ pageInfo.nextPage }">&gt;</a>
        
                
                    <a href="${ pageContext.request.contextPath }/question?page=${ pageInfo.maxPage }" style="letter-spacing: 0px;">&gt;&gt;</a>
                </div>

         
        
        </section>       



    





</body>
</html>

<jsp:include page="/views/common/footer.jsp" />