<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>     

<jsp:include page="/views/common/header.jsp" />
    

<title>My page Update</title>
<link rel="stylesheet" href="${ path }/resources/css/mypageUpdate.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    

<main id="wrap">
        <nav>
        	<div class="product_box">
            <div class="categories_box">
                <ul>
                    <li>
                        <a href="">HOME</a>
                    </li>
                    <li>
                        <a href="">
                            > 
                           	마이페이지
                        </a>
                    </li>
                    <li>
                        <a href="${ path }/mypageUpdate">
                            > 
                            회원 정보 수정
                        </a>
                    </li>
                </ul>
            </div>
            </div>
        </nav>
        <aside>
            <div id="profile">
                    <div id="profile-box">
                        <img id="profile-img" src="${ path }/resources/images/pro_photo.jpg">
                    </div>
                    <div id="profile-text"><p id="profile-text1">${ loginMember.nickname }</p></div>
                    <div id="profile-img-update"><button id="updateImg">프로필 수정</button></div>
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
                <form id="memberFrm" action="${ path }/mypageUpdate" method="post">
                    <table>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input class="form_myPage" type="text" name="userId" id="newId"
                                        value="${ loginMember.id }" readonly required >
                            </td> 	
                        </tr>
                        <tr>
                            <th>닉네임</th>
                            <td>
                                <input class="form_myPage" type="text" name="userNickname" id="userNickname"
                                        value="${ loginMember.nickname }" required > <span id="member-nickname"></span>
                            </td> 	
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input class="form_myPage" type="text" name="userName" id="userName"
                                        value="${ loginMember.name }" required>	<span id="member-name"></span>			
                            </td> 	
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td>
                                <input class="form_myPage" type="tel" name="userPhone" id="userPhone"
                                        value="${ loginMember.phone }" maxlength="11"> <span id="member-phone"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input class="form_myPage"type="email" name="userEmail" id="userEmail"
                                        value="${ loginMember.email }">	<span id="member-email"></span>											
                            </td> 	
                        </tr>
                        <tr>
                            <th>주소</th>
                                <td>
                                    <input class="form_myPage" type="text" name="userAddress" id="userAddress" 
                                        value="${ loginMember.address }">
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
<script>
$(document).ready(() => {
	$("#updateImg").on("click", () => {
		const url = "${ pageContext.request.contextPath }/views/member/updateImg.jsp";
		const status = "lest=500px, top=200px, width=500px, height=200px";
	
		open(url, "", status);
	});
	
	$("#updatePwd").on("click", () => {
		const url = "${ pageContext.request.contextPath }/updatePwd";
		const status = "left=500px, top=200px, width=500px,height=270px";
		
		open(url, "", status);
	});
	
	$("#btnDelete").on("click", () => {
		if(confirm("정말로 탈퇴하시겠습니까?")) {
			location.replace("${ pageContext.request.contextPath }/delete");
		};
	});
});
</script>
<style>
	table span {
		font-size: 15px;
	}
</style>

<script src="${ path }/resources/js/mypageUpdate.js"></script>
<jsp:include page="/views/common/footer.jsp" />