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
 <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
 <link rel="stylesheet" href="${ path }/resources/css/questionReUpdate.css">
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
            <h2>1:1문의 제목 수정</h2>
            <hr id="line">
            <form action="${ pageContext.request.contextPath }/question/update" method="post" enctype="multipart/form-data">
            <input type="hidden" name="no" value="${ board.otoNo }">
			<input type="hidden" name="originalFileName" value="${ board.otoFilename }">
			<input type="hidden" name="renamedFileName" value="${ board.renamedFileName }">
            <div id="title-area">
                <div id="title"><input type="text" name="title" id="title" value="${ board.otoTitle }"></div>
            </div>
            <hr>
            <div class="file-area">
                <label class="file-btn" for="upload_file">파일선택</label>
                <input type="text" id="file_route" disabled="disabled" value="파일 선택">
                <!-- <c:if test="${ !empty board.otoFilename }">
                    <span id="file-title"><c:out value="${ board.otoFilename }"></c:out></span>
                </c:if> -->

                <input type="file" id="upload_file" name="upfile" style="display: none;"><br>
            </div>
            <hr>
            <div id="content-area">
                <h2>1:1문의 내용 수정</h2>
                <div>
                    <textarea id="content" name="content" cols="94" rows="13">${ board.otoContent }</textarea>
                </div>
            </div>

            <div id="btn-area">
                <input type="submit" class="btn" value="수정하기">
                <button type="button" class="btn" onclick="location.href='${ pageContext.request.contextPath }/question'">이전으로</button>
            </div>
        </form>
        </div>
    </div>
</body>
<script>
    document.querySelector("#upload_file").addEventListener("change", (changeEvent) => {
    const imgFile = changeEvent.target.files[0];
    // reader.readAsDataURL(imgFile);
    const fileName = document.getElementById("file_route");
    fileName.value = imgFile.name;
    });
</script>
</html>

<jsp:include page="/views/common/footer.jsp" />