<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/chatting.css" >
</head>
<body>
	<div class="page-content page-container" id="page-content">
        <div class="padding">
            <div class="row container d-flex justify-content-center">
                <div class="col-md-6">
                    <div class="card card-bordered">
                        <div class="card-header">
                            <h4 class="card-title"><strong>Ucamping</strong></h4> <a class="btn btn-xs btn-secondary" href="#" data-abc="true">Let's Chat App</a>
                        </div>
                        <div class="ps-container ps-theme-default ps-active-y" id="chat-content" style="overflow-y: scroll !important; height:400px !important;">
                            <div class="media media-chat"> <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                                <div class="media-body">
                                    <p>안녕하세요?</p>
                                    <p>올리신 상품 구매하고 싶은데요!</p>
                                    <p>혹시 판매 됐나요?</p>
                                    <p class="meta"><time datetime="2018">23:58</time></p>
                                </div>
                            </div>
                            <div class="media media-meta-day">Today</div>
                            <div class="media media-chat media-chat-reverse">
                                <div class="media-body">
                                    <p>네 판매 가능합니다.</p>
                                    <p>혹시 직거래 가능하신가요?</p>
                                    <p class="meta"><time datetime="2018">00:06</time></p>
                                </div>
                            </div>
                            <div class="media media-chat"> <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                                <div class="media-body">
                                    <p>네 가능합니다!</p>
                                    <p>몇 시쯤이 괜찮으세요?</p>
                                    <p class="meta"><time datetime="2018">00:07</time></p>
                                </div>
                            </div>
                            <div class="media media-chat media-chat-reverse">
                                <div class="media-body">
                                    <p>내일 저녁 7시쯤 어떠세요?</p>
                                    <p>퇴근하고 동네 도착하면 그정도 됩니다.</p>
                                    <p class="meta"><time datetime="2018">00:09</time></p>
                                </div>
                            </div>
                            <div class="media media-chat"> <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                                <div class="media-body">
                                    <p>아 네 그러면 저녁 7시에 oo동 파리바게트 앞에서 만날까요?</p>
                                    <p class="meta"><time datetime="2018">00:10</time></p>
                                </div>
                            </div>
                            <div class="media media-chat media-chat-reverse">
                                <div class="media-body">
                                    <p>네 혹시 시간 변동 있다면 다시 톡드리겠습니다.</p>
                                    <p class="meta"><time datetime="2018">00:10</time></p>
                                </div>
                            </div>
                            <div class="media media-chat"> <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                                <div class="media-body">
                                    <p>네 감사합니다 내일 봬요~</p>
                                    <p class="meta"><time datetime="2018">00:12</time></p>
                                </div>
                            </div>
                            <div class="media media-chat media-chat-reverse">
                                <div class="media-body">
                                    <p>네 :> </p>
                                    <p class="meta"><time datetime="2018">00:12</time></p>
                                </div>
                            </div>
                            <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
                                <div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps-scrollbar-y-rail" style="top: 0px; height: 0px; right: 2px;">
                                <div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 2px;"></div>
                            </div>
                        </div>
                        <div class="publisher bt-1 border-light"> <img class="avatar avatar-xs" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="..."> <input class="publisher-input" type="text" placeholder="채팅을 입력하세요."> <span class="publisher-btn file-group"> <i class="fa fa-paperclip file-browser"></i> <input type="file"> </span> <a class="publisher-btn" href="#" data-abc="true"><i class="fa fa-smile"></i></a> <a class="publisher-btn text-info" href="#" data-abc="true"><i class="fa fa-paper-plane"></i></a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>