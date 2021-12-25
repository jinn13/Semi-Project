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
                <div id="title">${ question.otoTitle }</div>
                <div id="date">${ question.otoDate }</div>
            </div>
            <hr>

                <div id="file-area">

                    <div id="file-area2">
            		<c:if test="${ empty question.otoFilename }">
					<!-- OriginalFileName없으면 span으로 - 찍기 -->
						<span> - </span>
					</c:if>
					<c:if test="${ !empty question.otoFilename }">
					<!-- OriginalFileName있으면 img와 파일명 출력하기 -->
						<li><a href="javascript:fileDownload('${question.otoFilename}', '${question.renamedFileName}')" class="sml-text2"><span><i id="sml-ctgr-img1" class="material-icons-outlined chgcolor">file_download</i>${ question.otoFilename }</span></a></li>
						</a>	
					</c:if>
                </div>
                    <div id="writer">${question.writerId}</div>
                </div>
            
            
            
            <hr>
            <div id="content-area">
                <div>
                ${ question.otoContent }

                </div>
            </div>

            <div id="btn-area">
            <c:if test="${ ! empty loginMember && loginMember.id == question.writerId }">
                <button class="btn" type="button" onclick="location.href='${ pageContext.request.contextPath }/question/update?no=${ question.otoNo }'">수정</button>
                <button class="btn" type="button" id="btnDelete">삭제</button>
            </c:if>
            <button type="button" class="btn" onclick="location.href='${ pageContext.request.contextPath }/question'">목록으로</button>
            </div>


        </div>
    </div>
</body>
<script>
	$(document).ready(()=>{
		$("#btnDelete").on("click", ()=>{
			
			if(confirm("정말로 게시글을 삭제하겠습니까?")){
				location.replace("${ pageContext.request.contextPath }/question/delete?no=${ question.otoNo }");
			}
		})
		
	});

	function fileDownload(oname, rname){
		
		// 브라우저마다 동작 안할경우 있으므로 인코딩해서 넘겨주기
		// encodeURIComponent()
		// 	- 아스키문자(a~z, A~Z, 1~8, ..)는 그대로 전달하고 기타문자(한글, 특수문자 등)만 %XX(16진수 2자리)와 같이 변환된다.
		location.assign("${ pageContext.request.contextPath }/question/fileDown?oname="+encodeURIComponent(oname)+"&rname="+encodeURIComponent(rname));		
	}
</script>

<jsp:include page="/views/common/footer.jsp" />