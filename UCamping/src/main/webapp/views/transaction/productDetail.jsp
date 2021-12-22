<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>     

<jsp:include page="/views/common/header.jsp" />       
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${ path }/resources/css/productDetail.css">
    <title>제품 상세 페이지</title>
</head>
<body>
    <div>
    <header>
    </header>
    <section>
        <div class="product_box">
            <div class="categories_box">
                <ul>
                    <li>
                        <a href="Home.html">HOME</a>
                    </li>
                    <li>
                        <a href="bigCategories.html">
                            > 
                            대분류 카테고리
                        </a>
                    </li>
                    <li>
                        <a href="subCategoreis.html">
                            > 
                            중분류 카테고리
                        </a>
                    </li>
                </ul>
            </div>
            <div class="product_main_area">
                <section class="product_main">
                    <div class="detail_box">
                        <article class="detail_box_top">
                            <section class="detail_box_area">
                                <div class="photo_area">
                                    <div class="main_img"></div>
                                    <div class="img_viewport">
                                        <div class="img_viewport_prev"></div>
                                        <div class="img_viewport_container">
                                            <div class="img_item img_normal_item img_item_other">
                                                <a><img alt="small_thumbnail_img" class="thumbnail_img" src="${ path }/resources/images/item/item24.jpg"></a>
                                            </div>
                                            <div class="img_item img_normal_item img_item_other">
                                                <a><img alt="small_thumbnail_img" class="thumbnail_img" src="${ path }/resources/images/item/item23.jpeg"></a>
                                            </div>
                                            <div class="img_item img_item_other">
                                                <a><img alt="small_thumbnail_img" class="thumbnail_img" src="${ path }/resources/images/blank_img.jpeg"></a>
                                            </div>
                                            <div class="img_item img_item_other">
                                                <a><img alt="small_thumbnail_img" class="thumbnail_img" src="${ path }/resources/images/blank_img.jpeg"></a>
                                            </div>
                                        </div>
                                        <div class="img_viewport_next"></div>
                                    </div>
                                </div>
                                <div class="item_info">
                                    <div class="item_name_price_info">
                                        <h1 class="item_name">캠핑텐트 제드트윈오토듀얼팔레스 차박텐트 팝니다(마지막 가격다운)</h1>
                                        <div>
                                            <div class="item_price">
                                                350,000
                                                <span>원</span>
                                            </div>
                                            <div class="report_user">
                                                <a href="">
                                                    신고
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item_count_sales_box">
                                        <div class="item_info_count">
                                            <ul>
                                                <li><img src="${ path }/resources/images/wish_heart.png" width="15px" height="15px">0
                                                </li>
                                                <li>조회 0
                                                </li>
                                                <li>채팅 0
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="item_price_description">
                                            <table>
                                                <tbody>
                                                    <tr class="description_sales_table">
                                                        <td class="title">거래방법</td>
                                                        <td class="description">직거래</td>
                                                    </tr>
                                                    <tr class="description_sales_table">
                                                        <td class="title">배송비</td>
                                                        <td class="description">배송비 별도</td>
                                                    </tr>
                                                    <tr class="description_sales_table">
                                                        <td class="title">상품상태</td>
                                                        <td class="description">판매중</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="item_sns">
                                        <div class="item_chat">
                                            <button type="button" class="item_chat_submit">1:1채팅하기</button>
                                        </div>
                                        <div class="item_wish">
                                            <button type="button" class="item_wish_myproduct">찜</button>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section>
                                <div class="detail_comment_box">
                                    <div class="detail_comment">
                                        <section class="description">
                                            <h3 class="description_title_h3">
                                                <div class="description_title">상세설명</div>
                                            </h3>
                                            <div class="description_text">
                                                캠핑홀릭 오두막텐트(면텐트), 베스티블, 전용 이너매트팝니다.
                                                ​<br>
                                                오두막과 베스티블은 지퍼형식은 아닙니다.
                                                입구 에이폴에 걸어서 사용하시면 됩니다.
                                                <br>
                                                중고로 구매하여 총 3회 피칭하였으며
                                                불빵 팩빵 없으며 생활 오염과 이염이 조금씩 있습니다.
                                                <br>
                                                <br>
                                                구성품은 오두막텐트, 이너 A폴, 입구A폴, 베스티블, 오두막 전용 이너매트, 오두막 전용 팩(피아노강선팩), 사이드폴, 스트링과 스토퍼 입니다.
                                                ​<br>
                                                구성품은 풀셋트라고 생각하시면 될 것 같습니다.
                                                <br>
                                                부피가 크기때문에 직거래 원합니다.
                                                직거래 지역은 부산입니다.
                                                <br>
                                                더 궁긍하신것은 댓글이나 문자부탁드립니다.
                                            </div>
                                        </section>
                                        <section class="item_user_info">
                                            <div class="profile_img">
                                                <a href="">
                                                    <img class="profile" src="${ path }/resources/images/pro_photo.jpg" alt="users_profile_img">
                                                </a>
                                            </div>
                                            <div class="nick">
                                                <a href="">
                                                    어쩔캠핑
                                                </a>
                                            </div>
                                            <div class="users_item_count">
                                                <a href="">
                                                    <span class="users_item_count_title">상품</span>
                                                    <span class="users_item_count_number">10</span>
                                                </a>
                                            </div>
                                            <div class="detail_profile_review">
                                                <a href="">
                                                    <span class="review_tag">거래후기</span>
                                                    <span class="review_count_rating">
                                                        (0)
                                                    </span>
                                                    <span class="review_count_rating_img">
                                                        <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star1">
                                                        <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star2">
                                                        <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star3">
                                                        <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star4">
                                                        <img src="${ path }/resources/images/pro_image/review_star_1.png" alt="blank_star5">
                                                    </span>
                                                </a>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </section>
                        </article>
                    </div>
                </section>
                <section class="member_comment">
                    <div class="member_comment_count">
                        <section class="comment_count">
                            <span class="comment_count_all">댓글</span>
                            <span>0</span>
                        </section>
                        <section class="input_comment">
                            <div class="cmt_in_box">
                                <textarea type="text" placeholder="댓글을 입력해주세요." class="input_txt"></textarea>
                            </div>
                            <div class="cmt_btn_box">
                                <div class="cmt_send_btn">댓글등록</div>
                            </div>
                        </section>
                    </div>
                </section>
            </div>
        </div>
    </section>
    </div>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />