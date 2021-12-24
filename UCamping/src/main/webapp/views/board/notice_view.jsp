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

  <link rel="stylesheet" href="${ path }/resources/css/notice_view.css">

</head>
<body>
    <div class="body">
		<div id="sml-category-area">
            <ul class="sml-category">
                <li><a href="${ path }" class="sml-text2"><span><i id="sml-ctgr-img1" class="material-icons-outlined chgcolor">home</i> 홈</span></a></li>
                <li id="bar">></li>
                <li><a href="${ path }/notice" class="sml-text2"><span>공지사항</span></a></li>
            </ul>
        </div>

        <div class="view-area">
            <h2>공지사항</h2>
            <hr id="line3">
            <div id="title-area">
                <div id="title">${ notice.title }</div>
                <div id="date">${ notice.createDate }</div>
            </div>
            <hr>
            <div id="content-area">
                <div>
                ${ notice.content }

                </div>
            </div>


            <div id="btn-area">
            <c:if test="${ !empty loginMember && loginMember.role == 'ROLE_ADMIN' }">
                <button class="btn" type="button" onclick="location.href='${ pageContext.request.contextPath }/admin/notice/update?no=${ notice.no }'">수정</button>
                <button class="btn" type="button" id="btnDelete">삭제</button>
            </c:if>
            <button type="button" class="btn" onclick="location.href='${ pageContext.request.contextPath }/notice'">목록으로</button>
            </div>

        <script>
            $(document).ready(()=>{
                $("#btnDelete").on("click", ()=>{
                    
                    if(confirm("정말로 게시글을 삭제하겠습니까?")){
                        location.replace("${ pageContext.request.contextPath }/admin/notice/delete?no=${ notice.no }");
                    }
                })
                
            });
        </script>
        </div>
    </div>
</body>

</html>

<jsp:include page="/views/common/footer.jsp" />