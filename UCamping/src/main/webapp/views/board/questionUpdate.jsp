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
<link rel="stylesheet" href="${ path }/resources/css/questionUpdate.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
	<section id="content">
        <h1 style="text-align: center;">1:1 문의 등록</h1>
        <div id='board-write-container'>
            <form action="${ pageContext.request.contextPath }/question/write" method="post" enctype="multipart/form-data">
                <table id='tbl-board'>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="title" id="title" placeholder="제목을 입력하세요." style="width:400px; height:20px;"></td>
                    </tr>
                    <tr>
                        <th>작성자 번호</th>
                        <td><input type="text" name="writer" value="${ loginMember.nickname}" style="width:400px; height:20px;" readonly></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file" name="upfile" ></td>
                    </tr>
                    <tr>
                        <th>문의내용</th>
                        <td rowspan="2"><textarea name="content" cols="55" rows="15" placeholder="문의내용을 입력해주세요." style="resize:none;"></textarea></td>
                    </tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <input type="submit" value="등록" >
                            <input type="reset" value="취소">
                        </th>
                    </tr>
                </table>
            </form>
        </div>
    </section>
    <br><br>

</body>
</html>

<jsp:include page="/views/common/footer.jsp" />