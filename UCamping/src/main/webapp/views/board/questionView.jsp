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

  <link rel="stylesheet" href="${ path }/resources/css/questionView.css">

</head>
<body>
    <div class="body">
		<div id="sml-category-area">
            <ul class="sml-category">
                <li><a href="${ path }" class="sml-text2"><span><i id="sml-ctgr-img1" class="material-icons-outlined chgcolor">home</i> 홈</span></a></li>
                <li id="bar">></li>
                <li><a href="${ path }/question" class="sml-text2"><span>1:1 문의</span></a></li>
            </ul>
        </div>

        <div class="view-area">
            <h2>1:1 문의</h2>
            <hr id="line3">
            <div id="title-area">
                <p type="hidden" id="otoNo">${ qBoard.otoNo }</p>
                <p type="hidden" id="otoPwd">${ qBoard.otoPwd }</p>
                <div id="title">${ qBoard.otoTitle }</div>
                <div id="date">${ qBoard.otoDate }</div>
            </div>
            <hr>
            <div id="file-area">첨부파일 : ${ qBoard.otoFilename }</div>
            <hr>
            <div id="content-area">
                <div>
                ${ qBoard.otoContent }

                </div>
            </div>

            <div id="btn-area">
            <c:if test="${ !empty loginMember && loginMember.role == 'ROLE_ADMIN' }">
                <button class="btn" type="button" onclick="location.href='${ pageContext.request.contextPath }/board/auestionUpdate?no=${ qboard.otoNo }'">수정</button>
                <button class="btn" type="button" id="btnDelete">삭제</button>
            </c:if>
            <button type="button" class="btn" onclick="location.href='${ pageContext.request.contextPath }/question'">목록으로</button>
            </div>

        <script>
            $(document).ready(()=>{
                $("#btnDelete").on("click", ()=>{
                    
                    if(confirm("정말로 게시글을 삭제하겠습니까?")){
                        location.replace("${ pageContext.request.contextPath }/board/delete?no=${ board.no }");
                    }
                })
                
            });
        </script>
        </div>
    </div>
</body>


<jsp:include page="/views/common/footer.jsp" />