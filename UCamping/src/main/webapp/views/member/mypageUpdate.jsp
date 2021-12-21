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
<link rel="stylesheet" href="${ path }/resources/css/mypageUpdate.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    
</head>
<body>
<main id="wrap">
        <nav>
            <div>
                <img id="home_img" src="../resources/image/home.png">
            </div>
        </nav>
        <aside>
            <div id="profile">
                    <div id="profile-box">
                        <img id="profile-img" src="${ path }/resources/images/pro_photo.jpg">
                    </div>
                    <div id="profile-text"><p id="profile-text1">캠핑처돌이</p></div>
                </div>
        </aside>
        <section id="container">
            <div>
            <div class="titleArea">
                <h2>MEMBER MODIFY</h2>
            </div>
            <hr>
        <table id="whole-view">
            <div>
                <form id="memberFrm" action="" method="post">
                    <table>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" name="userId" id="newId"
                                        value="" readonly required >
                            </td> 	
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input type="password" name="userPwd" id="userPwd"
                                        value="" readonly required >
                            </td> 	
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td>
                                <input type="password" name="userPwd2" id="userPwd2"
                                        value="" readonly required >
                                <button id="btnPwd">확인</button>
                            </td> 	
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <td>
                                <input type="text" name="userNick" id="userNick"
                                        value="" readonly required >
                            </td> 	
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input type="text" name="userName" id="userName"
                                        value="" required>				
                            </td> 	
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td>
                                <input type="tel" name="phone" id="phone"
                                        value="" maxlength="11">
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="email" name="email" id="email"
                                        value="">												
                            </td> 	
                        </tr>
                        <tr>
                            <th>주소</th>
                                <td>
                                    <input type="text" name="address" id="address" 
                                        value="">
                                </td> 	
                        </tr>
                    </table>
                    <div id="btn-area">
                        <button type="button" class="btn_mypage"  id="updatePwd">비밀번호 변경</button>
                        <input type="submit"  class="btn_mypage" value="정보수정">
                        <input type="button"  class="btn_mypage" id="btnDelete" value="탈퇴하기">
                    </div>
                </form>
            </div>    
        </table>
        </div>
    </section>
</main>
	
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />